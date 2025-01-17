# Docker settings

## Base command

```txt
notes:
    containers:
    1 - restart the docker after turning off the computer
    2 - if you are using a virtual machine when port mapping is used -p :<port> access via localhost:<random> or linux_ip: <random> "port shielding"
    
    docker hub and tag version
    1 - docker build -t ABC:TAG .
    2 - docker tag ABC:TAG <REPOS_NAME>:required version
    3 - docker push <REPOS_NAME>:required version
```

### Version

```bash
docker -v
docker login
```

### Status

```bash
systemctl status docker 
service docker status
```

### Container list

```docker ps -a```

### Images list

```docker images```

### Delete container

```bash
docker rm <NAME/ID/SHORTID>
docker rm $(docker ps -a -f status=exited)
```

### Delete images

```bash
docker rmi <NAME/ID>
docker rmi $(docker images -a -q)
```

### Delete all

```docker system prune -a --volumes```

### Pull-Push image

```bash
docker pull <NAME_IMAGE>
docker push <NAME_IMAGE>
```

### Container

```bash
docker start <NAME/ID>
docker stop (kill) <NAME/ID>
docker pause (unpause) <NAME/ID>
docker restart <NAME/ID>
```

### Inspect

```bash
docker inspect <NAME>
docker stats <NAME>
docker logs ('-f' --> real time) <NAME>
docker port <NAME>
```

### Exec container

```docker exec -it <NAME (testapp)> or <NAMESERVICE (mysql)> /bin/bash```

### Run command

```bash
docker run 
    -d          ---> background mode
    --name      ---> define name
    --rm        ---> remove container after exits
    -p          ---> port mapping
    -P          ---> random port
    -e          ---> env
    -v          ---> 1. volume PATH(HOST):PATH(Docker container)
                ---> 2. anonymous volume PATH(Docker container)
                ---> 3. named volume NAME:PATH(Docker container)
                           cd /var/lib/docker/volumes
    --net       ---> network name
    --ip        ---> unreal ip
```

### Volume command

```bash
docker volume 
    create          ---> create a volume
    inspect         ---> display detailed information on one or more volume
    ls              ---> list volumes
    prune           ---> remove unused local volumes
    rm              ---> remove one or more volumes
```

### Example

```bash
docker run -d -p <PORT_LOCAL>:<PORT_DOCKER> --name <TESTNAME> <IMAGENAME:TAG>

docker run --name test-nginx-85-80 -d -it -p x.x.x.x:85:80 nginx

docker run --name test-nginx-86-80 -d -it -v /usr/TEST/volumes:/usr/share/nginx/html
-p x.x.x.x:86:80 nginx

docker run --name test-nginx-random-80 -d -it -v /test:/var/www/html
-P nginx
```

### Network command

```bash
docker network 
    create  (-d, --drive)        ---> create a network
                 bridge
                 host
                 none
                 macvlan
                 ipvlan
            (--subnet x.x.x.x./x)
            (--gateway)
            (--ip-range x.x.x.x/x)
            (-o parent=<ens-->) ---> option parent for macvlan
    connect                     ---> <NAME_NETWORK> <NAME_CONTAINER>
    disconnect                  ---> <NETWORK_ID> <NAME_CONTAINER>            
    inspect                     ---> display detailed information 
    ls                          ---> list network
    rm                          ---> remove one or more network
```

### Example

```bash
docker run -d -it --name <TEST_NAME-1> --net <NAME_NETWORK> <IMAGE_NAME:TAG> /bin/bash
docker run -d -it --name <TEST_NAME-2> --net <NAME_NETWORK> <IMAGE_NAME:TAG> /bin/bash
ping from <TEST_NAME-1> to <TEST_NAME-2> --> ip or DNS --> success

docker network create -d macvlan --subnet x.x.x.x/24 --gateway x.x.x.x -o parent=ens00 TEST_NET
docker run -d -it --name <TEST_FILE> --ip x.x.x.x --net <TEST_NET> <IMAGE_NAME:TAG> /bin/bash
```

### Build command

```bash
docker build
    -t          ---> create <NAME:TAG>

docker build -t <NAME:TAG> .
```

### Image command

```bash
docker image 
    build                       ---> build an image from a Dockerfile
    history                     ---> history images
    inspect                     ---> detailed information
    ls                          ---> list images
    rm                          ---> remove images
    tag                         ---> docker tag <ID_IMAGE:TAG> <NEWNAME:TAG>
```

### ENV

```-e  ---> if we set <-e TEST=123> and Dockerfile has <TEST=abc>, we will display 123```

### Dockerfile command

```Dockerfile
FROM
LABEL
COPY
RUN
EXPOSE
VOLUME
ENV
ENTRYPOINT
CMD
```

### Base example Dockerfile

```Dockerfile
FROM ubuntu:latest
RUN apt-get update

#NGINX
RUN apt-get install nginx -y
#APACHE
RUN apt-get install apache2 -y

RUN apt-get clean
WORKDIR /var/www/html/
COPY index.html .
ENV TEST=123
LABEL autor=Dmitry
EXPOSE 80

#NGINX
CMD ["nginx","-g","daemon off;"]
#APACHE
CMD ["apache2ctl","-D","FOREGROUND"]
```

### Docker compose command

```docker compose logs -f <NAME/ID>```

### Simple file docker compose

```yml
version: "version"
volumes:
    data:
services:
    <NAME>:
        image: <ISO:TAG>
        container_name: <NAME>
        volumes:
            - <PATH_HOST>:<PATH_CONTAINER>
            - data:<PATH_CONTAINER>
        ports:
            - "xxxx:xxxx"
        environment:
            - TEST=12345
        depends_on:
            - <SOME_APP>
        restart: <no, always, unless-stopped, on-failure>
        network:
            - my_network
networks:
    default:
        driver: bridge
        name: my_network
# networks:
#     my_network:
#         driver: bridge
```

### Docker Hub

```bash
1 ---> create rep in Docker Hub
2 ---> docker tag <OLDNAME:TAG> <NEWNAME:TAG>
3 ---> docker login
4 ---> docker push <NEWNAME:TAG>
5 ---> docker run -d -it --name <NAME> -P <ISO:TAG>
```

- [x] TEST
