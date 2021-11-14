Copyright (c) 2016, 2021, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > connect shridhar@localhost:3306
ERROR: Not connected.
           -> ^C
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC1..Ability to create a payroll service database
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx		   
		   
 MySQL  SQL > \connect shridhar@localhost:3306
Creating a session to 'shridhar@localhost:3306'
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 21
Server version: 8.0.27 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > show databases;
+----------------------+
| Database             |
+----------------------+
| address_bookservices |
| addressbookservice   |
| database_name        |
| demo                 |
| dta                  |
| information_schema   |
| my_data              |
| my_database          |
| mysql                |
| performance_schema   |
| sys                  |
+----------------------+
11 rows in set (0.0015 sec)
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE payrollservice;
Query OK, 1 row affected (0.3381 sec)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC2..Ability to create a employee payroll table
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE payrollservice;
Query OK, 1 row affected (0.3381 sec)
 MySQL  localhost:3306 ssl  SQL > USE payrollservice;
Default schema set to `payrollservice`.
Fetching table and column names from `payrollservice` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  payrollservice  SQL > CREATE TABLE employee_payroll (
                                               -> id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                               -> name VARCHAR(30) NOT NULL,
                                               -> salary DOUBLE NOT NULL,
                                               -> start DATE NOT NULL,
                                               -> PRIMARY KEY (id) );
Query OK, 0 rows affected (2.5482 sec)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC3..INSERT DATA INTO employee_payroll
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Query OK, 0 rows affected (2.5482 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > INSERT INTO employee_payroll (name,salary,start)
                                               -> values  ('Prashant', 60000.0, '2021-01-10'),
                                               -> ('sonali', 40000.0, '2021-04-10'),
                                               -> ('pratik', 55000.0, '2020-02-20'),
                                               -> ('Akash', 70000.0, '2020-10-10');
Query OK, 4 rows affected (0.2839 sec)

Records: 4  Duplicates: 0  Warnings: 0

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC4..retrieve  the  payroll data
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Prashant |  60000 | 2021-01-10 |
|  2 | sonali   |  40000 | 2021-04-10 |
|  3 | pratik   |  55000 | 2020-02-20 |
|  4 | Akash    |  70000 | 2020-10-10 |
+----+----------+--------+------------+
4 rows in set (0.0009 sec)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC5.. Ability to retrieve salary data for a particular employee
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll where name = 'prashant';
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Prashant |  60000 | 2021-01-10 |
+----+----------+--------+------------+
1 row in set (0.0010 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll where salary=70000;
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  4 | Akash |  70000 | 2020-10-10 |
+----+-------+--------+------------+
1 row in set (0.0008 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >  SELECT * FROM employee_payroll WHERE START  BETWEEN CAST('2021-04-10' AS DATE) AND DATE (NOW());
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  2 | sonali |  40000 | 2021-04-10 |
+----+--------+--------+------------+
1 row in set (0.0559 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC6..Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

 MySQL  localhost:3306 ssl  payrollservice  SQL > desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(30)  | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.0811 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll ;
+----+----------+--------+------------+--------+
| id | name     | salary | start      | gender |
+----+----------+--------+------------+--------+
|  1 | Prashant |  60000 | 2021-01-10 | NULL   |
|  2 | sonali   |  40000 | 2021-04-10 | NULL   |
|  3 | pratik   |  55000 | 2020-02-20 | NULL   |
|  4 | Akash    |  70000 | 2020-10-10 | NULL   |
+----+----------+--------+------------+--------+
4 rows in set (0.0329 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =1;
Query OK, 1 row affected (0.1273 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'F' WHERE id =2;
Query OK, 1 row affected (0.1479 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =3;
Query OK, 1 row affected (0.1233 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =4;
Query OK, 1 row affected (0.0639 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+
| id | name     | salary | start      | gender |
+----+----------+--------+------------+--------+
|  1 | Prashant |  60000 | 2021-01-10 | M      |
|  2 | sonali   |  40000 | 2021-04-10 | F      |
|  3 | pratik   |  55000 | 2020-02-20 | M      |
|  4 | Akash    |  70000 | 2020-10-10 | M      |
+----+----------+--------+------------+--------+
4 rows in set (0.0008 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >
 
 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 //UC7..Ability to find sum, average, min, max and number of male and female employees
 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 
  MySQL  localhost:3306 ssl  payrollservice  SQL >  select gender,sum(salary) from employee_payroll;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |      225000 |
+--------+-------------+
1 row in set (0.0423 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,min(salary) from employee_payroll;
+--------+-------------+
| gender | min(salary) |
+--------+-------------+
| M      |       40000 |
+--------+-------------+
1 row in set (0.0236 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,max(salary) from employee_payroll;
+--------+-------------+
| gender | max(salary) |
+--------+-------------+
| M      |       70000 |
+--------+-------------+
1 row in set (0.0009 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,Avg(salary) from employee_payroll;
+--------+-------------+
| gender | Avg(salary) |
+--------+-------------+
| M      |       56250 |
+--------+-------------+
1 row in set (0.0006 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,sum(salary) from employee_payroll Where gender = 'M' group by gender;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |      170000 |
+--------+-------------+
1 row in set (0.0007 sec)

 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 //UC8 Extend employee_payroll data to store employee information like employee phone, address and department. 
 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 
  MySQL  localhost:3306 ssl  payrollservice  SQL > alter table employee_payroll add phone varchar(15) ,add address varchar(20) default 'address1',add department varchar(20) not null;
Query OK, 0 rows affected (0.4367 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > desc employee_payroll;
+------------+--------------+------+-----+----------+----------------+
| Field      | Type         | Null | Key | Default  | Extra          |
+------------+--------------+------+-----+----------+----------------+
| id         | int unsigned | NO   | PRI | NULL     | auto_increment |
| name       | varchar(30)  | NO   |     | NULL     |                |
| salary     | double       | NO   |     | NULL     |                |
| start      | date         | NO   |     | NULL     |                |
| gender     | char(1)      | YES  |     | NULL     |                |
| phone      | varchar(15)  | YES  |     | NULL     |                |
| address    | varchar(20)  | YES  |     | address1 |                |
| department | varchar(20)  | NO   |     | NULL     |                |
+------------+--------------+------+-----+----------+----------------+
8 rows in set (0.1100 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+
| id | name     | salary | start      | gender | phone | address  | department |
+----+----------+--------+------------+--------+-------+----------+------------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |
|  2 | sonali   |  40000 | 2021-04-10 | M      | NULL  | address1 |            |
|  3 | pratik   |  55000 | 2020-02-20 | F      | NULL  | address1 |            |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 |            |
+----+----------+--------+------------+--------+-------+----------+------------+
4 rows in set (0.0365 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >  UPDATE employee_payroll
                                               -> SET  department = 'Finance' WHERE name IN ('akash' , 'preeti');
Query OK, 1 row affected (0.1603 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+
| id | name     | salary | start      | gender | phone | address  | department |
+----+----------+--------+------------+--------+-------+----------+------------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |
|  2 | sonali   |  40000 | 2021-04-10 | M      | NULL  | address1 |            |
|  3 | pratik   |  55000 | 2020-02-20 | F      | NULL  | address1 |            |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 | Finance    |
+----+----------+--------+------------+--------+-------+----------+------------+
4 rows in set (0.0007 sec)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//UC9 Ability to extendemployee_payroll tableto have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

 MySQL  localhost:3306 ssl  payrollservice  SQL >  alter table employee_payroll
                                               ->  add basic_pay int,
                                               ->  add deductions int,
                                               ->  add taxable_pay int  ,
                                               ->  add tax int,
                                               ->  	
Query OK, 0 rows affected (2.4271 sec)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
UC10//Ability to make Terissa as part of Sales and Marketing Department
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
 MySQL  localhost:3306 ssl  payrollservice  SQL > insert into employee_payroll
                                               -> (name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start,salary) values
                                               -> ('Terissa',' Finance','F',4000000,2000000,1000000,300000,2000000,'2021-08-06',19000);
Query OK, 1 row affected (0.1111 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > insert into employee_payroll
                                               -> (name,department,gender,basic_pay ,deductions,taxable_pay,tax,net_pay,start,salary) values
                                               -> ('Terissa','Sales','F',4000000,0,0,0,0,'2021-06-03',89999);
Query OK, 1 row affected (0.1056 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
| id | name     | salary | start      | gender | phone | address  | department | basic_pay | deductions | taxable_pay | tax    | net_pay |
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |      NULL |       NULL |        NULL |   NULL |    NULL |
|  2 | sonali   |  40000 | 2021-04-10 | M      | NULL  | address1 |            |      NULL |       NULL |        NULL |   NULL |    NULL |
|  3 | pratik   |  55000 | 2020-02-20 | F      | NULL  | address1 |            |      NULL |       NULL |        NULL |   NULL |    NULL |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 | Finance    |      NULL |       NULL |        NULL |   NULL |    NULL |
|  5 | Terissa  |  19000 | 2021-08-06 | F      | NULL  | address1 |  Finance   |   4000000 |    2000000 |     1000000 | 300000 | 2000000 |
|  6 | Terissa  |  89999 | 2021-06-03 | F      | NULL  | address1 | Sales      |   4000000 |          0 |           0 |      0 |       0 |
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
6 rows in set (0.0009 sec)