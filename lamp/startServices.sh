#!/bin/bash

# Start MariaDB
echo "Starting MariaDB!" &
mysqld &

# Add hostname to Apache2 configuration
echo "Adding Hostname: '`hostname`' to Apache2 configuration" &
echo "ServerName `hostname`" >> /etc/apache2/apache2.conf;

# Start Apache2
echo "Starting Apache2!" &
/usr/sbin/apache2ctl -DFOREGROUND
