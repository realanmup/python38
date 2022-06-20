FROM python:3.8

RUN  apt update && apt upgrade -yqq

RUN apt install build-essential checkinstall zlib1g-dev make gcc -yqq

WORKDIR /usr/local/src/

RUN wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz

RUN tar -zxf openssl-1.1.1g.tar.gz 

WORKDIR /usr/local/src/openssl-1.1.1g

RUN ./config

RUN make

# RUN make test

RUN make install

RUN mv /usr/bin/openssl ~/tmp

RUN ln -s /usr/local/bin/openssl /usr/bin/openssl

RUN ldconfig -v

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/ssl/bin"

RUN openssl version

RUN apt update && apt install -yqq poppler-utils

WORKDIR /

ENTRYPOINT [ "python3" ]
