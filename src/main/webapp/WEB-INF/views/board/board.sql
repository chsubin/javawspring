show tables;

create table board2 (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  nickName  varchar(20)  not null,		/* 게시글 올린사람의 닉네임 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  email			varchar(50),							/* 글쓴이의 메일주소(회원가입시에 필수 입력처리 되어 있다.) */
  homePage  varchar(50),							/* 글쓴이의 홈페이지(블로그)주소 */
  content		text	not null,						/* 글 내용 */
  wDate			datetime	default now(),	/* 글 올린 날짜 */
  hostIp		varchar(50) not null,			/* 글 올린이의 접속 IP */
  readNum   int default 0,						/* 글 조회수 */
  good			int default 0,						/* '좋아요' 클릭 횟수 누적하기 */
  mid				varchar(20) not null,			/* 회원 아이디(내가 올린 게시글 전체 조회시체 사용) */
  primary key(idx)
);

desc board2;
drop table board2;

insert into board2 values (default,'관리맨','게시판 서비스를 시작합니다.','cjsk1126@naver.com','cjsk1126.tistory.com','이곳은 게시판입니다.',default,'192.168.50.20',default,default,'admin');

select * from board2;

/* 게시판에 댓글 달기 */
create table boardReply2 (
  idx		int not null auto_increment,	/* 댓글의 고유번호 */
  boardIdx int not null,							/* 원본글의 고유번호(외래키로 지정) */
  mid			 varchar(20) not null,			/* 댓글 올린이의 아이디 */
  nickName varchar(20) not null,			/* 댓글 올린이의 닉네임 */
  wDate		 datetime default now(),		/* 댓글 올린 날짜 */
  hostIp	 varchar(50) not null,			/* 댓글올린 PC의 IP */
  content  text not null,							/* 댓글 내용 */
  level int not null default 0, 	/*댓글 레벨- 첫번째 댓글(부모댓글)의 레벨은 0번*/
  levelOrder int not null default 0, /*댓글의 순서 - 첫번째 댓글(부모댓글)의 levelOrder는 0번*/
  primary key(idx),
  foreign key(boardIdx) references board2(idx)
  /* on update cascade */
  /* on delete restrict */
);
desc boardReply2;
drop table boardReply2;
select max(levelOrder) from boardReply2;
delete from boardReply2;


/* 날짜함수 처리 연습 */
select now();		-- now() : 오늘 '날짜와 시간'을 보여준다.
select year(now());		-- year() : '년도' 출력
select month(now());		-- month() : '월' 출력
select day(now());		-- day() : '일' 출력
select date(now());   -- date(now()) : 년-월-일
select weekday(now()); -- 요일 : 0(월), 1(화), 2(수), 3(목), 4(금), 5(토), 6(일)
select dayofweek(now());-- 요일 : 1(일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토)
select hour(now());		-- hour() : 시간
select minute(now());		-- minute() : 분
select second(now());		-- second() : 초

select year('2022-12-1');
select idx, year(wDate) from board2;
select idx, day(wDate) as 날짜 from board2;
select idx, wDate,weekday(wDate) from board2;

/* 날짜 연산 */
-- date_add(date, interval 값 type)
select date_add(now(), interval 1 day);		-- 오늘날짜보다 +1일 출력
select date_add(now(), interval -1 day);		-- 오늘날짜보다 -1일 출력
select date_add(now(), interval 10 day_hour);		-- 오늘날짜보다 +10시간 출력
select date_add(now(), interval -10 day_hour);		-- 오늘날짜보다 -10시간 출력

-- date_sub(date, interval 값 type)
select date_sub(now(), interval 1 day);		-- 오늘날짜보다 -1일 출력
select date_sub(now(), interval -1 day);		-- 오늘날짜보다 +1일 출력

select idx, wDate from board2;
-- date_format(날짜, '양식기호')
-- 년도(2자리):%y, 년도(4자리):%Y, 월:%m, 월(영문):%M, 일:%d, 시(12시간제):%h, 시(24시간제):%H, 분:%i, 초:%s
select idx, date_format(wDate, '%y-%M-%d') from board2;	-- %M 월을 영문출력
select idx, date_format(wDate, '%y-%m-%d') from board2;  -- %m 월을 숫자출력
select idx, date_format(wDate, '%Y-%m-%d') from board2;  -- %m 월을 숫자출력
select idx, date_format(wDate, '%h-%i-%s') from board2;
select idx, date_format(wDate, '%H-%i-%s') from board2;

-- 현재부터 한달전의 날짜
select date_add(now(), interval -1 month);

-- 하루전 체크
select date_add(now(), interval -1 day);
select date_add(now(), interval -1 day), wDate from board2;

-- 날짜차이 계산 : DATEDIFF(시작날짜, 마지막날짜)
select datediff('2022-11-30', '2022-12-01');
select datediff(now(), '2022-11-30');
select idx, wDate, datediff(now(), wDate) from board2;
select idx, wDate, datediff(now(), wDate) as day_diff from board2;
select *, datediff(now(), wDate) as day_diff from board2;

select timestampdiff(hour, now(), '2022-11-30');
select timestampdiff(hour, '2022-11-30', now());
select timestampdiff(hour, wDate, now()) from board2;
select *,timestampdiff(hour, wDate, now()) as hour_diff from board2;
select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board2;

select date(now());SELECT TIMESTAMPDIFF(minute, date_format('2022-04-20 01:01', '%Y-%m-%d %H:%i'), date_format('2022-12-31 23:59', '%Y-%m-%d %H:%i')) AS time_diff;
SELECT TIMESTAMPDIFF(hour, date_format('2022-11-30 13:01', '%Y-%m-%d %H:%i'), date_format(now(), '%Y-%m-%d %H:%i')) AS time_diff;
SELECT *,TIMESTAMPDIFF(hour, date_format(wDate, '%Y-%m-%d %H:%i'), date_format(now(), '%Y-%m-%d %H:%i')) AS time_diff from board2;		-- date() : 일 출력


/*  이전글 다음글 체크 */
select * from board2 where idx < 5 order by idx desc limit 1;
select * from board2 where idx > 5 limit 1;


/* 댓글의 수를 전체 List에 출력하기 연습 */
select * from boardReply2 order by idx desc;
-- 댓글테이블(boardReply2)에서 board2테이블의 고유번호 35번글에 딸려있는 댓글의 개수는?
select count(*) from boardReply2 where board2Idx = 35;
-- 댓글테이블(boardReply2)에서 board2테이블의 고유번호 35번글에 딸려있는 댓글의 개수는?
-- 원본글의 고유번호와 함께 출력, 갯수의 별명은 replyCnt
select board2Idx,count(*) as replyCnt from boardReply2 where board2Idx = 35;

-- 댓글테이블(boardReply2)에서 board2테이블의 고유번호 35번글에 딸려있는 댓글의 개수는?
-- 원본글의 고유번호와 함께 출력, 갯수의 별명은 replyCnt
-- 이때 원본글을 쓴 닉네임을 함께 출력하시오. 단, 닉네임은 board2(원본글)테이블에서 가져와서 출력하시오.
select board2Idx,nickName,count(*) as replyCnt from boardReply2 where boardIdx = 35;
SELECT boardIdx,
  (SELECT nickName FROM board where idx = 35) AS nickName,
  count(*) AS replyCnt
  FROM boardReply WHERE boardIdx = 35;
  
-- 앞의 문장을 부모테이블(board)의 관점에서 보자...
SELECT mid, nickname FROM board where idx = 35;
-- 앞의 닉네임을 자식(댓글)테이블(boardReply)에서 가져와서 보여준다면????
SELECT mid, 
  (select nickName from boardReply where boardIdx=35) as nickName
  FROM board where idx = 35;
  
-- 부모관점(board)에서 고유번호 35번의 아이디와, 현재글에 달려있는 댓글의 개수???
SELECT 	mid,
  (SELECT count(*) 	FROM boardReply WHERE boardIdx=35) 
  FROM board WHERE idx=35;

-- 부모관점(board)에서 board테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력?
SELECT 	*,
  (SELECT count(*) 	FROM boardReply WHERE boardIdx=board.idx) as replyCount
  FROM board
  order by idx desc
  limit 5;
  
-- 부모관점(board)에서 board테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력?
-- 각각의 테이블에 별명을 붙여서 앞의 내용을 변경시켜보자.
SELECT 	*,
  (SELECT count(*) 	FROM boardReply WHERE boardIdx=b.idx) as replyCount
  FROM board b
  order by idx desc
  limit 5;
