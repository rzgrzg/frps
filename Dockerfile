FROM alpine
MAINTAINER rzgrzg,<13416155@qq.com>
ENV FRP_VERSION 0.21.0
WORKDIR /var/frp
RUN mkdir /var/frp/conf

ADD https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_${FRP_VERSION}_linux_amd64.tar.gz /var/frp/frp_${FRP_VERSION}_linux_amd64.tar.gz
RUN tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz  --strip-components=1  frp_${FRP_VERSION}_linux_amd64/frps -C /var/frp \
    && tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz  --strip-components=1  frp_${FRP_VERSION}_linux_amd64/frps.ini -C /var/frp/conf \
    && rm /var/frp/frp_${FRP_VERSION}_linux_amd64.tar.gz

VOLUME /var/frp/conf

EXPOSE 80 443 7000 7500

CMD ./frps -c /var/frp/conf/frps.ini
