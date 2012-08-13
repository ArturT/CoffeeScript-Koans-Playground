#!/bin/bash
# Based on http://stackoverflow.com/a/4139449

currentwindow=`xdotool getwindowfocus`

id=`xdotool search --name '[Site Title] - Google Chrome'`
xdotool windowmap $id
if [ $? = 0 ]
then
    xdotool windowactivate $id
    xdotool key 'ctrl+r' $id
fi

id=`xdotool search --name '[Site Title] - Moz'`
xdotool windowmap $id
if [ $? = 0 ]
then
    xdotool windowactivate $id
    xdotool key 'ctrl+r' $id
fi

#xdotool windowmap $currentwindow
xdotool windowactivate $currentwindow
