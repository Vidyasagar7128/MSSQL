ALTER PROCEDURE spUserDocuments(
@creator_user int,
@field_name varchar(25),
@candidate_id int
)AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO candidates_personal_det_check(candidate_id,field_name,creator_user) VALUES(@candidate_id,@field_name,@creator_user);
	UPDATE fellowship_candidates SET personal_info_filled = 1 WHERE id = @candidate_id
	IF(@@ERROR > 0)
		BEGIN
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
	END
END
EXEC spUserDocuments 5,'UID',19