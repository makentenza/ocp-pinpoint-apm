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

RUN cd /root && \
git clone https://github.com/naver/pinpoint.git && \
cd pinpoint && \
mvn install -Dmaven.test.skip=true

RUN echo "export JAVA_6_HOME=/usr/java/jdk1.6.0_45" > /etc/profile.d/jdk.sh && \
echo "export JAVA_7_HOME=/usr/java/jdk1.7.0_79" >> /etc/profile.d/jdk.sh && \
echo "export JAVA_8_HOME=/usr/java/jdk1.8.0_101" >> /etc/profile.d/jdk.sh && \
echo "JAVA_HOME=/usr/java/jdk1.7.0_79" >> /etc/profile.d/jdk.sh

#RUN echo "nohup /root/pinpoint/quickstart/bin/start-hbase.sh &> /dev/null &" >> /root/pinpoint/quickstart/bin/startup.sh && \
#echo "nohup /root/pinpoint/quickstart/bin/init-hbase.sh &> /dev/null &" >> /root/pinpoint/quickstart/bin/startup.sh && \
#echo "nohup /root/pinpoint/quickstart/bin/start-collector.sh &> /dev/null &" >> /root/pinpoint/quickstart/bin/startup.sh && \
#echo "nohup /root/pinpoint/quickstart/bin/start-web.sh &> /dev/null &" >> /root/pinpoint/quickstart/bin/startup.sh && \
#chmod +x /root/pinpoint/quickstart/bin/startup.sh

RUN mkdir /root/logs && \
echo "/root/pinpoint/quickstart/bin/start-hbase.sh &> /root/hbase.out &" > /root/pinpoint/quickstart/bin/startup.sh && \
echo "/root/pinpoint/quickstart/bin/init-hbase.sh &> /root/hbase-init.out &" >> /root/pinpoint/quickstart/bin/startup.sh && \
echo "/root/pinpoint/quickstart/bin/start-collector.sh &> /root/collector.out &" >> /root/pinpoint/quickstart/bin/startup.sh && \
echo "/root/pinpoint/quickstart/bin/start-web.sh &> /root/webui.out &" >> /root/pinpoint/quickstart/bin/startup.sh && \
chmod +x /root/pinpoint/quickstart/bin/startup.sh

RUN sed -i '/^CLOSE_WAIT_TIME/c\CLOSE_WAIT_TIME=1000' /root/pinpoint/quickstart/bin/start-collector.sh && \
sed -i '/^CLOSE_WAIT_TIME/c\CLOSE_WAIT_TIME=1000' /root/pinpoint/quickstart/bin/start-web.sh && \
sed -i '/^CLOSE_WAIT_TIME/c\CLOSE_WAIT_TIME=1000' /root/pinpoint/quickstart/bin/start-testapp.sh



#RUN /root/pinpoint/quickstart/bin/start-hbase.sh && \
#/root/pinpoint/quickstart/bin/init-hbase.sh && \
#/root/pinpoint/quickstart/bin/start-collector.sh && \
#/root/pinpoint/quickstart/bin/start-testapp.sh && \
#/root/pinpoint/quickstart/bin/start-web.sh

#EXPOSE 2181
#EXPOSE 16010
#EXPOSE 9994
#EXPOSE 9995/tcp
#EXPOSE 9995/udp
#EXPOSE 9996/tcp
#EXPOSE 9996/udp
#EXPOSE 8080

EXPOSE 28080
EXPOSE 28081

CMD ["/root/pinpoint/quickstart/bin/startup.sh"]
