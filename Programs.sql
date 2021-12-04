------------------------------------------------------------------------------SPCreate_fellowship_candidates-------------------------------
CREATE PROCEDURE spAddCandidates(
@first_name varchar(100),
@middle_name varchar(100),
@last_name varchar(100),
@email varchar(50),
@hired_city varchar(50),
@degree varchar(50),
@hired_date datetime,
@mobile_num bigint,
@permanent_pincode int,
@hired_lab varchar(20),
@attitude_remark varchar(15),
@communication_remark varchar(15),
@knowledge_remark varchar(15),
@aggregate_remark varchar(15),
@birth_date date,
@is_birth_date_verified int,
@parent_name varchar(50),
@parent_occupation varchar(100),
@parent_mobile_num bigint,
@parent_annual_sal float,
@local_addr varchar(255),
@permanent_addr varchar(250),
@photo_path varchar(500),
@joining_date date,
@candidate_status varchar(20),
@personal_info_filled int,
@bank_info_filled int,
@educational_info_filled int,
@status varchar(20),
@remark varchar(150),
@creator_stamp datetime,
@creator_user int
)AS
BEGIN
	BEGIN TRY
	insert into fellowship_candidates values( @first_name, @middle_name, @last_name, @email, @hired_city,@degree,@hired_date, @mobile_num,
	@permanent_pincode, @hired_lab, @attitude_remark, @communication_remark, @knowledge_remark, @aggregate_remark, @birth_date, @is_birth_date_verified, @parent_name, @parent_occupation,
	@parent_mobile_num, @parent_annual_sal, @local_addr, @permanent_addr, @photo_path, @joining_date, @candidate_status, @personal_info_filled, @bank_info_filled, @educational_info_filled, @status, @remark, @creator_stamp, @creator_user);
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
-----------------------------------------------CRUD using Store Procedure--------------------------------------------
ALTER PROCEDURE spCreateUser(
  @email varchar(50),
  @first_name varchar(100),
  @last_name varchar(100),
  @password varchar(15),
  @contact_number bigint,
  @verified bit,
  @StatementType NVARCHAR(20) = '',
  @update varchar(20)
)
AS
BEGIN
	BEGIN TRY
		IF @StatementType ='Insert'
			BEGIN
				INSERt INTO user_details VALUES(@email,@first_name,@last_name,@password,@contact_number,@verified);
			END
		IF @StatementType ='Update'
			BEGIN
			UPDATE user_details SET email=@email,first_name=@first_name,last_name=@last_name, password=@password,contact_number=@contact_number WHERE first_name=@update;
			END
		IF @StatementType ='Delete'
			BEGIN
				DELETE FROM user_details WHERE first_name=@first_name;
			END
		IF @StatementType ='Show'
			BEGIN
				SELECT * FROM user_details WHERE first_name=@first_name;
			END
		IF @StatementType ='All'
			BEGIN
				SELECT * FROM user_details;
			END
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

EXEC spAddCandidates 'Anuj', 'Sham', 'Sabne', 'anuj@gmail.com ', 'Nagpur','BCA','2020-07-13', 8862001457,
413517, 'Management', 'Nice', 'Good', 'Good', 'Good', '1998-03-07', 1, 'Sham', 'Bank Officer',
8845213698, 505000.00, 'Udgir', 'Udgir', 'photo_path.jpg', '2019-10-10', 'Good', 1, 1, 1, 'Correct', 'Good', null, 6
SELECT * FROM fellowship_candidates

EXEC spCreateUser 'sonu@gmail.com','Sonu','Gaikwad','Sonu@123',8821004588,1,'Update','Ganesh'
SELECT * FROM user_details