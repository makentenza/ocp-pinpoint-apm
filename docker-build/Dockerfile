FROM rhel7

MAINTAINER Marcos Entenza (Mak) version: 1.0

ENV JAVA_6_HOME /usr/java/jdk1.6.0_45
ENV JAVA_7_HOME /usr/java/jdk1.7.0_79
ENV JAVA_8_HOME /usr/java/jdk1.8.0_101
ENV JAVA_HOME /usr/java/jdk1.7.0_79

RUN yum install git wget tar hostname lsof net-tools -y && yum clean all

RUN mkdir /root/jdk && cd /root/jdk && wget https://github.com/makentenza/ocp-pinpoint-apm/raw/master/jdk6/jdk-6u45-linux-amd64.rpm && \
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm && \
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm

RUN cd /root/jdk && \
rpm -i jdk-6u45-linux-amd64.rpm --force && \
rpm -i jdk-7u79-linux-x64.rpm --force && \
rpm -i jdk-8u101-linux-x64.rpm --force

RUN wget -O /etc/yum.repos.d/epel-apache-maven.repo http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo && \
yum install apache-maven -y && yum clean all

RUN git clone https://github.com/naver/pinpoint.git && \
cd pinpoint && \
mvn install -Dmaven.test.skip=true

#RUN /root/pinpoint/quickstart/bin/start-hbase.sh && \
#/root/pinpoint/quickstart/bin/init-hbase.sh && \
#/root/pinpoint/quickstart/bin/start-collector.sh && \
#/root/pinpoint/quickstart/bin/start-testapp.sh && \
#/root/pinpoint/quickstart/bin/start-web.sh
