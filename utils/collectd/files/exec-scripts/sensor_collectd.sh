#!/bin/bash

HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-60}"

while true; do
  VALUE=$(awk '{ printf("%.1f", $0 / 1000) }' /sys/class/thermal/thermal_zone0/temp)
  echo "PUTVAL \"$HOSTNAME/CPUTEMPERTURE\" interval=$INTERVAL N:$VALUE"
  sleep "${INTERVAL%%.*}"
done
