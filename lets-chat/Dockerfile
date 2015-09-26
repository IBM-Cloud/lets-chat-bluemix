FROM sdelements/lets-chat

USER root

ENV EXTRACT_VCAP_URL=https://raw.githubusercontent.com/osowski/ibm-containers/master/utils/docker-build/extract-vcap.py

#Added additional npm/UNSET commands below to fix incorrect package versions in main source tarball
RUN apt-get update && apt-get install -y python && \
	npm uninstall passport-http && \
	npm uninstall passport.socketio && \
	npm install passport-http@0.3.0 --save && \
	npm install passport.socketio@3.6.1 --save && \
	unset NODE_PATH

RUN mkdir scripts
ADD scripts scripts
ADD $EXTRACT_VCAP_URL scripts/extract-vcap.py
RUN chmod +r scripts/extract-vcap.py

USER node

CMD ["scripts/start-server.sh"]

