-------------------------------------- Simple View--------------------------
CREATE PROCEDURE getData
AS
BEGIN
	SELECT * FROM getUsers;
END

EXEC getData

CREATE VIEW getCandidate AS SELECT * FROM fellowship_candidates;

SELECT * FROM getCandidate
SELECT * from fellowship_candidates

INSERT getCandidate VALUES('Vinay', 'Dnyanoba', 'Suryawanshi', 'vinay@gmail.com ', 'Nanded','MSC','2018-12-13', 8885699650,
413517, 'Frontend', 'Good', 'Nice', 'Good', 'Good', '2000-12-13', 1, 'Dnyanoba', 'Farmer',
8220145875, 200000.00, 'Nanded', 'Nanded', 'photo_path.jpg', '2019-05-13', 'Nice', 0, 0, 0, 'Correct', 'Good', null, 4);

UPDATE getCandidate SET hired_lab = 'Angular' WHERE id = 20
DELETE getCandidate WHERE id = 21
-------------------------------------Complex View------------------------------
CREATE VIEW getUsers AS SELECT c.first_name,c.last_name,b.account_num,b.ifsc_code FROM fellowship_candidates c
LEFT OUTER JOIN candidate_bank_det b
ON c.id = b.candidate_id;
SELECT * FROM getUsers
