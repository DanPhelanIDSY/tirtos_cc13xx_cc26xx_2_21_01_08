## Example Summary

This application moves into and out of shutdown. The state is controlled
by buttons. `Board_BUTTON1` will bring the device into shutdown, while
`Board_BUTTON0` will wake-up the device. A special LED toggling sequence
is used when waking from shutdown to demonstrate the get-reset-source
functionality.

## Peripherals Exercised

* `Board_LED0` -  Lit when the device is active, not lit when in shutdown.
* `Board_LED1` -  Will blink 2 times when coming out of shutdown.

## Resources & Jumper Settings

> Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes                                                  |
| ----------------- | -----                                                  |
| CC1310DK          | LED0, LED1 toggling, dependent on mode                 |
| CC2650DK          | ^                                                       |
| CC1310STK-BLE     |                                                        |
| CC2650STK-BLE     |                                                        |
| CC1310LP          | `LED0` (Red), `LED1` (Green) toggling, dependent on mode   |
| CC1350LP          | ^                                                       |
| CC2650LP          | ^                                                       |

> Fields containing ^, refer to the above settings.

> Fields left blank have no specific settings for this example.

> In order to get lowest shutdown current, the JTAG pins TMS
and TCK should be disconnected by removing the jumpers on P408 of the
SmartRF06 EB. TMS and TCK have internal pull-up and are driven low when
inactive from the emulator, hence after programming the device these
jumpers should be removed to avoid the extra leakage current.

## Example Usage

* Run the example. Use the `KEY_DOWN` and `KEY_UP` buttons to shutdown
and wake-up the device. Also, use the RESET button to compare the
different start-up sequences used.

> It is not possible to do a proper shutdown sequence with the
debugger connected. For correct behaviour, this example must be run with the
debugger disconnected by resetting or performing a power-cycle of the device.

## Application Design Details

* The example consists of one task which is waiting for a semaphore
that is posted in the `Board_BUTTON1` interrupt handle. Since no other
resources are requested by the application, it will enter standby
in active mode when waiting for a posting of the semaphore. The
non-default initialization table used is equal to the default one.
It is included to show how a non-default initialization when waking
from shutdown can be used to avoid glitches on IOs.

> For IAR users using any SensorTag(STK) Board, the XDS110 debugger must be
selected with the 4-wire JTAG connection within your projects' debugger
configuration.

## References
* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
