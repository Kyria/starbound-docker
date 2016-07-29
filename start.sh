#!/bin/bash
set -e

usermod --uid $UID starbound
groupmod --gid $GID starbound

chown -R starbound:starbound /opt/starbound/ /start_starbound
chmod -R 775 /opt/starbound/ /opt/steamcmd/* /start_starbound

# force to change HOME as sudo don't reset it here...
export HOME=/opt/steamcmd

exec sudo -E -u starbound /start_starbound
