노트북에 대한 테이블생성
-- 노트북의 이름, 가격, cpu, ram, hdd,보증기간을 속성으로 갖게 하고싶음
-- 조건에 부합하는 테이블을 작성하는 문장
-- 하나의 기본키, 모든값은 채워넣어야 함
-- 노트북 사양이 좋아져서 128gb 짜리 ram 을 사용하게 되었음
-- 이때 ram컬럼의 용량을 변경하는 문장 작성
-- 노트북의 크기 에 대한 칼럼을 추가하는 문장작성.
-- 단위 cm, 소수점 두번째 자리까지 나타낼 것
-- 노트북에는 앞으로 hdd대신에 sdd가 장착됨
-- 보증기간 컬럼을 삭제하는 문장 작성
-- 노트북 가격이 800000~2300000 사이의 값만 들어갈 수 있게끔 해당 컬럼을 변경하는 문장 작성
-- 테이블 내의 컬럼만 전체 삭제
-- 만든 테이블을 완전히 삭제하는 문장 작성.
-- 노트북 name 을 외래키로 두며 속성은 매장명,지역 인 노트북 매장 하나 만들기



직업 훈련소가있다 훈련소넘버, 훈련소건축비용, 훈련소이름, 지역, 직업,
직업에 회귀자가 새로 생겼다
훈련소 컬럼에 컬러가 새로 생겼다.
직업 칼럼 명이 전직 칼럼명으로 바뀌었다.
컬러 칼럼이 다시 삭제되었다.
훈련소 건축비용이 5000~10000 사이의 값만 들어갈수 있게 컬럼 변경해야한다.
훈련소 직업 을 외래키로 두며 속성은 직업,캐릭터명,생성날짜,power,잠재power,인 캐릭터 테이블 만들기

create table gym(
g_game varchar2(30 char) default '재미난게임',
g_no number(5) not null,
g_price number(10) not null,
g_name varchar2(20 char) not null,
g_location varchar2(30 char) not null,
g_class varchar2(30 char)primary key
); 

alter table gym modify g_class varchar2(30char)'회귀자';
alter table gym add collor varchar2(30 char);
alter table gym rename column g_class to g_upgrade;
alter table gym drop collor;
alter table gym modify g_price constraint re_price check(g_price between 3000 and 5000);



create sequence gym_seq;

insert into gym values(default,gym_seq.nextval,4000,'인력사무소','성남','환술사');
insert into gym values(default,gym_seq.nextval,4000,'인력사무소','전주','검사');
insert into gym values(default,gym_seq.nextval,4000,'인력사무소','모란','궁수');
insert into gym values(default,gym_seq.nextval,4000,'인력사무소','울산','흑마법사');


create table person (
s_class varchar2(30 char) not null,
s_name varchar2(30 char) primary key,
s_date date not null,
s_power number(10) not null,
s_power2 number(10) not null,
	constraint class foreign key(s_class)
	references gym(g_class)
	on delete cascade 
);

insert into person values('환술사','다니봇',sysdate,5000,1000);
insert into person values('검사','요셉봇',sysdate,3000,1000);
insert into person values('궁수','병준봇',sysdate,4000,1000);
insert into person values('흑마법사','세니봇',sysdate,2000,1000);
insert into person values('환술사','수정봇',sysdate,1000,1000);
insert into person values('검사','승유봇',sysdate,5500,10);
insert into person values('흑마법사','소연봇',sysdate,1200,1000);
insert into person values('검사','송아봇',sysdate,2000,800);
insert into person values('궁수','두희봇',sysdate,300,40);

select to_char(s_date,'YYYY.MM.DD  HH24:MI') as 투차 from person;
select s_power,s_power2, s_power+s_power2 as soms from person;
select to_date('19900331021024','YYYYMMDDHH24MISS') from dual;


select * from tab;

select * from gym;
select * from person;

turncate table gym;
turncate table person;

drop table gym cascade constraint purge;
drop table person cascade constraint purge;