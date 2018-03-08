# Base image
FROM debian:9
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Update repos
RUN apt-get update

# Install Apache 2 web server
RUN apt-get install -y apache2

# Allow ports
EXPOSE 80

# Configure Apacche 2
CMD echo "ServerName `hostname`" >> /etc/apache2/apache2.conf; /usr/sbin/apache2ctl -DFOREGROUND
