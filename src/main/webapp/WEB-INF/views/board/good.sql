
show tables;

create table good (
	idx int not null auto_increment primary key, /*좋아요 고유번호*/
	part varchar(20) not null, /*어떤분야(테이블)인지*/
	partIdx int not null, /*그 분야(테이블)의 고유번호*/
	mid varchar(20) not null, /*해당분야의 해당 게시글에 접속한 사용자의 아이디 */
	goodSw char(1) default 'Y' /*좋아요(Y)/좋아요해제(N)체크*/
);

desc good;

drop table good;

select * from good;
insert into good values (default,'board','3','admin',default);