FROM mdillon/postgis:10-alpine

RUN apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        g++ \
        make
        
        
#RUN apt-get update;apt-get install postgresql-server-dev-10 -y

ADD kmeans /usr/src/kmeans

RUN  cd /usr/src/kmeans; make ; make install; make clean

RUN  apk del .build-deps

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
