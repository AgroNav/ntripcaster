FROM ubuntu:20.04
RUN apt-get update && apt-get install -y g++ make
WORKDIR /app
COPY . .
RUN ./configure && make && make install
WORKDIR /usr/local/ntripcaster/bin
CMD ./ntripcaster