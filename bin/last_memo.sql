alter 의 사용

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
alter table note_book modify n_ram number(10) default 125;
alter table note_book add size number (5,2);
alter table note_book rename column n_hdd to n_sdd;
alter table note_book drop n_day
alter table note_book modify n_price num(10) constraint re_price check(n_price between 800000 and 2300000);

truncate table note_book;

--------------------------------------------------------------------------------------------------------------
sequence 의 사용

--심플 시퀀스 예제
만들때 : create sequence 시퀀스명;  (시퀀스명은 테이블명 뒤에 _seq 를 붙여주는 문화가 있따.)
사용시 : 시퀀스명.nextval
삭제시 : drop sequence 시퀀스명;

--------------------------------------------------------------------------------------------------------------
문자,숫자,날짜,집계,null 관련 함수


1.쓸만한 문자 함수
REPLACE(s1,s2,s3)	:s1의 지정한 문자 s2를 문자 s3로 변경		ex)REPLACE('JACK and JUE','J','BL')
LENGTH(s1)			:	글자 수 세어주는 함수					ex)LENGTH('zzz')

----------

2.쓸만한 숫자 함수
ABS(숫자)				:		절대값 계산					ex)ABS(-4,5)
ROUND(숫자,m)			:	숫자 반올림,m은 반올림 기준 자릿수		ex)ROUND(5.36,1)
POWER(숫자,n)			:	숫자 n제곱값을 계산					ex)POWER(2,3)
TRUNC(숫자,m)			:	숫자의 m번째 자리까지 남기고 값을 버림	ex)TRUNC(123.456,2)
														ex)TRUNC(123.456,-1)
														ex)TRUNC(123.456,0)

----------														
													
3.날짜 함수.....
-- 날짜 형식
YYYY:		4자리 연도
YYY:		마지막 3자리
YY:			마지막 2자리
Y:			마지막 1자리
MM:			월
DD:			1달중 날짜
DAY:		월요일~일요일
DY:			월~일
HH,HH12:	12시간 / AM or PM : 오전or오후
HH24:		24시간
MI:			분
SS:			초

SYSDATE 							:	현재 날짜 시간을 반환 

TO DATE(문자형데이터 , datetime형식)		:	문자형 데이터를 날짜형으로 반환
		select to_date('2022-09-01 오전 06:00', 'YYYY-MM-DD PM HH:MI') from dual;
		
TO_CHAR(date,datetime형식)			:	날짜형 데이터를 문자형으로 반환
		select to_CHAR(sysdate,'YYYY-MM-DD') from dual;
		--특정 날짜 값을 받아오고 싶다면 sysdate 자리에 to_date 함수를 넣어서 만들면 됨 반환되는 데이터 타입이 다르다.

ADD_MONTHS(date,숫자)					:	날짜에서 지정한 달만큼 더함 (1:다음달, -1:전달)
		add_months(sysdate,1) from dual
		
LAST_DAY(date)						:	그 달의 마지막 날을 반환.
		select last_day(sysdate) from dual
		
----------
		
4.집계 함수
--집계 /분석함수 - select 컬럼명 쪽이나, having 절에서 사용!
AVG(컬럼명)		:평균
COUNT(컬럼명)		:검색되는 데이터 수
MAX(컬럼명)		:최대값
MIN(컬럼명)		:최소값
SUM(컬럼명)		:총합
RANK			:중복 순위만큼 다음 순위 값을 시킴. 		ex)1등,2등,2등,2등,5등,6등
DENSE_RANK		:중복 쉰이가 존재해도 순차적으로 순위값	ex)1등,2등,2등,2등,3등,4등

----------

5.null 관련 함수
NVL함수			:null 인 경우에만 지정된 값으로 대치하는 함수
				NVL(값,null일때 대체값)
				select nvl(null,'b') from dual;
				select nvl('a','b') from dual;
NVL2함수			:null 의 여부에 따라 지정한 값으로 대치하는 함수
				nvl2(값,값이있을때 대체값,null일때 대체값)
				select nvl2(null,'a','b') from dual;
				select nvl2('c','a','b') from dual;