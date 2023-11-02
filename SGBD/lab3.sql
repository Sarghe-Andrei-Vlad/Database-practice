set serveroutput on;
DECLARE
    v_id_student studenti.id%TYPE;
    v_an_student studenti.an%TYPE;
    BEGIN
        select max(id) into v_id_student from studenti;
        v_id_student := v_id_student + 1;
        v_an_student := DBMS_RANDOM.value(1,3);
        insert into studenti (id,nr_matricol,nume,prenume,an,grupa,data_nastere) values(v_id_student,p_nr_mat,p_nume,p_prenume,v_an_student,p_grupa,p_data);
        DBMS_OUTPUT.PUT_LINE('Studentul ' || v_id_student || ', ' || p_nume || ' ' || p_prenume || ', cu nr matricol: ' || p_nr_mat || ', din anul ' ||  v_an_student || ' si grupa ' || p_grupa);
    END;


CREATE OR REPLACE PROCEDURE adaugare_note AS
        v_an_student NUMBER := DBMS_RANDOM.value(1,3);
        CURSOR materii IS SELECT id from cursuri where an=v_an_student;
        v_id_curs cursuri.id%type;
        v_nota note.valoare%type;
        v_id_nota note.id%type;
    BEGIN
        OPEN materii;
        LOOP
            FETCH materii INTO v_id_curs;
            v_nota := DBMS_RANDOM.value(4,10);
            select max(id) into v_id_nota from note;
            v_id_nota := v_id_nota + 1;
            insert into note (id,id_student,id_curs,valoare) values(v_id_nota,v_id_student,v_id_curs,v_nota);
            EXIT WHEN materii%NOTFOUND;
        END LOOP;
        CLOSE materii;
    END;
    
    

END student;

