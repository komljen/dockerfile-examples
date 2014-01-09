FROM komljen/jdk6-oracle
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN apt-get -qq update
RUN apt-get -qqy install jenkins

VOLUME ["/root/.jenkins"]

EXPOSE 8080
RUN rm /usr/sbin/policy-rc.d
CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--webroot=/root/.jenkins/web"]
