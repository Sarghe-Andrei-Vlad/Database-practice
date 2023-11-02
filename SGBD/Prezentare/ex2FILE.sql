DECLARE
v_fexists BOOLEAN ;
v_file_length NUMBER ;
v_block_size BINARY_INTEGER;
BEGIN
UTL_FILE.FGETATTR('MYDIR','myfile.txt',v_fexists,v_file_length ,v_block_size);
IF v_fexists THEN
DBMS_OUTPUT.PUT_LINE('Fila exista ');
DBMS_OUTPUT.PUT_LINE('Lungimea filei este : '|| v_file_length );
DBMS_OUTPUT.PUT_LINE('Dimensiunea in octeti este : ' || v_block_size );
ELSE
DBMS_OUTPUT.PUT_LINE('Fila nu exista !');
END IF;
END ;
