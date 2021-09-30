#zbvs/kiwizzle:kiwizzle-nginx-1.0.0
FROM nginx:1.19

WORKDIR /home
RUN apt-get update -y \
    && apt-get install -y libpcap-dev zlib1g-dev libpcre3 libpcre3-dev build-essential git \
    && git clone https://github.com/six-ddc/httpflow
RUN cd httpflow && make && make install

WORKDIR /
ADD ./default.conf /etc/nginx/conf.d/default.conf
ADD ./robots.txt /var/www/html/robots.txt