/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <stdint.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Types.h>

/* Kernel services */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Semaphore.h>

/* TI-RTOS drivers */
#include <ti/drivers/ADC.h>
#include <ti/drivers/adc/ADCCC26XX.h>
#include <ti/drivers/PIN.h>
#include <ti/drivers/pin/PINCC26XX.h>
#include <ti/drivers/Power.h>
#include <ti/drivers/power/PowerCC26XX.h>

/* driverlib header files */
#include <inc/hw_memmap.h>
#include <inc/hw_ints.h>
#include <inc/hw_types.h>
#include <inc/hw_aux_evctl.h>
#include <driverlib/aux_adc.h>
#include <driverlib/aux_wuc.h>
#include <driverlib/aux_smph.h>
#include <driverlib/sys_ctrl.h>
#include <driverlib/ioc.h>
#include <driverlib/aon_ioc.h>


/*
 * =============================================================================
 * Public Function Declarations
 * =============================================================================
 */
void ADCCC26XX_close(ADC_Handle handle);
void ADCCC26XX_init(ADC_Handle handle);
ADC_Handle ADCCC26XX_open(ADC_Handle handle, ADC_Params *params);
int_fast16_t ADCCC26XX_convert(ADC_Handle handle, uint16_t *value);
int_fast16_t ADCCC26XX_control(ADC_Handle handle, uint_fast16_t cmd, void *arg);
uint32_t ADCCC26XX_convertRawToMicroVolts(ADC_Handle handle, uint16_t rawAdcValue);

/*
 * =============================================================================
 * Private Function Declarations
 * =============================================================================
 */

/*
 * =============================================================================
 * Constants
 * =============================================================================
 */

/* ADC function table for ADCCC26XX implementation */
const ADC_FxnTable ADCCC26XX_fxnTable = {
    ADCCC26XX_close,
    ADCCC26XX_control,
    ADCCC26XX_convert,
    ADCCC26XX_convertRawToMicroVolts,
    ADCCC26XX_init,
    ADCCC26XX_open
};

/*
 * =============================================================================
 * Private Global Variables
 * =============================================================================
 */

/* Keep track the adc handle instance to create and delete adcSemaphore */
static uint16_t adcInstance = 0;

/* Semaphore to arbitrate access to the single ADC peripheral between multiple handles */
static Semaphore_Struct adcSemaphore;



/*
 * =============================================================================
 * Function Definitions
 * =============================================================================
 */

/*
 *  ======== ADCCC26XX_close ========
 */
void ADCCC26XX_close(ADC_Handle handle){
    ADCCC26XX_Object        *object;

    Assert_isTrue(handle, NULL);

    object = handle->object;


    uint32_t key = Hwi_disable();
    if (object->isOpen){
        adcInstance--;
        if (adcInstance == 0) {
                Semaphore_destruct(&adcSemaphore);
        }
        Log_print0(Diags_USER1,"ADC: Object closed");
    }
    else {
        return;
    }
    object->isOpen = false;
    Hwi_restore(key);

    /* Deallocate pins */
    if (object->pinHandle){
        PIN_close(object->pinHandle);
    }
}


/*
 *  ======== ADCCC26XX_control ========
 */
int_fast16_t ADCCC26XX_control(ADC_Handle handle, uint_fast16_t cmd, void *arg){
    /* No implementation yet */
    return ADC_STATUS_UNDEFINEDCMD;
}

/*
 *  ======== ADCCC26XX_convert ========
 */
int_fast16_t ADCCC26XX_convert(ADC_Handle handle, uint16_t *value){
    ADCCC26XX_HWAttrs     const *hwAttrs;
    int_fast16_t                conversionResult = ADC_STATUS_ERROR;

    Assert_isTrue(handle, NULL);

    /* Get handle */
    hwAttrs = handle->hwAttrs;

    /* Acquire the lock for this particular ADC handle */
    Semaphore_pend(Semaphore_handle(&adcSemaphore), BIOS_WAIT_FOREVER);

    /* Set constraints to guarantee operation */
    Power_setConstraint(PowerCC26XX_SB_DISALLOW);

    /* Acquire the ADC hw semaphore. This call polls until the semaphore is available */
    if(!AUXSMPHTryAcquire(AUX_SMPH_2)){
        Power_releaseConstraint(PowerCC26XX_SB_DISALLOW);
        Semaphore_post(Semaphore_handle(&adcSemaphore));
        return conversionResult;
    }

    /* Specify input in ADC module */
    AUXADCSelectInput(hwAttrs->adcCompBInput);

    /* Flush the ADC FIFO in case we have triggered prior to this call */
    AUXADCFlushFifo();

    /* If input scaling is set to disabled in the params, disable it */
    if (!hwAttrs->inputScalingEnabled){
        AUXADCDisableInputScaling();
    }

    /* Use synchronous sampling mode and prepare for trigger */
    AUXADCEnableSync(hwAttrs->refSource, hwAttrs->samplingDuration, hwAttrs->triggerSource);

    /* Manually trigger the ADC once */
    AUXADCGenManualTrigger();

    /* Poll until the sample is ready */
    *value = AUXADCReadFifo();

    conversionResult = ADC_STATUS_SUCCESS;

    /* Shut down the ADC peripheral */
    AUXADCDisable();

    /* Release the ADC hw semaphore */
    AUXSMPHRelease(AUX_SMPH_2);

    /* Allow entering standby again after ADC conversion complete */
    Power_releaseConstraint(PowerCC26XX_SB_DISALLOW);

    /* Release the lock for this particular ADC handle */
    Semaphore_post(Semaphore_handle(&adcSemaphore));

    /* Return the number of bytes transfered by the ADC */
    return conversionResult;
}


/*
 *  ======== ADCCC26XX_convertRawToMicroVolts ========
 */
uint32_t ADCCC26XX_convertRawToMicroVolts(ADC_Handle handle, uint16_t rawAdcValue){
    ADCCC26XX_HWAttrs     const *hwAttrs;
    uint32_t                    gain;
    uint32_t                    offset;
    uint32_t                    adjustedValue;

    Assert_isTrue(handle, NULL);

    /* Get the pointer to the hwAttrs */
    hwAttrs = handle->hwAttrs;

    gain = AUXADCGetAdjustmentGain(hwAttrs->refSource);
    offset = AUXADCGetAdjustmentOffset(hwAttrs->refSource);
    adjustedValue = AUXADCAdjustValueForGainAndOffset(rawAdcValue, gain, offset);

    return AUXADCValueToMicrovolts((hwAttrs->inputScalingEnabled ? AUXADC_FIXED_REF_VOLTAGE_NORMAL : AUXADC_FIXED_REF_VOLTAGE_UNSCALED), adjustedValue);
}

/*
 *  ======== ADCCC26XX_init ========
 */
void ADCCC26XX_init(ADC_Handle handle){
    ADCCC26XX_Object *object;

    /* Get the object */
    object = handle->object;

    /* Mark the object as available */
    object->isOpen = false;
}

/*
 *  ======== ADCCC26XX_open ========
 */
ADC_Handle ADCCC26XX_open(ADC_Handle handle, ADC_Params *params){
    ADCCC26XX_Object            *object;
    ADCCC26XX_HWAttrs     const *hwAttrs;
    PIN_Config                  adcPinTable[2];
    Semaphore_Params            semParams;

    Assert_isTrue(handle, NULL);

    /* Get object and hwAttrs */
    object = handle->object;
    hwAttrs = handle->hwAttrs;

    /* Determine if the driver was already opened */
    uint32_t key = Hwi_disable();

    if (object->isOpen){
        Log_error0("ADC: Error! Already in use.");
        Hwi_restore(key);
        return NULL;
    }
    object->isOpen = true;

    /* If this is the first handle requested, set up the semaphore as well */
    if (adcInstance == 0){
        /* Setup semaphore */
        Semaphore_Params_init(&semParams);
        semParams.mode = Semaphore_Mode_BINARY;
        Semaphore_construct(&adcSemaphore, 1, &semParams);
    }
    adcInstance++;

    /* Turn on the ANAIF clock. ANIAF contains the aux ADC. */
    AUXWUCClockEnable(AUX_WUC_ANAIF_CLOCK);
    AUXWUCClockEnable(AUX_WUC_ADI_CLOCK);

    Hwi_restore(key);

    /* Reserve the DIO defined in the hwAttrs */
    uint8_t i = 0;
    /* Add pin to measure on */
    adcPinTable[i++] = hwAttrs->adcDIO | PIN_INPUT_EN;
    /* Terminate pin list */
    adcPinTable[i] = PIN_TERMINATE;
    object->pinHandle = PIN_open(&object->pinState, adcPinTable);
    if (!object->pinHandle){
        Log_error0("ADC: Error! Already in use.");
        object->isOpen = false;
        return NULL;
    }

    Log_print0(Diags_USER1, "ADC: Object opened");

    return handle;
}
