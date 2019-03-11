#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# update && install require packages
apt-get update
apt-get upgrade -y
mkdir -p /usr/share/man/man1
apt-get install -y --no-install-recommends curl unzip fonts-noto-cjk openjdk-8-jre-headless procps

# geoserver
curl --location --output ~/geoserver-2.15.0.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/geoserver-2.15.0-bin.zip
unzip ~/geoserver-2.15.0.zip -d / && mv -v /geoserver-2.15.0 /geoserver
rm ~/geoserver-2.15.0.zip

# geoserver-mysql-plugin
curl --location --output ~/geoserver-2.15.0-mysql-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-mysql-plugin.zip
unzip -o ~/geoserver-2.15.0-mysql-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-mysql-plugin.zip

# sqlserver-plugin
curl --location --output ~/geoserver-2.15.0-sqlserver-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-sqlserver-plugin.zip
unzip -o ~/geoserver-2.15.0-sqlserver-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-sqlserver-plugin.zip

# oracle-plugin
curl --location --output ~/geoserver-2.15.0-oracle-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-oracle-plugin.zip
unzip -o ~/geoserver-2.15.0-oracle-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-oracle-plugin.zip

# css-plugin
curl --location --output ~/geoserver-2.15.0-css-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-css-plugin.zip
unzip -o ~/geoserver-2.15.0-css-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-css-plugin.zip

# ysld-plugin
curl --location --output ~/geoserver-2.15.0-ysld-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-ysld-plugin.zip
unzip -o ~/geoserver-2.15.0-ysld-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-ysld-plugin.zip

# pyramid-plugin
curl --location --output ~/geoserver-2.15.0-pyramid-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-pyramid-plugin.zip
unzip -o ~/geoserver-2.15.0-pyramid-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-pyramid-plugin.zip

# vectortiles-plugin
curl --location --output ~/geoserver-2.15.0-vectortiles-plugin.zip \
  https://build.geoserver.org/geoserver/release/2.15.0/plugins/geoserver-2.15.0-vectortiles-plugin.zip
unzip -o ~/geoserver-2.15.0-vectortiles-plugin.zip -d /geoserver/webapps/geoserver/WEB-INF/lib/
rm ~/geoserver-2.15.0-vectortiles-plugin.zip

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
