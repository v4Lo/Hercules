#!/bin/bash
~/hercules/tools/mob_db2.pl < ~/hercules/db/mob_db2.txt > ~/hercules/tools/mob_db2.sql
mysql -u hercules -pragnarok -h localhost << EOF
USE hercules;
source ~/hercules/tools/mob_db2.sql
EOF
