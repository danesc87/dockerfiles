# Base image
FROM debian:9
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Update repos
RUN apt-get update

# Install Apache 2 web server
RUN apt-get install -y apache2

# Install MariaDB
RUN apt-get install -y mariadb-server

# Install PHP for LAMP
RUN apt-get install -y libapache2-mod-php php-mysql php-gd php-apcu php-mcrypt php-xml

# Extras packages for PHP
RUN apt-get install -y curl php-json php-mail php-mail-mime php-mailparse php-ssh2 php-zip php-bz2 php-mbstring php-twig

# Configure MariaDB
RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start; mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY '1234abcd';"; mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;";

# Config PHP
RUN a2enmod rewrite expires mime deflate headers

# Add PHP info page
ADD index.php /var/www/html/index.php

# Add initializer for LAMP
ADD startServices.sh /
RUN chmod 755 /startServices.sh

# Allow ports
EXPOSE 80
EXPOSE 3306

# Launch services bash script
CMD ["sh","-c","/startServices.sh"]
