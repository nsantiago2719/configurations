#!/usr/bin/env python
# -*- coding: utf-8 -*-
# zsh_battery_state 0.1
# 13:04:03 2012.03.10
# Jactry Zeng <jactry92@gmail.com>

import math
import sys, os
import re

remaining_capacity = open("/sys/class/power_supply/BAT0/energy_now").readline()
state = open("/sys/class/power_supply/BAT0/status").readline()
state = state.replace("\n", '')
last_full_capacity = open("/sys/class/power_supply/BAT0/energy_full").readline()


remaining_capacity = int(remaining_capacity)
last_full_capacity = int(last_full_capacity)
power=int((remaining_capacity*100/last_full_capacity)/10.0)

full_power = 10
power_filled = int(math.ceil(power * (full_power / 10.0))) * "▰"
used = (full_power - len(power_filled)) * "▱"
charged =  "✓"
discharging =  "↯"
out = (power_filled + used)



color_green = "%{[32m%}"
color_yellow = "%{[1;33m%}"
color_red = "%{[31m%}"
color_reset = "%{[00m%}"

if len(power_filled) > 6:
	color_of_out = color_green
	color_of_discharging = color_green
elif len(power_filled) > 4:
	color_of_out = color_yellow
	color_of_discharging = color_yellow
else:
	color_of_out = color_red
	color_of_discharging = color_red


show_discharging = color_of_discharging + discharging + color_reset
show_charging = color_green + charged + color_reset
bar = color_of_out + out + color_reset

if state == "Charged":
    sys.stdout.write(show_charging)
elif state == "Charging":
    sys.stdout.write(show_discharging+" "+bar)
else:
    sys.stdout.write(color_of_discharging + bar)
