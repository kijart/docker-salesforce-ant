FROM openjdk:15-alpine

LABEL maintainer="Luis Miguel Vicente Fuentes"

# Apache Ant
ENV ANT_VERSION 1.10.8
ENV ANT_HOME /opt/ant

# Salesforce Ant migration tool
ENV SF_ANT_VERSION 49.0

# Apache Ant installation
RUN cd /tmp \
    && wget http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mkdir ant-${ANT_VERSION} \
    && tar -zxvf apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mv apache-ant-${ANT_VERSION} ${ANT_HOME} \
    && rm apache-ant-${ANT_VERSION}-bin.tar.gz \
    && rm -rf ant-${ANT_VERSION} \
    && rm -rf ${ANT_HOME}/manual \
    && unset ANT_VERSION
ENV PATH ${PATH}:${ANT_HOME}/bin

# Salesforce Ant migration tool installation
RUN cd /tmp \
    && mkdir salesforce-ant-${SF_ANT_VERSION} \
    && wget https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_${SF_ANT_VERSION}.zip \
    && unzip -d salesforce-ant-${SF_ANT_VERSION} salesforce_ant_${SF_ANT_VERSION}.zip \
    && mv salesforce-ant-${SF_ANT_VERSION}/ant-salesforce.jar ${ANT_HOME}/lib \
    && rm salesforce_ant_${SF_ANT_VERSION}.zip \
    && rm -rf salesforce-ant-${SF_ANT_VERSION} \
    && unset SF_ANT_VERSION

RUN cd /tmp \
    && wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    && tar xJf Python-3.6.3.tar.xz
    && cd Python-3.6.3
    && ./configure
    && make
    && make install

WORKDIR /salesforce
