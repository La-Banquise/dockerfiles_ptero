FROM    --platform=$TARGETOS/$TARGETARCH eclipse-temurin:21-jre-ubi9-minimal
RUN 	apt-get update -y \
	&& apt-get install -y curl \
	&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
