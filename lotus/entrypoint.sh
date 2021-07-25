#!/bin/bash
if [ -n "$VERSION" ] && [ -n "$CPU_MODE" ]; then
     wget -P /usr/local/bin -c http://192.168.2.199:8888/${VERSION}/lotus/${CPU_MODE}/lotus
     chmod +x /usr/local/bin/lotus
else
    echo "Please set the ENV!!!"
    exit 1
fi
exec "$@"
