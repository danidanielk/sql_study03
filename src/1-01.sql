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
-- 만든 테이블을 완전히 삭제하는 문장 작성.

create table note_book (
n_name varchar2(30 char) primary key,
n_price number(10) not null,
n_cpu varchar2(30 char) not null,
n_ram number(10) not null,
n_hdd number(10) not null,
n_day date not null
);

insert into note_book values('s500',500000,'i7',80,100,sysdate+12);

truncate table note_book;

alter table note_book modify n_ram number(10) default 125;

alter table note_book add size number (5,2);

alter table note_book rename column n_hdd to n_sdd;

alter table note_book drop n_day

alter table note_book modify n_price num(10) constraint re_price check(n_price between 800000 and 2300000);


drop table note_book cascade constraint purge;



--------------------------------선생님이한것-------------------------------
create table aug30_notebook(
n_name varchar2(10 char) not null,
n_price number(7) not null,
n_cpu varchar2(10 char) not null,
n_ram number(2) not null,
n_hdd number(4) not null,
n_warranty date not null
);

alter table aug30_notebook modify n_ram number(3);

alter table aug30_notebook add n_inch number(4,2)not null;

alter table aug30_notebook rename column n_hdd to n_sdd;

alter table aug30_notebook drop n_warranty;

alter table aug30_notebook modify n_price number(7) constraint re_price check(n_price between 800000 and 2300000);

truncate table aug30_notebook; --그냥 써봄..

drop table aug30_notebook cascade constraint purge;