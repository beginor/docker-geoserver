FROM beginor/openjdk-jre:1.8.0_131

LABEL maintainer="beginor <beginor@qq.com>"

ENV GEOSERVER_HOME=/geoserver

COPY docker-entrypoint.sh /usr/bin/
COPY web.xml /tmp

# GeoServer, mysql, sqlserver, oracle, css, ysld style, image pyramid,
# vector tiles, mbstyle, enable cors
RUN apt-get update && apt-get install -y curl wget unzip fonts-wqy-microhei fonts-wqy-zenhei ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/geoserver-2.12.2-bin.zip -O ~/geoserver.zip &&\
      unzip ~/geoserver.zip -d / && mv -v /geoserver* /geoserver && \
      rm ~/geoserver.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-mysql-plugin.zip -O ~/geoserver-mysql-plugin.zip &&\
      unzip -o ~/geoserver-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-mysql-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-sqlserver-plugin.zip -O ~/geoserver-sqlserver-plugin.zip &&\
      unzip -o ~/geoserver-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-sqlserver-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-oracle-plugin.zip -O ~/geoserver-oracle-plugin.zip &&\
      unzip -o ~/geoserver-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-oracle-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-css-plugin.zip -O ~/geoserver-css-plugin.zip &&\
      unzip -o ~/geoserver-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-css-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-ysld-plugin.zip -O ~/geoserver-ysld-plugin.zip &&\
      unzip -o ~/geoserver-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-ysld-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-pyramid-plugin.zip -O ~/geoserver-pyramid-plugin.zip &&\
      unzip -o ~/geoserver-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-pyramid-plugin.zip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.2/extensions/geoserver-2.12.2-vectortiles-plugin.zip -O ~/geoserver-vectortiles-plugin.zip &&\
      unzip -o ~/geoserver-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-vectortiles-plugin.zip && \
    wget -c http://ares.opengeo.org/geoserver/2.12.x/community-latest/geoserver-2.12-SNAPSHOT-mbstyle-plugin.zip -O ~/geoserver-2.12-SNAPSHOT-mbstyle-plugin.zip &&\
      unzip -o ~/geoserver-2.12-SNAPSHOT-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/ && \
      rm ~/geoserver-2.12-SNAPSHOT-mbstyle-plugin.zip && \
    apt-get remove -y wget unzip && apt-get purge -y wget unzip && \
      rm -rf /var/lib/apt/lists/* && \
    mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

EXPOSE 8080

VOLUME ["/geoserver/data_dir","/geoserver/logs"]

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
  CMD curl "http://127.0.0.1:8080/geoserver/ows?service=wfs&version=2.0.0&request=GetCapabilities" || exit 1
