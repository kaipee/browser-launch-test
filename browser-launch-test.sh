#!/bin/bash

# Author:	Keith Patton 2016
# Brief:	A BASH script to compare the load times of
#		Google Chrome and Firefox web browsers

# Launch both firefox and google-chrome
(nohup firefox >/dev/null 2>&1 &) && (nohup google-chrome-stable >/dev/null 2>&1 &)

# Wait for the Chrome window to appear
status=0
while [ $status -eq 0 ]
do
	sleep 1
	status=`wmctrl -x -l | grep "Google Chrome" | wc -l | gawk '{print $1}'`
done

# Move to secondary monitor
# wmctrl [resize] window with title [Window Title] [and move] [zindex,x,y,w,h]
wmctrl -r 'Google Chrome' -e '0,1600,0,1600,900'
