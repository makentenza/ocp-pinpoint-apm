#!/bin/bash

echo "## === HOW TO START THIS STACK ==="

echo "\n## Run the following commands, one by one. Review each out log file and wait until finish to run next"

echo "/pinpoint/quickstart/bin/start-hbase.sh"
echo "/pinpoint/quickstart/bin/init-hbase.sh"
echo "/pinpoint/quickstart/bin/start-collector.sh &> /root/logs/collector.out &"
echo "/pinpoint/quickstart/bin/start-web.sh &> /root/logs/webui.out &"

echo "\n## Run the TEST application:"

echo "/pinpoint/quickstart/bin/start-testapp.sh"
