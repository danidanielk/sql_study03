��Ʈ�Ͽ� ���� ���̺����
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
-- ���̺� ���� �÷��� ��ü ����
-- ���� ���̺��� ������ �����ϴ� ���� �ۼ�.
-- ��Ʈ�� name �� �ܷ�Ű�� �θ� �Ӽ��� �����,���� �� ��Ʈ�� ���� �ϳ� �����



���� �ƷüҰ��ִ� �Ʒüҳѹ�, �ƷüҰ�����, �Ʒü��̸�, ����, ����,
������ ȸ���ڰ� ���� �����
�Ʒü� �÷��� �÷��� ���� �����.
���� Į�� ���� ���� Į�������� �ٲ����.
�÷� Į���� �ٽ� �����Ǿ���.
�Ʒü� �������� 5000~10000 ������ ���� ���� �ְ� �÷� �����ؾ��Ѵ�.
�Ʒü� ���� �� �ܷ�Ű�� �θ� �Ӽ��� ����,ĳ���͸�,������¥,power,����power,�� ĳ���� ���̺� �����

create table gym(
g_game varchar2(30 char) default '��̳�����',
g_no number(5) not null,
g_price number(10) not null,
g_name varchar2(20 char) not null,
g_location varchar2(30 char) not null,
g_class varchar2(30 char)primary key
); 

alter table gym modify g_class varchar2(30char)'ȸ����';
alter table gym add collor varchar2(30 char);
alter table gym rename column g_class to g_upgrade;
alter table gym drop collor;
alter table gym modify g_price constraint re_price check(g_price between 3000 and 5000);



create sequence gym_seq;

insert into gym values(default,gym_seq.nextval,4000,'�η»繫��','����','ȯ����');
insert into gym values(default,gym_seq.nextval,4000,'�η»繫��','����','�˻�');
insert into gym values(default,gym_seq.nextval,4000,'�η»繫��','���','�ü�');
insert into gym values(default,gym_seq.nextval,4000,'�η»繫��','���','�渶����');


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

insert into person values('ȯ����','�ٴϺ�',sysdate,5000,1000);
insert into person values('�˻�','�����',sysdate,3000,1000);
insert into person values('�ü�','���غ�',sysdate,4000,1000);
insert into person values('�渶����','���Ϻ�',sysdate,2000,1000);
insert into person values('ȯ����','������',sysdate,1000,1000);
insert into person values('�˻�','������',sysdate,5500,10);
insert into person values('�渶����','�ҿ���',sysdate,1200,1000);
insert into person values('�˻�','�۾ƺ�',sysdate,2000,800);
insert into person values('�ü�','����',sysdate,300,40);

select to_char(s_date,'YYYY.MM.DD  HH24:MI') as ���� from person;
select s_power,s_power2, s_power+s_power2 as soms from person;
select to_date('19900331021024','YYYYMMDDHH24MISS') from dual;


select * from tab;

select * from gym;
select * from person;

turncate table gym;
turncate table person;

drop table gym cascade constraint purge;
drop table person cascade constraint purge;