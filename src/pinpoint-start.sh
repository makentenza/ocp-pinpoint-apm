#!/bin/bash

# For using as entrypoint command once Hbase is initialized - This is done during the Docker build process.

/pinpoint/quickstart/bin/start-hbase.sh &> /pinpoint/logs/hbase.out
/pinpoint/quickstart/bin/start-collector.sh &> /pinpoint/logs/collector.out &
/pinpoint/quickstart/bin/start-web.sh &> /pinpoint/logs/webui.out
/pinpoint/quickstart/bin/start-testapp.sh &> /pinpoint/logs/testapp.out &
