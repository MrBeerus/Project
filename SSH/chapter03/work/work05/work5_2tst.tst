PL/SQL Developer Test script 3.0
28
--��ȡ�α�
declare
  cur_salary SYS_reFCURSOR;
  on_FLAG    NUMBER(4);
  on_Msg     VARCHAR(200);
  sal        emp.sal%TYPE;
  empno        emp.empno%TYPE;
begin
  /**
  - --���շ��ص��α�
   procedure_emp2(cur_salary,on_FLAG,on_Msg);
   --ѭ���α�
   FOR c_object IN cur_salary LOOP
       --��ȡ�α�
       DBMS_OUTPUT.PUT_LINE(c_object.sal);
   END LOOP;
  -
  */
  --��Ϊ�Ѵ��α� ʹ��FORѭ������ȡ���Զ��� ���������ͻ
  --ʹ��LOOPѭ����û��
 procedure_emp2(cur_salary,on_FLAG,on_Msg);
  LOOP
       FETCH cur_salary INTO empno,sal;
       EXIT WHEN cur_salary%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(sal);
   END LOOP;
   CLOSE cur_salary;
  end;
0
0
