PL/SQL Developer Test script 3.0
13
-- ���02.5���Գ���
declare
  v_COMM      emp.comm%TYPE; -- ģ������˰���
  v_updateMsg VARCHAR(50); -- �޸�״̬
  v_level     NUMBER(5); -- нˮ����
  on_FLAG     NUMBER(5);
  on_MSG      VARCHAR(200);
begin
  PROCEDURE_orders(7788, v_COMM, v_updateMsg, v_level, on_FLAG, on_MSG);
  DBMS_OUTPUT.PUT_LINE('˰��:' || TO_CHAR(v_COMM) || '�޸���Ϣ:' || v_updateMsg ||
                       '����:' || TO_CHAR(v_level) || '״̬��:' ||
                       TO_CHAR(on_FLAG) || '��Ϣ:' || on_MSG);
end;
0
0
