# Pinpoint APM Integration for OpenShift Container Platform

The objetive for this repository is to deploy the Pinpoint APM project (https://github.com/naver/pinpoint) on top of Openshift Container Platform.

1. Create the *pinpoint-apm* namespace on your

        # oc new-project pinpoint-apm

2. Import the template from source

        # oc create -f https://raw.githubusercontent.com/makentenza/ocp-pinpoint-apm/master/kube/pinpoint-template-ephemetal.yaml

3. Create the new application from the imported template

        # oc new-app pinpoint-ephemeral-template

      --> Deploying template "pinpoint-ephemeral-template" in project "openshift"

           pinpoint-ephemeral-template
           ---------
           Pinpoint APM Ephemeral

           Pinpoint APM Ephemeral

      --> Creating resources with label app=pinpoint-ephemeral-template

          serviceaccount "pinpoint" created
          imagestream "pinpoint" created
          service "pinpoint-apm" created
          service "pinpoint-testapp" created
          service "pinpoint-collector" created
          route "webinterface" created
          route "testapp" created
          buildconfig "pinpoint" created
          deploymentconfig "pinpoint-apm" created

      --> Success

          Build scheduled, use 'oc logs -f bc/pinpoint' to track its progress.
          Run 'oc status' to view your app.

4. Add the pinpoint service account to anyuid Security Context Constraint so root user could start processes inside de image

        # oadm policy add-scc-to-user anyuid system:serviceaccount:pinpoint-apm:pinpoint
