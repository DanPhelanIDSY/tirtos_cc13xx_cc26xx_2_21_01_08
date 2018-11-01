

//*********************************************************************************
// These settings have been generated for use with TI-RTOS and cc13xxware
//
// Generated by SmartRF Studio version 2.4.3 (build #23)
// Tested for TI-RTOS version tirtos_simplelink_2_21_xx
// Device: CC1350 Rev. 2.1
//
//*********************************************************************************


//*********************************************************************************
// Parameter summary
// BLE Channel: 17
// Frequency: 2440 MHz
// PDU Payload length: 30
// TX Power: 9 dBm (requires define CCFG_FORCE_VDDR_HH = 1 in ccfg.c, see CC13xx/CC26xx Technical Reference Manual)
// Whitening: TRUE

#include <driverlib/rf_mailbox.h>
#include <driverlib/rf_common_cmd.h>
#include <driverlib/rf_ble_cmd.h>
#include <ti/drivers/rf/RF.h>
#include <rf_patches/rf_patch_cpe_ble.h>
#include <rf_patches/rf_patch_rfe_ble.h>
#include "smartrf_settings_ble.h"


// TI-RTOS RF Mode Object
RF_Mode RF_modeBle =
{
    .rfMode = RF_MODE_BLE,
    .cpePatchFxn = &rf_patch_cpe_ble,
    .mcePatchFxn = 0,
    .rfePatchFxn = &rf_patch_rfe_ble,
};

// Overrides for CMD_RADIO_SETUP
static uint32_t pBleOverrides[] =
{
    // override_use_patch_ble_1mbps.xml
    // PHY: Use MCE ROM, RFE RAM patch
    MCE_RFE_OVERRIDE(0,0,0,1,0,0),
    // override_synth_ble_1mbps.xml
    // Synth: Set recommended RTRIM to 4
    HW_REG_OVERRIDE(0x4038,0x0034),
    // Synth: Set Fref to 3.43 MHz
    (uint32_t)0x000784A3,
    // Synth: Configure fine calibration setting
    HW_REG_OVERRIDE(0x4020,0x7F00),
    // Synth: Configure fine calibration setting
    HW_REG_OVERRIDE(0x4064,0x0040),
    // Synth: Configure fine calibration setting
    (uint32_t)0xB1070503,
    // Synth: Configure fine calibration setting
    (uint32_t)0x05330523,
    // Synth: Set loop bandwidth after lock to 80 kHz
    (uint32_t)0xA47E0583,
    // Synth: Set loop bandwidth after lock to 80 kHz
    (uint32_t)0xEAE00603,
    // Synth: Set loop bandwidth after lock to 80 kHz
    (uint32_t)0x00010623,
    // Synth: Configure PLL bias
    HW32_ARRAY_OVERRIDE(0x405C,1),
    // Synth: Configure PLL bias
    (uint32_t)0x18000000,
    // Synth: Configure VCO LDO (in ADI1, set VCOLDOCFG=0x9F to use voltage input reference)
    ADI_REG_OVERRIDE(1,4,0x9F),
    // Synth: Configure synth LDO (in ADI1, set SLDOCTL0.COMP_CAP=1)
    ADI_HALFREG_OVERRIDE(1,7,0x4,0x4),
    // override_phy_ble_1mbps.xml
    // Tx: Configure symbol shape for BLE frequency deviation requirements
    (uint32_t)0x013800C3,
    // Rx: Configure AGC reference level
    HW_REG_OVERRIDE(0x6088, 0x0045),
    // Rx: Configure AGC gain level
    HW_REG_OVERRIDE(0x6084, 0x05FD),
    // Rx: Configure LNA bias current trim offset
    (uint32_t)0x00038883,
    // override_frontend_xd.xml
    // Rx: Set RSSI offset to adjust reported RSSI by +13 dB
    (uint32_t)0x00F388A3,
    // TX power override
    // Tx: Set PA trim to max (in ADI0, set PACTL0=0xF8)
    ADI_REG_OVERRIDE(0,12,0xF8),
    (uint32_t)0xFFFFFFFF,
};


// CMD_RADIO_SETUP
rfc_CMD_RADIO_SETUP_t RF_ble_cmdRadioSetup =
{
    .commandNo = 0x0802,
    .status = 0x0000,
    .pNextOp = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .startTime = 0x00000000,
    .startTrigger.triggerType = 0x0,
    .startTrigger.bEnaCmd = 0x0,
    .startTrigger.triggerNo = 0x0,
    .startTrigger.pastTrig = 0x0,
    .condition.rule = 0x1,
    .condition.nSkip = 0x0,
    .mode = 0x00,
    .loDivider = 0x00,
    .config.frontEndMode = 0x0,
    .config.biasMode = 0x1,
    .config.analogCfgMode = 0x0,
    .config.bNoFsPowerUp = 0x0,
    .txPower = 0x3D3F,
    .pRegOverride = pBleOverrides,
};

// CMD_FS
rfc_CMD_FS_t RF_ble_cmdFs =
{
    .commandNo = 0x0803,
    .status = 0x0000,
    .pNextOp = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .startTime = 0x00000000,
    .startTrigger.triggerType = 0x0,
    .startTrigger.bEnaCmd = 0x0,
    .startTrigger.triggerNo = 0x0,
    .startTrigger.pastTrig = 0x0,
    .condition.rule = 0x1,
    .condition.nSkip = 0x0,
    .frequency = 0x0988,
    .fractFreq = 0x0000,
    .synthConf.bTxMode = 0x0,
    .synthConf.refFreq = 0x0,
    .__dummy0 = 0x00,
    .__dummy1 = 0x00,
    .__dummy2 = 0x00,
    .__dummy3 = 0x0000,
};


// Structure for CMD_BLE_ADV_NC.pParams
rfc_bleAdvPar_t bleAdvNcPar =
{
    .pRxQ = 0, // INSERT APPLICABLE POINTER: (dataQueue_t*)&xxx
    .rxConfig.bAutoFlushIgnored = 0,
    .rxConfig.bAutoFlushCrcErr = 0,
    .rxConfig.bAutoFlushEmpty = 0,
    .rxConfig.bIncludeLenByte = 0,
    .rxConfig.bIncludeCrc = 0,
    .rxConfig.bAppendRssi = 0,
    .rxConfig.bAppendStatus = 0,
    .rxConfig.bAppendTimestamp = 0,
    .advConfig.advFilterPolicy = 0,
    .advConfig.deviceAddrType = 0,
    .advConfig.peerAddrType = 0,
    .advConfig.bStrictLenFilter = 0,
    .advConfig.rpaMode = 0,
    .advLen = 0x18,
    .scanRspLen = 0x00,
    .pAdvData = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .pScanRspData = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .pDeviceAddress = 0, // INSERT APPLICABLE POINTER: (uint16_t*)&xxx
    .pWhiteList = 0, // INSERT APPLICABLE POINTER: (uint32_t*)&xxx
    .__dummy0 = 0x0000,
    .__dummy1 = 0x00,
    .endTrigger.triggerType = 0x1,
    .endTrigger.bEnaCmd = 0x0,
    .endTrigger.triggerNo = 0x0,
    .endTrigger.pastTrig = 0x0,
    .endTime = 0x00000000,
};

// CMD_BLE_ADV_NC
rfc_CMD_BLE_ADV_NC_t RF_ble_cmdBleAdvNc =
{
    .commandNo = 0x1805,
    .status = 0x0000,
    .pNextOp = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .startTime = 0x00000000,
    .startTrigger.triggerType = 0x0,
    .startTrigger.bEnaCmd = 0x0,
    .startTrigger.triggerNo = 0x0,
    .startTrigger.pastTrig = 0x0,
    .condition.rule = 0x1,
    .condition.nSkip = 0x0,
    .channel = 0x8C,
    .whitening.init = 0x51,
    .whitening.bOverride = 0x1,
    .pParams = &bleAdvNcPar,
    .pOutput = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
};

// Structure for CMD_BLE_GENERIC_RX.pParams
rfc_bleGenericRxPar_t bleGenericRxPar =
{
    .pRxQ = 0, // INSERT APPLICABLE POINTER: (dataQueue_t*)&xxx
    .rxConfig.bAutoFlushIgnored = 0,
    .rxConfig.bAutoFlushCrcErr = 0,
    .rxConfig.bAutoFlushEmpty = 0,
    .rxConfig.bIncludeLenByte = 1,
    .rxConfig.bIncludeCrc = 1,
    .rxConfig.bAppendRssi = 1,
    .rxConfig.bAppendStatus = 1,
    .rxConfig.bAppendTimestamp = 0,
    .bRepeat = 0x01,
    .__dummy0 = 0x0000,
    .accessAddress = 0x8E89BED6,
    .crcInit0 = 0x55,
    .crcInit1 = 0x55,
    .crcInit2 = 0x55,
    .endTrigger.triggerType = 0x1,
    .endTrigger.bEnaCmd = 0x0,
    .endTrigger.triggerNo = 0x0,
    .endTrigger.pastTrig = 0x0,
    .endTime = 0x00000001,
};

// CMD_BLE_GENERIC_RX
rfc_CMD_BLE_GENERIC_RX_t RF_ble_cmdBleGenericRx =
{
    .commandNo = 0x1809,
    .status = 0x0000,
    .pNextOp = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
    .startTime = 0x00000000,
    .startTrigger.triggerType = 0x0,
    .startTrigger.bEnaCmd = 0x0,
    .startTrigger.triggerNo = 0x0,
    .startTrigger.pastTrig = 0x0,
    .condition.rule = 0x1,
    .condition.nSkip = 0x0,
    .channel = 0x8C,
    .whitening.init = 0x51,
    .whitening.bOverride = 0x1,
    .pParams = &bleGenericRxPar,
    .pOutput = 0, // INSERT APPLICABLE POINTER: (uint8_t*)&xxx
};

RF_Mode *RF_pModeBle = &RF_modeBle;
rfc_CMD_RADIO_SETUP_t *RF_ble_pCmdRadioSetup = &RF_ble_cmdRadioSetup;
rfc_CMD_FS_t *RF_ble_pCmdFs = &RF_ble_cmdFs;
rfc_CMD_BLE_ADV_NC_t *RF_ble_pCmdBleAdvNc = &RF_ble_cmdBleAdvNc;
rfc_CMD_BLE_GENERIC_RX_t *RF_ble_pCmdBleGenericRx = &RF_ble_cmdBleGenericRx;