#! /bin/bash 
picom &
nitrogen --restore &
#dwmblocks &
nm-applet &

nmcli c up Ahmed &

xinput set-prop 12 289 1 &

while true; do
#! /bin/bash 

upt="$(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/, / /g')"
echo -e " ↸ $upt uptime "

#!/bin/bash 

vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
echo " <))) ${vol}% "

#! /bin/bash 

dte="$(date +"%a, %B %d %l:%M%p"| sed 's/  / /g')"
echo -e " ⦼ $dte"

#! /bin/bash 

mem="$(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo -e " ↹ $mem ram "

#! /bin/bash 

kern="$(uname -r)"
echo -e " ☑ $kern "

#!/bin/bash

cupd=$(pacman -Qu | wc -l)
echo -e " ↻ $cupd updates "

cupdaur=$(checkupdates-aur | wc -l)
echo -e " ↻ $cupd updates "

#!/bin/bash
bat=$(acpi  | awk -F'[ :]+' '/, /{print $4}')

cpu=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')

nm=$( nmcli c show --active | awk '{if(NR==2)print $1}')

xsetroot -name  "↸ WIFI $nm | ↹ cpu $cpu /-\ $mem ram | ↻ $cupd Pac $cupdaur AUR updates | ⦼ $kern | Battery $bat | $dte"
sleep 5
done &


