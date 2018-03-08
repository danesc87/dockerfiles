# Base image
FROM danesc87/lamp
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php 

# Make Composer available for everyone
RUN mv composer.phar /usr/local/bin/composer

# Update Composer
CMD composer update
