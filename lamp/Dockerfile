# Base image
FROM debian:9-slim
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Upgrade System
RUN apt-get update
RUN apt-get upgrade -y

# Install some necessary things
RUN apt-get install -y gnupg2 curl

# Add some extra repos
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update

# Install LAMP with dependencies and extra packages
RUN apt-get install -y apache2 mariadb-server libapache2-mod-php php-mysql php-gd php-apcu php-mcrypt php-xml php-json php-mail php-mail-mime php-mailparse php-ssh2 php-zip php-bz2 php-mbstring php-twig

# Install extra packages
RUN apt-get install -y nodejs yarn

# Configure MariaDB
RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start; mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY '1234abcd';"; mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;";

# Config PHP
RUN a2enmod rewrite expires mime deflate headers

# Add PHP info page
ADD index.php /var/www/html/index.php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php

# Make Composer available for everyone
RUN mv composer.phar /usr/local/bin/composer

# Create user
RUN adduser --disabled-password --gecos '' lamp

# Add Match UserId and GroupId
ADD match_id.sh /opt
RUN chmod 755 /opt/match_id.sh

# Add initializer for LAMP
ADD startServices.sh /opt
RUN chmod 755 /opt/startServices.sh

# Allow ports
EXPOSE 80
EXPOSE 3306
EXPOSE 8000
EXPOSE 3000

# Workdir
WORKDIR /home/lamp

# Launch services bash script
ENTRYPOINT [ "/opt/startServices.sh" ]
