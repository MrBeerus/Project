PL/SQL Developer Test script 3.0
29
--���ڼ���
-- Created on 2019/3/19 by J.Z 
declare 
   --��������
   v_eptName dept.dname%TYPE;
   --����
   v_sal emp.sal%TYPE;
   --�ȼ�
   v_level NUMBER(1);
  -- Local variables here
  i integer;
begin
  -- Test statements here
  SELECT SAL INTO v_sal FROM emp  WHERE ENAME = UPPER('Scott');
  SELECT dept.dname  INTO v_eptName FROM emp,dept WHERE emp.deptno = dept.deptno AND ENAME = UPPER('Scott');
  --�жϼ���
  IF v_sal > 700 AND  v_sal <= 3200 THEN
     v_level:=1;
  ELSIF v_sal >= 3201 AND  v_sal <= 4400 THEN
     v_level:=2;
  ELSIF v_sal >= 4401 AND  v_sal <= 5000 THEN
     v_level:=3;
  ELSIF v_sal >= 5001 AND  v_sal <= 7000 THEN
     v_level:=4;
  ELSE
     v_level:=5;
  END IF;
  DBMS_OUTPUT.PUT_LINE('SCOTT:'||'����:'||v_eptName||'н��:'||TO_CHAR(v_sal)||'���ڼ���:'||v_level);
end;
0
0
