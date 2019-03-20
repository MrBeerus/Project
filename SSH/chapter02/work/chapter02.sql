--01
CREATE TABLESPACE tp_orders
       DATAFILE 'C:\tp_orders.dbf'
       SIZE 10M
       AUTOEXTEND ON;
CREATE USER A_oe
       IDENTIFIED BY bdqn
       DEFAULT TABLESPACE tp_orders;
GRANT CONNECT,RESOURCE TO A_oe;
CREATE USER A_hr IDENTIFIED BY orcl;
GRANT DBA TO A_hr;
CREATE TABLE employee(
       ID NUMBER(11) NOT NULL
);
GRANT ALL ON A_hr.employee TO A_oe;
--02
CREATE SEQUENCE dept_seq
       START WITH 60
       INCREMENT BY 10
       MAXVALUE 10000
       MINVALUE 60;
INSERT INTO dept(DEPTNO,DNAME,LOC) VALUES(dept_seq.NEXTVAL,'ACCOUNTING1','NEW YORK1');
INSERT INTO dept(DEPTNO,DNAME,LOC) VALUES(dept_seq.NEXTVAL,'ACCOUNTING2','NEW YORK2');
SELECT * FROM dept;
DROP SEQUENCE dept_seq;
CREATE TABLE deptBAK as SELECT * FROM dept WHERE 1=2;
INSERT INTO deptBAK(DEPTNO,DNAME,LOC) VALUES(dept_seq.NEXTVAL,'ACCOUNTING1','NEW YORK1');
INSERT INTO deptBAK(DEPTNO,DNAME,LOC) VALUES(dept_seq.NEXTVAL,'ACCOUNTING2','NEW YORK2');
SELECT * FROM deptBAK;
--03
--�������scott.emp���Ȩ��
GRANT ALL ON scott.dept TO A_hr;
SELECT * FROM scott.dept;
--��¡��
CREATE TABLE A_hr.dept AS  SELECT * FROM scott.dept;
--��������ͬ���
CREATE PUBLIC SYNONYM p_sy_dept FOR A_hr.dept;
--��ѯ
SELECT * FROM p_sy_dept;
--04
--Ϊ�ͻ���Ŵ������������
CREATE INDEX index_customer_id ON scott.customers(customer_id) REVERSE;
--�����������
CREATE INDEX index_customer_name ON scott.customers(cust_first_name,cust_last_name);
--����λͼ����
CREATE BITMAP INDEX index_customer_TERRITORY ON scott.customers(nls_territory);
--����A_oe�û�����oraders��Ȩ��
--04
SELECT * FROM scott.orders;
GRANT ALL ON scott.orders TO A_oe;
CREATE TABLE order2 (
       order_id NUMBER(12) PRIMARY KEY,
       order_date DATE NOT NULL 
)
PARTITION BY RANGE(order_date)
(
          PARTITION part1 VALUES LESS THAN (TO_DATE('2005/01/01','yyyy/mm/dd')),
          PARTITION part2 VALUES LESS THAN (TO_DATE('2006/01/01','yyyy/mm/dd')),
          PARTITION part3 VALUES LESS THAN (TO_DATE('2007/01/01','yyyy/mm/dd')),
          PARTITION part4 VALUES LESS THAN (TO_DATE('2008/01/01','yyyy/mm/dd')),
          PARTITION part5 VALUES LESS THAN (TO_DATE('2009/01/01','yyyy/mm/dd'))
);

SELECT * FROM order2 PARTITION(part1);
SELECT * FROM order2 PARTITION(part2);
SELECT * FROM order2 PARTITION(part3);
SELECT * FROM order2 PARTITION(part4);
SELECT * FROM order2 PARTITION(part5);

INSERT INTO order2(order_id,order_date) VALUES(1,TO_DATE('2004/03/12','yyyy-mm-dd'));
INSERT INTO order2(order_id,order_date) VALUES(2,TO_DATE('2005/12/12','yyyy-mm-dd'));
INSERT INTO order2(order_id,order_date) VALUES(3,TO_DATE('2007/03/06','yyyy-mm-dd'));
INSERT INTO order2(order_id,order_date) VALUES(4,TO_DATE('2003/12/11','yyyy-mm-dd'));
INSERT INTO order2(order_id,order_date) VALUES(5,TO_DATE('2013/01/01','yyyy-mm-dd'));
--���2013-01-01���ݲ��ܲ��������
CREATE TABLE order3 
PARTITION BY RANGE(order_date)
(
          PARTITION part1 VALUES LESS THAN (TO_DATE('2005/01/01','yyyy/mm/dd')),
          PARTITION part2 VALUES LESS THAN (TO_DATE('2006/01/01','yyyy/mm/dd')),
          PARTITION part3 VALUES LESS THAN (TO_DATE('2007/01/01','yyyy/mm/dd')),
          PARTITION part4 VALUES LESS THAN (TO_DATE('2008/01/01','yyyy/mm/dd')),
          PARTITION part5 VALUES LESS THAN (TO_DATE('2009/01/01','yyyy/mm/dd')),
          PARTITION part6 VALUES LESS THAN (maxvalue)
)
AS SELECT * FROM order2;
--ɾ������������������
DELETE FROM order2 PARTITION(part3);
--06 �����������
CREATE TABLE intervalOrders
PARTITION BY RANGE(order_date)
          INTERVAL(NUMTOYMINTERVAL(1,'year'))
          (
             PARTITION part1 VALUES LESS THAN(TO_DATE('2005/01/01','yyyy/mm/dd'))
             
          )
AS SELECT * FROM order2;
--��ѯ����
SELECT table_name,partition_name FROM user_tab_partitions WHERE table_name = UPPER('intervalOrders');
SELECT * FROM intervalOrders PARTITION(part1);
SELECT * FROM intervalOrders PARTITION(SYS_P21);
SELECT * FROM intervalOrders PARTITION(SYS_P22);
--���
--���� p_Stock_Received��
CREATE TABLE p_Stock_Received(
       Stock_ID NUMBER,
       Stock_Date DATE,
       Cost VARCHAR2(10)
);
--2.1 ����myseq����
CREATE SEQUENCE myseq
       START WITH 1000
       INCREMENT BY 10
       MAXVALUE 1100
       CYCLE;
--2.2 ��������ͬ���
CREATE PUBLIC SYNONYM Stock_Received FOR A_hr.p_Stock_Received;
--ͨ��A_oe����
SELECT * FROM Stock_Received;
--2.3 ����
CREATE TABLE Stock_Received2
PARTITION BY RANGE(Stock_Date)(
          PARTITION VALUES LESS THAN (TO_DATE('2012-01-01','yyyy-mm-dd')),
          PARTITION VALUES LESS THAN (TO_DATE('2013-01-01','yyyy-mm-dd')),
          PARTITION VALUES LESS THAN (TO_DATE('2014-01-01','yyyy-mm-dd'))
)AS SELECT * FROM Stock_Received;
--��ѯ����
SELECT table_name,partition_name FROM user_tab_partitions WHERE table_name = UPPER('Stock_Received2');
--2.4 ����һ��Ψһ����
CREATE UNIQUE INDEX index_STOCK_ID ON p_Stock_Received(Stock_ID);
       
