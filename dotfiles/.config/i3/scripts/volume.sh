#!/bin/bash

cmd=$1

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oE '[0-9]+%' | head -1 | sed 's/%//g')
maxvol=100

# +10% , -10%, or similar

if [ "$cmd" = "incr" ]; then
	by=$2
	if [ `expr $by + $vol` -gt $maxvol ]; then
		echo "YES"
		by=`expr $maxvol - $vol`
	fi
	echo $by
	pactl set-sink-volume @DEFAULT_SINK@ "+$by%"
elif [ "$cmd" = "decr"  ]; then
	by=$2
	pactl set-sink-volume @DEFAULT_SINK@ "-$by%"
elif [ "$cmd" = "volmute"  ]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle

elif [ "$cmd" = "micmute" ]; then
	pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi


