CREATE OR REPLACE TYPE persoana AS OBJECT(
    nume varchar2(32),
    prenume varchar2(32),
    cnp number(7),
    ORDER MEMBER FUNCTION compare(p persoana) return number,
    MEMBER PROCEDURE printInfo
);

CREATE OR REPLACE TYPE BODY persoana AS
    MEMBER PROCEDURE printInfo IS
       BEGIN
           DBMS_OUTPUT.PUT_LINE(self.nume || ' ' || self.prenume || ' are CNP-ul: ' || self.cnp);
       END;
    CONSTRUCTOR FUNCTION persoana( nume varchar2, prenume varchar2, gen varchar2, data_nastere date)
        RETURN SELF AS RESULT 
    AS
    BEGIN
        self.nume := nume;
        self.prenume := prenume;
        cnp := 2;
        IF gen = 'masculin' THEN
            cnp := 1;
        END IF;
        cnp := cnp * 100 + TO_CHAR( data_nastere, 'mm');
        cnp := cnp * 100 + TO_CHAR( data_nastere, 'dd');
        cnp := cnp * 100 + TO_CHAR( data_nastere, 'yy');
        return;
END;
    ORDER MEMBER FUNCTION compare(p persoana) 
        RETURN number IS
    BEGIN
        IF mod(self.cnp, 100) < mod(p.cnp, 100) THEN
            return 1;
        ELSIF mod(self.cnp, 100) > mod(p.cnp, 100) THEN
            return -1;
        ELSIF mod( self.cnp/10000, 100) > mod( p.cnp/10000, 100) THEN
            return 1;
        ELSIF mod( self.cnp/10000, 100) < mod( p.cnp/10000, 100) THEN
            return -1;
        ELSIF mod( self.cnp/100, 100) > mod( p.cnp/100, 100) THEN
            return 1;
        ELSIF mod( self.cnp/100, 100) < mod( p.cnp/100, 100) THEN
            return -1;
        END IF;
        return 0;
    END;   
END;

DECLARE 
    P1 persoana;
    P2 persoana;
    P3 persoana;
    P4 persoana;
    P5 persoana;
BEGIN
    P1 := persoana('Andrei', 'Sarghe', '25-OCT-1997');
    P2 := persoana('Andrei', 'Lungu', '26-OCT-1996');
    P3 := persoana('Alexandru', 'Cretu', '01-FEB-2001');
    P4 := persoana('Razvan', 'Iftimoaia', '02-FEB-2002');
    P5 := persoana('Adrian', 'Onofrei', '12-DEC-2000');
    
    P1.printInfo;
    P2.printInfo;
    P3.printInfo;
    P4.printInfo;
    P5.printInfo;
END;