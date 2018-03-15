# Base image
FROM danesc87/lamp
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Upgrade System
RUN apt-get update
RUN apt-get upgrade -y

# Install dependencies
RUN apt-get install -y gnupg2

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php

# Make Composer available for everyone
RUN mv composer.phar /usr/local/bin/composer

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

# Allow ports
EXPOSE 8000
EXPOSE 3000
