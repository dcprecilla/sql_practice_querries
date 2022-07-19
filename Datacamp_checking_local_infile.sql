SHOW variables like 'local_infile';
SET GLOBAL local_infile = 1;

select * from stackoverflow;
alter table stackoverflow
add column id serial;


LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DataCamp/Exploratory Data Analysis/ev311 (1).csv'
INTO TABLE test
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
use practice;
create table test (
  id int primary key,
  priority varchar(6),
  source varchar(20),
  category varchar(64),
  date_created timestamp,
  date_completed timestamp,
  street varchar(48),
  house_num varchar(12),
  zip char(5),
  description text
);

select * from test;
drop table test;

