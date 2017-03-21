FROM beginor/openjdk:1.8.0

MAINTAINER beginor <beginor@qq.com>

RUN apt-get update \
    && apt-get install -y wget unzip

ENV GEOSERVER_VERSION 2.11-RC1

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

# Get Oracle plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-oracle-plugin.zip -O ~/geoserver-oracle-plugin.zip &&\
    unzip -o ~/geoserver-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-oracle-plugin.zip

# Get CSS Styling plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-css-plugin.zip -O ~/geoserver-css-plugin.zip &&\
    unzip -o ~/geoserver-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-css-plugin.zip

# Get YSLD Styling plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-ysld-plugin.zip -O ~/geoserver-ysld-plugin.zip &&\
    unzip -o ~/geoserver-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-ysld-plugin.zip

# Get Image Pyramid plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-pyramid-plugin.zip -O ~/geoserver-pyramid-plugin.zip &&\
    unzip -o ~/geoserver-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-pyramid-plugin.zip

# Get Vector Tiles plugin
RUN wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-vectortiles-plugin.zip -O ~/geoserver-vectortiles-plugin.zip &&\
    unzip -o ~/geoserver-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
    rm ~/geoserver-vectortiles-plugin.zip

# Enable CORS for geoserver
RUN wget http://central.maven.org/maven2/org/eclipse/jetty/jetty-servlets/9.2.13.v20150730/jetty-servlets-9.2.13.v20150730.jar -O ~/jetty-servlets-9.2.13.v20150730.jar &&\
    mv ~/jetty-servlets-9.2.13.v20150730.jar /geoserver/webapps/geoserver/WEB-INF/lib/
COPY web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

RUN apt-get remove -y wget unzip \
    && apt-get purge -y wget unzip \
    && rm -rf /var/lib/apt/lists/*

ENV GEOSERVER_HOME /geoserver

EXPOSE 8080

VOLUME ["/geoserver/data_dir","/geoserver/logs"]

CMD ["/geoserver/bin/startup.sh"]
