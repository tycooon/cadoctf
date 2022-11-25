FROM ubuntu

RUN apt-get update
RUN apt-get install -y libc6-i386
RUN apt-get install -y binutils
RUN apt-get install -y file
RUN apt-get install -y ltrace

ENTRYPOINT [ "bash" ]
