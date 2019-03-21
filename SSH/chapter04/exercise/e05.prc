CREATE OR REPLACE PROCEDURE PROCEDURE_orders
(
       v_empno NUMBER,                        --Ա�����
       v_COMM OUT emp.comm%TYPE,              -- ģ������˰���
       v_updateMsg OUT VARCHAR,               -- �޸�״̬
       v_level OUT NUMBER,                    -- нˮ����
       on_FLAG OUT NUMBER,
       on_MSG OUT VARCHAR
)
IS
BEGIN
       -- ˰��
       SELECT COMM INTO v_COMM FROM emp WHERE empno = v_empno;
       --�޸Ľ����б�
       UPDATE emp SET COMM = 1000 WHERE empno = v_empno;
       COMMIT;
       --����нˮ����
       SELECT SAL INTO v_level FROM emp WHERE empno = v_empno;
       IF v_level > 3000 THEN
          v_level := 1;
       END IF;
        on_FLAG:=2001;
        on_MSG:='success';
        v_updateMsg:='update success!';
EXCEPTION
       WHEN OTHERS THEN
            v_updateMsg:='update error!';
            on_FLAG:=2000;
            on_MSG:=SQLERRM;
END;
/
