FROM ubuntu:18.04 # ubuntu image download
EXPOSE 8080 # port for jenkins
ENV JENKINS_HOME /var/lib/jenkins # home directory for jenkins

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-8-jre-headless wget && \ # java install
    rm -rf /var/lib/apt/lists/*

ADD http://mirrors.jenkins-ci.org/war/2.219/jenkins.war /opt/jenkins.war # jenkins download and unpacking
#    wget http://mirrors.jenkins-ci.org/war/2.87/jenkins.war -O /opt/jenkins.war # alternative option for jenkins download
RUN chmod 644 /opt/jenkins.war # rights for jenkins.war

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"] # java run jenkins.war: unpacking war file
CMD [""]