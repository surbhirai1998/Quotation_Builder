create database BlueBanyanQuotation;
use BlueBanyanQuotation;

create table BBAdmin(
id int AUTO_INCREMENT,
admin_name varchar(50),
user_name varchar(50) unique,
password varchar(300),
primary key(id)
);

create table Client(
c_id int AUTO_INCREMENT,
company_name varchar(50) not null,
client_name varchar(50) not null,
email varchar(50) not null unique,
contact_number varchar(50) not null,
city varchar(50) not null,
state varchar(50),
country varchar(50),
primary key(c_id)
);


CREATE TABLE Projects(
p_id int AUTO_INCREMENT,
project_name varchar(100) not null,
c_id int,
term  varchar(10) not null,
sender_name varchar(50),	
extra_note varchar(700),
primary key(p_id),
constraint pfk foreign key(c_id) references  Client(c_id) 
);

create table MainService(
m_id int AUTO_INCREMENT,
p_id int,
main_service varchar(100) not null,
fees int(10) not null,
primary key(m_id),
constraint mfk foreign key(p_id) references  Projects(p_id) 
);

create table subServices(
s_id int AUTO_INCREMENT,
m_id int,
description varchar(200),
primary key(s_id),
constraint sfk foreign key(m_id) references MainService(m_id)
);

create table original_mainServices(
 m_id int AUTO_INCREMENT,
mainService varchar(100),
primary key(m_id)
 );
 
create table original_subservices(
 s_id int AUTO_INCREMENT,
 m_id int,
subService varchar(200),
primary key(s_id),
 constraint osfk foreign key(m_id) references  original_mainServices(m_id) 
 );



