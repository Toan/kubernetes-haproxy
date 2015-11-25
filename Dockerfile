FROM haproxy:1.5

# download latest stable etcdctl
ADD https://s3-us-west-2.amazonaws.com/opdemand/etcdctl-v0.4.5 /usr/local/bin/etcdctl
RUN chmod +x /usr/local/bin/etcdctl

# install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.6.0/confd-0.6.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ADD . /app

# Define working directory.
WORKDIR /app

RUN chmod +x /app/bin/*

CMD ["/app/bin/boot"]