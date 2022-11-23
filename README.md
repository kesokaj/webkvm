````
docker build -t ghcr.io/kesokaj/webkvm:v<VERSION> -t ghcr.io/kesokaj/webkvm:latest .
docker push ghcr.io/kesokaj/webkvm --all-tags

docker run --privileged -d -p 3389:3389 --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN webkvm 
````