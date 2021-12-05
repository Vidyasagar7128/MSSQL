------------------------------------Scalar function----------------------------------
ALTER FUNCTION getAccountNo(@id AS int )  
RETURNS varchar(25)  
BEGIN  
    RETURN (SELECT account_num FROM candidate_bank_det  
        WHERE candidate_id=@id)  
END

select dbo.getAccountNo(12);
--------------------------------------Aggregate functions---------------------
SELECT AVG(parent_annual_sal) FROM fellowship_candidates
SELECT MIN(parent_annual_sal) FROM fellowship_candidates
SELECT MAX(parent_annual_sal) FROM fellowship_candidates
SELECT SUM(parent_annual_sal) FROM fellowship_candidates
SELECT COUNT(parent_annual_sal) FROM fellowship_candidates
--------------------------------------Scalar Functions-----------------------
SELECT UPPER(first_name) FROM fellowship_candidates
SELECT LOWER(first_name) FROM fellowship_candidates
SELECT LEN(first_name) FROM fellowship_candidates
SELECT SUBSTRING(first_name,1,1) FROM fellowship_candidates
----------------------------------Inline Table-Valued Function----------------
ALTER FUNCTION getAccountDetails()  
RETURNS Table  
    RETURN (SELECT * FROM candidate_bank_det);
select * from getAccountDetails();

