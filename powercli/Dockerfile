FROM microsoft/powershell:ubuntu16.04

RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y unzip git && apt-get clean
    
RUN apt-get update -y && \
    apt-get install python3.3 python3-dev gcc libpng-dev g++ build-essential libssl-dev libffi-dev curl wget -y

RUN apt install python3-pip  libpython2.7-stdlib -y
RUN pip3 install wheel
RUN pip3 install --upgrade setuptools
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy git && \
    apt-get install -qy openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
    apt-get install -qy openjdk-8-jdk && \
    apt-get install -qy maven && \
    apt-get -qy autoremove && \
    adduser --quiet sshuser && \
    echo "sshuser:sshuser" | chpasswd && \
    mkdir /home/sshuser/

# Set working directory so stuff doesn't end up in /
WORKDIR /root

# Install VMware modules from PSGallery
SHELL [ "pwsh", "-command" ]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module VMware.PowerCLI,SqlServer

# Add the PowerCLI Example Scripts and Modules
# using ZIP instead of a git pull to save at least 100MB
SHELL [ "bash", "-c"]

RUN curl -o ./PowerCLI-Example-Scripts.zip -J -L https://github.com/vmware/PowerCLI-Example-Scripts/archive/master.zip && \
    unzip PowerCLI-Example-Scripts.zip && \
    rm -f PowerCLI-Example-Scripts.zip && \
    mv ./PowerCLI-Example-Scripts-master ./PowerCLI-Example-Scripts && \
    mv ./PowerCLI-Example-Scripts/Modules/* /usr/local/share/powershell/Modules/

EXPOSE 22
CMD ["/usr/bin/pwsh"]
