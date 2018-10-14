drop database book;
create database book;
use book;

#管理员表
#id 管理员编号 管理员名字 管理员密码 注册时间 最后登录日期 标记
create table admin(
  id int(11),
  ano varchar(50),
  aname varchar(50) not null,
  password varchar(50),
  cdate date,
  udate date,
  yn int,
  primary key (id)
);
--管理员
insert into admin(id,ano,aname,password,cdate,udate,yn) values (1,1,'root','admin','2018-04-04','2018-05-04',1);

#图书详情表book
#id 图书详情编号 图书名称 tid tname 作者 价格 brief total remain 创建时间 更新时间 yn
create table book(
  id int(11),
  bno varchar(50),
  bname varchar(100),
  tid int(11),
  tname varchar(50),
  author varchar(50),
  price decimal(38,30),
  brief varchar(50),
  total int(11),
  remain int(11),
  cdate date,
  udate date,
  yn int(11),
  primary key (id)
);
INSERT INTO book(id,bno,bname,author,brief) VALUES(1,'root','西游记','吴承恩','名著阅读快进来');
INSERT INTO book(id,bno,bname,author,brief) VALUES(2,'01','02','03','04');
INSERT INTO book(id,bno,bname,tname,author,price,brief,total,cdate,yn) VALUES(3,'008','水浒传','名著','施耐庵','99.98','名著阅读快进来','200','2018-09-09','1');
INSERT INTO book(id,bno,bname,tname,author,price,brief,total,cdate) VALUES(4,'4','水浒传','名著','施耐庵','99.98','名著阅读快进来','200','2018-09-09');
INSERT INTO book(id,bno,bname,tname,author,price,brief,total,cdate) VALUES(5,'5','水浒传','名著','施耐庵','99','名著阅读快进来','200','2018-09-09');

#借书详情表
#
create table bookstudent(
	id int(11),
	bid int(11),
	bno varchar(50),
	bname varchar(50),
	sid int(11),
	sno varchar(50),
	sname varchar(50),
	author varchar(50),
	price varchar(50),
	bdate date,
	rdate date,
	cdate date,
	udate date,
	yn int(11),
	primary key (id)
);


#图书类别表
#类
create table booktype(
  id int(11),
  tname varchar(50),
  cdate date,
  udate date,
  yn int(11),
  primary key (id)
);
-- insert into booktype values (1,'名著','古代名著流传');


create table setting(
  id int(11),
  name varchar(50),
  value int(11),
  cdate date,
  udate date,
  yn int(11),
  primary key (id)
);


#用户表
#
create table user(
  id int(11) not null,
  sno varchar(50),
  sname varchar(50),
  password varchar(50),
  passwordNew varchar(50),
  cdate date,
  udate date,
  yn int(11),
  primary key (id)
);
insert into user(id,sname,password,cdate,udate) values (1,'xiaowang','123','2018-02-01','2018-12-01');











































