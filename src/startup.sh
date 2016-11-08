#!/bin/bash

## === HOW TO START THIS STACK ===

## Run the following commands, one by one. Review each out log file and wait until finish to run next

/root/pinpoint/quickstart/bin/start-hbase.sh &> /root/logs/hbase.out &
/root/pinpoint/quickstart/bin/init-hbase.sh &> /root/logs/hbase-init.out &
/root/pinpoint/quickstart/bin/start-collector.sh &> /root/logs/collector.out &
/root/pinpoint/quickstart/bin/start-web.sh &> /root/logs/webui.out &
