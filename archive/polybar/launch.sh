#!/bin/bash

# Terminate already running bra instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/launch.sh
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

# 2 bar config example
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Polybar launched..."
