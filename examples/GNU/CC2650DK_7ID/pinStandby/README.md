## Example Summary

Application that enters standby, and wakes up at periodic intervals to toggle
LEDs.

## Peripherals Exercised

* `Board_LED0` - Toggled by DUT(Device Under Test)
* `Board_LED1` - Toggled by DUT

## Resources & Jumper Settings

>Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes                                                  |
| ----------------- | ------                                                 |
| CC1310DK          | LED0, LED1 toggled                                     |
| CC2650DK          | ^                                                       |
| CC1310STK-BLE     | LED0 toggled                                           |
| CC2650STK-BLE     | LED0, LED1 toggled                                     |
| CC1310LP          | LED0 (Red), LED1 (Green) toggled                       |
| CC1350LP          | ^                                                       |
| CC2650LP          | ^                                                       |

> Fields containing ^, refer to the above settings.

> In order to get lowest standby current, the JTAG pins TMS and TCK
should be disconnected by removing the jumpers on P408 of the SmartRF06 EB.
TMS and TCK have internal pull-ups and are driven low when inactive from the
emulator, hence after programming the device these jumpers should be removed
to avoid the extra leakage current.

## Example Usage

* Run the example.

* The device wakes up and toggles the LEDs at periodic intervals.
Modify the `standbyDurationUs` to change how long the device stays in standby,
the default is 5s.

>If the `standbyDurationUs` is set to < 1ms, the power policy will
choose to enter idle instead of standby, since it won't have sufficient time
to enter/exit standby.

## Application Design Details

* The example consists of one task which periodically sleeps and wakes.
Since no other work is scheduled in the application, the power policy
(run when the CPU is idle) will choose to put the device into standby during
the duration of the task sleep.

> For IAR users using any SensorTag(STK) Board, the XDS110 debugger must be
selected with the 4-wire JTAG connection within your projects' debugger
configuration.

## References
* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
