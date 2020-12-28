FROM mysql
MAINTAINER Keyur Patel
CMD --default-authentication-plugin=mysql_native_password
RESTART always
ENV MYSQL_ROOT_PASSWORD=password
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
     mysql server \
     && service mysql start \
     && rm -r /var/lib/apt/lists/* 
COPY ./mysql.script / 
RUN  mysql -u root -p < /mysql.script
EXPOSE 3306

