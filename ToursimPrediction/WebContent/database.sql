drop sequence tourid;

CREATE SEQUENCE tourid
start with 101
increment by 1;

drop table tourism_user;

create table tourism_user(
	tourid number(5) primary key,
	fname varchar(20),
	lname varchar(20),
	emailId varchar(100),
	contact number(10),
	password varchar(10)
);

insert into tourism_user values(tourid.nextval,'Saurav','Kumar','skbk104@gmail.com',7739449005,'@Saurav09');
insert into tourism_user values(tourid.nextval,'Rahu','Kumar','raju204@gmail.com',8796449005,'12345678');

commit;

select * from tourism_user;

drop sequence spotid;

CREATE SEQUENCE spotid
start with 201
increment by 1;

drop table tourist_spot;

create table tourist_spot(
	spotid number(5) primary key,
	spotname varchar(20),
	month varchar(20),
	budget number(10)
);
delete tourist_spot;

insert into tourist_spot values(spotid.nextval,'Auli','January',2000);
insert into tourist_spot values(spotid.nextval,'Gulmarg','February',3000);
insert into tourist_spot values(spotid.nextval,'Mon','April',2550);
insert into tourist_spot values(spotid.nextval,'Srinagar','April',4000);
insert into tourist_spot values(spotid.nextval,'Ladakh','June',1600);
insert into tourist_spot values(spotid.nextval,'Kodaikanal','June',1900);
insert into tourist_spot values(spotid.nextval,'SpitiValley','August',2500);

commit;

select * from tourist_spot;

CREATE SEQUENCE contactid
start with 101
increment by 1;

drop table contactustourism;

create table contactustourism(
	contactid number(5) primary key,
	name varchar(20),
	emailId varchar(100),
	message varchar(100)
);
