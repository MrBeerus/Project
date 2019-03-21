PL/SQL Developer Test script 3.0
71
declare
  v_sal emp.sal%TYPE;
  --˰��
  v_s NUMBER(7, 3);
  --����۳���
  v_ss NUMBER(7, 3);
  --��˰��
  v_toaltax NUMBER(11, 4) := 0;
  --���ڼ���
  v_level NUMBER(1);
  --�����α��ѯ����
  CURSOR currsor_emp
  --���Ա������
  IS
    SELECT SAL,
           TO_CHAR(HIREDATE, 'yyyy') as year_date,
           empno,
           ename,
           dname,
           TO_CHAR(SYSDATE, 'yyyy') as year_curr
      FROM emp, dept
     WHERE emp.deptno = dept.deptno;
begin
  --ѭ����ȡ
  FOR v_object IN currsor_emp LOOP
    v_sal := (v_object.sal - 1500);
    --�ж�˰��
    IF v_sal <= 1500 THEN
      v_s  := 0.03;
      v_ss := 0;
    ELSIF v_sal <= 4500 THEN
      v_s  := 0.1;
      v_ss := 105;
    ELSIF v_sal <= 9000 THEN
      v_s  := 0.2;
      v_ss := 555;
    ELSE
      v_s  := 0.25;
      v_ss := 1005;
    END IF;
    --�ۼӽ��
    v_toaltax := v_toaltax + (v_sal * v_s - v_ss);
    --�жϼ���
    IF v_sal > 700 AND v_sal <= 3200 THEN
      v_level := 1;
    ELSIF v_sal >= 3201 AND v_sal <= 4400 THEN
      v_level := 2;
    ELSIF v_sal >= 4401 AND v_sal <= 5000 THEN
      v_level := 3;
    ELSIF v_sal >= 5001 AND v_sal <= 7000 THEN
      v_level := 4;
    ELSE
      v_level := 5;
    END IF;
    --���Ľ��
     IF v_object.year_curr - v_object.year_date < 6 THEN
      --�޸Ľ���1000
      UPDATE emp SET COMM = COMM + 1000 WHERE  EMPNO = v_object.empno;
  ELSE
      --�޸Ľ��Ϊ2000
      UPDATE emp SET COMM = COMM + 2000 WHERE  EMPNO = v_object.empno;
  END IF;
  COMMIT;
    --�����Ϣ
    DBMS_OUTPUT.PUT_LINE('Ա������:' || v_object.ename || '��������:' ||
                         v_object.dname || 'нˮ:' ||
                         TO_CHAR(v_object.SAL + 1500) || '���ڼ���:' ||
                         TO_CHAR(v_level));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('��˰��:' || TO_CHAR(v_toaltax));
end;
0
0
