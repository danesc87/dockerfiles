# LAMP Server
This build contains a LAMP server with the following features:  

* **OS:** Debian 9
* **Server:** Apache2
* **DB:** MariaDB 10.1
* **PHP:** PHP 7
* **Composer:** 1.8.0
* **NodeJS:** 8.14.0
* **Yarn:** 1.12.3

## MariaDB
*Maria DB* contains a full privileged user called **admin** with password: **1234abcd**

## Run Lamp

```bash
docker run --name=lamp -d -p 80:80 -p 3306:3306 -p 8000:8000 -p 3000:3000 -v $PWD:/var/www/html danesc87/lamp
```

## Things you should do after Run the container

### Test Server

```bash
curl -i 127.0.0.1
```
Response will be:

```
HTTP/1.1 200 OK
Date: Tue, 13 Mar 2018 22:02:01 GMT
Server: Apache/2.4.25 (Debian)
Vary: Accept-Encoding
Content-Length: 71
Content-Type: text/html; charset=UTF-8

LAMP server succesfully deployed!<br/>Connection succesfully to MariaDB
```

* Or you can test via web browser

### Access Docker container
It's necessary to access to container without *ROOT* to avoid some issues of permissions with the **host** user.

>The user **lamp** has the same *UID* and *GID* as the host user on Linux OS's

```bash
docker exec -it -u lamp lamp /bin/bash
```

### Connect MariaDB
If you are inside de docker container, you can connect to MariaDB through CLI like the following

```bash
mysql --user=admin --password=1234abcd --host=127.0.0.1
```

* And you can create a DataBase

```bash
CREATE DATABASE TEST_DB;
```
