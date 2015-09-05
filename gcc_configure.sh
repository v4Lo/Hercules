#!/bin/sh
./hercules-start.sh stop
#touch ~/Hercules/src/map/mob.c
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS autoconf
#CC="clang" CFLAGS="-Ofast -flto -static" LDFLAGS=$CFLAGS ./configure
#LD="clang" CC="clang" CFLAGS="-O3 -Ofast" LDFLAGS=$CFLAGS autoconf
#LD="clang" CC="clang" CFLAGS="-O3 -Ofast" LDFLAGS=$CFLAGS ./configure
CFLAGS="-ggdb3" LDFLAGS=$CFLAGS autoconf
CFLAGS="-ggdb3" LDFLAGS=$CFLAGS ./configure --enable-debug=gdb
#make -j3 sql
make -j5 all
if [ $? -ne 0 ]
then
    echo make failed, Athena NOT started
    exit 1
fi
./hercules-start.sh start
