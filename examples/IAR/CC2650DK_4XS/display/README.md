## Example Summary

Application that writes to the UART and the available LCD display using Display driver.

## Peripherals Exercised

* `Board_LED0` - Toggled by example task periodically
* `Board_UART` - (If enabled) Outputs test strings
* `Board_SPI ` - (If enabled) Outputs test strings to LCDs

## Resources & Jumper Settings

> Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes                                                  |
| ----------------- | ------                                                 |
| CC1310DK  7x7     |                                                        |
| CC2650DK  7x7     |                                                        |
| CC2650DK  5x5     | No LCD support                                         |
| CC2650DK  4x4     | No LCD support                                         |
| CC1350 Sensortag  | DEVPACK-DEBUG needed for UART. DEVPACK-WATCH for LCD   |
| CC2650 SensorTag  | DEVPACK-DEBUG needed for UART. DEVPACK-WATCH for LCD   |
| CC2650LAUNCHXL    | Boosterpack 430BOOST-SHARP96 needed for LCD            |
| CC1310LAUNCHXL    | Boosterpack 430BOOST-SHARP96 needed for LCD            |
| CC1350LAUNCHXL    | Boosterpack 430BOOST-SHARP96 needed for LCD            |

> Fields left blank have no specific settings for this example.

## Example Usage

* Run the example
* A splash screen will be displayed on LCD's and a welcome string on UART
* `Board_LED0` is toggled periodically
* The state of LED0 is output periodically on UART and LCD

## Application Design Details

* If the boosterpack is attached on the Launchpads, it will work out of the box.
* If not present, code can be disabled by adding the precompiler define `BOARD_DISPLAY_EXCLUDE_LCD`.

> For SensorTags there is a pin conflict, so either the DEVPACK-DEBUG or the DEVPACK-WATCH must be used
and `BOARD_DISPLAY_EXCLUDE_UART` must be added to the global precompiler defines in order to use LCD.

> For IAR users using any SensorTag(STK) Board, the XDS110 debugger must be
selected with the 4-wire JTAG connection within your projects' debugger
configuration.

## References
* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.