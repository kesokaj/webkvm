````
docker build -t webkvm .

docker run --privileged -d -p 3389:3389 --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN webkvm 
````