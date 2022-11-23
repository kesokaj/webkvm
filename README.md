````
docker build -t webkvm .

docker run --privileged -it --name webkvm --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN webkvm bash
docker run --privileged -p 3389:3389 -it webkvm bash
````