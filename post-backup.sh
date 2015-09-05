#!/bin/bash
mysql -u hercules -pragnarok -h localhost << EOF
USE hercules;
CREATE TABLE picklog_new LIKE picklog;
RENAME TABLE picklog TO picklog_old, picklog_new TO picklog;
DROP TABLE picklog_old;
EOF

