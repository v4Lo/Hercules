#!/bin/sh
screen -S map-server -X quit
#touch ~/hercules/src/map/mob.c
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS autoconf
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS ./configure
#LD="clang" CC="clang" CFLAGS="-O2" LDFLAGS=$CFLAGS autoconf
#LD="clang" CC="clang" CFLAGS="-O2" LDFLAGS=$CFLAGS ./configure
#CFLAGS="-O3" autoconf
#CFLAGS="-O3" ./configure
#make -j3 sql
make -j5 map_sql
if [ $? -ne 0 ]
then
    echo make failed, Athena NOT started
    exit 1
fi
screen -admS map-server "./map-server.sh"

