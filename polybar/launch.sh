#!/bin/bash
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  # polybar DP-4 &
  # polybar DP-7 &

  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload bosch_workstation &
  done
)

