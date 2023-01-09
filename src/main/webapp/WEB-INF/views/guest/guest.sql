show tables;

create table guest2 (
  idx		int not null auto_increment primary key,	
  name  varchar(20) not null,		
  email varchar(60),						
  homePage  varchar(60),					
  visitDate datetime default now(),  
  hostIp	varchar(50) not null,	
  content text not null					
);

desc guest;

insert into guest2 values (default,'������','cjsk1126@naver.com','cjsk1126.tistory.com',default,'192.168.50.20','���� ���񽺸� �����մϴ�.');

select * from guest2;
