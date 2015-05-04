#!/bin/sh

echo "Initializing ODROID-C fb0..."

# Get stuff from cmdline
for x in $(cat /proc/cmdline); do
	case ${x} in
		m_bpp=*) export bpp=${x#*=} ;;
		hdmimode=*) export mode=${x#*=} ;;
	esac
done

common_display_setup() {
	echo 0 > /sys/class/graphics/fb0/free_scale
	echo 1 > /sys/class/graphics/fb0/freescale_mode

	case $mode in
		800x480*) M="0 0 799 479" ;;
		vga*) M="0 0 639 749" ;;
		800x600p60*) M="0 0 799 599" ;;
		1024x600p60h*) M="0 0 1023 599" ;;
		1024x768p60h*) M="0 0 1023 767" ;;
		sxga*) M="0 0 1279 1023" ;;
		1440x900p60*) M="0 0 1439 899" ;;
		480*) M="0 0 719 479" ;;
		576*) M="0 0 719 575" ;;
		720*) M="0 0 1279 719" ;;
		800*) M="0 0 1279 799" ;;
		1080*) M="0 0 1919 1079" ;;
		1920x1200*) M="0 0 1919 1199" ;;
		1680x1050p60*) M="0 0 1679 1049" ;;
		1360x768p60*) M="0 0 1359 767" ;;
		1366x768p60*) M="0 0 1365 767" ;;
		1600x900p60*) M="0 0 1599 899" ;;
	esac

	echo $M > /sys/class/graphics/fb0/free_scale_axis
	echo $M > /sys/class/graphics/fb0/window_axis
	echo 0x10001 > /sys/class/graphics/fb0/free_scale
}

case $mode in
	800x480*)	/usr/sbin/fbset -fb /dev/fb0 -g 800 480 800 960 $bpp;		common_display_setup ;;
	vga*)		/usr/sbin/fbset -fb /dev/fb0 -g 640 480 640 960 $bpp;		common_display_setup ;;
	480*)		/usr/sbin/fbset -fb /dev/fb0 -g 720 480 720 960 $bpp;		common_display_setup ;;
	800x600p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 800 600 800 1200 $bpp;		common_display_setup ;;
	576*)		/usr/sbin/fbset -fb /dev/fb0 -g 720 576 720 1152 $bpp;		common_display_setup ;;
	1024x600p60h*)	/usr/sbin/fbset -fb /dev/fb0 -g 1024 600 1024 1200 $bpp;	common_display_setup ;;
	1024x768p60h*)	/usr/sbin/fbset -fb /dev/fb0 -g 1024 768 1024 1536 $bpp;	common_display_setup ;;
	720*)		/usr/sbin/fbset -fb /dev/fb0 -g 1280 720 1280 1440 $bpp;	common_display_setup ;;
	800*)		/usr/sbin/fbset -fb /dev/fb0 -g 1280 800 1280 1600 $bpp;	common_display_setup ;;
	sxga*)		/usr/sbin/fbset -fb /dev/fb0 -g 1280 1024 1280 2048 $bpp;	common_display_setup ;;
	1440x900p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 1440 900 1440 1800 $bpp;	common_display_setup ;;
	1080*)		/usr/sbin/fbset -fb /dev/fb0 -g 1920 1080 1920 2160 $bpp;	common_display_setup ;;
	1920x1200*)	/usr/sbin/fbset -fb /dev/fb0 -g 1920 1200 1920 2400 $bpp;	common_display_setup ;;
	1360x768p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 1360 768 1360 1536 $bpp;	common_display_setup ;;
	1366x768p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 1366 768 1366 1536 $bpp;	common_display_setup ;;
	1600x900p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 1600 900 1600 1800 $bpp;	common_display_setup ;;
	1680x1050p60*)	/usr/sbin/fbset -fb /dev/fb0 -g 1680 1050 1680 2100 $bpp;	common_display_setup ;;
esac

# Console unblack
echo 0 > /sys/class/graphics/fb0/blank
