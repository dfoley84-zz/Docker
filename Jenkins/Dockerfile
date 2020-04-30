FROM jenkins/jenkins:lts

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root

RUN apt-get update && apt upgrade -y
RUN apt-get install wget nano curl -y
RUN apt-get install python3 python3-pip  -y

COPY ./requirements.txt /
RUN pip3 install -r /requirements.txt

RUN apt-get install software-properties-common -y
RUN apt-get update && apt install ansible -y

COPY ./plugins.txt /
RUN /usr/local/bin/install-plugins.sh < /plugins.txt

# SSL Certs
