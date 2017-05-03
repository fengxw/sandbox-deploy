It's demo to show you how to build your local dev environment by docker, and manage your docker images and containers by docker compose.To get more info [here](http://onlyfeng.com/sandbox-deploy/).

# Warming-Up
## Centos install docker

```
- login sandbox account and swich to root
  - sudo su - (pwd)
- yum install docker
- service docker start
- exit (go back to sandbox account)
- service docker start
```

## Install docker-compose

```
mv data/docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

or we can download newest verision from the internet

```
curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Pull latest sandbox-deploy script and source code

- pull latest sandbox-deploy script to your home directory
- pull latest sandbox code to source code folder in directory of sandbox-deploy

# Create App server

## Generate docker-compose.yml file

```
./make.sh
```

## Build docker images and start containers

```
docker-compose up -d
```

## Create database and user

```
sudo docker exec -it sandbox_db bash
mysql -uroot -proot
CREATE DATABASE sandbox_db;
CREATE DATABASE openfire;
CREATE USER sandbox IDENTIFIED BY 'sandbox';
GRANT ALL ON sandbox_db.* TO 'sandbox'@'sandbox_app' IDENTIFIED BY 'sandbox';
GRANT ALL ON sandbox_db.* TO 'sandbox'@'%' IDENTIFIED BY 'sandbox';
GRANT ALL ON openfire.* TO 'sandbox'@'sandbox_app' IDENTIFIED BY 'sandbox';
GRANT ALL ON openfire.* TO 'sandbox'@'%' IDENTIFIED BY 'sandbox';
```

Normally, the app server should work now.
