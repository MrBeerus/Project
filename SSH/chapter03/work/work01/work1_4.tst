PL/SQL Developer Test script 3.0
17
--ÿ������100Ԫ
-- Created on 2019/3/20 by J.Z 
declare 
  -- Local variables here
  var_sal emp.sal%TYPE;
  var_moeny emp.sal%TYPE:=0;
begin
  -- Test statements here
  SELECT SAL INTO var_sal FROM emp WHERE ename = 'SCOTT';
  WHILE var_moeny < 10000 LOOP
        --����ÿ������100
        var_moeny:=(var_moeny + 100);
  END LOOP;
  --�޸�����
  UPDATE emp SET SAL = var_sal + var_moeny WHERE ename = 'SCOTT';
  COMMIT;
end;
0
0
