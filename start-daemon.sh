#!/bin/sh

# Start the guix build daemon

guix-daemon --build-users-group=guix-builder --disable-deduplication
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start guix-daemon: $status"
  exit $status
fi

# Map guix-daemon UNIX socket to a TCP port

socat TCP4-LISTEN:30123,forever,fork UNIX:/var/guix/daemon-socket/socket

status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start socat: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited

while /bin/true; do
  PROCESS_1_STATUS=$(ps aux |grep -q socat |grep -v grep)
  PROCESS_2_STATUS=$(ps aux |grep -q guix-daemon | grep -v grep)
  # If the greps above find anything, they will exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit -1
  fi
  sleep 5
done
