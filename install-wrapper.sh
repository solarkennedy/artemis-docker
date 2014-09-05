#!/bin/bash
Xvfb :0 -screen 0 1024x768x16 &
sleep 3s

wine /Artemis_demo_v2_1.exe &

while ! pgrep Artemis_demo >/dev/null; do
  echo Waiting for Artemis to show up as a process
  sleep 1s
done
WPIPID=`pgrep Artemis_demo`

echo Waiting for an Artemis window to appear
while ! xdotool search --all --pid $WPIPID ; do
  echo -n "."
  sleep 1s
done
echo
# The main window is a second window after a loading one.
sleep 5s
# By now the main window is up.
WINDOW=`xdotool search --all --pid $WPIPID`

echo "Waiting for the installer to finish. Mashing the Return button."
echo "Next next next. Standard way to install windows programs"
echo
while xdotool key --window $WINDOW Return >/dev/null; do
  echo -n "."
  sleep 2s
done
echo
sleep 2s

exit 0
