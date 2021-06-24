#! /usr/bin/env bash
export CID=-1001327643573
export PATH=$PATH:~/bin/:/usr/bin
export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Kolkata
export TIME=$(date +"%S-%F")
 ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
 dpkg-reconfigure --frontend noninteractive tzdata

 apt-get install -y tzdata
 apt-get update -qq && \
    apt-get install --no-install-recommends -y \
	autoconf \
	autogen \
	automake \
	autotools-dev \
	bc \
	binutils \
	binutils-aarch64-linux-gnu \
	binutils-arm-linux-gnueabi \
	bison \
	bzip2 \
	ca-certificates \
	coreutils \
	cmake \
	ccache \
	curl \
	expect \
	flex \
	g++ \
	gawk \
	gcc \
	git \
	gnupg \
	gperf \
	help2man \
	lftp \
	libc6-dev \
	libelf-dev \
	libgomp1-* \
	liblz4-tool \
	libncurses5-dev \
	libssl-dev \
	libstdc++6 \
	libtool \
	libtool-bin \
	m4 \
	make \
	nano \
	openjdk-8-jdk \
	openssh-client \
	openssl \
	ovmf \
	patch \
	pigz \
	python3 \
	python \
	rsync \
	shtool \
	subversion \
	tar \
	texinfo \
	tzdata \
	u-boot-tools \
	unzip \
	wget \
	xz-utils \
	zip \
	zlib1g-dev \
	zstd
chmod +x sc/*.sh
cp -rf sc/* .
chmod +x build_kernel.sh
./build_kernel.sh g
cd out && curl -sL https://git.io/file-transfer | sh && ./transfer wet *.zip
export com=$(git log)
export OWO=$(ls *.zip)
curl -F document=@$OWO "https://api.telegram.org/bot$TOKEN/sendDocument" \
        -F chat_id=$CID \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html"

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d chat_id=$CID \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$com"

