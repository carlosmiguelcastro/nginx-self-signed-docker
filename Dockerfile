FROM nginx

RUN apt-get update \
    && apt-get install -y openssl

RUN mkdir /opt/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /opt/ssl/nginx-selfsigned.key -out /opt/ssl/nginx-selfsigned.crt -subj "/C=PT/ST=Porto/L=Porto/O=random.io/OU=random.io/CN=random.codeclou.io"

COPY nginx.conf /etc/nginx/
COPY html /usr/share/nginx/html

EXPOSE 443  
