-- ���̺� Ȯ���ϱ�
select * from tab;
--1. �����Լ�
ABS(����):		���밪 ���						ex)ABS(-4,5)
ROUND(����,m):	���� �ݿø�,m�� �ݿø� ���� �ڸ���		ex)ROUND(5.36,1)
POWER(����,n):	���� n�������� ���					ex)POWER(2,3)
TRUNC(����,m):	������ m��° �ڸ����� ����� ���� ����	ex)TRUNC(123.456,2)
												ex)TRUNC(123.456,-1)
												ex)TRUNC(123.456,0)
MOD(m,n):		���� m�� n���� ���� ������			ex)MOD(12,10)
SQRT(����):		������ ������ ���� ��� (���ڴ� ���)!	ex)SQRT(9,0)




--2 ���� �Լ�
CONCAT(s1,s2):	�� ���ڿ��� ����						ex)CONCAT('aa','bb')
SUBSTR(s1,n,k):	���ڿ��� n��°���� k ��ŭ�� ���̸� ��ȯ	ex)SUBSTR('abcdefg',3,4)
INSTR(s1,s2,n,k):s1��n��°������ �����ؼ� ã�����ϴ�
				s2�� k ��° ��Ÿ���� ���ڿ��� ��ġ�� ��ȯ	ex)INSTR('Hello','e',1,2)
RPAD(s,n,c)	:	���ڿ� s �� ���ʺ��� ������ �ڸ��� n����
				������ ���� c�� ä�� ��				ex)RPAD('ABC',5,'*')
LTRIM(s1,s2):	���ڿ� s1�������� ���ʿ� ������ ����
				s2 ����							ex)LTRIM('*ABC','*')
RTRIM(s1,s2):	���ڿ� s1�������� �����ʿ� ������ ����
				s2 ����							ex)RTRIM('ABC*','*')
REPLACE(s1,s2,s3):s1�� ������ ���� s2�� ���� s3�� ����	ex)REPLACE('JACK and JUE','J','BL')
LENGTH(s1)	:	���� �� �����ִ� �Լ�					ex)LENGTH('zzz')
LENGTHB(s1)	:	���� ����Ʈ �����ִ� �Լ�





--3. ��¥/ �ð� �Լ�
-- ��¥ ����
YYYY:		4�ڸ� ����
YYY:		������ 3�ڸ�
YY:			������ 2�ڸ�
Y:			������ 1�ڸ�
MM:			��
DD:			1���� ��¥
DAY:		������~�Ͽ���
DY:			��~��
HH,HH12:	12�ð� / AM or PM : ����or����
HH24:		24�ð�
MI:			��
SS:			��

--------------------------
SYSDATE 							:	���� ��¥ �ð��� ��ȯ 

TO DATE(������������ , datetime����)		:	������ �����͸� ��¥������ ��ȯ
		select to_date('2022-09-01 ���� 06:00', 'YYYY-MM-DD PM HH:MI')
		
TO_CHAR(date,datetime����)			:	��¥�� �����͸� ���������� ��ȯ
		select to_CHAR(sysdate,'YYYY-MM-DD') from dual;
		--Ư�� ��¥ ���� �޾ƿ��� �ʹٸ� sysdate �ڸ��� to_date �Լ��� �־ ����� �� ��ȯ�Ǵ� ������ Ÿ���� �ٸ���.

ADD_MONTHS(date,����)					:	��¥���� ������ �޸�ŭ ���� (1:������, -1:����)
		add_months(sysdate,1) from dual
		
LAST_DAY(date)						:	�� ���� ������ ���� ��ȯ.
		select last_day(sysdate) from dual
		
	
--------------------------------------------







--���� ��¥ ���� ���� ��ȸ 	(���̺� ����� '����' / �÷��� '2022��' �̶�� ������
select to_char (sysdate,'YYYY')||'��' as ���� from dual;

--���� ��¥ ���� �� ��ȸ		(���̺� ����� ' ��' / �÷��� '08��' �̶�� ������
select to_char (sysdate,'MM')||'��' as �� from dual;

--���� ��¥ ���� �� ��ȸ		(���̺� ����� '��'/�÷��� '30��' �̶�� ������
select to_char (sysdate,'DD')||'��' as �� from dual;

--���� ��¥ ���� ��/�� ��ȸ	(���̺� ����� ���� '��','��' / Į���� ���� '?��' ,'?��' �̶�� ������
select to_char (sysdate,'HH24')||'��' as ��,to_char (sysdate,'MI')||'��' as �� from dual;

--������ �������� �������� ��ȸ
select to_char(sysdate,'PM') as "����/����" from dual;

--���ڿ� 2022-09-09 ���� 07:23�� 2022.09.09 �� ��ȸ
select to_char(to_date('2022-09-09 ����07:23','YYYY-MM-DD PM HH:MI'),'YYYY.MM.DD') from dual;

--���� ��¥ ���� 3�� �� ������ ���� ��� ��ĥ���� ��ȸ
select to_char(last_day(add_months(sysdate,-3)),'MM-DD') from dual;



--4 ���� /�м��Լ� - select �÷��� ���̳�, having ������ ���!
AVG(�÷���)		:���
COUNT(�÷���)		:�˻��Ǵ� ������ ��
MAX(�÷���)		:�ִ밪
MIN(�÷���)		:�ּҰ�
SUM(�÷���)		:����
RANK			:�ߺ� ������ŭ ���� ���� ���� ��Ŵ. 		ex)1��,2��,2��,2��,5��,6��
DENSE_RANK		:�ߺ� ���̰� �����ص� ���������� ������	ex)1��,2��,2��,2��,3��,4��

--5NULL ���� �Լ� : ���� �������ǿ� not null �� ������ �����͸� �Է��ϰ� �س��µ�
--				null �� �ú��� �Ⱦ ��ü �ϴ� ��
NVL�Լ�			:null �� ��쿡�� ������ ������ ��ġ�ϴ� �Լ�
				NVL(��,null�϶� ��ü��)
				select nvl(null,'b') from dual;
				select nvl('a','b') from dual;
NVL2�Լ�			:null �� ���ο� ���� ������ ������ ��ġ�ϴ� �Լ�
				nvl2(��,���������� ��ü��,null�϶� ��ü��)
				select nvl2(null,'a','b') from dual;
				select nvl2('c','a','b') from dual;
