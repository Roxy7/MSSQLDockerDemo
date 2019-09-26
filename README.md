# MSSQLDockerDemo
This repository is dedicated to run a sqlserver2017 on a docker container. It use an import-data.sh script combined to a setup.sql file used to init some data or restore a database on startup. Rigth now, it restore the WideWorldImportersDW database sample from Microsoft repos wich is cloned from the github repos during the image build.

# Running the Demo
## Setting up the application and building the image for the first time
First, create a folder on your host and then git clone this project into that folder:
```
git clone https://github.com/Roxy7/MSSQLDockerDemo.git
```
To run the demo you just need to build the container:
```
docker build -t demosql2017 .
```

Then, you need to run the container:
```
docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=Demo1234! -p 1433:1433 -d --name sql2017 demosql2017
```
Note: make sure that your password matches what is in the import-data.sh script.

Then you can connect to the SQL Server in the container by running a tool on your host or you can docker exec into the container and run sqlcmd from inside the container.
```
docker exec -it sql2017 /bin/bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Demo1234!
```



example from: https://github.com/twright-msft/mssql-node-docker-demo-app