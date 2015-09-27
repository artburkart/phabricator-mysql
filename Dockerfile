#
# Docker image for the phabricator database
#

FROM tutum/mysql
MAINTAINER Arthur Burkart <artburkart@gmail.com>

# Install curl for download.sh
RUN apt-get update && apt-get install -y curl

# Copy phabricator mysql conf file
ADD my-phabricator.cnf /etc/mysql/conf.d/my-phabricator.cnf

# Download bootstrap files
ADD download.sh /opt/mysql/download.sh
RUN bash /opt/mysql/download.sh

ENV MYSQL_PASS admin
ENV STARTUP_SQL /opt/phabricator/resources/sql/quickstart.sql
