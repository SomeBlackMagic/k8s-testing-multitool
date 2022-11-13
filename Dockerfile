FROM ubuntu:20.04
#ENV GO_VERSION=go1.17.6
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

COPY locale.gen /etc/locale.gen
RUN apt-get update && apt-get install -y locales && locale-gen

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    apache2-utils \
    bash-completion \
    binutils \
    bird \
    bison \
    bpfcc-tools \
    bridge-utils \
    build-essential \
    conntrack \
    ctop \
    ccze \
    curl \
    dhcping \
    dnsutils \
    ethtool \
    fping \
    fzf \
    gdb \
    git \
    gnupg2 \
    htop \
    httpie \
    iftop \
    iperf \
    iproute2 \
    ipset \
    iptables \
    iptraf-ng \
    iputils-ping \
    ipvsadm \
    jq \
    liboping-dev \
    libunwind8 \
    linux-tools-common \
    mtr \
    mycli \
    nano \
    netcat \
    netgen \
    nftables \
    ngrep \
    nmap \
    mc \
    pgcli \
    postgresql \
    python3-pip \
    python3.8 \
    pv \
    rar \
    redis-tools \
    stress \
    scapy \
    snmp \
    snmpd \
    socat \
    software-properties-common \
    strace \
    stress \
    tcpdump \
    tcptraceroute \
    termshark \
    tmux \
    tshark \
    unzip \
    unrar \
    util-linux \
    vim \
    wget \
    wuzz \
    zip

RUN set -eux \
	&& wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb \
	&& dpkg -i percona-release_latest.generic_all.deb \
	&& apt update \
	&& percona-release setup ps80 \
    && apt install -y percona-server-client \
	&& true


RUN set -eux \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod 755 kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    && kubectl completion bash > /etc/bash_completion.d/kubectl \
    && true



RUN set -eux \
    && cd /tmp \
    && curl https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz > helm-v3.8.0-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.8.0-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && helm completion bash > /etc/bash_completion.d/helm \
    && true

COPY .bashrc /root/.bashrc

CMD ["/bin/bash"]
