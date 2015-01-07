FROM komljen/maven
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV JMETER_VERSION 2.9

RUN \
  git clone https://github.com/ATLANTBH/jmeter-components.git && \
  cd jmeter-components && \
  mvn clean install

RUN \
  wget -q http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
  tar zxf apache-jmeter-${JMETER_VERSION}.tgz && \
  rm apache-jmeter-${JMETER_VERSION}.tgz && \
  cp jmeter-components/target/atlantbh-components-*-SNAPSHOT.jar apache-jmeter-$JMETER_VERSION/lib/ext/. && \
  cp -r jmeter-components/target/lib/* apache-jmeter-${JMETER_VERSION}/lib/. && \
  tar cf apache-jmeter-${JMETER_VERSION}.tgz apache-jmeter-${JMETER_VERSION}/
