#
#
#
#

FROM centos:latest

MAINTAINER Phillip Dudley version 0.1.0

RUN yum install -y epel-release curl wget

RUN cd /opt; wget https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chefdk-0.11.2-1.el7.x86_64.rpm

RUN rpm -Uvh /opt/chefdk-0.11.2-1.el7.x86_64.rpm

ADD run_chef_verify.sh /opt/
RUN bash /opt/run_chef_verify.sh
