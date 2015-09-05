#/bin/sh
#Hi my naem is Kirt and I liek anime

ulimit -Sc unlimited

while [ 3 ] ; do
if [ -f .stopserver3 ] ; then
echo server marked down >> ~/logs/server-log.txt
else
echo restarting server at time at `date +"%m-%d-%H:%M-%S"`>> ~/logs/start-log.txt
./char-server | tee ~/logs/$(date +"%m-%d-%H:%M-%S")_char-server.log
fi

sleep 5

done
