------------------------------------------------------Join with storeProcedure-----------------------------------
CREATE PROCEDURE spCandidateDetails(
@id int
)AS
BEGIN
	BEGIN TRY
		SELECT first_name,last_name,degree_name,passing_year,aggr_per,account_num,ifsc_code,field_name from fellowship_candidates
		LEFT JOIN candidate_bank_det
		ON fellowship_candidates.id = candidate_bank_det.candidate_id
		JOIN candidate_qualification
		ON fellowship_candidates.id = candidate_qualification.candidate_id
		JOIN candidates_education_det_check
		ON fellowship_candidates.id = candidates_education_det_check.candidate_id
		WHERE fellowship_candidates.id = @id;
	END TRY
	BEGIN CATCH
		SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
--------------------------------------------------------Join-----------------------------------------------------
SELECT first_name,last_name,degree_name,passing_year,aggr_per,account_num,ifsc_code,field_name from fellowship_candidates
LEFT JOIN candidate_bank_det
ON fellowship_candidates.id = candidate_bank_det.candidate_id
JOIN candidate_qualification
ON fellowship_candidates.id = candidate_qualification.candidate_id
JOIN candidates_education_det_check
ON fellowship_candidates.id = candidates_education_det_check.candidate_id;
JOIN hired_candidates

EXEC spCandidateDetails 16;