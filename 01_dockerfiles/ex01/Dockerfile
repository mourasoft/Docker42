FROM debian 

ENV TS3SERVER_LICENSE=accept

WORKDIR /home/tms

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget bzip2 && \
	wget https://files.teamspeak-services.com/releases/server/3.10.0/teamspeak3-server_linux_amd64-3.10.0.tar.bz2 && \
	tar -xf teamspeak3-server_linux_amd64-3.10.0.tar.bz2 && \
	rm -rf teamspeak3-server_linux_amd64-3.10.0.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

ENTRYPOINT sh ts3server_minimal_runscript.sh
