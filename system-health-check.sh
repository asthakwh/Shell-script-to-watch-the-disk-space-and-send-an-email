#!/bin/bash

THRESHOLD=85

# Disk usage
disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

# Memory usage
mem=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

# CPU usage
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

if [ "$disk" -gt "$THRESHOLD" ]; then
    notify-send "Warning" "Disk usage is ${disk}%"
fi

if [ "$mem" -gt "$THRESHOLD" ]; then
    notify-send "Warning" "Memory usage is ${mem}%"
fi

if [ "$cpu" -gt "$THRESHOLD" ]; then
    notify-send "Warning" "CPU usage is ${cpu}%"
fi
