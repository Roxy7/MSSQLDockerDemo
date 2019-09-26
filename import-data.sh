#!/bin/sh

# wait for the SQL Server to come up
sleep 30s

# Restore the WWI DW database
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Demo1234! -d master -i setup.sql
