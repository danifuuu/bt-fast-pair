#! /bin/bash

# Put the MAC of the device here
MAC=AA:AA:AA:AA:AA:AA

sudo service bluetooth restart &&

sleep 1
bluetoothctl -- agent on &&
sleep 1
bluetoothctl -- default-agent &&
sleep 1
bluetoothctl -- power on &&
sleep 1
bluetoothctl -- pairable on &&
sleep 1
bluetoothctl -- devices &&
sleep 1
bluetoothctl -- remove $MAC &&
sleep 1
bluetoothctl -- scan on &
sleep 1
bluetoothctl -- pair $MAC &&
sleep 1
bluetoothctl -- connect $MAC &&
sleep 1
bluetoothctl -- trust $MAC &&
sleep 2

pkill bluetoothctl

exit
