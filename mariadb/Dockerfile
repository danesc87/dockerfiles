# Base image
FROM danesc87/apache
MAINTAINER Daniel Córdova A. <danesc87@gmail.com>

# Update repos
RUN apt-get update

# Install MariaDB
RUN apt-get install -y mariadb-server

# Allow ports
EXPOSE 3306

# Configure MariaDB
RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/my.cnf
RUN service mysql start; mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'pass';";mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;"; 

