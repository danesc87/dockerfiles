# LAMP Server
This build contains a LAMP server with the following features:
- __OS:__ Debian 9
- __Server:__ Apache2
- __DB:__ MariaDB 10.1
- __PHP:__ PHP 7

## MariaDB
Maria DB contains a full privileged user called **admin** with password: **1234abcd**

## Run Lamp
```bash
docker run --name=lamp -d -p 80:80 -p 3306:3306 -v $PWD:/var/www/html danesc87/lamp
```

## Post deploy
### Connect MariaDB
You can connect to MariaDB through CLI like the following
```bash
mysql --user=admin --password=1234abcd --host=127.0.0.1
```
Or connect through a DB tool

### Test Server
```bash
curl -i 127.0.0.1
```
Response will be:

HTTP/1.1 200 OK
Date: Tue, 13 Mar 2018 22:02:01 GMT
Server: Apache/2.4.25 (Debian)
Vary: Accept-Encoding
Content-Length: 71
Content-Type: text/html; charset=UTF-8

LAMP server succesfully deployed!<br/>Connection succesfully to MariaDB

Or you can test via web browser
