FROM jenkins/jenkins:lts

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root

RUN apt-get update && apt upgrade -y 
RUN apt install python3 python3-pip python-pip -y 
RUN python3 -m pip install --upgrade pip  
RUN python -m pip install --upgrade pip 
RUN apt install wget -y 
RUN apt install nano -y 
RUN pip install pywinrm 
RUN pip install pywinrm[credssp]
RUN pip install -U requests-credssp
RUN apt-get -y install openssh-client
#RUN ssh-keygen -q -t rsa -N '' -f /id_rsa
RUN pip pip install paramiko 
RUN pip install pyvmomi
RUN install apt-get install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update && apt install ansible -y 

# QC Certs

