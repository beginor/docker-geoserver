#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# update && install require packages
apt-get update
apt-get install -y --no-install-recommends curl wget unzip fonts-noto-cjk openjdk-8-jre-headless

# geoserver
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/geoserver-2.13.0-bin.zip -O ~/geoserver.zip
unzip ~/geoserver.zip -d / && mv -v /geoserver* /geoserver
rm ~/geoserver.zip

# geoserver-mysql-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-mysql-plugin.zip -O ~/geoserver-mysql-plugin.zip
unzip -o ~/geoserver-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-mysql-plugin.zip

# sqlserver-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-sqlserver-plugin.zip -O ~/geoserver-sqlserver-plugin.zip
unzip -o ~/geoserver-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-sqlserver-plugin.zip

# oracle-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-oracle-plugin.zip -O ~/geoserver-oracle-plugin.zip
unzip -o ~/geoserver-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-oracle-plugin.zip

# css-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-css-plugin.zip -O ~/geoserver-css-plugin.zip
unzip -o ~/geoserver-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-css-plugin.zip

# ysld-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-ysld-plugin.zip -O ~/geoserver-ysld-plugin.zip
unzip -o ~/geoserver-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-ysld-plugin.zip

# pyramid-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-pyramid-plugin.zip -O ~/geoserver-pyramid-plugin.zip
unzip -o ~/geoserver-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-pyramid-plugin.zip

# vectortiles-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.0/extensions/geoserver-2.13.0-vectortiles-plugin.zip -O ~/geoserver-vectortiles-plugin.zip
unzip -o ~/geoserver-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-vectortiles-plugin.zip

# mbstyle-plugin
wget -c http://ares.opengeo.org/geoserver/master/community-latest/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip -O ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip
unzip -o ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip

# copy cors enabled web.xml
mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

# cleanup
apt-get remove -y wget unzip
apt-get purge -y wget unzip
apt-get autoremove
rm -rf /var/lib/apt/lists/*

