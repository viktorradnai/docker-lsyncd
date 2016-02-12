FROM ubuntu:14.04
# MAINTAINER djx339@gmail.com
MAINTAINER viktor.radnai@ticketmaster.co.uk

#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y rsync lsyncd openssh-server

RUN sed -i 's/Port 22/Port {{SOURCE_PORT}}/' /etc/ssh/sshd_config
ADD ./assets/config/lsyncd.conf /app/config/lsyncd.conf

ADD ./assets/init /app/init
RUN chmod a+x /app/init

RUN mkdir -p /root/.ssh \
    && cd /root/.ssh \
    && ssh-keygen -f id_rsa -N '' \
    && cp id_rsa.pub authorized_keys

CMD /app/init start
