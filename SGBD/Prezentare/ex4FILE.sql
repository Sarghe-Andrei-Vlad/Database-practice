set serveroutput on;
DECLARE
v_fisier UTL_FILE.FILE_TYPE ;
v_fexists BOOLEAN;
v_file_length NUMBER;
v_block_size BINARY_INTEGER;
v_out VARCHAR2(1024);
BEGIN
UTL_FILE.FGETATTR('MYDIR','studenti.txt',v_fexists,v_file_length,v_block_size);
IF(v_fexists) THEN
v_fisier:=UTL_FILE.FOPEN('MYDIR','studenti.txt','R');
LOOP
BEGIN
UTL_FILE.GET_LINE (v_fisier,v_out);
DBMS_OUTPUT.PUT_LINE (v_out);
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT;
END;
END LOOP;
UTL_FILE.FCLOSE(v_fisier);
END IF;
END;