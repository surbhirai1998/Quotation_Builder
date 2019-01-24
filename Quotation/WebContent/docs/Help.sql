
 create table BBAdmin(
 id number primary key,
 admin_name varchar2(50),
 user_name varchar2(50) not null,
 password varchar2(50)
 );

create table Client(
c_id number primary key,
company_name varchar2(50) not null,
client_name varchar2(50) not null unique,
email varchar2(50) not null,
contact_number varchar2(50) not null,
city varchar2(50) not null,
state varchar2(50),
country varchar2(50)
);
CREATE TABLE Projects(
p_id number PRIMARY KEY,
project_name varchar2(100) not null unique,
c_id number,
term  varchar(10) not null,
sender_name varchar2(50),	
extra_note varchar2(700),
constraint pfk foreign key(c_id) references  Client(c_id) 
);

create table MainService(
m_id number primary key,
p_id number,
main_service varchar2(100) not null,
fees number(10) not null,
constraint mfk foreign key(p_id) references  Projects(p_id) 
);

create table subServices(
s_id number primary key,
m_id number,
description varchar2(200),
constraint sfk foreign key(m_id) references MainService(m_id)
);

-----------------------------------------------------------------------------------------------
insert into Client(
c_id,company_name,client_name ,email ,contact_number,city,state,country
)values(
(select nvl(max(c_id),0)+1 from Client),
'CN1','head1','cn1@gmail.com','1111111111','Raipur','',''
);
insert into Client(
c_id,company_name,client_name ,email ,contact_number,city,state,country
)values(
(select nvl(max(c_id),0)+1 from Client),
'CN2','head2','cn2@gmail.com','2111111111','Nagpur','Maharashtra','India'
);
 select * from client order by c_id asc;
 delete from Client where c_id=?;
 select * from Client where c_id=?;
 update Client set company_name=?,client_name =?,email =?,contact_number=?,city=?,state=?,country=? where c_id=?;
 
 ---------------------------------------------------------------------------------
 select * from Projects;
 select * from MainService;
 select * from subServices;
 ----------------------------------------------------------------------------------
 insert into Projects(
 p_id,project_name,c_id,term
 ) values(
 (select nvl(max(p_id),0)+1 from Projects),'proj1',1,'10-10-2018'
 );
 
 insert into MainService(m_id,p_id,main_service,fees
 )values(
 (select nvl(max(m_id),0)+1 from MainService),1,'web-development',3000
 );
 insert into MainService(m_id,p_id,main_service,fees
 )values(
 (select nvl(max(m_id),0)+1 from MainService),1,'app-development',2000
 );
 
 insert into subServices(s_id,m_id,description
 )values(
 (select nvl(max(s_id),0)+1 from subServices),1,'mobile friendly'
 );
 
  insert into subServices(s_id,m_id,description
 )values(
 (select nvl(max(s_id),0)+1 from subServices),1,'google analytics'
 );
 
   insert into subServices(s_id,m_id,description
  )values(
  (select nvl(max(s_id),0)+1 from subServices),2,'user friendly'
 );
 
 
 ------------------------------------------------------------------------------
 select * from mainservice where p_id=1;
 select * from subServices where m_id=1;
 
select * from subServices where m_id in (select m_id from mainservice where p_id=1);
 
select description from subServices where m_id in (select m_id from mainservice where p_id=1); 
 
select description from subServices where
m_id in (select m_id from mainservice where
p_id in (select p_id from Client where c_id=1)); 

select main_service from mainservice where
p_id in (select p_id from Client where c_id=1);

---------------------------------------------------------------
select m_id from mainService where p_id=1;
select main_service from mainservice where m_id=1;
select description from subServices where m_id=1;

-------------------------------------------------------------------
insert into MainService(m_id,p_id,main_service,fees
 )values(
 (select nvl(max(m_id),0)+1 from MainService),8,'Online Examination Portal',15000
 );
 
 insert into subServices(s_id,m_id,description
  )values(
  (select nvl(max(s_id),0)+1 from subServices),14,'Free Fb Advert Credits Rs.1000/-'
 );
------------------------------------------------------------------------------------
  alter table subservices
 modify description varchar(200);
  alter table projects
 add extra_note varchar(700);
  alter table projects
 modify extra_note varchar(700);
 
 
 -------------------------------------------------------------------------------
 create table original_mainServices(
 m_id number primary key,
mainService varchar2(100)
 );
 
 create table original_subservices(
 s_id number primary key,
 m_id number,
subService varchar2(200),
 constraint osfk foreign key(m_id) references  original_mainServices(m_id) 
 );
 -----------------------------------------------------------------------------
 
insert into original_mainServices(m_id,mainService)values((select nvl(max(m_id),0)+1 from original_mainServices),'Website Design and Development');
 
 
 alter table client drop column sender_name;
 alter table projects drop column extra_note;
  alter table projects
  add sender_name varchar(50);
  
  alter table projects
  add extra_note varchar(700);
  
   update projects set extra_note='this is extra note' where p_id=10;
   update projects set sender_name='Bipul Gupta';
  
 
 
 
 
 
 
 