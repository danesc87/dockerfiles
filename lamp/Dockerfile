# Base image
FROM danesc87/mariadb
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Update repos
RUN apt-get update

# Install PHP for LAMP
RUN apt-get install -y supervisor libapache2-mod-php php-mysql php-gd php-apcu php-mcrypt php-xml

# Extras packages
RUN apt-get install -y curl php-json php-mail php-mail-mime php-mailparse php-ssh2 php-zip php-bz2 php-mbstring php-twig

# Supervisor configuration 
ADD supervisor-lamp.conf /etc/supervisor/conf.d/
ADD supervisord.conf /etc/supervisor/

# Add PHP info page
ADD index.php /var/www/html/index.php


# Start supervisor
CMD ["supervisord"]
