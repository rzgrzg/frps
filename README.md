# frps
frps dockerfile for amd64

usage:  
  docker build -t rzgrzg/frps https://github.com/rzgrzg/frps.git  

docker run --name frps --restart=always \  
    -p 80:80 \  
    -p 443:443 \  
    -p 7000:7000 \  
    -p 7500:7500 \  
    -v /var/frp/conf/frps.ini:frps.ini \  
    -d rzgrzg/frps  
