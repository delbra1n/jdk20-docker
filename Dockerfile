FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y wget

RUN wget https://download.oracle.com/java/20/archive/jdk-20.0.1_linux-x64_bin.deb && \
    apt install -y ./jdk-20.0.1_linux-x64_bin.deb

RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-20/bin/java 1 && \
    update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-20/bin/javac 1 && \
    update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-20/bin/jar 1

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz && \
    tar xvf apache-maven-3.9.2-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.9.2 /opt/maven

COPY maven.sh /etc/profile.d/

RUN chmod +x /etc/profile.d/maven.sh

SHELL ["/bin/bash", "-c"] 

RUN source /etc/profile.d/maven.sh