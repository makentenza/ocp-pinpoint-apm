#!/bin/bash

echo "## === HOW THIS STACK HAS STARTED ==="

echo "## Run the following commands, one by one. Review each out log file and wait until finish to run next"
echo ""
echo "/pinpoint/quickstart/bin/start-hbase.sh"
echo "/pinpoint/quickstart/bin/init-hbase.sh"
echo "/pinpoint/quickstart/bin/start-collector.sh &> /root/logs/collector.out &"
echo "/pinpoint/quickstart/bin/start-web.sh &> /root/logs/webui.out &"
echo ""
echo "## Run the TEST application:"
echo ""
echo "/pinpoint/quickstart/bin/start-testapp.sh &> /root/logs/testapp.out &"
echo ""

echo "## === EACH COMPONENT LOG FILE ==="
echo ""
echo "Collector ---->  /root/logs/collector.out"
echo "Web UI ------->  /root/logs/webui.out"
echo "Test App ----->  /root/logs/testapp.out"
