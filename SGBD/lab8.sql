DROP TABLE laborator8;
CREATE TABLE laborator8(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(32) NOT NULL,
  prenume VARCHAR2(32) NOT NULL,
  email VARCHAR2(32) NOT NULL,
  telefon NUMBER(10)
)
/
DECLARE
v_fisier UTL_FILE.FILE_TYPE;
v_nume VARCHAR2(32);
v_prenume VARCHAR2(32);
v_email VARCHAR2(32);
v_telefon VARCHAR2(32);
v_out VARCHAR2(1024);
v_id INTEGER;
v_separator1 VARCHAR(10);
v_separator2 VARCHAR(10);
v_separator3 VARCHAR(10);
v_studentexists INTEGER;
BEGIN
v_fisier:=UTL_FILE.FOPEN('MYDIR','studenti.txt','R');
v_id := 1;
    LOOP
        BEGIN
          UTL_FILE.GET_LINE(v_fisier, v_out);
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            EXIT;
        END;
        v_separator1 := INSTR(v_out, ';', 1, 1);
        v_separator2 := INSTR(v_out, ';', 1, 2);
        v_separator3 := INSTR(v_out, ';', 1, 3);
        v_nume := SUBSTR(v_out, 1, v_separator1 - 1);
        v_prenume := SUBSTR(v_out, v_separator1 + 1, v_separator2 - v_separator1 - 1);
        v_email := SUBSTR(v_out, v_separator2 + 1, v_separator3 - v_separator2 - 1);
        v_telefon := SUBSTR(v_out, v_separator3 + 1);
        v_studentexists := 0;
        select count(*) into v_studentexists from laborator8 where nume = v_nume and prenume = v_prenume;
        if v_studentexists != 0 then
        raise_application_error(-20111, v_nume || v_ prenume || 'este deja in baza de date');
        end if;
        INSERT INTO laborator8 (id, nume, prenume, email, telefon) VALUES (v_id,v_nume,v_prenume,v_email,v_telefon);
        v_id := v_id + 1;
    END LOOP;
    UTL_FILE.FCLOSE(v_fisier);
END;