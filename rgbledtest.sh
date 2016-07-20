#!/bin/sh
# From: https://pihw.wordpress.com/lessons/rgb-led-lessons/rgb-led-lesson-0-the-absolute-basics-gpio/
# Bash uses BCM GPIO numbers (i.e. the pin names of the Broadcom Chip itself)
# These are detailed in the Raspberry Pi wiki pages.
# Therefore to make life easier we will map them to the Raspberry Pi GPIO
# Pin Numbers.
PIN12=18
PIN16=23
PIN18=24
PIN22=25
PIN7=4
PIN11=17
PIN13_REV1=21
PIN13_REV2=27
PIN15=22
 
#Setup Pins
LED01=$PIN12
LED02=$PIN16
LED03=$PIN18
LED04=$PIN22
LED05=$PIN7
LED_RED=$PIN11
LED_GREEN=$PIN13_REV2 #Rev2.0 (Ensure you use correct one for your board)
LED_BLUE=$PIN15
 
#Setup Active states
#Common Cathode RGB-LEDs (Cathode=Active Low)
LED_ENABLE=0
LED_DISABLE=1
RGB_ENABLE=1
RGB_DISABLE=0
 
#Set up GPIO to Outputs
# Set up GPIO Pin, to output and put in disable state
echo "$LED01" > /sys/class/gpio/export
echo "$LED_RED" > /sys/class/gpio/export
echo "$LED_GREEN" > /sys/class/gpio/export
echo "$LED_BLUE" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$LED01/direction
echo "out" > /sys/class/gpio/gpio$LED_RED/direction
echo "out" > /sys/class/gpio/gpio$LED_GREEN/direction
echo "out" > /sys/class/gpio/gpio$LED_BLUE/direction
echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
# Setup End
############################################################
 
#Switch on LED with RED/GREEN/BLUE
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_GREEN/value
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$LED_ENABLE" > /sys/class/gpio/gpio$LED01/value
#Wait
sleep 1s
#Switch each LED off
echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
 
############################################################
# Clean Up
echo "$LED01" > /sys/class/gpio/unexport
echo "$LED_RED" > /sys/class/gpio/unexport
echo "$LED_GREEN" > /sys/class/gpio/unexport
echo "$LED_BLUE" > /sys/class/gpio/unexport
#End
