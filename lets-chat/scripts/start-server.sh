#!/bin/bash

#Extract Mongo credentials from VCAP_SERVICES
TEMP=`python scripts/extract-vcap.py mongolab 0 credentials.uri`
if [ "$?" = "0" ]; then
	export LCB_DATABASE_URI=${TEMP}
fi

# Inserting sleep delay per recommendation via https://www.ng.bluemix.net/docs/containers/container_single_ov.html#container_single_cli
sleep 60

#Run server
npm start
