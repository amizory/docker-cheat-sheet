# Docker settings

## Base command

### Version
```docker -v```

### Status 
```
systemctl status docker 
service docker status
```

### Container list
```docker ps -a```

### Images list
```docker images```

### Delete container
```
docker rm <NAME/ID/SHORTID>
docker rm $(docker ps -a -f status=exited)
```

### Delete images
```
docker rmi <NAME/ID>
docker rmi $(docker images -a -q)
```

### Delete all
```docker system prune -a --volumes```

### Pull image
```docker pull <NAME>```

### Container
```
docker start <NAME/ID>
docker stop (kill) <NAME/ID>
docker pause (unpause) <NAME/ID>
docker restart <NAME/ID>
```

### Inspect
```
docker inspect <NAME>
docker stats <NAME>
docker logs ('-f' --> real time) <NAME>
```

### Exec container 
```docker exec -it <NAME (testapp)> or <NAMESERVICE (mysql)> /bin/bash```

### Run command
```
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
### Example
- [x] docker run -d -p <PORT_LOCAL>:<PORT_DOCKER> --name <TESTNAME> <IMAGENAME>:<TAG>

- [x] docker run --name test-nginx-85-80 -d -it -p x.x.x.x:85:80 nginx

- [x] docker run --name test-nginx-86-80 -d -it -v /usr/TEST/volumes:/usr/share/nginx/html 
-p x.x.x.x:86:80 nginx

### Volume command
```
docker volume 
    create          ---> create a volume
    inspect         ---> display detailed information on one or more volume
    ls              ---> list volumes
    prune           ---> remove unused local volumes
    rm              ---> remove one or more volumes
```  
### Network command
```
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
    connect                     ---> <NAMENETWORK> <NAMECONTAINER>
    disconnect                  ---> <NETWORK_ID> <NAMECONTAINER>            
    inspect                     ---> display detailed information 
    ls                          ---> list network
    rm                          ---> remove one or more network
```
### Example
- [x] docker run -d -it --name <TESTNAME-1> --net <NAMENETWORK> <IMAGENAME>:<TAG> /bin/bash
- [x] docker run -d -it --name <TESTNAME-2> --net <NAMENETWORK> <IMAGENAME>:<TAG> /bin/bash
- [x] ping from <TESTNAME-1> to <TESTNAME-2> --> ip or DNS --> success

- [x] docker network crate -d macvlan --subnet x.x.x.x/24 --gateway x.x.x.x -o parent=ens00 <TESTNET>
- [x] docker run -d -it --name <TESTFILE> --ip x.x.x.x --net <TESTNET> <IMAGENAME>:<TAG> /bin/bash

### Build command
```
docker build
    -t          ---> create <NAME:TAG>
```

### Image command
```
docker image 
    build                       ---> build an image from a Dockerfile
    history                     ---> history images
    inspect                     ---> detailed information
    ls                          ---> list images
    rm                          ---> remove images
    tag                         ---> docker tag <ID_IMAGE:TAG> <NEWNAME:TAG>
```  
### ENV
```-e ```

