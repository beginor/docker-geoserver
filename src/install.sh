#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# update && install require packages
apt-get update
apt-get install -y --no-install-recommends curl wget unzip fonts-noto-cjk openjdk-8-jre-headless

# geoserver
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/geoserver-2.13.2-bin.zip -O ~/geoserver.zip
unzip ~/geoserver.zip -d / && mv -v /geoserver* /geoserver
rm ~/geoserver.zip

# geoserver-mysql-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-mysql-plugin.zip -O ~/geoserver-mysql-plugin.zip
unzip -o ~/geoserver-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-mysql-plugin.zip

# sqlserver-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-sqlserver-plugin.zip -O ~/geoserver-sqlserver-plugin.zip
unzip -o ~/geoserver-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-sqlserver-plugin.zip
# sqlserver jdbc driver
wget -c http://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_6.0.8112.200_enu.tar.gz -O ~/sqljdbc_6.0.8112.200_enu.tar.gz
cd ~ && tar -zxvf sqljdbc_6.0.8112.200_enu.tar.gz
copy sqljdbc_6.0/enu/jre8/sqljdbc42.jar /geoserver/webapps/geoserver/WEB-INF/lib/
rm -rf sqljdbc_6.0
rm sqljdbc_6.0.8112.200_enu.tar.gz
# oracle-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-oracle-plugin.zip -O ~/geoserver-oracle-plugin.zip
unzip -o ~/geoserver-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-oracle-plugin.zip

# css-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-css-plugin.zip -O ~/geoserver-css-plugin.zip
unzip -o ~/geoserver-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-css-plugin.zip

# ysld-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-ysld-plugin.zip -O ~/geoserver-ysld-plugin.zip
unzip -o ~/geoserver-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-ysld-plugin.zip

# pyramid-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-pyramid-plugin.zip -O ~/geoserver-pyramid-plugin.zip
unzip -o ~/geoserver-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-pyramid-plugin.zip

# vectortiles-plugin
wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/extensions/geoserver-2.13.2-vectortiles-plugin.zip -O ~/geoserver-vectortiles-plugin.zip
unzip -o ~/geoserver-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-vectortiles-plugin.zip

# mbstyle-plugin
wget -c http://ares.opengeo.org/geoserver/master/community-latest/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip -O ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip
unzip -o ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.13-SNAPSHOT-mbstyle-plugin.zip

# copy cors enabled web.xml
mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

# cleanup
apt-get purge -y wget unzip
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*

