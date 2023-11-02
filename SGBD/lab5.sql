CREATE TABLE stud AS SELECT * FROM studenti;
ALTER TABLE stud
        ADD ERASMUS varchar(20);
        
DECLARE
    v_contorStud INTEGER;
    v_nrStud INTEGER;
    v_notaMin INTEGER;
BEGIN
    select max(id) into v_nrStud from stud;
    v_contorStud := 0;
    LOOP
        v_contorStud := v_contorStud + 1;
        v_notaMin := -100;
        select min(valoare) into v_notaMin from stud s natural join note n where id = v_contorStud;
        if(v_notaMin > 4) THEN
            UPDATE stud
                SET
                ERASMUS = 'ERASMUS'
            WHERE ID = v_contorStud;
        END IF;
        
        if(v_notaMin > 0 AND v_notaMin <  5) THEN
            UPDATE stud
                SET
                ERASMUS = 'RESTANTIER'
            WHERE ID = v_contorStud;
        END IF;
        
        if(v_notaMin = -1) THEN
            UPDATE stud
                SET
                ERASMUS = 'fara note'
            WHERE ID = v_contorStud;
        END IF;
        EXIT WHEN v_contorStud = v_nrStud;
    END LOOP;
END;