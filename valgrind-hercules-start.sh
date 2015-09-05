#!/bin/sh
# athena starting script by rowla
# modified by shazeya@syafi.com (NL101541)

PATH=./:$PATH

dir=`dirname $0`
FILE_PATH=`cd  $dir;pwd`

cd $FILE_PATH

case $1 in
    'start')
		screen -admS login-server "./valgrind-login-server.sh"
		screen -admS char-server "./valgrind-char-server.sh"
		screen -admS map-server "./valgrind-map-server.sh"

        echo "Started Athena."
;;
    'stop')
		screen -S login-server -X quit
		screen -S char-server -X quit
		screen -S map-server -X quit	

	echo "Killed Athena."
;;
    'restart')
        $0 stop
        $0 start
;;
    *)
        echo "Usage: athena-start { start | stop | restart }"
;;
esac
