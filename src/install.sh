#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# update && install require packages
apt-get update
mkdir -p /usr/share/man/man1
apt-get install -y --no-install-recommends curl unzip fonts-noto-cjk openjdk-8-jre-headless

# geoserver
curl --location --output ~/geoserver.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/geoserver-2.14.0-bin.zip
unzip ~/geoserver.zip -d / && mv -v /geoserver* /geoserver
rm ~/geoserver.zip

# geoserver-mysql-plugin
curl --location --output ~/geoserver-mysql-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-mysql-plugin.zip
unzip -o ~/geoserver-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-mysql-plugin.zip

# sqlserver-plugin
curl --location --output ~/geoserver-sqlserver-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-sqlserver-plugin.zip
unzip -o ~/geoserver-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-sqlserver-plugin.zip

# oracle-plugin
curl --location --output ~/geoserver-oracle-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-oracle-plugin.zip
unzip -o ~/geoserver-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-oracle-plugin.zip

# css-plugin
curl --location --output ~/geoserver-css-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-css-plugin.zip
unzip -o ~/geoserver-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-css-plugin.zip

# ysld-plugin
curl --location --output ~/geoserver-ysld-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-ysld-plugin.zip
unzip -o ~/geoserver-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-ysld-plugin.zip

# pyramid-plugin
curl --location --output ~/geoserver-pyramid-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-pyramid-plugin.zip
unzip -o ~/geoserver-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-pyramid-plugin.zip

# vectortiles-plugin
curl --location --output ~/geoserver-vectortiles-plugin.zip http://downloads.sourceforge.net/project/geoserver/GeoServer/2.14.0/extensions/geoserver-2.14.0-vectortiles-plugin.zip
unzip -o ~/geoserver-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-vectortiles-plugin.zip

# mbstyle-plugin
curl --location --output ~/geoserver-2.14-SNAPSHOT-mbstyle-plugin.zip http://build.geoserver.org/geoserver/2.14.x/community-latest/geoserver-2.14-SNAPSHOT-mbstyle-plugin.zip
unzip -o ~/geoserver-2.14-SNAPSHOT-mbstyle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.14-SNAPSHOT-mbstyle-plugin.zip

# sqlserver jdbc driver
curl --location --output ~/sqljdbc_6.0.8112.200_enu.tar.gz https://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_6.0.8112.200_enu.tar.gz
cd ~ && tar -zxvf sqljdbc_6.0.8112.200_enu.tar.gz
cp sqljdbc_6.0/enu/jre8/sqljdbc42.jar /geoserver/webapps/geoserver/WEB-INF/lib/
rm -rf sqljdbc_6.0
rm sqljdbc_6.0.8112.200_enu.tar.gz

# copy cors enabled web.xml
mv /tmp/web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

# cleanup
apt-get purge -y unzip
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*

