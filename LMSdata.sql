use LMSdata
-------------------------------------------------------------------------1) hired_candidates-----------------------------------------------
CREATE TABLE hired_candidates (
  id int IDENTITY PRIMARY KEY NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  hired_city varchar(50) NOT NULL,
  degree varchar(100) NOT NULL,
  hired_date datetime NOT NULL,
  mobile_num bigint NOT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  aggregate_remark varchar(15) DEFAULT NULL,
  status varchar(20) NOT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------2) fellowship_candidates---------------------------------------
CREATE TABLE fellowship_candidates (
  id int IDENTITY PRIMARY KEY NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  hired_city varchar(50) NOT NULL,
  degree varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  mobile_num bigint NOT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  aggregate_remark varchar(15) DEFAULT NULL,
  birth_date date NOT NULL,
  is_birth_date_verified int DEFAULT 0,
  parent_name varchar(50) DEFAULT NULL,
  parent_occupation varchar(100) NOT NULL,
  parent_mobile_num bigint NOT NULL,
  parent_annual_sal float DEFAULT NULL,
  local_addr varchar(255) NOT NULL,
  permanent_addr varchar(150) DEFAULT NULL,
  photo_path varchar(500) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  candidate_status varchar(20) NOT NULL,
  personal_info_filled int DEFAULT 0,
  bank_info_filled int DEFAULT 0,
  educational_info_filled int DEFAULT 0,
  status varchar(20) DEFAULT NULL,
  remark varchar(150) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------3) candidates_personal_det_check---------------------------------------
CREATE TABLE candidates_personal_det_check (
  id int IDENTITY PRIMARY KEY NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
ALTER TABLE candidates_personal_det_check
ALTER COLUMN field_name VARCHAR(25)
SELECT * FROM candidates_personal_det_check
-------------------------------------------------------------------------4)candidate_bank_det---------------------------------------
CREATE TABLE candidate_bank_det(
  id int IDENTITY PRIMARY KEY NOT NULL,
  name varchar(100) NOT NULL,
  account_num int NOT NULL,
  is_account_num_verified int DEFAULT 0,
  ifsc_code varchar(20) NOT NULL,
  is_ifsc_code_verified int DEFAULT 0,
  pan_number varchar(10) DEFAULT NULL,
  is_pan_number_verified int DEFAULT 0,
  addhaar_num int NOT NULL,
  is_addhaar_num_verified int DEFAULT 0,
  candidate_id int NOT NULL FOREIGN KEY REFERENCES fellowship_candidates(id),
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)

ALTER TABLE candidate_bank_det
ALTER COLUMN account_num bigint;

ALTER TABLE candidate_bank_det
ALTER COLUMN addhaar_num bigint;
-------------------------------------------------------------------------5) candidate_qualification---------------------------------------
CREATE TABLE candidate_qualification(
  id int IDENTITY PRIMARY KEY NOT NULL,
  candidate_id int NOT NULL FOREIGN KEY REFERENCES fellowship_candidates(id),
  diploma int DEFAULT 0,
  degree_name varchar(10) NOT NULL,
  is_degree_name_verified int DEFAULT 0,
  employee_decipline varchar(100) NOT NULL,
  is_employee_decipline_verified int DEFAULT 0,
  passing_year int NOT NULL,
  is_passing_year_verified int DEFAULT 0,
  aggr_per float DEFAULT NULL,
  final_year_per float DEFAULT NULL,
  is_final_year_per_verified int DEFAULT 0,
  training_institute varchar(20) NOT NULL,
  is_training_institute_verified int DEFAULT 0,
  training_duration_month int DEFAULT NULL,
  is_training_duration_month_verified int DEFAULT 0,
  other_training varchar(255) DEFAULT NULL,
  is_other_training_verified int DEFAULT 0,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------6) candidates_education_det_check---------------------------------------
CREATE TABLE candidates_education_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
ALTER TABLE candidates_education_det_check
ALTER COLUMN field_name varchar(25);
-------------------------------------------------------------------------7) candidate_docs---------------------------------------
CREATE TABLE candidate_docs(
  id int IDENTITY PRIMARY KEY NOT NULL,
  candidate_id int  NOT NULL FOREIGN KEY REFERENCES fellowship_candidates(id),
  doc_type varchar(20) DEFAULT NULL,
  doc_path varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------8) user_details---------------------------------------
CREATE TABLE user_details (
  id int IDENTITY PRIMARY KEY NOT NULL,
  email varchar(50) UNIQUE NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  password varchar(15) NOT NULL,
  contact_number bigint NOT NULL,
  verified bit DEFAULT NULL,
)
-------------------------------------------------------------------------9) user_roles------------------------
CREATE TABLE user_roles (
  user_id int NOT NULL,
  role_name varchar(100)
)
-------------------------------------------------------------------------10) company---------------------------------------
CREATE TABLE company(
  id int IDENTITY PRIMARY KEY NOT NULL,
  name int NOT NULL,
  address varchar(150) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------11) maker_program---------------------------------------
CREATE TABLE maker_program(
  id int IDENTITY PRIMARY KEY NOT NULL,
  program_name int NOT NULL,
  program_type varchar(10) DEFAULT NULL,
  program_link text DEFAULT NULL,
  tech_stack_id int DEFAULT NULL FOREIGN KEY REFERENCES tech_stack(id),
  tech_type_id int NOT NULL FOREIGN KEY REFERENCES tech_type(id),
  is_program_approved int,
  description varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------12) app_parameters---------------------------------------
CREATE TABLE app_parameters (
  id int IDENTITY PRIMARY KEY NOT NULL,
  key_type varchar(20) NOT NULL,
  key_value varchar(20) NOT NULL,
  key_text varchar(80) DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  seq_num int DEFAULT NULL,
  --PRIMARY KEY (key_type,  key_value)
)
-------------------------------------------------------------------------13) mentor---------------------------------------
CREATE TABLE mentor(
  id int NOT NULL IDENTITY PRIMARY KEY,
  name varchar(50) DEFAULT NULL,
  mentor_type varchar(20) DEFAULT NULL,
  lab_id int NOT NULL FOREIGN KEY REFERENCES mentor(id),
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------14) mentor_ideation_map---------------------------------------
CREATE TABLE mentor_ideation_map(
  id int NOT NULL IDENTITY PRIMARY KEY,
  mentor_id int NOT NULL FOREIGN KEY REFERENCES mentor(id),
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------15) mentor_techstack---------------------------------------
CREATE TABLE mentor_techstack(
  id int IDENTITY PRIMARY KEY NOT NULL,
  mentor_id int NOT NULL FOREIGN KEY REFERENCES mentor(id),
  tech_stack_id int NOT NULL FOREIGN KEY REFERENCES tech_stack(id),
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------16) tech_stack---------------------------------------
CREATE TABLE tech_stack (
  id int NOT NULL IDENTITY PRIMARY KEY,
  tech_name varchar(50) NOT NULL,
  image_path varchar(500) DEFAULT NULL,
  framework text DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------17) tech_type---------------------------------------
CREATE TABLE tech_type (
  id int NOT NULL IDENTITY PRIMARY KEY,
  type_name varchar(50) NOT NULL,
  cur_status char DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)
-------------------------------------------------------------------------18) lab---------------------------------------
CREATE TABLE lab(
  id int IDENTITY PRIMARY KEY NOT NULL,
  name varchar(50) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  address  varchar(255) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------19) lab_threshold---------------------------------------
CREATE TABLE lab_threshold(
  id int IDENTITY PRIMARY KEY NOT NULL,
  lab_id int NOT NULL FOREIGN KEY REFERENCES company_requirement(id),
  lab_capacity varchar(50) DEFAULT NULL,
  lead_threshold int DEFAULT NULL,
  ideation_engg_threshold int DEFAULT NULL,
  buddy_engg_threshold int DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  --KEY `FK_lab_lab_id` (`lab_id`),
  --CONSTRAINT `FK_lab_lab_id` FOREIGN KEY (`lab_id`) REFERENCES company_requirement(id) REFERENCES `candidate_lead` (`id`)
  )
-------------------------------------------------------------------------20) company_requirement---------------------------------------
CREATE TABLE company_requirement(
id int IDENTITY PRIMARY KEY NOT NULL,
company_id int NOT NULL,
candidate_id int NOT NULL FOREIGN KEY REFERENCES fellowship_candidates(id),
requested_month varchar(20) NOT NULL,
city varchar(20) DEFAULT NULL,
is_doc_verification int DEFAULT 1,
requirement_doc_path varchar(500) DEFAULT NULL,
no_of_engg int NOT NULL,
tech_stack_id int NOT NULL,
tech_type_id int NOT NULL,
maker_programs_id int NOT NULL,
lead_id int NOT NULL,
ideateion_engg_id int DEFAULT NULL,
buddy_engg_id int  DEFAULT NULL,
special_remark text DEFAULT NULL,
status int DEFAULT 1,
creator_stamp datetime DEFAULT NULL,
creator_user int DEFAULT NULL,
)
-------------------------------------------------------------------------21) candidate_techstack_assignment---------------------------------------
CREATE TABLE candidate_techstack_assignment(
  id int IDENTITY PRIMARY KEY NOT NULL,
  requirement_id int NOT NULL FOREIGN KEY REFERENCES company_requirement(id),
  candidate_id int NOT NULL FOREIGN KEY REFERENCES fellowship_candidates(id),
  assign_date datetime DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
)