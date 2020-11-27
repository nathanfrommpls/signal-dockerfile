# signal-dockerfile

- Update username, uid, gid in the Dockerfile.
- Build the image:
```
docker build -t signal .
```
- Run with following options, update <user> with same username in Dockerfile
```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOSTNAME -v $HOME/.Xauthority:/home/<user>/.Xauthority signal
```
