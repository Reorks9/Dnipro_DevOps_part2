FROM ubuntu:18.04
EXPOSE 8080
EXPOSE 80
# home directory for jenkins
ENV JENKINS_HOME /var/lib/jenkins

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-8-jre-headless wget nginx maven && \ 
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/sites-available/jenkins
COPY ./nginx.conf /etc/nginx/sites-available/jenkins/nginx.conf

# jenkins download and unpack
ADD http://mirrors.jenkins-ci.org/war/2.219/jenkins.war /opt/jenkins.war 
# alternative option for jenkins download
#    wget http://mirrors.jenkins-ci.org/war/2.87/jenkins.war -O /opt/jenkins.war
RUN chmod 755 /etc/nginx/sites-available/jenkins && \
	unlink /etc/nginx/sites-enabled/default && \
	ln -s /etc/nginx/sites-available/jenkins/nginx.conf /etc/nginx/sites-enabled/nginx.conf && \
	echo "daemon on;" >> /etc/nginx/nginx.conf && \
	chmod 644 /opt/jenkins.war

# java run jenkins.war: unpack war file
ENTRYPOINT /usr/sbin/nginx && java -jar /opt/jenkins.war
CMD [""]