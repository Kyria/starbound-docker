# starbound-docker : A docker container for starbound, __without steamcmd included__.


This docker container container requires you to init your steamcmd before you make the container.

__Why ?__

For only one reason: to reuse cached credential through multiple docker container, and to be able to update it, change it, without changing your container.

## So, what to do first

__Disclaimer:__ everything here is written for debian, if you want to use something else, [please refer to this page](https://developer.valvesoftware.com/wiki/SteamCMD#Linux)

Assuming you are logged as root (if not, you may need to adjust some path), run these commands to install steamcmd (you may change the ```/opt/steamcmd``` of course) :

```shell
mkdir -p /opt/steamcmd
dpkg --add-architecture i386
aptitude update
aptitude install -y lib32gcc1

wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz
mkdir -p /opt/steamcmd
tar -C /opt/steamcmd/ -xzvf /tmp/steamcmd.tar.gz
```

Now, as you installed it, run it, login, and exit:

```shell
/opt/steamcmd/steamcmd.sh
```
The script will show a prompt ```Steam> ``` then write :
```
login <username>
```
Enter your password, your steamguard code, and then exit by typing "exit".

To check if it correctly set your steam credential cache, open steamcmd again:
```shell
/opt/steamcmd/steamcmd.sh

Steam> login <username>
```
This should log you in without asking any password. If it's the case, then one last step: you will need to copy your cached data into the steamcmd directory, to have it the same place you installed steamcmd (for easier use in docker)

To do this:
```
cp -fR /root/Steam /opt/steamcmd
```

Now you are done.

## Use the container

This container requires you to map volume in order to use steamcmd.
Available volumes in the image :
- /opt/steamcmd : will contains the steamcmd binaries and the cached data
- /opt/starbound/storage : will contain the game universe and configs (if you want to customize it :))

## Environment variables + default values
```
UID: 1000
GID: 1000
STEAM_LOGIN: empty
