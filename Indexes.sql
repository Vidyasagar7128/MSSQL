-----------------------------------Simple Index----------------------------
CREATE INDEX UserIds ON candidate_qualification(candidate_id);
SELECT * FROM candidate_qualification WHERE candidate_id = 15;
-----------------------------------Nonclustered Index-------------------------
CREATE NONCLUSTERED INDEX degreeIn ON candidate_qualification(degree_name DESC);
sp_helpindex candidate_qualification;