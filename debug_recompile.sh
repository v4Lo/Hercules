#!/bin/sh
./hercules-start.sh stop
#touch ~/hercules/src/map/mob.c
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS autoconf
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS ./configure
LD="clang" CC="clang" CFLAGS="-ggdb" LDFLAGS=$CFLAGS autoconf
LD="clang" CC="clang" CFLAGS="-ggdb" LDFLAGS=$CFLAGS ./configure --enable-debug
#CFLAGS="-O3" autoconf
#CFLAGS="-O3" ./configure
#make -j3 sql
make -j5 all
if [ $? -ne 0 ]
then
    echo make failed, Athena NOT started
    exit 1
fi
#./hercules-start.sh start
