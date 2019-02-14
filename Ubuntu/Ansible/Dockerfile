FROM Ubuntu:18:04
MAINTAINER dfoley <@>

RUN apt update && \
    apt install software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible && \
    apt update && \
    apt install wget -y && \ 
    apt apt install ansible -y 
    
RUN useradd -s /bin/bash ansible && \ 
    echo "ansible ALL=(ALL:ALL) NOPASSWD ALL" >> /etc/sudeors

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.0-amd64.deb && \ 
    dpkg -i filebeat-6.6.0-amd64.deb && \ 
    wget <Location of filebeat.yml> && \
    mv filebeat.yml /etc/filebeat/ && \ 
    systemctl enable filebeat && \ 
    systemctl start filebeat 
    
    
    
    
