# for mysql container
sudo docker network create mysqlDB-network   
sudo docker build -t servermysql:customImage .
sudo docker run -d -p 3306:3306 --name mysqlServerDB  -v ${PWD}/server/app:/var/lib/mysql --network mysqlDB-network -e MYSQL_ROOT_PASSWORD=123456 servermysql:customImage

# for phpmyadmin container
sudo docker run -d -p 8080:80 --name phpmyadminMysqlServerDB --network mysqlDB-network --link mysqlServerDB:db phpmyadmin

# Create User with global privilage
# Create Some predefined db
# import database from specific path