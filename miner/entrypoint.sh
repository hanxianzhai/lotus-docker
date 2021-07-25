#!/bin/bash
if [ -n "$VERSION" ] &&  [ -n "$SCHEDULE_MODE" ]; then
     wget -P /home/xxx/bin -c http://192.168.2.2:8888/${VERSION}/${SCHEDULE_MODE}/lotus-miner/lotus-miner
     chmod +x /home/xxx/bin/*
else
    echo "Please set the ENV!!!"
    exit 1
fi
exec "$@"
