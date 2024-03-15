FROM nginx:1.17.8-alpine

LABEL maintainer Vitaly Lyapunov <vitaly.lyapunov@gmail.com>

COPY ./nginx_conf/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx_conf/default-small.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html