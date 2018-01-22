EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:homebrew
LIBS:GeekAmmo
LIBS:LilyPad-Wearables
LIBS:SparkFun-Aesthetics
LIBS:SparkFun-AnalogIC
LIBS:SparkFun-Boards
LIBS:SparkFun-Capacitors
LIBS:SparkFun-Connectors
LIBS:SparkFun-DigitalIC
LIBS:SparkFun-DiscreteSemi
LIBS:SparkFun-Displays
LIBS:SparkFun-Electromechanical
LIBS:SparkFun-FreqCtrl
LIBS:SparkFun-LED
LIBS:SparkFun-Passives
LIBS:SparkFun-PowerIC
LIBS:SparkFun-Resistors
LIBS:SparkFun-Retired
LIBS:SparkFun-RF
LIBS:SparkFun-Sensors
LIBS:Teensy_3_and_LC_Series_Boards_v1.1
LIBS:User-Submitted
LIBS:adafruit
LIBS:10118194-0001LF
LIBS:firefly2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SAM_D11C U1
U 1 1 5A541B47
P 1450 1800
F 0 "U1" H 1400 1550 60  0000 C CNN
F 1 "SAM_D11C" H 1450 1800 60  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 1400 1550 60  0001 C CNN
F 3 "" H 1400 1550 60  0000 C CNN
	1    1450 1800
	1    0    0    -1  
$EndComp
Text Notes 7350 7500 0    60   ~ 0
Firefly V2
Text Notes 8150 7650 0    60   ~ 0
2018-01-08
Text Notes 10550 7650 0    60   ~ 0
1	
$Comp
L CONN_01X03 P2
U 1 1 5A5420CD
P 2850 7450
F 0 "P2" H 2850 7650 50  0000 C CNN
F 1 "CONN_01X03" V 2950 7450 50  0000 C CNN
F 2 "SparkFun-Connectors:1X03" H 2850 7450 50  0001 C CNN
F 3 "" H 2850 7450 50  0000 C CNN
	1    2850 7450
	1    0    0    -1  
$EndComp
Text Notes 550  6750 0    60   ~ 0
USB connector\n(Power/programming)
Text Notes 2400 6650 0    60   ~ 0
Off board LED
$Comp
L +3V3 #PWR1
U 1 1 5A5421BD
P 1000 1250
F 0 "#PWR1" H 1000 1100 50  0001 C CNN
F 1 "+3V3" H 1000 1390 50  0000 C CNN
F 2 "" H 1000 1250 50  0000 C CNN
F 3 "" H 1000 1250 50  0000 C CNN
	1    1000 1250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR5
U 1 1 5A54225C
P 2650 7350
F 0 "#PWR5" H 2650 7200 50  0001 C CNN
F 1 "+5V" H 2650 7490 50  0000 C CNN
F 2 "" H 2650 7350 50  0000 C CNN
F 3 "" H 2650 7350 50  0000 C CNN
	1    2650 7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 5A542285
P 2650 7550
F 0 "#PWR6" H 2650 7300 50  0001 C CNN
F 1 "GND" H 2650 7400 50  0000 C CNN
F 2 "" H 2650 7550 50  0000 C CNN
F 3 "" H 2650 7550 50  0000 C CNN
	1    2650 7550
	1    0    0    -1  
$EndComp
Text GLabel 2450 7450 1    60   Input ~ 0
LED_EXTERNAL
Wire Wire Line
	2450 7450 2650 7450
$Comp
L CONN_01X04 P3
U 1 1 5A5423D1
P 3750 7400
F 0 "P3" H 3750 7650 50  0000 C CNN
F 1 "CONN_01X04" V 3850 7400 50  0000 C CNN
F 2 "SparkFun-Connectors:1X04" H 3750 7400 50  0001 C CNN
F 3 "" H 3750 7400 50  0000 C CNN
	1    3750 7400
	1    0    0    -1  
$EndComp
Text Notes 3150 6750 0    60   ~ 0
ARM\nSerial Wire Debug
$Comp
L +3V3 #PWR7
U 1 1 5A54243D
P 3550 7250
F 0 "#PWR7" H 3550 7100 50  0001 C CNN
F 1 "+3V3" H 3550 7390 50  0000 C CNN
F 2 "" H 3550 7250 50  0000 C CNN
F 3 "" H 3550 7250 50  0000 C CNN
	1    3550 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 5A542459
P 3550 7550
F 0 "#PWR8" H 3550 7300 50  0001 C CNN
F 1 "GND" H 3550 7400 50  0000 C CNN
F 2 "" H 3550 7550 50  0000 C CNN
F 3 "" H 3550 7550 50  0000 C CNN
	1    3550 7550
	1    0    0    -1  
$EndComp
Text GLabel 3400 7350 1    60   Input ~ 0
ARM_SWDIO
Text GLabel 3250 7450 1    60   Input ~ 0
ARM_SWCLK
Wire Wire Line
	3400 7350 3550 7350
Wire Wire Line
	3550 7450 3250 7450
$Comp
L +5V #PWR3
U 1 1 5A5424FD
P 2000 7250
F 0 "#PWR3" H 2000 7100 50  0001 C CNN
F 1 "+5V" H 2000 7390 50  0000 C CNN
F 2 "" H 2000 7250 50  0000 C CNN
F 3 "" H 2000 7250 50  0000 C CNN
	1    2000 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 5A542519
P 2000 7450
F 0 "#PWR4" H 2000 7200 50  0001 C CNN
F 1 "GND" H 2000 7300 50  0000 C CNN
F 2 "" H 2000 7450 50  0000 C CNN
F 3 "" H 2000 7450 50  0000 C CNN
	1    2000 7450
	1    0    0    -1  
$EndComp
Text GLabel 850  7350 1    60   Input ~ 0
USB_D-
Text GLabel 1000 7250 1    60   Input ~ 0
USB_D+
Wire Wire Line
	850  7350 1000 7350
$Comp
L GND #PWR12
U 1 1 5A54267D
P 4350 7450
F 0 "#PWR12" H 4350 7200 50  0001 C CNN
F 1 "GND" H 4350 7300 50  0000 C CNN
F 2 "" H 4350 7450 50  0000 C CNN
F 3 "" H 4350 7450 50  0000 C CNN
	1    4350 7450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR11
U 1 1 5A54269B
P 4350 7150
F 0 "#PWR11" H 4350 7000 50  0001 C CNN
F 1 "+3V3" H 4350 7290 50  0000 C CNN
F 2 "" H 4350 7150 50  0000 C CNN
F 3 "" H 4350 7150 50  0000 C CNN
	1    4350 7150
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR10
U 1 1 5A5426B9
P 4350 7050
F 0 "#PWR10" H 4350 6900 50  0001 C CNN
F 1 "+5V" H 4350 7190 50  0000 C CNN
F 2 "" H 4350 7050 50  0000 C CNN
F 3 "" H 4350 7050 50  0000 C CNN
	1    4350 7050
	1    0    0    -1  
$EndComp
Text Notes 4050 6800 0    60   ~ 0
Debug Power\nAccess
$Comp
L GND #PWR2
U 1 1 5A542851
P 1000 1350
F 0 "#PWR2" H 1000 1100 50  0001 C CNN
F 1 "GND" H 1000 1200 50  0000 C CNN
F 2 "" H 1000 1350 50  0000 C CNN
F 3 "" H 1000 1350 50  0000 C CNN
	1    1000 1350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P4
U 1 1 5A54290F
P 4550 7250
F 0 "P4" H 4550 7550 50  0000 C CNN
F 1 "CONN_01X05" V 4650 7250 50  0000 C CNN
F 2 "SparkFun-Connectors:1X05" H 4550 7250 50  0001 C CNN
F 3 "" H 4550 7250 50  0000 C CNN
	1    4550 7250
	1    0    0    -1  
$EndComp
Text GLabel 4350 7250 0    60   Input ~ 0
AUX1
Text GLabel 4350 7350 0    60   Input ~ 0
AUX2
$Comp
L RFM69CW U2
U 1 1 5A542578
P 4900 1700
F 0 "U2" H 4500 2250 50  0000 L BNN
F 1 "RFM69CW" H 4500 1075 50  0000 L BNN
F 2 "SparkFun-RF:RFM69CW-XXXS2" H 4930 1850 20  0001 C CNN
F 3 "" H 4900 1700 60  0000 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR13
U 1 1 5A542675
P 5500 1900
F 0 "#PWR13" H 5500 1650 50  0001 C CNN
F 1 "GND" H 5500 1750 50  0000 C CNN
F 2 "" H 5500 1900 50  0000 C CNN
F 3 "" H 5500 1900 50  0000 C CNN
	1    5500 1900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR14
U 1 1 5A542695
P 5500 2100
F 0 "#PWR14" H 5500 1850 50  0001 C CNN
F 1 "GND" H 5500 1950 50  0000 C CNN
F 2 "" H 5500 2100 50  0000 C CNN
F 3 "" H 5500 2100 50  0000 C CNN
	1    5500 2100
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 5A542715
P 5000 7400
F 0 "P5" H 5000 7500 50  0000 C CNN
F 1 "CONN_01X01" V 5100 7400 50  0000 C CNN
F 2 "SparkFun-Connectors:1X01" H 5000 7400 50  0001 C CNN
F 3 "" H 5000 7400 50  0000 C CNN
	1    5000 7400
	1    0    0    -1  
$EndComp
Text Notes 4750 6750 0    60   ~ 0
Antenna
Text GLabel 4800 7400 1    60   Input ~ 0
ANTENNA
Text GLabel 5700 2000 2    60   Input ~ 0
ANTENNA
Wire Wire Line
	5700 2000 5500 2000
Text GLabel 5500 1300 2    60   Input ~ 0
RADIO_DIO0
Text GLabel 4300 1500 0    60   Input ~ 0
RADIO_MISO
Text GLabel 4300 1600 0    60   Input ~ 0
RADIO_MOSI
Text GLabel 4300 1700 0    60   Input ~ 0
RADIO_SCK
Text GLabel 4300 1800 0    60   Input ~ 0
RADIO_NSS
NoConn ~ 5500 1400
NoConn ~ 5500 1500
NoConn ~ 5500 1600
NoConn ~ 5500 1700
NoConn ~ 4300 2100
$Comp
L WS2812B D1
U 1 1 5A54355C
P 7350 1050
F 0 "D1" H 7260 1380 50  0000 L BNN
F 1 "WS2812B" H 7250 750 50  0000 L BNN
F 2 "SparkFun-LED:WS2812B" H 7380 1200 20  0001 C CNN
F 3 "" H 7350 1050 60  0000 C CNN
	1    7350 1050
	1    0    0    -1  
$EndComp
$Comp
L WS2812B D2
U 1 1 5A5435CB
P 7350 1850
F 0 "D2" H 7260 2180 50  0000 L BNN
F 1 "WS2812B" H 7250 1550 50  0000 L BNN
F 2 "SparkFun-LED:WS2812B" H 7380 2000 20  0001 C CNN
F 3 "" H 7350 1850 60  0000 C CNN
	1    7350 1850
	1    0    0    -1  
$EndComp
$Comp
L WS2812B D3
U 1 1 5A543630
P 7350 2650
F 0 "D3" H 7260 2980 50  0000 L BNN
F 1 "WS2812B" H 7250 2350 50  0000 L BNN
F 2 "SparkFun-LED:WS2812B" H 7380 2800 20  0001 C CNN
F 3 "" H 7350 2650 60  0000 C CNN
	1    7350 2650
	1    0    0    -1  
$EndComp
$Comp
L WS2812B D4
U 1 1 5A54365F
P 7350 3450
F 0 "D4" H 7260 3780 50  0000 L BNN
F 1 "WS2812B" H 7250 3150 50  0000 L BNN
F 2 "SparkFun-LED:WS2812B" H 7380 3600 20  0001 C CNN
F 3 "" H 7350 3450 60  0000 C CNN
	1    7350 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR15
U 1 1 5A543862
P 7150 850
F 0 "#PWR15" H 7150 700 50  0001 C CNN
F 1 "+5V" H 7150 990 50  0000 C CNN
F 2 "" H 7150 850 50  0000 C CNN
F 3 "" H 7150 850 50  0000 C CNN
	1    7150 850 
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR16
U 1 1 5A54388C
P 7150 1650
F 0 "#PWR16" H 7150 1500 50  0001 C CNN
F 1 "+5V" H 7150 1790 50  0000 C CNN
F 2 "" H 7150 1650 50  0000 C CNN
F 3 "" H 7150 1650 50  0000 C CNN
	1    7150 1650
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR17
U 1 1 5A543915
P 7150 2450
F 0 "#PWR17" H 7150 2300 50  0001 C CNN
F 1 "+5V" H 7150 2590 50  0000 C CNN
F 2 "" H 7150 2450 50  0000 C CNN
F 3 "" H 7150 2450 50  0000 C CNN
	1    7150 2450
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR18
U 1 1 5A543955
P 7150 3250
F 0 "#PWR18" H 7150 3100 50  0001 C CNN
F 1 "+5V" H 7150 3390 50  0000 C CNN
F 2 "" H 7150 3250 50  0000 C CNN
F 3 "" H 7150 3250 50  0000 C CNN
	1    7150 3250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR19
U 1 1 5A54397F
P 8050 1150
F 0 "#PWR19" H 8050 900 50  0001 C CNN
F 1 "GND" H 8050 1000 50  0000 C CNN
F 2 "" H 8050 1150 50  0000 C CNN
F 3 "" H 8050 1150 50  0000 C CNN
	1    8050 1150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR20
U 1 1 5A5439A9
P 8050 1950
F 0 "#PWR20" H 8050 1700 50  0001 C CNN
F 1 "GND" H 8050 1800 50  0000 C CNN
F 2 "" H 8050 1950 50  0000 C CNN
F 3 "" H 8050 1950 50  0000 C CNN
	1    8050 1950
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR21
U 1 1 5A5439D3
P 8050 2750
F 0 "#PWR21" H 8050 2500 50  0001 C CNN
F 1 "GND" H 8050 2600 50  0000 C CNN
F 2 "" H 8050 2750 50  0000 C CNN
F 3 "" H 8050 2750 50  0000 C CNN
	1    8050 2750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR22
U 1 1 5A543A27
P 8050 3550
F 0 "#PWR22" H 8050 3300 50  0001 C CNN
F 1 "GND" H 8050 3400 50  0000 C CNN
F 2 "" H 8050 3550 50  0000 C CNN
F 3 "" H 8050 3550 50  0000 C CNN
	1    8050 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7150 1150 7150 1400
Wire Wire Line
	7150 1400 8050 1400
Wire Wire Line
	8050 1400 8050 1650
Wire Wire Line
	7150 1950 7150 2200
Wire Wire Line
	7150 2200 8050 2200
Wire Wire Line
	8050 2200 8050 2450
Wire Wire Line
	7150 2750 7150 3000
Wire Wire Line
	7150 3000 8050 3000
Wire Wire Line
	8050 3000 8050 3250
$Comp
L R R1
U 1 1 5A543CB0
P 8200 850
F 0 "R1" V 8280 850 50  0000 C CNN
F 1 "220" V 8200 850 50  0000 C CNN
F 2 "SparkFun-Resistors:0603" V 8130 850 50  0001 C CNN
F 3 "" H 8200 850 50  0000 C CNN
	1    8200 850 
	0    1    1    0   
$EndComp
Text GLabel 7150 3550 0    60   Input ~ 0
LED_EXTERNAL
Text GLabel 8350 850  2    60   Input ~ 0
LED_INTERNAL
Text GLabel 1950 2150 2    60   Input ~ 0
LED_INTERNAL
Text GLabel 1950 1250 2    60   Input ~ 0
RADIO_DIO0
Text GLabel 1950 1450 2    60   Input ~ 0
RADIO_MISO
Text GLabel 1950 1750 2    60   Input ~ 0
RADIO_MOSI
Text GLabel 1950 1850 2    60   Input ~ 0
RADIO_SCK
Text GLabel 1950 1350 2    60   Input ~ 0
RADIO_NSS
Text GLabel 1950 1950 2    60   Input ~ 0
USB_D-
Text GLabel 1950 2050 2    60   Input ~ 0
USB_D+
Text GLabel 1950 2250 2    60   Input ~ 0
ARM_SWCLK
Text GLabel 1950 2350 2    60   Input ~ 0
ARM_SWDIO
Text GLabel 1950 1550 2    60   Input ~ 0
AUX1
Text GLabel 1950 1650 2    60   Input ~ 0
AUX2
$Comp
L MIC5504 U3
U 1 1 5A547287
P 10400 1050
F 0 "U3" H 10400 1450 60  0000 C CNN
F 1 "MIC5504" H 10400 1000 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 10400 1000 60  0001 C CNN
F 3 "" H 10400 1000 60  0000 C CNN
	1    10400 1050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR23
U 1 1 5A5473E5
P 9800 1150
F 0 "#PWR23" H 9800 900 50  0001 C CNN
F 1 "GND" H 9800 1000 50  0000 C CNN
F 2 "" H 9800 1150 50  0000 C CNN
F 3 "" H 9800 1150 50  0000 C CNN
	1    9800 1150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR24
U 1 1 5A547413
P 10000 750
F 0 "#PWR24" H 10000 600 50  0001 C CNN
F 1 "+5V" H 10000 890 50  0000 C CNN
F 2 "" H 10000 750 50  0000 C CNN
F 3 "" H 10000 750 50  0000 C CNN
	1    10000 750 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR25
U 1 1 5A547441
P 10950 950
F 0 "#PWR25" H 10950 800 50  0001 C CNN
F 1 "+3V3" H 10950 1090 50  0000 C CNN
F 2 "" H 10950 950 50  0000 C CNN
F 3 "" H 10950 950 50  0000 C CNN
	1    10950 950 
	1    0    0    -1  
$EndComp
NoConn ~ 10000 950 
$Comp
L CAP0603-CAP C2
U 1 1 5A5477DB
P 9800 850
F 0 "C2" H 9860 965 50  0000 L BNN
F 1 "1uF" H 9860 765 50  0000 L BNN
F 2 "SparkFun-Capacitors:0603" H 9830 1000 20  0001 C CNN
F 3 "" H 9800 850 60  0000 C CNN
	1    9800 850 
	-1   0    0    1   
$EndComp
$Comp
L CAP0603-CAP C3
U 1 1 5A547830
P 10950 1050
F 0 "C3" H 11010 1165 50  0000 L BNN
F 1 "1uF" H 11010 965 50  0000 L BNN
F 2 "SparkFun-Capacitors:0603" H 10980 1200 20  0001 C CNN
F 3 "" H 10950 1050 60  0000 C CNN
	1    10950 1050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR26
U 1 1 5A547D81
P 10950 1250
F 0 "#PWR26" H 10950 1000 50  0001 C CNN
F 1 "GND" H 10950 1100 50  0000 C CNN
F 2 "" H 10950 1250 50  0000 C CNN
F 3 "" H 10950 1250 50  0000 C CNN
	1    10950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 950  10800 950 
Wire Wire Line
	9550 750  10000 750 
Wire Wire Line
	9800 1150 9800 1050
Wire Wire Line
	9550 1050 9950 1050
Wire Wire Line
	9950 1050 9950 850 
Wire Wire Line
	9950 850  10000 850 
$Comp
L CAP0603-CAP C1
U 1 1 5A548BBE
P 9550 850
F 0 "C1" H 9610 965 50  0000 L BNN
F 1 "10uF" H 9610 765 50  0000 L BNN
F 2 "SparkFun-Capacitors:0805" H 9580 1000 20  0001 C CNN
F 3 "" H 9550 850 60  0000 C CNN
	1    9550 850 
	-1   0    0    1   
$EndComp
Connection ~ 9800 750 
Connection ~ 9800 1050
$Comp
L +3V3 #PWR9
U 1 1 5A54A758
P 4300 1300
F 0 "#PWR9" H 4300 1150 50  0001 C CNN
F 1 "+3V3" H 4300 1440 50  0000 C CNN
F 2 "" H 4300 1300 50  0000 C CNN
F 3 "" H 4300 1300 50  0000 C CNN
	1    4300 1300
	1    0    0    -1  
$EndComp
$Comp
L 10118194-0001LF J1
U 1 1 5A59670D
P 1500 7350
F 0 "J1" H 1209 7571 50  0000 L BNN
F 1 "10118194-0001LF" H 1199 7049 50  0000 L BNN
F 2 "10118194-0001LF:FRAMATOME_10118194-0001LF" H 1500 7350 50  0001 L BNN
F 3 "Amphenol" H 1500 7350 50  0001 L BNN
F 4 "0.25 USD" H 1500 7350 50  0001 L BNN "Field4"
F 5 "DIP-4 FCI" H 1500 7350 50  0001 L BNN "Field5"
F 6 "Good" H 1500 7350 50  0001 L BNN "Field6"
F 7 "10118194-0001LF" H 1500 7350 50  0001 L BNN "Field7"
F 8 "CONN USB MICRO B RECPT SMT R/A" H 1500 7350 50  0001 L BNN "Field8"
	1    1500 7350
	1    0    0    -1  
$EndComp
NoConn ~ 1000 7450
$Comp
L hole H1
U 1 1 5A5AA266
P 5550 6800
F 0 "H1" H 5550 6800 60  0000 C CNN
F 1 "hole" H 5550 6800 60  0000 C CNN
F 2 "homebrew:hole-m2.5" H 5550 6800 60  0001 C CNN
F 3 "" H 5550 6800 60  0000 C CNN
	1    5550 6800
	1    0    0    -1  
$EndComp
$Comp
L hole H2
U 1 1 5A5AA2E7
P 5550 7350
F 0 "H2" H 5550 7350 60  0000 C CNN
F 1 "hole" H 5550 7350 60  0000 C CNN
F 2 "homebrew:hole-m2.5" H 5550 7350 60  0001 C CNN
F 3 "" H 5550 7350 60  0000 C CNN
	1    5550 7350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
