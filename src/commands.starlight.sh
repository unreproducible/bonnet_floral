#!/bin/bash

python3 BME280.py
python3 TSL2561.py

#cd luma.examples/examples/
#python3 bounce.py --display ssd1306 --width 128 --height 64 --interface spi --spi-port 0 --spi-device 0 --gpio-reset 24 --gpio-data-command 23 &

# RGB LED 
for x in 0 2 20
do
	if [[ ! -e /sys/class/gpio/gpio${x} ]]
	then
		echo ${x} > /sys/class/gpio/export
	fi
	echo out > /sys/class/gpio/gpio${x}/direction
	echo 1 > /sys/class/gpio/gpio${x}/value
	sleep 5
done

# Push Button
echo 46 > /sys/class/gpio/export
echo in > /sys/class/gpio46/direction
watch -n 1 cat /sys/class/gpio/gpio46/value

