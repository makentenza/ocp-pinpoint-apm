#!/bin/bash

# For using as entrypoint command once Hbase is initialized - This is done during the Docker build process.

/pinpoint/quickstart/bin/start-hbase.sh &> /root/logs/hbase.out
/pinpoint/quickstart/bin/start-collector.sh &> /root/logs/collector.out &
/pinpoint/quickstart/bin/start-web.sh &> /root/logs/webui.out
/pinpoint/quickstart/bin/start-testapp.sh &> /root/logs/testapp.out &
