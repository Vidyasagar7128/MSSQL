USE LMSdata

insert into fellowship_candidates values('Vikas', 'Dnyanoba', 'Mane', 'vikas@gmail.com ', 'Latur','BCA','2019-12-13', 8956748596,
413517, 'Fullstack', 'Good', 'Good', 'Good', 'Good', '1999-12-13', 1, 'Dnyanoba', 'Farmer',
7584962547, 300000.00, 'Udgir', 'Udgir', 'photo_path.jpg', '2019-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 1);

insert into fellowship_candidates values('Manoj', 'Vasant', 'Gaikwad', 'manoj@gmail.com ', 'Udgir','MCA','2018-11-01', 8999772355,
413517, 'React', 'Good', 'Good', 'Good', 'Good', '1998-04-27', 1, 'Vasant', 'Army',
7584962547, 300000.00, 'Udgir', 'Udgir', 'photo_path.jpg', '2018-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 1);

insert into fellowship_candidates values('Navnath', 'Eknath', 'Baber', 'navnath@gmail.com ', 'Nanded','MCA','2017-10-01', 7875965478,
431715, 'Backend', 'Good', 'Good', 'Good', 'Good', '1997-06-05', 1, 'Eknath', 'Farmer',
7584962547, 300000.00, 'Nanded', 'Nanded', 'photo_path.jpg', '2017-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 2);

insert into fellowship_candidates values('Atul', 'Arvind', 'Shinde', 'atul@gmail.com ', 'Udgir','MCA','2019-10-01', 8965741201,
413517, 'Java', 'Good', 'Fine', 'Good', 'Good', '1997-06-05', 1, 'Arvind', 'Teacher',
7584962547, 450000.00, 'Udgir', 'Udgir', 'photo_path.jpg', '2019-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 3);

insert into fellowship_candidates values('Prem', 'Amar', 'Mulbharti', 'prem@gmail.com ', 'Pune','BCOM','2012-05-06', 8742049658,
410006, 'Flutter', 'Good', 'Fine', 'Good', 'Fine', '1999-01-25', 1, 'Amar', 'Engineer',
800325478, 750000.00, 'Pune', 'Pune', 'photo_path.jpg', '2014-12-13', 'Good', 1, 1, 1, 'Correct', 'Good', null, 4);
SELECT * from fellowship_candidates
TRUNCATE TABLE fellowship_candidates
--------------------------------------------------candidate_bank_det---------------------
insert into candidate_bank_det values('Vikas',075611610021545,1,'BKID002154',1,'CSIPG052J',1,321549874512,1,12,NULL,1);
insert into candidate_bank_det values('Manoj',075611610025445,1,'ICICI002154',1,'CSIPB012J',1,541549874512,1,13,NULL,2);
insert into candidate_bank_det values('Navnath',098611610021545,1,'HDFC002154',1,'CSIEG012J',1,651549874512,1,14,NULL,3);
insert into candidate_bank_det values('Atul',12511610021545,1,'KTK002154',1,'CSING042J',1,681549874512,1,15,NULL,2);
insert into candidate_bank_det values('Prem',845611610021545,1,'PAYTM0021',1,'CSIPG013J',1,681549874512,1,16,NULL,4);

select * from candidate_bank_det
truncate table candidate_bank_det
--------------------------------------------------candidate_qualification----------------------
insert into candidate_qualification values(12,1,'BCA',1,'Good',1,2017,1,80.65,88.00,1,'SRTMUN',1,24,1,1,1,NULL,1);
insert into candidate_qualification values(13,1,'MCA',1,'Good',1,2018,1,79.65,7.00,1,'SRTMUN',1,24,1,1,1,NULL,1);
insert into candidate_qualification values(14,1,'MCA',1,'Good',1,2019,1,68.65,68.00,1,'SRTMUN',1,24,1,1,1,NULL,2);
insert into candidate_qualification values(15,1,'MCA',1,'Good',1,2020,1,78.65,67.00,1,'SRTMUN',1,24,1,1,1,NULL,3);
insert into candidate_qualification values(16,1,'BCOM',1,'Good',1,2015,1,83.65,78.00,1,'SRTMUN',1,24,1,1,1,NULL,4);

select * from candidate_qualification
TRUNCATE TABLE candidate_qualification

---------------------------------------------------candidate_docs-------------------------------
insert into candidate_docs values(12,'Adhar','C:\desktop\docs\a.pdf',1,NULL,1);
insert into candidate_docs values(13,'PAN','C:\desktop\docs\b.pdf',1,NULL,1);
insert into candidate_docs values(14,'Adhar','C:\desktop\docs\c.pdf',1,NULL,2);
insert into candidate_docs values(16,'PAN','C:\desktop\docs\d.pdf',1,NULL,3);
insert into candidate_docs values(16,'Adhar','C:\desktop\docs\e.pdf',1,NULL,4);

select * from candidate_docs
truncate table candidate_docs
--------------------------------------------------user_details----------------------------------
insert into user_details values('ram@gmail.com','Ram','More','Ram@123',9854124587,1);
insert into user_details values('krishna@gmail.com','Krishna','Gore','Krishna@123',8745962145,1);
insert into user_details values('rahul@gmail.com','Rahul','Jadhav','Rahul@123',7756998001,1);
insert into user_details values('om@gmail.com','Om','Vairat','Om@123',7780021540,1);

select * from user_details
TRUNCATE TABLE user_details

--------------------------------------------------candidates_education_det_check----------------------------------
INSERT INTO candidates_education_det_check values(1,12,'Computer',1,NULL,NULL,NULL,1);
INSERT INTO candidates_education_det_check values(2,13,'Computer',1,NULL,NULL,NULL,1);
INSERT INTO candidates_education_det_check values(3,14,'Computer',1,NULL,NULL,NULL,2);
INSERT INTO candidates_education_det_check values(4,15,'Computer',1,NULL,NULL,NULL,3);
INSERT INTO candidates_education_det_check values(5,16,'Computer',1,NULL,NULL,NULL,4);

select * from candidates_education_det_check