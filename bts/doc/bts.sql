-- system �������� �۾��� ����
-- bts�̶� �̸��� ���� ����
create user bts IDENTIFIED by 12345 account unlock;
-- bts�� ���̺� �����̽� ���� ���� �ο�(��� ����)
grant unlimited tablespace to bts;
-- �⺻ ���̺����̽� ����
ALTER USER bts DEFAULT TABLESPACE USERS;
-- �ӽ� ���̺����̽� ����
ALTER USER bts TEMPORARY TABLESPACE TEMP;
-- bts ����� ������ ���� �ο�
grant connect, resource to bts;
-- bts ����� ���� ���� ���� �ο�
grant create session to bts;
-- bts ����� ������ ���̺� ���� ���� �ο�
grant create table to bts;
-- �ٸ� ������� system������ �� ��ɾ �����ϸ� ��(system ��������)
conn bts/12345;

-- ���̺�� ���� �ڵ�
 DROP TABLE MEMBER;
 DROP TABLE ESCALATOR;
 DROP TABLE ELEVATOR;
 DROP TABLE CHAIRLIFT;
 DROP TABLE ATTRACTION;
 DROP TABLE RESTAURANT;
 DROP TABLE CONGESTION;


-- ȸ�� ���̺� ����
Create Table Member(
    mno NUMBER(4)
        CONSTRAINT MEMB_NO_PK PRIMARY KEY,
    name VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    id VARCHAR2(10 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    pw VARCHAR2(10 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMB_ISSHOW_CK CHECK (ISSHOW IN ('Y', 'N'))
        CONSTRAINT MEMB_ISSHOW_NN NOT NULL
);

-- �����÷����� ���̺� ����
CREATE TABLE ESCALATOR(
    "�Ϸù�ȣ" NUMBER
        CONSTRAINT ESC_NO_PK PRIMARY KEY,
    "ö��������" VARCHAR2(4000 CHAR),
    "��뼱��" VARCHAR2(4000 CHAR),
    "����" VARCHAR2(4000 CHAR),
    "�����౸��" VARCHAR2(4000 CHAR),
    "(����)���Ա���ȣ" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "������(����ġ)" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "������(����ġ)" VARCHAR2(4000 CHAR),
    "�°��� ����" VARCHAR2(4000 CHAR),
    "�°�������" VARCHAR2(4000 CHAR)
);

-- ���������� ���̺� ����
CREATE TABLE ELEVATOR(
    "�Ϸù�ȣ" NUMBER
        CONSTRAINT ELE_NO_PK PRIMARY KEY,
    "ö��������" VARCHAR2(4000 CHAR),
    "��뼱��" VARCHAR2(4000 CHAR),
    "����" VARCHAR2(4000 CHAR),
    "(����)���Ա���ȣ" VARCHAR2(4000 CHAR),
    "����ġ" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "����(�ο���)" VARCHAR2(4000 CHAR),
    "����(�߷�)(kg)" VARCHAR2(4000 CHAR),
    "�°������" VARCHAR2(4000 CHAR)
);

-- ��ü�� ����Ʈ ���̺� ����
CREATE TABLE CHAIRLIFT(
    "�Ϸù�ȣ" NUMBER
        CONSTRAINT LIFT_NO_PK PRIMARY KEY,
    "ö��������" VARCHAR2(4000 CHAR),
    "��뼱��" VARCHAR2(4000 CHAR),
    "����" VARCHAR2(4000 CHAR),
    "(����)���Ա���ȣ" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "������(����ġ)" VARCHAR2(4000 CHAR),
    "������(����/����)" VARCHAR2(4000 CHAR),
    "������(���࿪��)" VARCHAR2(4000 CHAR),
    "������(����ġ)" VARCHAR2(4000 CHAR),
    "����(Cm)" VARCHAR2(4000 CHAR),
    "��(Cm)" VARCHAR2(4000 CHAR),
    "�Ѱ��߷�(Kg)" VARCHAR2(4000 CHAR),
    "�°������" VARCHAR2(4000 CHAR)
);

-- ������ ���̺� ����
CREATE TABLE ATTRACTION(
    "������ ��ȣ" NUMBER
        CONSTRAINT ATTR_NO_PK PRIMARY KEY,
    "�߽� POI X ��ǥ" VARCHAR2(4000 CHAR),
    "�߽� POI Y ��ǥ" VARCHAR2(4000 CHAR),
    "��������" VARCHAR2(4000 CHAR),
    "�ּ�" VARCHAR2(4000 CHAR),
    "�߽�ī�װ� ��_��" VARCHAR2(4000 CHAR),
    "�з�" VARCHAR2(4000 CHAR),
    "��ġ���� ����" NUMBER
);

-- ���� ���̺� ����
CREATE TABLE RESTAURANT(
    "������ ��ȣ" NUMBER
        CONSTRAINT REST_NO_PK PRIMARY KEY,
    "���Ҹ�" VARCHAR2(4000 CHAR),
    "�ּ�" VARCHAR2(4000 CHAR),
    "�з�" VARCHAR2(4000 CHAR),
    "��ġ���� ��ŷ" NUMBER
);

-- ȥ�⵵ ���̺� ����
CREATE TABLE CONGESTION(
    "����" NUMBER
        CONSTRAINT SERIAL_NO_PK PRIMARY KEY,
    "���ϱ���" VARCHAR2(10 CHAR),
    "ȣ��" VARCHAR2(10 CHAR),
    "����ȣ" NUMBER,
    "��߿�" VARCHAR2(30 CHAR),
    "���ϱ���" VARCHAR2(10 CHAR),
    "5��30��" VARCHAR2(10 CHAR),
    "6��00��" VARCHAR2(10 CHAR),
    "6��30��" VARCHAR2(10 CHAR),
    "7��00��" VARCHAR2(10 CHAR),
    "7��30��" VARCHAR2(10 CHAR),
    "8��00��" VARCHAR2(10 CHAR),
    "8��30��" VARCHAR2(10 CHAR),
    "9��00��" VARCHAR2(10 CHAR),
    "9��30��" VARCHAR2(10 CHAR),
    "10��00��" VARCHAR2(10 CHAR),
    "10��30��" VARCHAR2(10 CHAR),
    "11��00��" VARCHAR2(10 CHAR),
    "11��30��" VARCHAR2(10 CHAR),
    "12��00��" VARCHAR2(10 CHAR),
    "12��30��" VARCHAR2(10 CHAR),
    "13��00��" VARCHAR2(10 CHAR),
    "13��30��" VARCHAR2(10 CHAR),
    "14��00��" VARCHAR2(10 CHAR),
    "14��30��" VARCHAR2(10 CHAR),
    "15��00��" VARCHAR2(10 CHAR),
    "15��30��" VARCHAR2(10 CHAR),
    "16��00��" VARCHAR2(10 CHAR),
    "16��30��" VARCHAR2(10 CHAR),
    "17��00��" VARCHAR2(10 CHAR),
    "17��30��" VARCHAR2(10 CHAR),
    "18��00��" VARCHAR2(10 CHAR),
    "18��30��" VARCHAR2(10 CHAR),
    "19��00��" VARCHAR2(10 CHAR),
    "19��30��" VARCHAR2(10 CHAR),
    "20��00��" VARCHAR2(10 CHAR),
    "20��30��" VARCHAR2(10 CHAR),
    "21��00��" VARCHAR2(10 CHAR),
    "21��30��" VARCHAR2(10 CHAR),
    "22��00��" VARCHAR2(10 CHAR),
    "22��30��" VARCHAR2(10 CHAR),
    "23��00��" VARCHAR2(10 CHAR),
    "23��30��" VARCHAR2(10 CHAR),
    "00��00��" VARCHAR2(10 CHAR),
    "00��30��" VARCHAR2(10 CHAR)
);

-- ȸ������ ���� ������ ���� �ڵ�
CREATE Sequence membSeq
start with 1001
increment by 1
nocache
nocycle;

-- �׸��� ���̽㿡���� �����ʹ� UTF-8�� ���ڵ��� �Ǿ��ִµ�
-- ����Ŭ���� SELECT���� ���ϰ� ������ EUC_KR(��õ)�̳� UTF-8�� ���ڵ� ������ �Ǿ�� �Ѵ�.
-- ����(T) -> �� �ؿ� �ִ� ȯ�漳�� Ŭ�� -> ȯ�� �޴��� ���ڵ� ���� EUC_KR�̳� UTF-8�� ���� �� Ȯ��.
-- �� �׷��� �÷��� ��ȸ�� ���� to_char("�÷���")���� ���¸� �ۼ��ؾ� �Ѵ�.
-- ���� ���̺��� ����� �� �� �����͸� �����Ϸ��� �� �� UTF-8�� ���ڵ��� �Ǿ��ִ��� Ȯ���ϰ� ������ �ؾ� �Ѵ�.

commit;

-- UTF-8�� ���ڵ� �Ǿ��ִ� ����
SELECT
    "ö��������" ȸ��, "��뼱��" �뼱
FROM
    elevator
where
    "ö��������" = '���ﱳ�����'
order by
    �뼱
;

-- �ٸ� ���
SELECT
    to_Char("ö��������") ȸ��, to_char("��뼱��") �뼱
FROM
    elevator
where
    to_Char("ö��������") = '���ﱳ�����'
order by
    �뼱
;

-- �������� �ִ� ������ �̸��� �ּ� �׸��� ī�װ��� �˻�
SELECT
    "��������" ��������,"�ּ�" �ּ�, "�߽�ī�װ� ��_��" ī�װ�
FROM
    attraction
WHERE
    �ּ� LIKE '%��õ��%'
;

