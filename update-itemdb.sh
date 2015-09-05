#!/bin/sh
echo 'starting mapserver with db2sql parameter'
~/hercules/map-server --db2sql
echo 'updating item db from files'
mysql -u hercules -pragnarok << EOF
use hercules;
source ~/hercules/sql-files/item_db.sql
source ~/hercules/sql-files/item_db2.sql
EOF
 