## Example Summary

Sample application to control on-board LEDs with the PWM driver.

## Peripherals Exercised

* `Board_PWM0` - PWM instance used to control `Board_LED1` brightness
* `Board_PWM1` - PWM instance used to control `Board_LED2` brightness

## Resources & Jumper Settings

> Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes                                                  |
| ----------------- | ---------                                              |
| CC3200            | Close jumpers J2 and J3                                |
| DK-TM4C129X       |                                                        |
| EK-TM4C123GXL     |                                                        |
| EK-TM4C1294XL     |                                                        |
| EK-TM4C129EXL     |                                                        |
| MSP-EXP432P401R   |                                                        |

> Fields left blank have no specific settings for this example.

## Example Usage

* The example performs general initialization in `main()`.

* The `pwmLED` task varies the intensity of the on-board LEDs at a rate determined
by the `arg0` parameter for the Task instance in the *.cfg* file.

* If `Board_PWM0` and `Board_PWM1` are different (connected to two LEDs),
the LED connected to `Board_PWM0` will fade-in while the LED connected to
`Board_PWM1` will fade-out and vice versa.

## Application Design Details

This application uses one task, `pwmLED` , which performs the following actions:

1. Opens and initializes PWM driver objects.

2. Uses the PWM driver changed the intensity of the LEDs.

3. The task sleeps for 50 system ticks before changing LED intensity again.

## References
* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
