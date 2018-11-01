Example Summary
---------------
Example includes the EasyLink API and uses it to configure the RF driver to
transmit packets. This project should be run in conjunction with the
rfEasyLinkRx project.

For more information on the EasyLink API and usage refer to
http://processors.wiki.ti.com/index.php/SimpleLink-EasyLink

Peripherals Exercised
---------------------
* `Board_LED1` - Indicates that a packet has been transmitted
* `Board_LED2` - Indicates an abort which is expected after transmitting 10 packets
 `Board_LED1` & `Board_LED2` indicate an error


Resources & Jumper Settings
---------------------------
Please refer to the development board's specific "Settings and Resources"
section in the Getting Started Guide (http://www.ti.com/lit/SPRUHU7C).
For convenience, a short summary is also shown below.

    | Development Boards | Notes                                               |
    | ================== | =================================================== |
    | CC1310DK           | Board_LED1 is the "LED1" LED                        |
    |                    | Board_LED2 is the "LED2" LED                        |
    | ------------------ | --------------------------------------------------- |
    | CC1310_LAUNCHXL    | Board_LED1 is the "Green" LED                       |
    |                    | Board_LED2 is the "Red" LED                         |
    | ------------------ | --------------------------------------------------- |

Example Usage
-------------
Run the example. Board_LED1 will toggle every 100 ms indicating a packet has
been transmitted. This will happen 10 times. The 11th transmission will then be
aborted, toggling Board_LED2. This cycle will continue.

Before running this application you should first start the rfEasyLinkRx on a
second board to see that the transmitted packets are received.

Application Design Details
--------------------------
This example shows how to use the EasyLink API to access the RF driver, set the
frequency and transmit packets. The RFEASYLINKTX_ASYNC define is used to select
between the Blocking or Async TX API.

The rfEasyLinkTx example will transmit a packet every 10 ms for 10 packets, if
RFEASYLINKTX_ASYNC is defined (as it is by default) then the 11th TX will be
scheduled, but will be aborted. This is to show an example of aborting a TX.
LED2 will toggle when a TX abort happens. Board_LED1 and Board_LED2 indicates an
error (not expected to happen). The TX/abort cycle will repeat indefinitely.

A single task, "rfEasyLinkTxFnx", configures the RF driver through the EasyLink
API and transmits messages.

EasyLink API
-------------------------
# Overview #
The EasyLink API should be used in application code. The EasyLink API is
intended to abstract the RF Driver in order to give a simple API for
customers to use as is or extend to suit their application[Use Cases]
(@ref USE_CASES).

# General Behavior #
Before using the EasyLink API:

  - The EasyLink Layer is initialized by calling EasyLink_init(). This
    initializes and opens the RF driver and configures a modulation scheme
    passed to EasyLink_init.
  - The RX and TX can operate independently of each other.

The following is true for receive operation:

  - RX is enabled by calling EasyLink_receive() or EasyLink_receiveAsync()
  - Entering RX can be immediate or scheduled
  - EasyLink_receive() is blocking and EasyLink_receiveAsync() is nonblocking
  - the EasyLink API does not queue messages so calling another API function
    while in EasyLink_receiveAsync() will return EasyLink_Status_Busy_Error
  - an Async operation can be cancelled with EasyLink_abort()

The following apply for transmit operation:

  - TX is enabled by calling EasyLink_transmit() or EasyLink_transmitAsync()
  - TX can be immediate or scheduled
  - EasyLink_transmit() is blocking and EasyLink_transmitAsync() is nonblocking
  - EasyLink_transmit() for a scheduled command, or if TX cannot start
  - The EasyLink API does not queue messages so calling another API function
    while in EasyLink_transmitAsync() will return EasyLink_Status_Busy_Error
  - An Async operation can be cancelled with EasyLink_abort()

# Error Handling #
The EasyLink API will return EasyLink_Status containing success or error
  code. The EasyLink_Status codes are:

   - EasyLink_Status_Success
   - EasyLink_Status_Config_Error
   - EasyLink_Status_Param_Error
   - EasyLink_Status_Mem_Error
   - EasyLink_Status_Cmd_Error
   - EasyLink_Status_Tx_Error
   - EasyLink_Status_Rx_Error
   - EasyLink_Status_Rx_Timeout
   - EasyLink_Status_Busy_Error
   - EasyLink_Status_Aborted

# Power Management #
The TI-RTOS power management framework will try to put the device into the most
power efficient mode whenever possible. Please see the technical reference
manual for further details on each power mode.

The EasyLink Layer uses the power management offered by the RF driver Refer to the RF
drive documentation for more details.

# Supported Functions #
    | Generic API function          | Description                                       |
    |-------------------------------|---------------------------------------------------|
    | EasyLink_init()               | Init's and opens the RF driver and configures the |
    |                               | specified modulation                              |
    | EasyLink_transmit()           | Blocking Transmit                                 |
    | EasyLink_transmitAsync()      | Non-blocking Transmit                             |
    | EasyLink_receive()            | Blocking Receive                                  |
    | EasyLink_receiveAsync()       | Non-blocking Receive                              |
    | EasyLink_abort()              | Aborts a non-blocking call                        |
    | EasyLink_EnableRxAddrFilter() | Enables/Disables RX filtering on the Addr         |
    | EasyLink_GetIeeeAddr()        | Gets the IEEE Address                             |
    | EasyLink_SetFreq()            | Sets the frequency                                |
    | EasyLink_GetFreq()            | Gets the frequency                                |
    | EasyLink_SetRfPwr()           | Sets the TX Power                                 |
    | EasyLink_GetRfPwr()           | Gets the TX Power                                 |

# Frame Structure #
The EasyLink implements a basic header for transmitting and receiving data. This header supports
addressing for a star or point-to-point network with acknowledgements.

Packet structure:

     _________________________________________________________
    |           |                   |                         |
    | 1B Length | 1-64b Dst Address |         Payload         |
    |___________|___________________|_________________________|


Note for IAR users: When using the CC1310DK, the TI XDS110v3 USB Emulator must
be selected. For the CC1310_LAUNCHXL, select TI XDS110 Emulator. In both cases,
select the cJTAG interface.

## References
* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
