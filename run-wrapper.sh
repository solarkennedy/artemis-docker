#!/bin/bash

function screendump {
 xwd  -root > /tmp/root.xwd
 convert /tmp/root.xwd /tmp/root.png
 img2txt -W 160 /tmp/root.png
}

rm -rf /tmp/.X0-lock
Xvfb :0 -screen 0 1024x768x24 &
sleep 1s
x11vnc &

cd /root/prefix32/drive_c/Program\ Files/Artemis\ DEMO/ && wine Artemis.exe &

sleep 20s
WPIPID=`pgrep Artemis.exe`

echo Waiting for an Artemis window to appear
while ! xdotool search --all --pid $WPIPID ; do
  echo -n "."
  sleep 1s
done
echo
# By now the main window is up.
WINDOW=`xdotool search --all --pid $WPIPID`

# Handle starting

echo "Selecting resolution"
screendump
# Click Full screen
xdotool mousemove --sync 343 173
xdotool click 1

# Click Start Game
xdotool mousemove --sync 250 525
xdotool click 1

# Wait for the next window
sleep 30s

echo "Selecting server stuff"
screendump
# Start server
xdotool mousemove --sync 124 569
sleep 1s
xdotool click 1
sleep 2s

# Solo Game
xdotool mousemove --sync 705 125
sleep 1s
xdotool click 1
sleep 2s

# Start game
xdotool mousemove --sync 905 745
sleep 1s
xdotool click 1
sleep 2s

echo "Starting game..."
while [ true ]; do
  echo "Screen dump:"
  screendump
  sleep 10s
  nc -z localhost 2010 || exit 0
done

wait
