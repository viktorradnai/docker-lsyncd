FROM ubuntu:14.04
MAINTAINER djx339@gmail.com

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y rsync lsyncd

ADD ./assets/config/lsyncd.conf /app/config/lsyncd.conf

ADD ./assets/init /app/init
RUN chmod a+x /app/init

ENTRYPOINT ["/app/init"]
CMD ["start"]
