
FROM centos
MAINTAINER Izhar ul Hassan "ezhaar@gmail.com"

USER root

# install java and set JAVA_HOME
RUN yum update -y && yum install -y \
  java-1.8.0-openjdk.x86_64\
  which\
  && yum clean all

# Download and extract hadoop-2.6.0
RUN  curl -O http://ftp.download-by.net/apache/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz\
  && tar -xzf hadoop-2.7.4.tar.gz && rm hadoop-2.7.4.tar.gz

RUN groupadd hdfs 
RUN groupadd supergroup 
RUN useradd -g hdfs -g supergroup hdfs 

# export hadoop variables
ENV HADOOP_HOME /hadoop-2.7.4
ENV HADOOP_PREFIX /hadoop-2.7.4
ENV HADOOP_CONF_DIR /hadoop-2.7.4/etc/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.el7_4.x86_64/jre
ENV PATH $PATH:$JAVA_HOME/bin:/hadoop-2.7.4/bin:/hadoop-2.7.4/sbin
USER hdfs 
# Define default command.
CMD ["bash"]

