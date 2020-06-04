FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install python3.3 python3-dev gcc libpng-dev g++ build-essential libssl-dev libffi-dev curl wget -y

RUN apt install python3-pip  libpython2.7-stdlib -y
RUN pip3 install wheel
RUN pip3 install --upgrade setuptools
RUN apt-get update -y && \
    apt upgrade -y 

RUN apt-add-repository ppa:ansible/ansible -y && \
    apt-get update -y && \
    apt install ansible -y 
