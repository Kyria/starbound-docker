FROM debian:8.5

COPY start.sh /start
COPY start_starbound.sh /start_starbound

RUN dpkg --add-architecture i386

RUN apt-get -qq update && apt-get install -qqy lib32gcc1 sudo \
        ca-certificates \
        lib32gcc1 \
        net-tools \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
    && apt-get clean \
    && groupadd -g 1000 starbound \
    && useradd -M -s /bin/false -u 1000 -g starbound -d /opt/steamcmd starbound \
    && mkdir -p \
        /opt/starbound/storage \
        /opt/steamcmd/ \
    && chmod 700 /start /start_starbound

EXPOSE 21025 21026

VOLUME ["/opt/steamcmd/", "/opt/starbound/"]

WORKDIR /opt/starbound

ENTRYPOINT ["/start"]

ENV UID=1000 GID=1000 \
    STEAM_LOGIN=
