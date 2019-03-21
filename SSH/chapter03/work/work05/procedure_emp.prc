CREATE OR REPLACE PROCEDURE procedure_emp (
  v_empno NUMBER, --Ա�����
  on_Flag OUT NUMBER, --״̬��
  on_Msg  OUT VARCHAR2 --״̬��Ϣ
)
IS
BEGIN
  --���ݴ����Ա�����ɾ��Ա��
  DELETE FROM emp WHERE empno = v_empno;
  on_Flag := 20000;
  on_Msg  := 'success';
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    --�����쳣
    on_Flag := 20001;
    on_Msg  := 'error';
END;
/
