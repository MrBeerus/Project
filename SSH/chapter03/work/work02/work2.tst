PL/SQL Developer Test script 3.0
15

declare 
  v_ename VARCHAR(1);
  --�쳣����
  e_error EXCEPTION;
begin
     SELECT ENAME INTO v_ename FROM emp WHERE EMPNO = 7369;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('û���ҵ�����!');
 WHEN VALUE_ERROR THEN
  DBMS_OUTPUT.PUT_LINE('���ȳ�����������!');
 WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
  end;
0
0
