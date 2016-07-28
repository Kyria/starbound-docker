FROM debian:8.5

COPY start.sh /start
COPY start_starbound.sh /start_starbound

RUN dpkg --add-architecture i386

RUN apt-get -qq update && apt-get install -qqy lib32gcc1 sudo \
    && apt-get clean \
    && groupadd -g 1000 starbound \
    && useradd -M -s /bin/false -u 1000 -g starbound -d /opt/steamcmd starbound \
    && mkdir -p \
        /opt/terraria/ \
        /opt/steamcmd/ \
    && chmod 700 /start /start_starbound

EXPOSE 21025 21026

VOLUME ["/opt/steamcmd/", "/opt/starbound/storage"]

WORKDIR /opt/starbound

ENTRYPOINT ["/start"]

ENV UID=1000 GID=1000 \
    STEAM_LOGIN=