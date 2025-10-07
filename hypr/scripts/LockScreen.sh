#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
$HOME/.config/hypr/scripts/UpTimeControl.sh stop &
# For Hyprlock
pidof hyprlock || hyprlock -q

$HOME/.config/hypr/scripts/UpTimeControl.sh start &

# loginctl lock-session

