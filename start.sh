#!/bin/bash
set -e

usermod --uid $UID starbound
groupmod --gid $GID starbound

chown -R starbound:starbound /opt/starbound/ /start_starbound
chmod -R 775 /opt/starbound/ /opt/steamcmd/* /start_starbound

exec sudo -E -u starbound /start_starbound
