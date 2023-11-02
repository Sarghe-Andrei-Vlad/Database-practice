CREATE OR REPLACE DIRECTORY MYDIR as 'D:\STUDENT';
/
DECLARE
v_fisier UTL_FILE.FILE_TYPE;
BEGIN
v_fisier:=UTL_FILE.FOPEN('MYDIrrrrR','myfile.txt','W'); -- deschidem fisierul cu drept de citire
UTL_FILE.PUT(v_fisier,'Hai la cafeluta');
UTL_FILE.FCLOSE(v_fisier);
EXCEPTION WHEN UTL_FILE.INVALID_PATH THEN DBMS_OUTPUT.PUT_LINE('Salutare');
END;
/
set serveroutput on;
DECLARE
v_fisier UTL_FILE.FILE_TYPE;
v_sir VARCHAR2(50);
BEGIN
v_fisier:=UTL_FILE.FOPEN('MYDIR','myfile.txt','R'); -- deschidem fisierul pt citire
UTL_FILE.GET_LINE( v_fisier,v_sir);
DBMS_OUTPUT.PUT_LINE (v_sir);
UTL_FILE.FCLOSE (v_fisier);
END;