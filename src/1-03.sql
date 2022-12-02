-- 테이블 확인하기
select * from tab;
--1. 숫자함수
ABS(숫자):		절대값 계산						ex)ABS(-4,5)
ROUND(숫자,m):	숫자 반올림,m은 반올림 기준 자릿수		ex)ROUND(5.36,1)
POWER(숫자,n):	숫자 n제곱값을 계산					ex)POWER(2,3)
TRUNC(숫자,m):	숫자의 m번째 자리까지 남기고 값을 버림	ex)TRUNC(123.456,2)
												ex)TRUNC(123.456,-1)
												ex)TRUNC(123.456,0)
MOD(m,n):		숫자 m을 n으로 나눈 나머지			ex)MOD(12,10)
SQRT(숫자):		숫자의 제곱근 값을 계산 (숫자는 양수)!	ex)SQRT(9,0)




--2 문자 함수
CONCAT(s1,s2):	두 문자열을 연결						ex)CONCAT('aa','bb')
SUBSTR(s1,n,k):	문자열의 n번째부터 k 만큼의 길이를 반환	ex)SUBSTR('abcdefg',3,4)
INSTR(s1,s2,n,k):s1의n번째서부터 시작해서 찾고자하는
				s2가 k 번째 나타내는 문자열의 위치를 반환	ex)INSTR('Hello','e',1,2)
RPAD(s,n,c)	:	문자열 s 의 왼쪽부터 지정한 자리수 n까지
				지정한 문자 c로 채워 줌				ex)RPAD('ABC',5,'*')
LTRIM(s1,s2):	문자열 s1기준으로 왼쪽에 지정한 문자
				s2 제거							ex)LTRIM('*ABC','*')
RTRIM(s1,s2):	문자열 s1기준으로 오른쪽에 지정한 문자
				s2 제거							ex)RTRIM('ABC*','*')
REPLACE(s1,s2,s3):s1의 지정한 문자 s2를 문자 s3로 변경	ex)REPLACE('JACK and JUE','J','BL')
LENGTH(s1)	:	글자 수 세어주는 함수					ex)LENGTH('zzz')
LENGTHB(s1)	:	글자 바이트 세어주는 함수





--3. 날짜/ 시간 함수
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

--------------------------
SYSDATE 							:	현재 날짜 시간을 반환 

TO DATE(문자형데이터 , datetime형식)		:	문자형 데이터를 날짜형으로 반환
		select to_date('2022-09-01 오전 06:00', 'YYYY-MM-DD PM HH:MI')
		
TO_CHAR(date,datetime형식)			:	날짜형 데이터를 문자형으로 반환
		select to_CHAR(sysdate,'YYYY-MM-DD') from dual;
		--특정 날짜 값을 받아오고 싶다면 sysdate 자리에 to_date 함수를 넣어서 만들면 됨 반환되는 데이터 타입이 다르다.

ADD_MONTHS(date,숫자)					:	날짜에서 지정한 달만큼 더함 (1:다음달, -1:전달)
		add_months(sysdate,1) from dual
		
LAST_DAY(date)						:	그 달의 마지막 날을 반환.
		select last_day(sysdate) from dual
		
	
--------------------------------------------







--오늘 날짜 기준 연도 조회 	(테이블 헤더에 '연도' / 컬럼에 '2022년' 이라고 나오게
select to_char (sysdate,'YYYY')||'년' as 연도 from dual;

--오늘 날짜 기준 월 조회		(테이블 헤더에 ' 월' / 컬럼에 '08월' 이라고 나오게
select to_char (sysdate,'MM')||'월' as 월 from dual;

--오늘 날짜 기준 일 조회		(테이블 헤더에 '일'/컬럼에 '30일' 이라고 나오게
select to_char (sysdate,'DD')||'일' as 일 from dual;

--오늘 날짜 기준 시/분 조회	(테이블 헤더에 각각 '시','분' / 칼럼에 각각 '?시' ,'?분' 이라고 나오게
select to_char (sysdate,'HH24')||'시' as 시,to_char (sysdate,'MI')||'분' as 분 from dual;

--지금이 오전인지 오후인지 조회
select to_char(sysdate,'PM') as "오전/오후" from dual;

--문자열 2022-09-09 오전 07:23을 2022.09.09 로 조회
select to_char(to_date('2022-09-09 오전07:23','YYYY-MM-DD PM HH:MI'),'YYYY.MM.DD') from dual;

--오늘 날짜 기준 3달 전 마지막 날은 몇월 며칠인지 조회
select to_char(last_day(add_months(sysdate,-3)),'MM-DD') from dual;



--4 집계 /분석함수 - select 컬럼명 쪽이나, having 절에서 사용!
AVG(컬럼명)		:평균
COUNT(컬럼명)		:검색되는 데이터 수
MAX(컬럼명)		:최대값
MIN(컬럼명)		:최소값
SUM(컬럼명)		:총합
RANK			:중복 순위만큼 다음 순위 값을 시킴. 		ex)1등,2등,2등,2등,5등,6등
DENSE_RANK		:중복 쉰이가 존재해도 순차적으로 순위값	ex)1등,2등,2등,2등,3등,4등

--5NULL 관렴 함수 : 현재 제약조건에 not null 로 무조건 데이터를 입력하게 해놨는데
--				null 값 꼴보기 싫어서 대체 하는 값
NVL함수			:null 인 경우에만 지정된 값으로 대치하는 함수
				NVL(값,null일때 대체값)
				select nvl(null,'b') from dual;
				select nvl('a','b') from dual;
NVL2함수			:null 의 여부에 따라 지정한 값으로 대치하는 함수
				nvl2(값,값이있을때 대체값,null일때 대체값)
				select nvl2(null,'a','b') from dual;
				select nvl2('c','a','b') from dual;
