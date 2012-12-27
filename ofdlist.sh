#!/bin/bash

for PIDS in $(pgrep "$1");
do
    if [ -d /proc/$PIDS ]; then
        echo "pid: $PIDS"
        echo "  command: $(sudo cat /proc/$PIDS/cmdline)"
        echo "  max open file descriptors: $(sudo cat /proc/$PIDS/limits | grep 'Max open' | awk 'NR==1 {print $5}')"
        echo "  open file descriptors: $(sudo ls /proc/$PIDS/fd/ | wc -w)"
    fi
done
