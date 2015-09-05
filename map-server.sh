#/bin/sh
#Hi my naem is Kirt and I liek anime

ulimit -Sc unlimited

while [ 1 ] ; do
if [ -f .stopserver ] ; then
echo server marked down >> ~/logs/server-log.txt
else
echo restarting server at time at `date +"%m-%d-%H:%M-%S"`>> ~/logs/start-log.txt
./map-server |  tee ~/logs/$(date +"%m-%d-%H:%M-%S")_map-server.log
fi

sleep 5

done
