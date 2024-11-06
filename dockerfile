FROM    --platform=$TARGETOS/$TARGETARCH eclipse-temurin:21-alpine
RUN 	apk add --update curl \
		&& rm -rf /var/cache/apk/* \
		&& adduser -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
