
create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null
);


--------------------DML---------------------
--------------------CRUD--------------------
--DML : Data Manipulation language ���̺� �����͸� �˻�,����,����,���� �ϴµ� ���Ǵ� ����.
--select ,insert, update, delete ���� �ְ�,
-- �ٿ��� CRUD :Create read update delete ��� �Ѵ�.

--C : insert
--ù��° ��� �����ؼ� ���� �� ����
insert into ���̺�� (�÷���) values (��)
insert into aug30_snack(s_no,s_name,s_maker,s_price) values(1,'��������','������',5000)
--�÷� �����ٲٱ� ����
insert into aug30_snack(s_name,s_price,s_no,s_maker) values('��������',5000,1,'�Ե�')
--�÷��� �� �������� not null �� ���ٸ� ��밡��. ���������� ���� �÷��� ���ؼ��� null ���� ��. ������ ��� ������ �� �־��ּ���
insert into aug30_snack(s_name,s_no) values('������',3);

--�ι�° ��� ������� ���� �� ����
insert into aug30_snack values(��)
insert into aug30_snack (1,'��������','������',5000)


-------------------------------------------------------------------------------

--���̺� ����� ���̺� �� 5�������� �־�ô�--
drop table aug30_snack cascade constraint purge;

insert into aug30_snack values(1,'����Ŀ��','������',2000);
insert into aug30_snack values(2,'������','�Ե�',2500);
insert into aug30_snack values(3,'������','��ī�ݶ�',500);
insert into aug30_snack values(4,'��ĵ��','�Ե�',1000);
insert into aug30_snack values(5,'�����','������',1500);

--���ڸ� ����ٰ� ��ȣ�� ��Ծ����� ����ϴ� factory pattern ����ȭ�ý��� : ��ȣ�� ������ �°� �ڵ����� ���� ���̺���� ���� --
--ġ������ ���� : insert �� �����ص� sepuence ���� ������ �ö� ���Ѿ� ������ ���� �ٽ� ���� �� ����. �׷����� ���� �����. 
--MySQL ������ Autoincrement
--OracleDB ������ Sequence

--���� ������ ����
create sequence ��������;  (���������� ���̺�� �ڿ� _seq �� �ٿ��ִ� ��ȭ�� �ֵ�.)
create sequence aug30_snack_seq;

--��ü���� ������ ����
create sequence ��������
	increment by 1		--������ 1�� ����.
	start with 1		--���۰� 1
	minvalue 1			--�ּҰ�
	maxvalue 999		--�ִ밪
	nocycle / cycle		--�ִ밪�� �����ϸ� ���۰����� �ٽ� �ݺ����� ����.
	nocache / cache		--�������� �̸� ����� ���� �޸𸮿��� ������ ���� ����
	noorder / order;	--��û ������� ���� ���� ���� ����
	
--������ ����
drop sequence ��������;

--������ ����� : ��������.nextval
create table aug30_snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null
);

create sequence aug30_snack_seq;

insert into aug30_snack values(aug30_snack_seq.nextval,'����Ŀ��','������',2000);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','�Ե�',2500);
insert into aug30_snack values(aug30_snack_seq.nextval,'������','��ī�ݶ�',500);
insert into aug30_snack values(aug30_snack_seq.nextval,'��ĵ��','�Ե�',1000);
insert into aug30_snack values(aug30_snack_seq.nextval,'�����','������',1500);

drop table aug30_snack cascade constraint purge;
select s_name as name from aug30_snack
where s_maker='�Ե�'
order by s_no;
-- ���̺� Ȯ���ϱ�
select * from tab;