## Example Summary

Application that uses the PDM driver and the UART driver.

## Peripherals Exercised

* `Board_LED1` - Indicates that the board was initialized within main(), and that sampling is not in progress.

* `Board_LED2` - Toggles every 16 sample blocks

* `Board_BUTTON0` - Button to start stream

* `Board_BUTTON1` - Button to stop stream

* `Display` - Used to write information about the stream. It can either be the LCD devpack or simply UART. Information about the stream includes volume indication.

## Resources & Jumper Settings

> Please refer to the development board's specific "Settings and Resources"
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes |
| ----------------- | ----- |
| CC2650STK         |       |
| CC1350STK         |       |

> Fields left blank have no specific settings for this example.

## Example Usage

Run the example. `Board_LED1` turns `ON` to indicate that TI-RTOS driver
initialization is complete. It is turned off as the PDM driver is started.

A stream is started when the user presses `Board_BUTTON0`. `Board_LED1` remains
off until the stream ends. The stream ends when user presses `Board_BUTTON1`,
or if there is an error in the stream.

While the stream is running `Board_LED1` toggles on and off with a period based
on the sample rate. The period is 32 frames, duty cycle 50%. One frame is 192
samples, @16kHz, which gives a period of 364ms.

When the application is running, open a serial session (e.g. HyperTerminal,
puTTY, etc.) to the appropriate COM port.

> The COM port can be determined via the Device Manager in Windows or via
`ls /dev/tty*` in Linux.

The connection should have the following settings

```
    Baud-rate:  115200
    Data bits:       8
    Stop bits:       1
    Parity:       None
    Flow Control: None
```

If the serial session is started before the target completes initialization,
the following is displayed:
    `Starting PDM stream:`

## Application Design Details

* This example shows how to use the PDM driver to start and stop a stream from a
digital microphone.

* It uses the UART driver to write information about the stream
to a host application, and uses the most basic button driver to let user control
start/stop of stream.

## References

* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
