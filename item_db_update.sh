#!/bin/bash
./map-server --db2sql
mysql -u hercules -pragnarok -h localhost << EOF
USE hercules;
source ~/hercules/sql-files/item_db.sql
source ~/hercules/sql-files/item_db2.sql
EOF
