FROM ubuntu:focal
LABEL org.opencontainers.image.source https://github.com/kesokaj/webkvm

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        curl wget apt-transport-https gnupg net-tools \
        qemu-kvm libvirt-daemon-system libvirt-dev jq sudo \
        lsb-core openssh-server

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update && apt-get install -y vagrant

RUN vagrant plugin install vagrant-libvirt
RUN vagrant box add --provider libvirt peru/windows-10-enterprise-x64-eval
RUN vagrant init peru/windows-10-enterprise-x64-eval

COPY init.sh init.sh
RUN chmod +x init.sh
ENTRYPOINT [ "/init.sh" ]