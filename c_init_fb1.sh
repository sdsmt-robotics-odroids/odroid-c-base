#!/bin/sh

echo "Initializing ODROID-C fb1..."

/usr/sbin/fbset -fb /dev/fb1 -g 32 32 32 32 32
echo 0 > /sys/class/graphics/fb1/free_scale

# Console unblack
echo 1 > /sys/class/graphics/fb1/blank
