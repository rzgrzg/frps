FROM alpine
MAINTAINER rzgrzg,<13416155@qq.com>
ENV FRP_VERSION 0.20.0
WORKDIR /usr/local/frp
RUN mkdir /usr/local/frp/conf

ADD https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_${FRP_VERSION}_linux_amd64.tar.gz /usr/local/frp/frp_${FRP_VERSION}_linux_amd64.tar.gz
RUN tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz --strip=1  frp_${FRP_VERSION}_linux_amd64/frps -C /usr/local/frp \
    && tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz --strip=1  frp_${FRP_VERSION}_linux_amd64/frps.ini -C /usr/local/frp/conf \
    && rm /usr/local/frp/frp_${FRP_VERSION}_linux_amd64.tar.gz

VOLUME /usr/local/frp/conf

EXPOSE 80 443 7000 7500

CMD ./frps -c ./conf/frps.ini
