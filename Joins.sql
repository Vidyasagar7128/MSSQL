------------------------------------------------------Join with storeProcedure-----------------------------------
ALTER PROCEDURE spCandidateDetails(
@id int
)AS
BEGIN
	BEGIN TRY
		SELECT fellowship_candidates.first_name,fellowship_candidates.last_name,degree_name,passing_year,aggr_per,account_num,ifsc_code,field_name,fellowship_candidates.hired_lab,address,location from fellowship_candidates
		LEFT JOIN candidate_bank_det
		ON fellowship_candidates.id = candidate_bank_det.candidate_id
		JOIN candidate_qualification
		ON fellowship_candidates.id = candidate_qualification.candidate_id
		JOIN candidates_education_det_check
		ON fellowship_candidates.id = candidates_education_det_check.candidate_id
		JOIN company
		ON fellowship_candidates.creator_user = company.creator_user
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

EXEC spCandidateDetails 16;