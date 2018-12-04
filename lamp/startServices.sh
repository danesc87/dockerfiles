#!/bin/bash

# Variables
THISDIR=$(dirname $(readlink -e ${BASH_SOURCE[0]}))

# Check and Match UID and GID with host
$THISDIR/match_id.sh lamp

# Start MariaDB
which mysqld &>/dev/null
[ $? -ne 0 ] && echo "MariaDB is not installed! Exiting..." && exit 1
echo "Starting MariaDB!" &
mysqld &

# Add hostname to Apache2 configuration
echo "Adding Hostname: '`hostname`' to Apache2 configuration" &
echo "ServerName `hostname`" >> /etc/apache2/apache2.conf;

# Start Apache2
echo "Starting Apache2!" &
/usr/sbin/apache2ctl -D FOREGROUND
