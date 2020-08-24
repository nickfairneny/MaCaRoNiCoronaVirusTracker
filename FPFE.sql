#!/bin/bash
#Final Project
#filename - Finalprojectfrontend.sql
#Team Members:
#Fairneny Nick
#Misra Rita
#Petrovich Marianna
echo "

                @@@@@@@@@@@@@@@                   @@@@@@@@@@@@@@@
           @@@@@@            @@@@@@           @@@@@@           @@@@@@
         @@@@                     @@@@     @@@@                     @@@@
       @@@                          @@@@@@@@                           @@@
     @@@                               @@@                              @@@@
    @@@                                                                   @@@
   @@@                                                                    @@@
   @@@                                                                     @@@
   @@@                                                                     @@@
   @@@                                                                    @@
    @@@                       @@                                          @@@
     @@@                     @@@@                                        @@@
      @@@@                   @@@@@          @@                         @@@@
        @@@@                @@@ @@@        @@@@                      @@@@
          @@@@             @@@  @@@       @@@@@@                  @@@@
             @            @@@    @@@     @@@  @@@                 @@
     @@@@@@@@@@@@@@@@@@@@@@@      @@@   @@@    @@@  @@@@@@@@@@@@@@@@@@@@@@
                                   @@@ @@@      @@@@@@
                     @@@           @@@@@@               @@@@
                       @@@@         @@@@              @@@@
                         @@@@@       @@            @@@@
                            @@@@                 @@@@
                              @@@@            @@@@
                                 @@@@       @@@@
                                   @@@@  @@@@
                                      @@@@@
                                        @

"
echo "Welcome to the MaCaRoNi Cornona Virus Tracking Database!"
echo "Please enter your name: "
read userentered

echo "Welcome, $userentered"

while :
do
echo "******************************************************"
echo "Please choose from the options presented by number:"
echo "1) Search cases by last name"
echo "2) Search cases by zip code"
echo "3) Search cases by severity"
echo "4) Search cases by prior condition"
echo "5) View summary by status report"
echo "6) View summary by common conditions report"
echo "7) View summary by age group report"
echo "8) View summary by gender report"
echo "9) View confirmed cases by gender report"
echo "10) View total cases by zip code report"
echo "11) View hospitalization report"
echo "12) View possible causes report"
echo "13) Rebuild tables [DDL]"
echo "14) Re-insert data [DML]"
echo "15) Re-grant permissions [DCL]"
echo "E) Exit database"
read useroption

case $useroption in

1)
dbname="rmisra1"
read -p "Enter last name: " last
read -p "Enter row count: " limit
psql $dbname $username << EOF
select * from patients where UPPER(LastName) LIKE UPPER('%$last%') limit $limit;

EOF
;;

2)
dbname="rmisra1"
read -p "Enter zip code: " zip
read -p "Enter row count: " limit
psql $dbname $username << EOF
select * from patients where zipcode LIKE '%$zip%' limit $limit;
EOF
;;

3)
echo "Select a severity level"
echo "1) Severe"
echo "2) Moderate"
echo "3) Slight"
echo "4) None"

read userseveritychoice
case $userseveritychoice in

1)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, severity from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where severity = 'Severe');
EOF
;;

2)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, severity from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where severity = 'Moderate');
EOF
;;

3)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, severity from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where severity = 'Slight');
EOF
;;

4)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, severity from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where severity = 'None');
EOF
;;

*)
echo "Please enter a valid selection"
;;

esac
;;

4)
echo "Select a prior condition"
echo "1) Cardiovascular"
echo "2) Diabetes"
echo "3) Chronic respiratory"
echo "4) Depression, anxiety"
echo "5) Immunocompromised"
echo "6) Chronic renal"
echo "7) Chronic liver"
echo "8) Neurologic disorder"
echo "9) Current smoker"
echo "10) Former smoker"
echo "11) Pregnancy"

read userconditionchoice
case $userconditionchoice in

1)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Cardiovascular' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Cardiovascular');
EOF
;;

2)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Diabetes' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Diabetes');
EOF
;;

3)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Chronic respiratory' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Chronic respiratory');
EOF
;;

4)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Depression, anxiety' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Depression, anxiety');
EOF
;;

5)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Immunocompromised' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Immunocompromised');
EOF
;;

6)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Chronic renal' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Chronic renal');
EOF
;;

7)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Chronic liver' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Chronic liver');
EOF
;;

8)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Neurologic disorder' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Neurologic disorder');
EOF
;;

9)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Current smoker' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Current smoker');
EOF
;;

10)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Former smoker' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Former smoker');
EOF
;;

11)
dbname="rmisra1"
psql $dbname $username << EOF
select ssn, lastname, firstname, dob, gender, street, city, zipcode, 'Pregnancy' as conditionname from patients, priorcondition
where patients.patientid = priorcondition.patientid
and conditionid in (select conditionid from conditions where conditionname = 'Pregnancy');
EOF
;;

*)
echo "Please enter a valid selection"
;;

esac
;;

5)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vw_summary_by_status;
EOF
;;

6)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vw_commonconditions;
EOF
;;

7)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vw_agegroups;
EOF
;;

8)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vw_gender;
EOF
;;

9)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vew_Cases_by_Gender;
EOF
;;

10)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vew_Cases_per_Zipcode;
EOF
;;

11)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vew_Hospitalized_per_Zipcode;
EOF
;;

12)
dbname="rmisra1"
psql $dbname $username << EOF
select * from vew_Cases_per_Cause;
EOF
;;


13)
dbname="rmisra1"
psql $dbname $username << EOF

DROP TABLE IF EXISTS CaseStatus CASCADE;
DROP TABLE IF EXISTS CaseHistory CASCADE;
DROP TABLE IF EXISTS PriorCondition CASCADE;
DROP TABLE IF EXISTS Patients CASCADE;
DROP TABLE IF EXISTS Zip CASCADE;
DROP TABLE IF EXISTS County CASCADE;
DROP TABLE IF EXISTS Conditions CASCADE;
DROP TABLE IF EXISTS Status CASCADE;

CREATE TABLE County (
CountyID INT PRIMARY KEY,
CountyName VARCHAR(20) NOT NULL,
State CHAR(2) NOT NULL
);

CREATE TABLE Zip (
Zipcode CHAR(5) NOT NULL PRIMARY KEY,
CountyID INT NOT NULL REFERENCES County(CountyID)
);

CREATE TABLE Patients (
PatientID INT PRIMARY KEY,
SSN CHAR(9) NOT NULL UNIQUE,
LastName VARCHAR(30) NOT NULL,
FirstName VARCHAR(30) NOT NULL,
DOB DATE NOT NULL,
Gender CHAR(1) Check (Gender IN ('M', 'F')),
Street VARCHAR(100),
City VARCHAR(20),
Zipcode CHAR(5) NOT NULL REFERENCES Zip(Zipcode)
);

CREATE TABLE Conditions (
ConditionID INT PRIMARY KEY,
ConditionName VARCHAR(20) NOT NULL
);

CREATE TABLE PriorCondition (
PatientID INT NOT NULL REFERENCES Patients(PatientID),
ConditionID INT NOT NULL REFERENCES Conditions(ConditionID),
DateStart DATE,
DateEnd DATE,
Severity VARCHAR(20),
PRIMARY KEY (PatientID, ConditionID)
);

CREATE TABLE Status (
StatusID INT PRIMARY KEY,
StatusName VARCHAR(10) NOT NULL
);

CREATE TABLE CaseStatus (
CaseID INT PRIMARY KEY,
StatusID INT NOT NULL REFERENCES Status(StatusID),
PatientID INT NOT NULL REFERENCES Patients(PatientID),
DateStart Date,
PatientLocation VARCHAR(20),
PatientHealth VARCHAR(20),
PossibleCause VARCHAR(100)
);

CREATE TABLE CaseHistory (
HistoryID INT PRIMARY KEY,
StatusID INT NOT NULL REFERENCES Status(StatusID),
PatientID INT NOT NULL REFERENCES Patients(PatientID),
DateStart Date,
DateEnd Date
);

CREATE OR REPLACE VIEW vw_Summary_by_Status
AS
SELECT StatusName,COUNT(*) NumPatients, MIN(DateStart) MinDte, MAX(DateStart) MaxDte
FROM Patients p
INNER JOIN CaseHistory h ON h.PatientID = p.PatientID
INNER JOIN Status s ON s.StatusID = h.StatusID
GROUP BY ROLLUP(s.StatusName);

CREATE OR REPLACE VIEW vw_CommonConditions
AS
SELECT cs.ConditionName, COUNT(*)
FROM CaseStatus s
INNER JOIN PriorCondition p ON p.PatientID = s.PatientID
INNER JOIN Conditions cs on cs.ConditionID = p.ConditionID
GROUP BY cs.ConditionName
ORDER by COUNT(*) DESC;

/* Summary by Gender Report */
CREATE OR REPLACE VIEW vw_Gender
AS
SELECT gender AS "Gender group", COUNT(*) AS "Total Count",
SUM(CASE WHEN s.StatusName = 'Fatal' THEN 1 ELSE 0 End) AS "Fatal Count",
SUM(CASE WHEN s.StatusName = 'Active' THEN 1 ELSE 0 End) AS "Active Count",
SUM(CASE WHEN s.StatusName = 'Recovered' THEN 1 ELSE 0 End) AS "Recovered Count",
SUM(CASE WHEN s.StatusName = 'Negative' THEN 1 ELSE 0 End) AS "Negative Count"
FROM Patients p
INNER JOIN CaseHistory h ON h.PatientID = p.PatientID
INNER JOIN Status s ON s.StatusID = h.StatusID
GROUP BY p.gender;

/* View Hospitalization Report */
CREATE OR REPLACE VIEW vew_Hospitalized_per_Zipcode
AS
SELECT zipcode AS "Zipcode", count(*) AS "Number of Cases Hospitalized"
FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM CaseStatus
    WHERE patientlocation != 'Home')
GROUP BY zipcode;

/* Gender of Confirmed Cases Report */
CREATE OR REPLACE VIEW vew_Cases_by_Gender
AS
SELECT CASE
         WHEN gender = 'M' THEN 'Male'
         ELSE 'Female'
       END
  AS "Gender Group",
  COUNT (*) AS "Confirmed Cases by Gender"
FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM CaseHistory
    WHERE StatusID IN (
        SELECT StatusID
        FROM Status
        WHERE StatusName <> 'Negative'))
GROUP BY gender;

/* Total Number of Cases per Zipcode Report */
CREATE OR REPLACE VIEW vew_Cases_per_Zipcode
AS
SELECT zipcode as "Zipcode", count(*) AS "Total Number of Cases"
FROM Patients
GROUP BY zipcode;

/* How virus was contracted Report */
CREATE OR REPLACE VIEW vew_Cases_per_Cause
AS
SELECT possiblecause AS "Possible Causes", count(*) AS "Number of Cases"
FROM CaseStatus
GROUP BY possiblecause
ORDER BY possiblecause DESC;

DROP TYPE IF EXISTS age_group_type CASCADE;

CREATE TYPE age_group_type AS (
    id INT,
    name VARCHAR
);

DROP FUNCTION IF EXISTS AgeGroup(date) CASCADE;

CREATE FUNCTION AgeGroup(dob date) RETURNS age_group_type
    AS '
DECLARE
    yr INTEGER;
    result age_group_type;
BEGIN
    yr = DATE_PART(''year'', CURRENT_TIMESTAMP) - DATE_PART(''year'', dob);
    CASE
      	WHEN yr > 0 AND yr < 12 THEN
            result = ROW(1, ''under 12'')::age_group_type;
      	WHEN yr >= 12 AND yr < 18 THEN
            result = ROW(2, ''12-18'')::age_group_type;
      	WHEN yr >= 18 AND yr < 25 THEN
            result = ROW(3, ''18-25'')::age_group_type;
        WHEN yr >= 25 AND yr < 35 THEN
            result = ROW(4, ''25-35'')::age_group_type;
        WHEN yr >= 35 AND yr < 45 THEN
            result = ROW(5, ''35-45'')::age_group_type;
        WHEN yr >= 45 AND yr < 55 THEN
            result = ROW(6, ''45-55'')::age_group_type;
        WHEN yr >= 55 AND yr < 65 THEN
            result = ROW(7, ''55-65'')::age_group_type;
      	ELSE
      	    result = ROW(8,''Over 65'')::age_group_type;
     	  END CASE;
        RETURN result;
END;
' LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;

CREATE OR REPLACE VIEW vw_AgeGroups
  AS
  SELECT (agegroup(p.dob)).name,
  SUM(CASE WHEN s.StatusName = 'Fatal' THEN 1 ELSE 0 End) As "Fatal Count",
  SUM(CASE WHEN s.StatusName = 'Active' THEN 1 ELSE 0 End) As "Active Count",
  SUM(CASE WHEN s.StatusName = 'Recovered' THEN 1 ELSE 0 End) As "Recovered Count",
  SUM(CASE WHEN s.StatusName = 'Negative' THEN 1 ELSE 0 End) As "Negative Count"
  FROM Patients p
  INNER JOIN CaseHistory h ON h.PatientID = p.PatientID
  INNER JOIN Status s ON s.StatusID = h.StatusID
  GROUP BY (agegroup(p.dob)).id, (agegroup(p.dob)).name
  ORDER BY (agegroup(p.dob)).id;

DROP SEQUENCE IF EXISTS CaseHistory_SEQ;
CREATE SEQUENCE CaseHistory_SEQ START 32;

CREATE OR REPLACE FUNCTION casehistory_insert() RETURNS trigger AS '
    BEGIN
         INSERT INTO CaseHistory (HistoryID, StatusID, PatientID, DateStart, DateEnd)
         VALUES (nextval(''casehistory_seq''), OLD.StatusID, NEW.PatientID, NEW.DateStart, current_date);
         RETURN NEW;
    END;
    ' LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_casehistory_insert_update on caseHistory;

CREATE TRIGGER tr_casehistory_insert_update
      AFTER UPDATE ON caseStatus
      FOR EACH ROW
      EXECUTE PROCEDURE casehistory_insert();
EOF

echo "Tables rebuilt!"
;;

14)
dbname="rmisra1"
psql $dbname $username << EOF

START TRANSACTION;

SET CONSTRAINTS ALL DEFERRED;

    INSERT INTO County VALUES (1,'Placer','CA');

    INSERT INTO zip VALUES('95631',1);
    INSERT INTO zip VALUES('95648',1);
    INSERT INTO zip VALUES('95650',1);
    INSERT INTO zip VALUES('95658',1);
    INSERT INTO zip VALUES('95661',1);
    INSERT INTO zip VALUES('95663',1);
    INSERT INTO zip VALUES('95668',1);
    INSERT INTO zip VALUES('95678',1);
    INSERT INTO zip VALUES('95677',1);
    INSERT INTO zip VALUES('95681',1);
    INSERT INTO zip VALUES('95701',1);
    INSERT INTO zip VALUES('95703',1);
    INSERT INTO zip VALUES('95713',1);
    INSERT INTO zip VALUES('95715',1);
    INSERT INTO zip VALUES('95714',1);
    INSERT INTO zip VALUES('95717',1);
    INSERT INTO zip VALUES('95722',1);
    INSERT INTO zip VALUES('96141',1);
    INSERT INTO zip VALUES('96140',1);
    INSERT INTO zip VALUES('96143',1);
    INSERT INTO zip VALUES('96142',1);
    INSERT INTO zip VALUES('95724',1);
    INSERT INTO zip VALUES('96146',1);
    INSERT INTO zip VALUES('95728',1);
    INSERT INTO zip VALUES('96145',1);
    INSERT INTO zip VALUES('95736',1);
    INSERT INTO zip VALUES('96148',1);
    INSERT INTO zip VALUES('95747',1);
    INSERT INTO zip VALUES('95746',1);
    INSERT INTO zip VALUES('95765',1);
    INSERT INTO zip VALUES('96161',1);
    INSERT INTO zip VALUES('95603',1);
    INSERT INTO zip VALUES('95602',1);

    INSERT INTO status VALUES(1,'Active');
    INSERT INTO status VALUES(2,'Recovered');
    INSERT INTO status VALUES(3,'Fatal');
    INSERT INTO status VALUES(4,'Negative');

    INSERT INTO conditions VALUES(1,'Cardiovascular');
    INSERT INTO conditions VALUES(2,'Diabetes');
    INSERT INTO conditions VALUES(3,'Chronic respiratory');
    INSERT INTO conditions VALUES(4,'Depression, anxiety');
    INSERT INTO conditions VALUES(5,'Immunocompromised');
    INSERT INTO conditions VALUES(6,'Chronic renal');
    INSERT INTO conditions VALUES(7,'Chronic liver');
    INSERT INTO conditions VALUES(8,'Neurologic disorder');
    INSERT INTO conditions VALUES(9,'Current smoke');
    INSERT INTO conditions VALUES(10,'Former smoker');
    INSERT INTO conditions VALUES(11,'Pregnancy');
    INSERT INTO conditions VALUES(12,'None');

    INSERT INTO Patients VALUES (1001, '555669999', 'Plant', 'Robert', '1948-08-20', 'M', '124 Immigrant Lane', 'Foresthill', '95631');
    INSERT INTO Patients VALUES (1002, '915527788', 'Page', 'Jimmy', '1944-01-09', 'M', '5594 Stairway Road', 'Sheridan', '95681');
    INSERT INTO Patients VALUES (1003, '442317985', 'Jones', 'John Paul', '1946-01-03', 'M', '5594 Stairway Road', 'Alta', '95701');
    INSERT INTO Patients VALUES (1004, '963852774', 'Bonham', 'John', '1948-05-31', 'M', '999 Overthetop Street', 'Troy', '96161');
    INSERT INTO Patients VALUES (2001, '665853696', 'Wilson', 'Ann', '1950-06-19', 'F', '789 Barracuda Street', 'Rocklin', '95663');
    INSERT INTO Patients VALUES (2002, '852741963', 'Wilson', 'Nancy', '1954-03-16', 'F', '789 Barracuda Street', 'Rocklin', '95663');
    INSERT INTO Patients VALUES (3001, '147258369', 'Corgan', 'Billy', '1967-03-17', 'M', '1979 Tonight Street', 'Colfax', '95663');
    INSERT INTO Patients VALUES (3002, '852741996', 'Wretzky', 'Darcy', '1968-05-01', 'F', '2001 Butterfly Drive', 'Roseville', '95677');
    INSERT INTO Patients VALUES (3003, '465852147', 'Iha', 'James', '1968-05-26', 'M', '552 Zero Lane', 'Roseville', '95765');
    INSERT INTO Patients VALUES (3004, '852456321', 'Chamberlain', 'Jimmy', '1964-06-10', 'M', '1010 Siamese Court', 'Roseville', '95678');
    INSERT INTO Patients VALUES (4001, '987654321', 'Homme', 'Josh', '1973-05-17', 'M', '8555 Flow Road', 'Rocklin', '95650');
    INSERT INTO Patients VALUES (4002, '741258963', 'Dalle', 'Brody', '1979-01-01', 'F', '4174 Makketwichu Circle', 'Dutch Flat', '95714');
    INSERT INTO Patients VALUES (4003, '445885566', 'Oliveri', 'Nick', '1971-10-21', 'M', '9515 Saga Drive', 'Roseville', '95746');
    INSERT INTO Patients VALUES (4004, '546789963', 'Hughes', 'Jesse', '1972-09-24', 'M', '4497 Sister Street', 'Carnelian', '96140');
    INSERT INTO Patients VALUES (5001, '225884777', 'Orzolek', 'Karen Lee', '1978-11-22', 'F', '11 Moon Court', 'Newcastle', '95658');
    INSERT INTO Patients VALUES (6001, '785321654', 'Armstrong', 'Emily', '1986-05-06', 'F', '225 Weather Road', 'Lincoln', '95648');
    INSERT INTO Patients VALUES (7001, '654987414', 'White', 'Jack', '1974-07-09', 'M', '199 Wichita Drive', 'Roseville', '95677');
    INSERT INTO Patients VALUES (7002, '998552314', 'White', 'Meg', '1974-12-10', 'F', '199 Wichita Drive', 'Roseville', '95677');
    INSERT INTO Patients VALUES (7003, '236998544', 'Elson', 'Karen', '1979-01-14', 'F', '10 Ball Lane', 'Roseville', '95677');
    INSERT INTO Patients VALUES (7004, '445996633', 'Benson', 'Brendan', '1970-11-14', 'M', '65 Nation Street', 'Weimar', '95736');

    INSERT INTO Patients VALUES (8001, '753951248', 'Morris', 'Zack', '2001-05-04', 'M', '444 Bayside Dr.', 'Roseville', '95678');
    INSERT INTO Patients VALUES (8002, '122558849', 'Kapowski', 'Kelly', '2002-01-22', 'F', '898 Bell Road', 'Rocklin', '95650');
    INSERT INTO Patients VALUES (8003, '111223333', 'Powers', 'Samuel', '2002-11-11', 'M', '996688 Screech St', 'Dutch Flat', '95714');
    INSERT INTO Patients VALUES (8004, '300203000', 'Slater', 'A.C.', '1999-06-28', 'M', '77558 Meat Court', 'Roseville', '95746');
    INSERT INTO Patients VALUES (8005, '988653222', 'Turtle', 'Lisa', '2006-02-14', 'F', '639 President St.', 'Carnelian', '96140');
    INSERT INTO Patients VALUES (8006, '888662222', 'Spano', 'Jesse', '2004-09-30', 'F', '558 Sending Dr.', 'Newcastle', '95658');
    INSERT INTO Patients VALUES (8007, '222233555', 'McGriff', 'Ted', '2010-10-31', 'M', '613 Ranch Road', 'Lincoln', '95648');
    INSERT INTO Patients VALUES (8008, '111447777', 'Hanson', 'Melody', '2009-08-11', 'F', '987 Rain Ave', 'Roseville', '95677');
    INSERT INTO Patients VALUES (8009, '650908000', 'Taylor', 'Brad', '2008-03-22', 'M', '447 Cactus Court', 'Roseville', '95677');
    INSERT INTO Patients VALUES (8010, '001101010', 'Lightfoot', 'Danny', '2001-12-21', 'M', '11 Cool Court', 'Roseville', '95677');
    INSERT INTO Patients VALUES (8011, '998855663', 'River', 'Amy', '1995-06-11', 'F', '789 Maditup St', 'Weimar', '95736');

    INSERT INTO CaseStatus VALUES (1, 1, 1001, '2020-03-14', 'Sutter Auburn Faith',  'Poor', 'Large gathering');
    INSERT INTO CaseStatus VALUES (2, 1, 1002, '2020-03-21', 'Tahoe Forest',  'Fair', 'Large gathering');
    INSERT INTO CaseStatus VALUES (3, 2, 1003, '2020-03-28', 'Home',  'Recovered', 'Workplace exposure');
    INSERT INTO CaseStatus VALUES (4, 3, 1004, '2020-03-12', 'Kaiser Roseville',  'Deceased', 'Unknown');
    INSERT INTO CaseStatus VALUES (5, 4, 2001, '2020-04-11', 'Home',  'Good', 'Not applicable');
    INSERT INTO CaseStatus VALUES (6, 2, 2002, '2020-04-01', 'Vibra Sacramento',  'Fair', 'Workplace exposure');
    INSERT INTO CaseStatus VALUES (7, 1, 3001, '2020-04-06', 'Kaiser Roseville',  'Fair', 'Public gathering');
    INSERT INTO CaseStatus VALUES (8, 4, 3002, '2020-03-27', 'Home',  'Good', 'Not applicable');
    INSERT INTO CaseStatus VALUES (9, 2, 3003, '2020-03-22', 'Home',  'Fair', 'Exposure during errand');
    INSERT INTO CaseStatus VALUES (10, 1, 3004, '2020-03-20', 'Sutter Auburn Faith',  'Poor', 'Unknown');
    INSERT INTO CaseStatus VALUES (11, 1, 4001, '2020-04-09', 'Sutter Auburn Faith',  'Fair', 'Large gathering');
    INSERT INTO CaseStatus VALUES (12, 2, 4002, '2020-04-10', 'Home',  'Fair', 'Large gathering');
    INSERT INTO CaseStatus VALUES (13, 4, 4003, '2020-04-07', 'Home',  'Good', 'Not applicable');
    INSERT INTO CaseStatus VALUES (14, 1, 4004, '2020-04-03', 'Tahoe Forest',  'Poor', 'Workplace exposure');
    INSERT INTO CaseStatus VALUES (15, 4, 5001, '2020-03-20', 'Home',  'Good', 'Not applicable');
    INSERT INTO CaseStatus VALUES (16, 1, 6001, '2020-03-20', 'Sutter Auburn Faith',  'Fair', 'Unknown');
    INSERT INTO CaseStatus VALUES (17, 2, 7001, '2020-03-28', 'Home',  'Fair', 'Exposure during errand');
    INSERT INTO CaseStatus VALUES (18, 2, 7002, '2020-03-27', 'Home',  'Fair', 'Exposure during errand');
    INSERT INTO CaseStatus VALUES (19, 1, 7003, '2020-04-21', 'Kaiser Roseville',  'Fair', 'Workplace exposure');
    INSERT INTO CaseStatus VALUES (20, 1, 7004, '2020-04-11', 'Kaiser Roseville',  'Poor', 'Workplace exposure');
    INSERT INTO CaseStatus VALUES (21, 2, 8001, '2020-04-10', 'Sutter Roseville', 'Fair', 'Large gathering');
    INSERT INTO CaseStatus VALUES (22, 4, 8002, '2020-04-11', 'Sutter Roseville', 'Good', 'Travel Overseas');
    INSERT INTO CaseStatus VALUES (23, 4, 8003, '2020-03-10', 'Sutter Roseville', 'Fair', 'Cruise Ship');
    INSERT INTO CaseStatus VALUES (24, 4, 8004, '2020-04-30', 'Home', 'Good', 'Not applicable');
    INSERT INTO CaseStatus VALUES (25, 4, 8005, '2020-04-16', 'Kaiser Roseville', 'Fair', 'Cruise Ship');
    INSERT INTO CaseStatus VALUES (26, 4, 8006, '2020-04-05', 'Kaiser Roseville', 'Good', 'Cruise Ship');
    INSERT INTO CaseStatus VALUES (27, 4, 8007, '2020-03-30', 'Sutter Auburn Faith', 'Fair', 'Not applicable');
    INSERT INTO CaseStatus VALUES (28, 4, 8008, '2020-04-07', 'Sutter Roseville', 'Good', 'Travel Overseas');
    INSERT INTO CaseStatus VALUES (29, 2, 8009, '2020-04-02', 'Sutter Auburn Faith', 'Fair', 'Large gathering');
    INSERT INTO CaseStatus VALUES (30, 4, 8010, '2020-03-25', 'Kaiser Roseville', 'Good', 'Travel Overseas');
    INSERT INTO CaseStatus VALUES (31, 4, 8011, '2020-03-29', 'Home', 'Good', 'Not applicable');

    INSERT INTO CaseHistory VALUES (1, 1, 1001, '2020-03-14');
    INSERT INTO CaseHistory VALUES (2, 1, 1002, '2020-03-21');
    INSERT INTO CaseHistory VALUES (3, 2, 1003, '2020-03-28', '2020-04-06');
    INSERT INTO CaseHistory VALUES (4, 3, 1004, '2020-03-12', '2020-04-12');
    INSERT INTO CaseHistory VALUES (5, 4, 2001, '2020-04-11', '2020-04-11');
    INSERT INTO CaseHistory VALUES (6, 2, 2002, '2020-04-01', '2020-04-08');
    INSERT INTO CaseHistory VALUES (7, 1, 3001, '2020-04-06');
    INSERT INTO CaseHistory VALUES (8, 4, 3002, '2020-03-27', '2020-03-27');
    INSERT INTO CaseHistory VALUES (9, 2, 3003, '2020-03-22', '2020-03-29');
    INSERT INTO CaseHistory VALUES (10, 1, 3004, '2020-03-20');
    INSERT INTO CaseHistory VALUES (11, 1, 4001, '2020-04-09');
    INSERT INTO CaseHistory VALUES (12, 2, 4002, '2020-04-10', '2020-04-18');
    INSERT INTO CaseHistory VALUES (13, 4, 4003, '2020-04-07', '2020-04-07');
    INSERT INTO CaseHistory VALUES (14, 1, 4004, '2020-04-03');
    INSERT INTO CaseHistory VALUES (15, 4, 5001, '2020-03-20', '2020-03-20');
    INSERT INTO CaseHistory VALUES (16, 1, 6001, '2020-03-20');
    INSERT INTO CaseHistory VALUES (17, 2, 7001, '2020-03-28', '2020-04-10');
    INSERT INTO CaseHistory VALUES (18, 2, 7002, '2020-03-27', '2020-04-05');
    INSERT INTO CaseHistory VALUES (19, 1, 7003, '2020-04-21');
    INSERT INTO CaseHistory VALUES (20, 1, 7004, '2020-04-11');

    INSERT INTO CaseHistory VALUES (21, 2, 8001, '2020-03-14', '2020-03-21');
    INSERT INTO CaseHistory VALUES (22, 4, 8002, '2020-04-11');
    INSERT INTO CaseHistory VALUES (23, 4, 8003, '2020-03-10');
    INSERT INTO CaseHistory VALUES (24, 4, 8004, '2020-04-30');
    INSERT INTO CaseHistory VALUES (25, 4, 8005, '2020-04-16');
    INSERT INTO CaseHistory VALUES (26, 4, 8006, '2020-04-05');
    INSERT INTO CaseHistory VALUES (27, 4, 8007, '2020-03-30');
    INSERT INTO CaseHistory VALUES (28, 4, 8008, '2020-04-07');
    INSERT INTO CaseHistory VALUES (29, 2, 8009, '2020-04-02', '2020-04-07');
    INSERT INTO CaseHistory VALUES (30, 4, 8010, '2020-03-25');
    INSERT INTO CaseHistory VALUES (31, 4, 8011, '2020-03-29');

    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (1001, 3, '2020-03-14', 'Severe');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (1002, 1, '2020-03-21', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (1003, 10, '2020-03-28', '2020-04-06', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (1004, 3, '2020-03-12', '2020-04-12', 'Severe');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (2001, 4, '2020-04-11', '2020-04-11', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (2002, 5, '2020-04-01', '2020-04-08', 'Slight');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (3001, 9, '2020-04-06', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (3002, 11, '2020-03-27', '2020-03-27', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (3003, 6, '2020-03-22', '2020-03-29', 'Slight');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (3004, 1, '2020-03-20', 'Severe');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (4001, 7, '2020-04-09', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (4002, 10, '2020-04-10', '2020-04-18', 'Slight');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (4003, 2, '2020-04-07', '2020-04-07', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (4004, 1, '2020-04-03', 'Severe');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (5001, 4, '2020-03-20', '2020-03-20', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (6001, 7, '2020-03-20', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (7001, 8, '2020-03-28', '2020-04-10', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (7002, 5, '2020-03-27', '2020-04-05', 'Severe');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (7003, 9 ,'2020-04-21', 'Moderate');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, Severity) VALUES (7004, 6,'2020-04-11', 'Slight');

    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8001, 2, '2020-03-14', '2020-03-21', 'Slight');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8002, 4, '2020-04-11', '2020-04-11', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8003, 4, '2020-03-10', '2020-03-10', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8004, 4, '2020-04-30', '2020-04-30', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8005, 4, '2020-04-16', '2020-04-16', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8006, 4, '2020-04-05', '2020-04-05', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8007, 4, '2020-03-30', '2020-03-30', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8008, 4, '2020-04-07', '2020-04-07', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8009, 2, '2020-04-02', '2020-04-07', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8010, 4, '2020-03-25', '2020-03-25', 'None');
    INSERT INTO PriorCondition (PatientID, ConditionID, DateStart, DateEnd, Severity) VALUES (8011, 4, '2020-03-29', '2020-03-29', 'None');

    SET CONSTRAINTS ALL IMMEDIATE;
    COMMIT TRANSACTION;

EOF

echo "Data re-inserted!"
;;

15)
dbname="rmisra1"
psql $dbname $username << EOF

REVOKE ALL ON County, Zip, Patients, Conditions, PriorCondition, Status, CaseStatus, CaseHistory FROM mpetrovich2;
REVOKE ALL ON County, Zip, Patients, Conditions, PriorCondition, Status, CaseStatus, CaseHistory FROM nfairneny;
REVOKE ALL ON County, Zip, Patients, Conditions, PriorCondition, Status, CaseStatus, CaseHistory FROM dkyubwa;

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER ON County, Zip, Patients, Conditions, PriorCondition,Status, CaseStatus, CaseHistory TO mpetrovich2 WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER ON County, Zip, Patients, Conditions, PriorCondition,Status, CaseStatus, CaseHistory TO nfairneny WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER ON County, Zip, Patients, Conditions, PriorCondition,Status, CaseStatus, CaseHistory TO dkyubwa WITH GRANT OPTION;
EOF

echo "Permissions re-granted!"
;;

E|e)
echo "Exiting database..."
exit
;;

*)
echo "Please enter a valid selection"

esac
done
