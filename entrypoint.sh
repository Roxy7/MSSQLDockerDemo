#!/bin/sh

#start SQL Server, start the script to create the DB and import the data, keep container alive
/opt/mssql/bin/sqlservr &
/usr/src/scripts/import-data.sh && tail -f /dev/null
