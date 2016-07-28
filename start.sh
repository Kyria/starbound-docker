#!/bin/bash
set -e

usermod --uid $UID starbound
groupmod --gid $GID starbound

chown -R starbound:starbound /opt/starbound/ /start_starbound
chmod -R 770 /opt/starbound/ /opt/steamcmd/* /start_starbound

exec sudo -E -u starbound /starbound
