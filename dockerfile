FROM    --platform=$TARGETOS/$TARGETARCH eclipse-temurin:11-jre-alpine

LABEL org.opencontainers.image.source="https://github.com/la-banquise/dockerfiles_ptero"

RUN 	apk add --update curl \
		&& apk add --update bash \
		&& rm -rf /var/cache/apk/* \
		&& adduser -D container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
