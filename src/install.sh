#!/bin/bash -e

# update && install require packages
apt-get update
apt-get upgrade -y
mkdir -p /usr/share/man/man1
apt-get install -y --no-install-recommends curl unzip fonts-noto-cjk openjdk-11-jre-headless procps

# geoserver
curl --location --output ~/geoserver-2.18.0.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/geoserver-2.18.0-bin.zip
unzip ~/geoserver-2.18.0.zip -d /geoserver
rm ~/geoserver-2.18.0.zip

# geoserver-mysql-plugin
curl --location --output ~/geoserver-2.18.0-mysql-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-mysql-plugin.zip
unzip -o ~/geoserver-2.18.0-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-mysql-plugin.zip

# sqlserver-plugin
curl --location --output ~/geoserver-2.18.0-sqlserver-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-sqlserver-plugin.zip
unzip -o ~/geoserver-2.18.0-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-sqlserver-plugin.zip

# oracle-plugin
curl --location --output ~/geoserver-2.18.0-oracle-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-oracle-plugin.zip
unzip -o ~/geoserver-2.18.0-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-oracle-plugin.zip

# css-plugin
curl --location --output ~/geoserver-2.18.0-css-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-css-plugin.zip
unzip -o ~/geoserver-2.18.0-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-css-plugin.zip

# ysld-plugin
curl --location --output ~/geoserver-2.18.0-ysld-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-ysld-plugin.zip
unzip -o ~/geoserver-2.18.0-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-ysld-plugin.zip

# pyramid-plugin
curl --location --output ~/geoserver-2.18.0-pyramid-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-pyramid-plugin.zip
unzip -o ~/geoserver-2.18.0-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-pyramid-plugin.zip

# vectortiles-plugin
curl --location --output ~/geoserver-2.18.0-vectortiles-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-vectortiles-plugin.zip
unzip -o ~/geoserver-2.18.0-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-vectortiles-plugin.zip

# mbstyle-plugin
curl --location --output ~/geoserver-2.18.0-mbstyle-plugin.zip \
  http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/extensions/geoserver-2.18.0-mbstyle-plugin.zip
unzip -o ~/geoserver-2.18.0-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.18.0-mbstyle-plugin.zip

# copy cors enabled web.xml
mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

# cleanup
apt-get purge -y unzip
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
