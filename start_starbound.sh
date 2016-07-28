#!/bin/bash

/opt/steamcmd/steamcmd.sh +login $STEAM_LOGIN +force_install_dir /opt/starbound +app_update 211820 validate +quit

cd /opt/starbound/linux
./starbound_server
