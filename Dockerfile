FROM alpine:3.8

RUN apk -U add wget \
	bc build-base gawk xorriso libelf-dev openssl-dev bison flex \
	linux-headers perl rsync git argp-standalone

WORKDIR /build

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh download

COPY . /build

ENTRYPOINT ["./build.sh"]
CMD ["build"]
