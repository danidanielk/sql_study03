
create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null
);


--------------------DML---------------------
--------------------CRUD--------------------
--DML : Data Manipulation language 테이블에 데이터를 검색,삽입,수정,삭제 하는데 사용되는 문장.
--select ,insert, update, delete 등이 있고,
-- 줄여서 CRUD :Create read update delete 라고 한다.

--C : insert
--첫번째 방법 지정해서 넣을 수 있음
insert into 테이블명 (컬럼명) values (값)
insert into aug30_snack(s_no,s_name,s_maker,s_price) values(1,'초코파이','오리온',5000)
--컬럼 순서바꾸기 가능
insert into aug30_snack(s_name,s_price,s_no,s_maker) values('초코파이',5000,1,'롯데')
--컬럼에 값 넣지말기 not null 이 없다면 사용가능. 지정해주지 않음 컬럼에 대해서는 null 값이 들어감. 가급적 모든 값들을 다 넣어주세요
insert into aug30_snack(s_name,s_no) values('마이쪼',3);

--두번째 방법 순서대로 넣을 수 있음
insert into aug30_snack values(값)
insert into aug30_snack (1,'초코파이','오리온',5000)


-------------------------------------------------------------------------------

--테이블 지우고 테이블에 값 5개정도만 넣어봅시다--
drop table aug30_snack cascade constraint purge;

insert into aug30_snack values(1,'스니커즈','오리온',2000);
insert into aug30_snack values(2,'오감자','롯데',2500);
insert into aug30_snack values(3,'조지아','코카콜라',500);
insert into aug30_snack values(4,'목캔디','롯데',1000);
insert into aug30_snack values(5,'쿠앤쿠','오리온',1500);

--과자를 만들다가 번호를 까먹었을때 사용하는 factory pattern 공장화시스템 : 번호를 순서에 맞게 자동으로 생성 테이블과는 무관 --
--치명적인 단점 : insert 에 실패해도 sepuence 값은 무조건 올라감 띄어넘어 증가된 값을 다시 내릴 수 없다. 그럼에도 자주 사용함. 
--MySQL 에서는 Autoincrement
--OracleDB 에서는 Sequence

--심플 시퀀스 예제
create sequence 시퀀스명;  (시퀀스명은 테이블명 뒤에 _seq 를 붙여주는 문화가 있따.)
create sequence aug30_snack_seq;

--구체적인 시퀀스 예제
create sequence 시퀀스명
	increment by 1		--증가값 1씩 증가.
	start with 1		--시작값 1
	minvalue 1			--최소값
	maxvalue 999		--최대값
	nocycle / cycle		--최대값에 도달하면 시작값부터 다시 반복할지 말지.
	nocache / cache		--시퀀스를 미리 만들어 놓고 메모리에서 가져다 쓸지 말지
	noorder / order;	--요청 순서대로 값을 생성 할지 말지
	
--시퀀스 삭제
drop sequence 스퀀스명;

--시퀀스 사용방법 : 시퀀스명.nextval
create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null
);

create sequence aug30_snack_seq;

insert into aug30_snack values(aug30_snack_seq.nextval,'스니커즈','오리온',2000);
insert into aug30_snack values(aug30_snack_seq.nextval,'오감자','롯데',2500);
insert into aug30_snack values(aug30_snack_seq.nextval,'조지아','코카콜라',500);
insert into aug30_snack values(aug30_snack_seq.nextval,'목캔디','롯데',1000);
insert into aug30_snack values(aug30_snack_seq.nextval,'쿠앤쿠','오리온',1500);

drop table aug30_snack cascade constraint purge;
select s_name as name from aug30_snack
where s_maker='롯데'
order by s_no;
-- 테이블 확인하기
select * from tab;