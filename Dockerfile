#
# Docker image for the phabricator database
#

FROM tutum/mysql
MAINTAINER Arthur Burkart <artburkart@gmail.com>

# Install curl for download.sh
RUN apt-get update && apt-get install -y curl

# Replace 127.0.0.1 with 0.0.0.0
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Copy phabricator mysql conf file
ADD my-phabricator.cnf /etc/mysql/conf.d/my-phabricator.cnf

# Download bootstrap files
ADD download.sh /opt/mysql/download.sh
RUN bash /opt/mysql/download.sh

ENV MYSQL_PASS admin
ENV MYSQL_USER admin
ENV STARTUP_SQL /opt/phabricator/resources/sql/quickstart.sql
