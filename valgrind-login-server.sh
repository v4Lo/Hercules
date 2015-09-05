#/bin/sh
#Hi my naem is Kirt and I liek anime

ulimit -Sc unlimited

while [ 2 ] ; do
if [ -f .stopserver2 ] ; then
echo server marked down >> ~/logs/server-log.txt
else
echo restarting server at time at `date +"%m-%d-%H:%M-%S"`>> ~/logs/start-log.txt
valgrind --leak-check=yes --log-file="valgrind_login_$(date +"%m-%d-%H:%M-%S").log" login-server  | tee ~/logs/valgrind-$(date +"%m-%d-%H:%M-%S")_login-server.log
fi

sleep 5

done
