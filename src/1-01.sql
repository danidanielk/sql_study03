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

truncate table note_book;

alter table note_book modify n_ram number(10) default 125;

alter table note_book add size number (5,2);

alter table note_book rename column n_hdd to n_sdd;

alter table note_book drop n_day

alter table note_book modify n_price num(10) constraint re_price check(n_price between 800000 and 2300000);


drop table note_book cascade constraint purge;



--------------------------------���������Ѱ�-------------------------------
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

truncate table aug30_notebook; --�׳� �ẽ..

drop table aug30_notebook cascade constraint purge;