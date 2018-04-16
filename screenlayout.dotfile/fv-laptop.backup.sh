#!/bin/bash

HDMI_CONNECTED=$(xrandr -q |grep "HDMI-1 connected"|wc -l);
SCREEN_OPEN=$(grep open /proc/acpi/button/lid/LID0/state|wc -l);

if [ "$HDMI_CONNECTED" == "1" ] && [ "$SCREEN_OPEN" == "1" ]
then
	~/.screenlayout/fv-laptop-dual.sh
elif [ "$HDMI_CONNECTED" == "1" ]
then
	~/.screenlayout/fv-laptop-external.sh
else
	~/.screenlayout/fv-laptop-internal.sh
fi
