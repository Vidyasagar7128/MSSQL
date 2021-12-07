-----------------------------------Simple Cursor-------------------------
DECLARE cGetCandidate CURSOR
SCROLL FOR SELECT * FROM fellowship_candidates
OPEN cGetCandidate;
FETCH LAST FROM cGetCandidate;
FETCH FIRST FROM cGetCandidate;
FETCH PRIOR FROM cGetCandidate;
FETCH NEXT FROM cGetCandidate;
FETCH ABSOLUTE 5 FROM cGetCandidate;
FETCH RELATIVE 2 FROM cGetCandidate;
CLOSE cGetCandidate;
DEALLOCATE cGetCandidate;
------------------------using Variables----------------------
DECLARE 
    @first_name VARCHAR(25), 
    @email   VARCHAR(25);
	DECLARE cursor_Details CURSOR
FOR SELECT
        first_name, 
        email
    FROM 
        fellowship_candidates;
OPEN cursor_Details;
	FETCH NEXT FROM cursor_Details INTO 
    @first_name,
    @email;
	print 'Name: ' + CAST(@first_name AS VARCHAR(25))+' '+ 'Email: '+ CAST(@email AS VARCHAR(25));
CLOSE cursor_Details;
DEALLOCATE cursor_Details;
