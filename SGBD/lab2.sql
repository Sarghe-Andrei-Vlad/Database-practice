set serveroutput on;
DECLARE
   CURSOR info_stud  IS
       SELECT DISTINCT s.nume, s.prenume, n.id_curs, c.titlu_curs FROM studenti s
       JOIN note n on n.id_student = s.id
       JOIN cursuri c on c.id=n.id_curs
       WHERE n.valoare = 4;
   v_nume studenti.nume%type;       
   v_prenume studenti.prenume%type;
   v_id_c note.id_curs%type;
   v_t_c cursuri.titlu_curs%type;

BEGIN
    OPEN info_stud;
    LOOP
        FETCH info_stud INTO v_nume, v_prenume, v_id_c, v_t_c;
        EXIT WHEN info_stud%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Studentul '||v_nume||' '|| v_prenume||' are nota 4 la materia: '||v_t_c);
    END LOOP;
    CLOSE info_stud;  
END;