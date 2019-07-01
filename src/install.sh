#!/bin/bash -e

# update && install require packages
apt-get update
apt-get upgrade -y
mkdir -p /usr/share/man/man1
apt-get install -y --no-install-recommends curl unzip fonts-noto-cjk openjdk-8-jre-headless procps

# geoserver
curl --location --output ~/geoserver-2.15.2.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/geoserver-2.15.2-bin.zip
unzip ~/geoserver-2.15.2.zip -d / && mv -v /geoserver-2.15.2 /geoserver
rm ~/geoserver-2.15.2.zip

# geoserver-mysql-plugin
curl --location --output ~/geoserver-2.15.2-mysql-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-mysql-plugin.zip
unzip -o ~/geoserver-2.15.2-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-mysql-plugin.zip

# sqlserver-plugin
curl --location --output ~/geoserver-2.15.2-sqlserver-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-sqlserver-plugin.zip
unzip -o ~/geoserver-2.15.2-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-sqlserver-plugin.zip

# oracle-plugin
curl --location --output ~/geoserver-2.15.2-oracle-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-oracle-plugin.zip
unzip -o ~/geoserver-2.15.2-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-oracle-plugin.zip

# css-plugin
curl --location --output ~/geoserver-2.15.2-css-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-css-plugin.zip
unzip -o ~/geoserver-2.15.2-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-css-plugin.zip

# ysld-plugin
curl --location --output ~/geoserver-2.15.2-ysld-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-ysld-plugin.zip
unzip -o ~/geoserver-2.15.2-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-ysld-plugin.zip

# pyramid-plugin
curl --location --output ~/geoserver-2.15.2-pyramid-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-pyramid-plugin.zip
unzip -o ~/geoserver-2.15.2-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-pyramid-plugin.zip

# vectortiles-plugin
curl --location --output ~/geoserver-2.15.2-vectortiles-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-vectortiles-plugin.zip
unzip -o ~/geoserver-2.15.2-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.2-vectortiles-plugin.zip

# mbstyle-plugin
curl --location --output ~/geoserver-2.15-SNAPSHOT-mbstyle-plugin.zip \
  https://build.geoserver.org/geoserver/2.15.x/community-latest/geoserver-2.15-SNAPSHOT-mbstyle-plugin.zip
unzip -o ~/geoserver-2.15-SNAPSHOT-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15-SNAPSHOT-mbstyle-plugin.zip

# copy cors enabled web.xml
mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

# cleanup
apt-get purge -y unzip
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
