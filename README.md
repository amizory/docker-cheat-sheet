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
docker rmi $(docker images -a -q)```

### Delete all
```docker system prune -a --volumes```

### Pull image
```docker pull <NAME>```

### Container
```
docker start <NAME/ID>
docker stop/kill <NAME/ID>
docker pause/unpause <NAME/ID>
docker restart <NAME/ID>```

### Inspect
```
docker inspect <NAME>
docker stats <NAME>
docker logs ('-f' --> real time) <NAME>```

### Exec container 
```docker exec -it <NAME (testapp)> or <NAMESERVICE (mysql)> /bin/bash```

## Run command

docker run 
    -d          ---> background mode
    --name      ---> define name
    --rm        ---> remove container after exits
    -p          ---> port mapping
    -e          ---> env
#Example
docker run -d -p <PORT_LOCAL>:<PORT_DOCKER> --name <TESTNAME> <IMAGENAME>:<TAG>

## ENV

-e 


