# base image
FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

# Install node/npm
RUN apt-get -y update  && \
        apt-get install -y curl 

RUN mkdir -p /var/opt/mssql/backup
WORKDIR /var/opt/mssql/backup
RUN curl -L -o WideWorldImportersDW-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak

# Create scripts directory
RUN mkdir -p /usr/src/scripts
WORKDIR /usr/src/scripts
COPY . /usr/src/scripts

# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/scripts/import-data.sh

CMD /bin/bash ./entrypoint.sh