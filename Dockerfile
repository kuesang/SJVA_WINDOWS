FROM ubuntu:latest
MAINTAINER YKS

# Run upgrades
RUN apt-get update

# Install basic packages
RUN apt-get -qq -y install git curl build-essential

