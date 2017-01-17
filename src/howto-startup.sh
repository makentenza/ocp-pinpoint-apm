#!/bin/bash

echo "## === HOW THIS STACK HAS STARTED ==="

echo "## Run the following commands, one by one. Review each out log file and wait until finish to run next"
echo ""
echo "/pinpoint/quickstart/bin/start-hbase.sh"
echo "/pinpoint/quickstart/bin/init-hbase.sh"
echo "/pinpoint/quickstart/bin/start-collector.sh &> /pinpoint/logs/collector.out &"
echo "/pinpoint/quickstart/bin/start-web.sh &> /pinpoint/logs/webui.out &"
echo ""
echo "## Run the TEST application:"
echo ""
echo "/pinpoint/quickstart/bin/start-testapp.sh &> /pinpoint/logs/testapp.out &"
echo ""

echo "## === EACH COMPONENT LOG FILE ==="
echo ""
echo "Collector ---->  /pinpoint/logs/collector.out"
echo "Web UI ------->  /pinpoint/logs/webui.out"
echo "Test App ----->  /pinpoint/logs/testapp.out"
