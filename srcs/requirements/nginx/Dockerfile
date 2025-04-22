FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install nginx -y && apt install openssl -y
RUN mkdir -p /etc/nginx/ssl /var/run/nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=enorie.42.fr/UID=enorie"
RUN chmod 600 /etc/nginx/ssl/inception.crt && \
	chmod 600 /etc/nginx/ssl/inception.key
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 777 /var/www/html
RUN chmod 777 /var/www/html/*
RUN chown -R www-data:www-data /var/www/html
CMD ["nginx", "-g", "daemon off;"]