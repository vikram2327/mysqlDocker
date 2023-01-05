# Run using dockerfile

# Create Network
```
sudo docker network create mysqlDB-network   
```

# Pull & Run
```
sudo docker run -d -p 3306:3306 --name mysqlServerDB --network mysqlDB-network -e MYSQL_ROOT_PASSWORD=123456 mysql
```

# Build Image
```
sudo docker build -t servermysql:customImage .
```
# Pull & Run
```
sudo docker run -d -p 3306:3306 --name mysqlServerDB  -v ${PWD}/server/app:/var/lib/mysql --network mysqlDB-network -e MYSQL_ROOT_PASSWORD=123456 servermysql:customImage
```

# Creating database dumps
Most of the normal tools will work, although their usage might be a little convoluted in some cases to ensure they have access to the mysqld server. A simple way to ensure this is to use docker exec and run the tool from the same container, similar to the following:

```
sudo docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
```

# Restoring data from dump files
For restoring data. You can use docker exec command with -i flag, similar to the following:
```
docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql
```
