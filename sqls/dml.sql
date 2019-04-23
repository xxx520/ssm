/*
 * create database
 * create mysql user
 * auth
 * 
 * */
create database if not exists `ops-manage` default charset utf8 COLLATE utf8_general_ci;
insert into mysql.user(Host,User,Password) values("%","opsmanage",password("123456"));
insert into mysql.user(Host,User,Password) values("localhost","opsmanage",password("123456"));
-- mysql5.6以上,不能insert 
--grant usage on `ops-manage`.* to 'opsmanage'@'%' identified by '123456' with grant option;
--grant usage on `ops-manage`.* to 'opsmanage'@'localhost' identified by '123456' with grant option;

grant all privileges on `ops-manage`.* to 'opsmanage'@'%' identified by '123456';
grant all privileges on `ops-manage`.* to 'opsmanage'@'localhost' identified by '123456';
flush privileges;
use `ops-manage`;
