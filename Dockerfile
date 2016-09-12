FROM ubuntu:16.04

MAINTAINER beginor <beginor@qq.com>

RUN apt-get update \
    && apt-get install -y openjdk-8-jdk wget unzip

ENV GEOSERVER_VERSION 2.9.1

# Get GeoServer
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-bin.zip -O ~/geoserver.zip &&\
    unzip ~/geoserver.zip -d / && mv -v /geoserver* /geoserver && \
    rm ~/geoserver.zip

# Get MySQL plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-mysql-plugin.zip -O ~/geoserver-mysql-plugin.zip &&\
    unzip -o ~/geoserver-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-mysql-plugin.zip

# Get SqlServer plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-sqlserver-plugin.zip -O ~/geoserver-sqlserver-plugin.zip &&\
    unzip -o ~/geoserver-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-sqlserver-plugin.zip

RUN apt-get remove -y wget unzip \
    && apt-get purge -y wget unzip \
    && rm -rf /var/lib/apt/lists/*

ENV GEOSERVER_HOME /geoserver

EXPOSE 8080

VOLUME ["/geoserver/data_dir","/geoserver/logs"]

CMD ["/geoserver/bin/startup.sh"]
