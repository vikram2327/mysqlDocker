# Run using dockerfile

# Pull & Run
```
sudo docker run -d -p 8081:80 --name phpmyadminMysqlLocalDB --network mysqlDB-network --link mysqlLocalDB:db phpmyadmin
```
