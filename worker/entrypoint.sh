#!/bin/bash
if [ -n "$VERSION" ] && [ -n "$OPTIMIZE" ] && [ -n "$SCHEDULE_MODE" ]; then
     wget -P /home/xxx/bin -c http://192.168.2.199:8888/${VERSION}/${SCHEDULE_MODE}/${OPTIMIZE}/lotus-worker
     chmod +x /home/xxx/bin/*
else
    echo "Please set the ENV!!!"
    exit 1
fi
/home/xxx/bin/lotus-worker run --no-swap --listen 0.0.0.0:8978 --addpiece=true --precommit1=false --precommit2=true --commit=false --parallel-fetch-limit 7 --pc1-num $@
