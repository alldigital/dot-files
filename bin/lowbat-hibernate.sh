#!/bin/bash

DEV="BAT0"
minimum_capacity=10
timeout=10

status=$(cat "/sys/class/power_supply/$DEV/status")
>&2 echo "$(date) - $status"

if [ "$status" == "Unknown" ]
then
    >&2 echo "Status $status - try one more time in ${timeout}s"
    sleep $timeout
fi

status=$(cat "/sys/class/power_supply/$DEV/status")

if [ "$status" == "Discharging" ]
then
    >&2 echo "Status $status properly recognized"
    capacity=$( cat "/sys/class/power_supply/$DEV/capacity")
    >&2 echo "Capacity $capacity%, must be equal or more than $minimum_capacity%"
    if (( capacity < minimum_capacity ))
    then
        >&2 echo "Time to hibernate!"
        /usr/bin/systemctl hibernate
    else
        >&2 echo "Nothing to do."
    fi
fi

exit 0
