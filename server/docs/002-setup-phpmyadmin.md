# Run using dockerfile

# Pull & Run
```
sudo docker run -d -p 8080:80 --name phpmyadminMysqlServerDB --network mysqlDB-network --link mysqlServerDB:db phpmyadmin
```
