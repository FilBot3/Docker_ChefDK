#
#
#
#

FROM centos:latest

MAINTAINER Phillip Dudley version 0.1.1

RUN yum install -y epel-release curl wget sudo

RUN cd /opt; curl -O https://packages.chef.io/files/stable/chefdk/1.2.22/el/7/chefdk-1.2.22-1.el7.x86_64.rpm 

RUN rpm -Uvh /opt/chefdk-1.2.22-1.el7.x86_64.rpm

ADD run_chef_verify.sh /opt/
RUN bash /opt/run_chef_verify.sh

RUN groupadd chefdk; useradd -g chefdk chefdk
RUN echo "%chefdk ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dockeruser
RUN chmod 440 /etc/sudoers.d/dockeruser

USER chefdk

