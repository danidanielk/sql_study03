alter �� ���

-- ��Ʈ���� �̸�, ����, cpu, ram, hdd,�����Ⱓ�� �Ӽ����� ���� �ϰ����
-- ���ǿ� �����ϴ� ���̺��� �ۼ��ϴ� ����
-- �ϳ��� �⺻Ű, ��簪�� ä���־�� ��
-- ��Ʈ�� ����� �������� 128gb ¥�� ram �� ����ϰ� �Ǿ���
-- �̶� ram�÷��� �뷮�� �����ϴ� ���� �ۼ�
-- ��Ʈ���� ũ�� �� ���� Į���� �߰��ϴ� �����ۼ�.
-- ���� cm, �Ҽ��� �ι�° �ڸ����� ��Ÿ�� ��
-- ��Ʈ�Ͽ��� ������ hdd��ſ� sdd�� ������
-- �����Ⱓ �÷��� �����ϴ� ���� �ۼ�
-- ��Ʈ�� ������ 800000~2300000 ������ ���� �� �� �ְԲ� �ش� �÷��� �����ϴ� ���� �ۼ�
-- ���� ���̺��� ������ �����ϴ� ���� �ۼ�.
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
sequence �� ���

--���� ������ ����
���鶧 : create sequence ��������;  (���������� ���̺�� �ڿ� _seq �� �ٿ��ִ� ��ȭ�� �ֵ�.)
���� : ��������.nextval
������ : drop sequence ��������;

--------------------------------------------------------------------------------------------------------------
����,����,��¥,����,null ���� �Լ�


1.������ ���� �Լ�
REPLACE(s1,s2,s3)	:s1�� ������ ���� s2�� ���� s3�� ����		ex)REPLACE('JACK and JUE','J','BL')
LENGTH(s1)			:	���� �� �����ִ� �Լ�					ex)LENGTH('zzz')

----------

2.������ ���� �Լ�
ABS(����)				:		���밪 ���					ex)ABS(-4,5)
ROUND(����,m)			:	���� �ݿø�,m�� �ݿø� ���� �ڸ���		ex)ROUND(5.36,1)
POWER(����,n)			:	���� n�������� ���					ex)POWER(2,3)
TRUNC(����,m)			:	������ m��° �ڸ����� ����� ���� ����	ex)TRUNC(123.456,2)
														ex)TRUNC(123.456,-1)
														ex)TRUNC(123.456,0)

----------														
													
3.��¥ �Լ�.....
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

SYSDATE 							:	���� ��¥ �ð��� ��ȯ 

TO DATE(������������ , datetime����)		:	������ �����͸� ��¥������ ��ȯ
		select to_date('2022-09-01 ���� 06:00', 'YYYY-MM-DD PM HH:MI') from dual;
		
TO_CHAR(date,datetime����)			:	��¥�� �����͸� ���������� ��ȯ
		select to_CHAR(sysdate,'YYYY-MM-DD') from dual;
		--Ư�� ��¥ ���� �޾ƿ��� �ʹٸ� sysdate �ڸ��� to_date �Լ��� �־ ����� �� ��ȯ�Ǵ� ������ Ÿ���� �ٸ���.

ADD_MONTHS(date,����)					:	��¥���� ������ �޸�ŭ ���� (1:������, -1:����)
		add_months(sysdate,1) from dual
		
LAST_DAY(date)						:	�� ���� ������ ���� ��ȯ.
		select last_day(sysdate) from dual
		
----------
		
4.���� �Լ�
--���� /�м��Լ� - select �÷��� ���̳�, having ������ ���!
AVG(�÷���)		:���
COUNT(�÷���)		:�˻��Ǵ� ������ ��
MAX(�÷���)		:�ִ밪
MIN(�÷���)		:�ּҰ�
SUM(�÷���)		:����
RANK			:�ߺ� ������ŭ ���� ���� ���� ��Ŵ. 		ex)1��,2��,2��,2��,5��,6��
DENSE_RANK		:�ߺ� ���̰� �����ص� ���������� ������	ex)1��,2��,2��,2��,3��,4��

----------

5.null ���� �Լ�
NVL�Լ�			:null �� ��쿡�� ������ ������ ��ġ�ϴ� �Լ�
				NVL(��,null�϶� ��ü��)
				select nvl(null,'b') from dual;
				select nvl('a','b') from dual;
NVL2�Լ�			:null �� ���ο� ���� ������ ������ ��ġ�ϴ� �Լ�
				nvl2(��,���������� ��ü��,null�϶� ��ü��)
				select nvl2(null,'a','b') from dual;
				select nvl2('c','a','b') from dual;