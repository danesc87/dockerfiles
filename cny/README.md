# LAMP CNY Server
This build contains a [LAMP server](https://hub.docker.com/r/danesc87/lamp/) with the **_extra_** following features:
- __Composer:__ 
- __NodeJS:__ 8.10
- __Yarn

## Run Lamp
```bash
docker run --name=cny -d -p 80:80 -p 3306:3306 -p 8000:8000 -p 3000:3000 -v $PWD:/var/www/html danesc87/lamp-cny
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
