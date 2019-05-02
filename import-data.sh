#!/bin/sh

# wait for the SQL Server to come up
sleep 60s

# Restore the WWI DW database
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Demo1234! -Q 'RESTORE DATABASE WideWorldImportersDW FROM DISK = "/var/opt/mssql/backup/WideWorldImportersDW-Full.bak" WITH MOVE "WWI_Primary" TO "/var/opt/mssql/data/WideWorldImporters.mdf", MOVE "WWI_UserData" TO "/var/opt/mssql/data/WideWorldImporters_userdata.ndf", MOVE "WWI_Log" TO "/var/opt/mssql/data/WideWorldImporters.ldf", MOVE "WWIDW_InMemory_Data_1" TO "/var/opt/mssql/data/WideWorldImportersDW_InMemory_Data_1"'
