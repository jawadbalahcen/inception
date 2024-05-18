FROM debian:bullseye

RUN apt update -y 

RUN apt upgrade -y 

RUN apt install nginx openssl curl -y 

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/jbalahce.key -out /etc/ssl/certs/jbalahce.crt -days 365 -nodes \
    -subj \
    "/C=MA/L=Benguerir/O=1337 School/CN=jbalahce.42.fr/emailAddress=jbalahce@student.1337.ma"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf


RUN chmod 755 /var/www/html

CMD ["nginx", "-g", "daemon off;"]
