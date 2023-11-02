set serveroutput on;
DECLARE
        v_id1 NUMBER(4) := &i_id1;
        v_id2 NUMBER(4) := &i_id2;
        v_n1 studenti.prenume%TYPE;
        v_n2 studenti.prenume%TYPE;
        v_pren1 studenti.nume%TYPE;
        v_pren2 studenti.nume%TYPE;
        v_d_n1 DATE;
        v_d_n2 DATE;
        v_varsta1 VARCHAR(50);
        v_varsta2 VARCHAR(50);
        
    BEGIN
        SELECT s.nume, s.prenume, s.data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, DATA_NASTERE)/12)||' ani '||
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, DATA_NASTERE), 12))||'luni ' INTO v_n1, v_pren1, v_d_n1, v_varsta1
        FROM studenti s WHERE s.id = v_id1;
        
        SELECT s.nume, s.prenume, s.data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, s.data_nastere)/12)||' ani '||
        TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, s.data_nastere), 12))||'luni ' INTO v_n2, v_pren2, v_d_n2, v_varsta2
        FROM studenti s WHERE s.id = v_id2;
        
        DBMS_OUTPUT.PUT_LINE( v_n1 || v_pren1 || v_d_n1 || v_varsta1);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE( v_n2 || v_pren2 || v_d_n2 || v_varsta2);
        DBMS_OUTPUT.PUT_LINE('');
        IF ( v_varsta1 > v_varsta2)
            THEN
            DBMS_OUTPUT.PUT_LINE( v_n1 || ' ' || v_pren1 || ' e mai mare decat ' || v_n2 || ' ' || v_pren2);
            ELSE DBMS_OUTPUT.PUT_LINE( v_n2 || ' ' || v_pren2 || ' e mai mare decat ' || v_n1 || ' ' || v_pren1);
            END IF;
    END;
