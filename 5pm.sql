CREATE DATABASE 5pm
show databases
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo               |
| dummy              |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sample             |
| sys                |
| world              |
+--------------------+
10 rows in set (0.00 sec)

USE 5pm
show table;
mysql> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| empl             |
| emplo            |
| employee         |
| unit             |
+------------------+
4 rows in set (0.01 sec)


CREATE TABLE employee(
eid int,
ename VARCHAR(32),
esal float,
eloc VARCHAR(32)
);

INSERT INTO employee(eid,ename,esal,eloc)VALUES
(
101,'Karthick',50000.00,'Sivagangai'
);

 select * from employee;
mysql>  select * from employee;
+------+----------+-------+------------+
| eid  | ename    | esal  | eloc       |
+------+----------+-------+------------+
|  101 | Karthick | 50000 | Sivagangai |
|  102 | Sudan    | 45000 | Kovai      |
+------+----------+-------+------------+
2 rows in set (0.00 sec)

 INSERT INTO employee VALUES(102,'Sudan',45000.00,'Kovai');

PRIMARY Key:
============
 USE demo;
 CREATE TABLE employ(
 eid INT,
 ename VARCHAR(32) unique,
 esal float,
 eloc VARCHAR(32) DEFAULT 'Bangalore',
 eage INT check(eage > 20),
 PRIMARY KEY(eid)
 );

 INSERT INTO employ (eid,ename,esal,eloc,eage)VALUES
 (
 101,'Arun',45000.00,'Kovai',34
 );

 INSERT INTO employ VALUES(102,'Karan',56000.00,'Ram',35);
  INSERT INTO employ VALUES(103,'Kanna',46000.00,'UK',28);

  USE sample;
CREATE TABLE unit(
unitid INT,
uname VARCHAR(32) unique,
uloc VARCHAR(32) unique,
PRIMARY KEY(unitid));

DESC unit;
mysql> desc unit;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| unitid | int         | NO   | PRI | NULL    |       |
| uname  | varchar(32) | YES  | UNI | NULL    |       |
| uloc   | varchar(32) | YES  | UNI | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

INSERT INTO unit(unitid,uname,uloc)VALUES
(101,'Saran','Karnatka'
);
UPDATE unit SET uname='ATT' WHERE unitid=101;
UPDATE unit SET uloc='chennai' WHERE unitid=101;
INSERT INTO unit VALUES(102,'vodaphone','Bangalore');
INSERT INTO unit VALUES(103,'City bank','Pune');
INSERT INTO unit VALUES(104,'Colt','Mumbay');

mysql> select * from unit;
+--------+-----------+-----------+
| unitid | uname     | uloc      |
+--------+-----------+-----------+
|    101 | ATT       | chennai   |
|    102 | vodaphone | Bangalore |
|    103 | City bank | Pune      |
|    104 | Colt      | Mumbay    |
+--------+-----------+-----------+
4 rows in set (0.01 sec)


FOREIGN key:
============
CREATE TABLE empl(
eid INT PRIMARY key,
ename VARCHAR(32),
esal FLOAT,
unitid INT,
FOREIGN KEY(unitid) REFERENCES UNIT(unitid));

DESC empl;
mysql> DESC empl;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| eid    | int         | NO   | PRI | NULL    |       |
| ename  | varchar(32) | YES  |     | NULL    |       |
| esal   | float       | YES  |     | NULL    |       |
| unitid | int         | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

INSERT INTO empl VALUES
(1,'Ashok',46000.00,101),
(2,'karan',60000.00,101),
(3,'Saran',40000.00,101),
(4,'Arun',50000.00,102),
(5,'Hari',30000.00,102),
(6,'kumar',36000.00,101),
(7,'Deepak',76000.00,103);

mysql> select * from empl;
+-----+--------+-------+--------+
| eid | ename  | esal  | unitid |
+-----+--------+-------+--------+
|   1 | Ashok  | 46000 |    101 |
|   2 | karan  | 60000 |    101 |
|   3 | Saran  | 40000 |    101 |
|   4 | Arun   | 50000 |    102 |
|   5 | Hari   | 30000 |    102 |
|   6 | kumar  | 36000 |    101 |
|   7 | Deepak | 76000 |    103 |
+-----+--------+-------+--------+
7 rows in set (0.00 sec)

Auto_Increment:
===============
USE demo;

CREATE TABLE USER(
uid INT AUTO_INCREMENT,
uname VARCHAR(32),
uloc VARCHAR(32),
PRIMARY KEY(uid));

DESC user;
mysql> desc user;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| uid   | int         | NO   | PRI | NULL    | auto_increment |
| uname | varchar(32) | YES  |     | NULL    |                |
| uloc  | varchar(32) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

INSERT INTO USER (uname,uloc)VALUES
('rahul','vayanad'),
('Modi','Delhi'),
('arul','Pakisthan'),
('kesavn','asam');

SELECT * FROM USER;
mysql> select * from user;
+-----+--------+-----------+
| uid | uname  | uloc      |
+-----+--------+-----------+
|   1 | rahul  | vayanad   |
|   2 | Modi   | Delhi     |
|   3 | arul   | Pakisthan |
|   4 | kesavn | asam      |
+-----+--------+-----------+
4 rows in set (0.00 sec)

INSERT INTO USER(uname,uloc) VALUES('Arun','Kerala');

NULL
=====
CREATE TABLE employee(
eid int,
ename VARCHAR(32),
esal float,
eloc VARCHAR(32),
eage int);

mysql> desc employee;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | YES  |     | NULL    |       |
| ename | varchar(32) | YES  |     | NULL    |       |
| esal  | float       | YES  |     | NULL    |       |
| eloc  | varchar(32) | YES  |     | NULL    |       |
| eage  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.19 sec)

mysql> insert into employee(ename)values("Karthi"),("Rajesh"),("Satheesh"),("Mahesh");

mysql> select * from employee;
+------+----------+------+------+------+
| eid  | ename    | esal | eloc | eage |
+------+----------+------+------+------+
| NULL | Karthi   | NULL | NULL | NULL |
| NULL | Rajesh   | NULL | NULL | NULL |
| NULL | Satheesh | NULL | NULL | NULL |
| NULL | Mahesh   | NULL | NULL | NULL |
+------+----------+------+------+------+
4 rows in set (0.10 sec)

NOT NULL 
========
CREATE TABLE employe(
eid INT NOT NULL,
ename VARCHAR (32) NOT NULL,
esal FLOAT,
eloc VARCHAR(32) NOT NULL,
eage INT);

mysql> desc employe;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | NO   |     | NULL    |       |
| ename | varchar(32) | NO   |     | NULL    |       |
| esal  | float       | YES  |     | NULL    |       |
| eloc  | varchar(32) | NO   |     | NULL    |       |
| eage  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

INSERT INTO employe VALUES
(101,'Kanna',46000.00,'UK',32),
(102,'Karan',56000.00,'avp',38),
(103,'Ananth',66000.00,'slg',35),
(104,'Ashok',48000.00,'Svg',25),
(105,'Naveen',96000.00,'kovai',28);
mysql> select * from employe;
+-----+--------+-------+-------+------+
| eid | ename  | esal  | eloc  | eage |
+-----+--------+-------+-------+------+
| 101 | Kanna  | 46000 | UK    |   32 |
| 102 | Karan  | 56000 | avp   |   38 |
| 103 | Ananth | 66000 | slg   |   35 |
| 104 | Ashok  | 48000 | Svg   |   25 |
| 105 | Naveen | 96000 | kovai |   28 |
+-----+--------+-------+-------+------+
5 rows in set (0.00 sec)

INSERT INTO employe(ename,esal) VALUES(("Krish",85000.00));

UNIQUE 
======
CREATE TABLE employe(
eid INT NOT NULL,
ename VARCHAR (32) UNIQUE,
esal FLOAT,
eloc VARCHAR(32) NOT NULL,
eage INT);

mysql> desc employe;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | NO   |     | NULL    |       |
| ename | varchar(32) | YES  | UNI | NULL    |       |
| esal  | float       | YES  |     | NULL    |       |
| eloc  | varchar(32) | NO   |     | NULL    |       |
| eage  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

INSERT INTO employe VALUES
(101,'Kanna',46000.00,'UK',32),
(102,'Kanna',56000.00,'avp',38);
mysql> INSERT INTO employe VALUES
    -> (101,'Kanna',46000.00,'UK',32),
    -> (102,'Kanna',56000.00,'avp',38);
ERROR 1062 (23000): Duplicate entry 'Kanna' for key 'employe.ename'

CHECK 
======
CREATE TABLE employe(
eid INT NOT NULL,
ename VARCHAR (32) UNIQUE,
esal FLOAT,
eloc VARCHAR(32) NOT NULL,
eage INT CHECK (eage>18));

mysql> desc employe;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | NO   |     | NULL    |       |
| ename | varchar(32) | YES  | UNI | NULL    |       |
| esal  | float       | YES  |     | NULL    |       |
| eloc  | varchar(32) | NO   |     | NULL    |       |
| eage  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

INSERT INTO employe VALUES
(101,'Kanna',46000.00,'UK',15);
mysql> INSERT INTO employe VALUES
    -> (101,'Kanna',46000.00,'UK',15);
ERROR 3819 (HY000): Check constraint 'employe_chk_1' is violated.

mysql> INSERT INTO employe VALUES
    -> (101,'Kanna',46000.00,'UK',25);
Query OK, 1 row affected (0.13 sec)
mysql> select * from employe;
+-----+-------+-------+------+------+
| eid | ename | esal  | eloc | eage |
+-----+-------+-------+------+------+
| 101 | Kanna | 46000 | UK   |   25 |
+-----+-------+-------+------+------+
1 row in set (0.00 sec)

DEFAULT 
=======
CREATE TABLE employe(
eid INT NOT NULL,
ename VARCHAR (32) UNIQUE,
esal FLOAT,
eloc VARCHAR(32) DEFAULT 'Bangalore',
eage INT CHECK (eage>18));

mysql> desc employe;
+-------+-------------+------+-----+-----------+-------+
| Field | Type        | Null | Key | Default   | Extra |
+-------+-------------+------+-----+-----------+-------+
| eid   | int         | NO   |     | NULL      |       |
| ename | varchar(32) | YES  | UNI | NULL      |       |
| esal  | float       | YES  |     | NULL      |       |
| eloc  | varchar(32) | YES  |     | Bangalore |       |
| eage  | int         | YES  |     | NULL      |       |
+-------+-------------+------+-----+-----------+-------+
5 rows in set (0.01 sec)

INSERT INTO employe VALUES
(101,'Kanna',46000.00,'UK',25);
INSERT INTO employe(eid,ename,esal,eage) VALUES
(102,'Karan',46000.00,25);

mysql> select * from employe;
+-----+-------+-------+-----------+------+
| eid | ename | esal  | eloc      | eage |
+-----+-------+-------+-----------+------+
| 101 | Kanna | 46000 | UK        |   25 |
| 102 | Karan | 46000 | Bangalore |   25 |
+-----+-------+-------+-----------+------+
2 rows in set (0.00 sec)