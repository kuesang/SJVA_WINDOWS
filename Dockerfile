FROM ubuntu:latest
MAINTAINER YKS

# Run upgrades
RUN apt-get update

# Install basic packages
RUN apt-get -qq -y install git curl build-essential

RUN apt-get -y install python2.7 
RUN apt-get -y install python-pip python-dev python-setuptools

RUN cd /home/

RUN git clone https://github.com/soju6jan/SJVA.git
RUN cd /home/SJVA

RUN apt-get -y install libffi-dev libxml2-dev libxslt-dev python-dev libjpeg-turbo-dev zlib1g-dev

RUN pip install --upgrade pyasn1
RUN pip install -r requirements.txt

RUN cp start.sh my_start.sh
RUN chmod 777 my_start.sh

RUN cp etc/sjva_u5mini /etc/init.d/sjva
RUN chmod a+x /etc/init.d/sjva
RUN update-rc.d sjva defaults

RUN service sjva start
