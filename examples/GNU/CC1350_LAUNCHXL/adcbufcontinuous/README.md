## Example Summary

Example that uses the ADCBuf driver to make a number of samples
and then echoes them to the console via UART.

## Peripherals Exercised

* `Board_ADCBuf0` - Used to take samples on an analogue input.
* `Board_UART0` - Used to echo samples to host serial session

## Resources & Jumper Settings

> Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes |
| ----------------- | ------|
| CC1310DK_7XD      |       |
| CC2650DK_7ID      |       |
| MSP-EXP432P401R   |       |

> Fields left blank have no specific settings for this example.

## Example Usage

* Run the example.

* When the application is running, open a serial session (e.g. `HyperTerminal`,
`puTTY`, etc.) to the appropriate COM port.
> The COM port can be determined via Device Manager in Windows or via `ls /dev/tty*` in Linux.

The connection should have the following settings
```
    Baud-rate:     115200
    Data bits:          8
    Stop bits:          1
    Parity:          None
    Flow Control:    None
```
* The target will send packages of 100 samples and a header to the serial session
twice per second. The ADCBuf driver supports higher sampling rates. The exact maximum
rate is device specific. 100 samples sampled at 500 Hz was chosen to make the console output
easily interpretable.
The values displayed on the console are in micro-volts.


## Application Design Details

* This example shows how to initialize the ADCBuf driver in continuous mode.

* A single task, `conversiontStartFxn`, sets up the UART connection to the serial console and starts
a continuous conversion with the ADCBuf driver. After this is completed, the task sleeps forever.
This allows the device to enter low power states. The callback function `adcBufCallback` is called
whenever the driver has finished filling one of the buffers. It transfers the data into an output buffer
in a human-readable format. It then starts a UART transfer to send the output buffer to the console.

## References

* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.