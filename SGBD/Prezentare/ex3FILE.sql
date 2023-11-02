DECLARE
v_fisier UTL_FILE.FILE_TYPE;
BEGIN
v_fisier:=UTL_FILE.FOPEN('MYDIR','studenti.txt','W');
FOR linie in(SELECT nr_matricol,nume,prenume FROM studenti) LOOP
UTL_FILE.PUTF(v_fisier,'Studentul cu numarul matricol %s este %s %s\n ',linie.nr_matricol,linie.nume,linie.prenume);
END LOOP;
UTL_FILE.FCLOSE(v_fisier);
END;