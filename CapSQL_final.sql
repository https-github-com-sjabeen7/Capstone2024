--CAPSTONE 2024:  EHG Data Repository and Query Development using SSMS:  Kay Kellerhouse, Mal Embry, Saiyida Jabeen

--This set of queries auto calculates and populates the following fields in the Aggregate Bryan/Spart worksheet

--STEP_1:  ***This ALTER TABLE query should only be run once after the Excel file has been imported***
USE Capstone2024
GO
ALTER TABLE dbo.EHGAggregateTable_Importb
ADD 
	Age							varchar(6) null,
	RiskLevel					varchar(8) null,
	DiagnosedDM					int null,
	UndiagnosedDM				int null,
	ControlledDM				int null,
	Diabetes1					varchar(12) null,
	A1C1						varchar(12) null,
	Glucose1					varchar(12) null,
	BloodPressure				varchar(30) null,
	CountNormalBP			    int null,
	CountPrehyper				int null,
	CountHyper					int null,
	BPMeds						varchar(30) null,
	BPMedStatus					varchar(10) null,
	TotalCholesterol			varchar(10) null,
	HDL							varchar(10) null,
	LDL							varchar(10) null,
	Triglyceride				varchar(10) null,
	BMI							varchar(20) null,
	WaistCircum					varchar(20) null,
	CountofWCMale40				int null,
	CountofWCMale40a			int null,
	CountofWCFemale35			int null,
	CountofWCFemale35a			int null,
	TobaccoUse					char(1) null,
	TobaccoProducts				varchar(10) null,
	IntenttoQuit				varchar(10) null,
	Overwhelmed					varchar(3) null,
	BPReferral					varchar(10) null,
	DMReferral					varchar(10) null,
	TGReferral					varchar(10) null
	
--SELECT * FROM EHGAggregateTable_Importb

--Provides Locale Lookups based on Lookup Values from main report
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET LocaleUse =
CASE 
	WHEN Locale ='Bryan County'								THEN 'Bryan County'
	WHEN Locale ='Bryan Terminated'							THEN 'Bryan Terminated'
	WHEN Locale ='Spartanburg Simms'						THEN 'Simms'
	WHEN Locale ='Spartanburg Collection and Distribution'  THEN 'Collection & Distribution'
	WHEN Locale ='Spartanburg Admin'						THEN 'Admin'
	WHEN Locale ='Spartanburg Water'						THEN 'Water'
	WHEN Locale ='Lawrenceville City Hall'					THEN 'Lawrenceville City Hall'
	WHEN Locale ='Lawrenceville Public Safety'				THEN 'Lawrenceville Public Safety'
	WHEN Locale ='Lawrenceville Public Works'				THEN 'Lawrenceville Public Works'
	WHEN Locale ='Lawrenceville Remote'						THEN 'Lawrenceville Remote'
	WHEN Locale ='Lawrenceville Terminated'					THEN 'Lawrenceville Terminated'
ELSE 'N/A'
END 

--Correctly identifies user gender
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Gender1 = 
CASE
		WHEN Gender='Female' THEN 'Female'
		WHEN Gender='F' THEN 'Female'
		WHEN Gender='Male' THEN 'Male'
		WHEN Gender='M' THEN 'Male'
END

--Correctly Identifies Age Range
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Age =
CASE 
	WHEN Age_Question >=60  THEN '60+'
	WHEN Age_Question BETWEEN 50 AND 59 THEN '50-59'
	WHEN Age_Question BETWEEN 40 AND 49 THEN '40-49'
	WHEN Age_Question BETWEEN 30 AND 39 THEN '30-39'
	WHEN Age_Question <30 THEN '<30'
	ELSE ''
END 

--Determines Risk Level for Aggregate Report (Bryan & Spart) 
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb
SET RiskLevel =
CASE 
	WHEN EHGRiskIndicator_Risk >=50  THEN 'High'
	WHEN EHGRiskIndicator_Risk < 5   THEN 'Low'
	WHEN EHGRiskIndicator_Risk BETWEEN 5 AND 49 THEN 'Moderate'
	ELSE ''
END 

--Determines Dx'd DM
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET DiagnosedDM =
CASE 
	WHEN Diabetes_Question =1 THEN '1'
		ELSE '0'
END 

--Determines Undx'd DM
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET UndiagnosedDM =
CASE 
	WHEN Diabetes_Question =0 AND A1C_Question >=6.5 THEN '1'
		ELSE '0'
END 


--Determines if the mbr Dx is Controlled --check for nulls; A1C trumps Glucose - more accurate, diagnostic; glucose is plan B
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET ControlledDM =
CASE 
	WHEN Diabetes_Question =1 AND A1C_Question <7 THEN '1'
		ELSE '0'
END 


--Determines the level of A1C:  Normal, Pre-Diabetic, Diabetic- A1C trumps Glucose
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET A1C1 =
CASE 
	WHEN dbo.EHGAggregateTable_Importb.A1C_Question >=6.5 THEN 'Diabetic'
	WHEN dbo.EHGAggregateTable_Importb.A1C_Question <5.7 THEN 'Normal'
	WHEN dbo.EHGAggregateTable_Importb.A1C_Question between 5.7 and 6.4 THEN 'Pre-Diabetic'
		ELSE ''
END 


--Determines the level of Glucose:  Normal, Pre-Diabetic, Diabetic- A1C trumps Glucose
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Glucose1 =
CASE 
	WHEN dbo.EHGAggregateTable_Importb.GLU_Question >=120 THEN 'Diabetic'
	WHEN dbo.EHGAggregateTable_Importb.GLU_Question <100 THEN 'Normal'
	WHEN dbo.EHGAggregateTable_Importb.GLU_Question between 100 and 119 THEN 'Pre-Diabetic'
		ELSE ''
END 


 --Determines the level of Diabetes:  Normal, Pre-Diabetic, Diabetic- A1C trumps Glucose
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Diabetes1 =
CASE 
	WHEN dbo.EHGAggregateTable_Importb.A1C1 is null THEN Glucose1 ELSE A1C1
END 


--Determines BP range
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET BloodPressure =
CASE 
	WHEN SBP_Question <=120 AND DBP_Question <=80 THEN 'Normal <=120/80'
	WHEN SBP_Question between 120 and 139 AND DBP_Question between 80 and 89 THEN 'Prehypertension 120/80-139/89' 
	WHEN SBP_Question >=140 AND DBP_Question >=90 THEN 'Prehypertension 120/80-139/89'
	ELSE ''
END 


--Determines Normal BPs <=120/80
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountNormalBP =
CASE 
	WHEN SBP_Question <=120 AND DBP_Question <=80 THEN '1' ELSE '0'
END

--Determines Prehypertensive BPs 120/80-139/89
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountPrehyper =
CASE 
	WHEN SBP_Question between 120 and 139 OR DBP_Question BETWEEN 80 AND 89 THEN '1' ELSE '0'
END 


--Determines Hypertension BPs 
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountHyper =
CASE 
	WHEN SBP_Question >=140 OR DBP_Question >=90 THEN '1' ELSE '0'
END 


--Determines BP Meds
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET BPMeds =
CASE 
	WHEN BPMeds_Question >=1 THEN '1' ELSE '0'
END 

--Determines levels of BP based on BP/Meds - **Change data type for BPMedStatus**
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET BPMedStatus =
CASE 
	WHEN SBP_Question <=120 AND DBP_Question <=80 THEN 'Normal' 
	WHEN SBP_Question between 120 and 139 AND DBP_Question BETWEEN 80 AND 89 THEN 'Prehyper' 
	WHEN SBP_Question >=140 AND DBP_Question >=90 THEN 'Hyper'
	ELSE ''
END 

--Determines Total Cholesterol
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET TotalCholesterol =
CASE 
	WHEN TC_Question >=240 THEN '240' 
	WHEN TC_Question <160 THEN '<160' 
	WHEN TC_Question >=160 AND TC_QUESTION <=199 THEN '160-199'
	WHEN TC_Question >=200 AND TC_QUESTION <=239 THEN '200-239'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb

--Determines HDL
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET HDL =
CASE 
	WHEN HDL_Question >=60 THEN '>=60' 
	WHEN HDL_Question <40 THEN '<40' 
	WHEN HDL_Question >=40 AND HDL_Question <60 THEN '40-59'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb

--Determines LDL
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET LDL =
CASE 
	WHEN LDL_Question >=190 THEN '>=190' 
	WHEN LDL_Question <100 THEN '<100' 
	WHEN LDL_Question >=100 AND LDL_Question <=129 THEN '100-129'
	WHEN LDL_Question >=130 AND LDL_Question <=159 THEN '130-159'
	WHEN LDL_Question >=160 AND LDL_Question <=189 THEN '160-189'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb

--Determines Triglycerides
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Triglyceride =
CASE 
	WHEN TRIG_Question >=500 THEN '>=500' 
	WHEN TRIG_Question <150 THEN '<150' 
	WHEN TRIG_Question >=150 AND TRIG_Question <=199 THEN '150-199'
	WHEN TRIG_Question >=200 AND TRIG_Question <=499 THEN '200-499'
	ELSE ''
END 


--Determines BMI
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET BMI =
CASE 
	WHEN BMI_Question >=30 THEN '>=30' 
	WHEN BMI_Question <25 THEN '<25' 
	WHEN BMI_Question >=25 AND BMI_Question <=29.9 THEN '25-29.9'
	ELSE ''
END 


--Determines Waist Circumference
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET WaistCircum =
CASE 
	WHEN CountofWCMale40 <40   THEN 'Male <40in' 
	WHEN CountofWCMale40a >=40 THEN 'Male >=40in'
	WHEN CountofWCFemale35 <35 THEN 'Female <35in'
	WHEN CountofWCFemale35 >=35 THEN 'Female >=35in'
	ELSE ''
END 


--Determines Waist Circumference - MALES <40
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountofWCMale40 =
CASE 
	WHEN WAIST_Question <40 THEN '1'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb
WHERE Gender = 'Male'

--Determines Waist Circumference - MALES >=40
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountofWCMale40a =
CASE 
	WHEN WAIST_Question >=40 THEN '1'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb
WHERE Gender = 'Male'

--Determines Waist Circumference - FEMALES <35
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountofWCFemale35 =
CASE 
	WHEN WAIST_Question <40 THEN '1'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb
WHERE Gender = 'Female'

--Determines Waist Circumference - FEMALES >=35
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET CountofWCFemale35a =
CASE 
	WHEN WAIST_Question <40 THEN '1'
	ELSE ''
END 
from dbo.EHGAggregateTable_Importb
WHERE Gender = 'Female'

--Determines Tobacco Usage
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET TobaccoUse =
CASE 
	WHEN Tobacco_Question >0 THEN '1'
	ELSE ''
END 

--Determines types of tobacco uses
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET TobaccoProducts =
CASE WHEN Tobaccoproducts_Question =1 THEN 'Cigarettes'
     WHEN Tobaccoproducts_Question =2 THEN 'Smokeless'
     WHEN Tobaccoproducts_Question =3 THEN 'Vape'
     WHEN Tobaccoproducts_Question in (1,2) or Tobaccoproducts_Question IN (1,3) or Tobaccoproducts_Question in (2,3) or 
	Tobaccoproducts_Question in (1,2,3) THEN 'Multiple'
	ELSE ''
END 

--Determines expected time to quit tobacco -= includes Never
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET IntenttoQuit =
CASE 
	WHEN QuitTobacco_Question =1 THEN '30 Days' 
	WHEN QuitTobacco_Question =2 THEN '6 months' 
	WHEN QuitTobacco_Question =3 THEN 'Never'
	ELSE ''
END 


--Determines if the member is Overwhelmed:
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET Overwhelmed =
CASE 
	WHEN overwhelmed_Question =1 THEN 'Yes' ELSE 'No'
END 


--Determines if member needs a BP Referral:
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET BPReferral =
CASE 
	WHEN SBP_Question >=160 THEN 'Immediate'
	WHEN SBP_Question between 140 and 159 THEN 'At Risk'
	WHEN DBP_Question >=100 THEN 'Immediate'
	WHEN DBP_Question between 90 and 99 THEN 'At Risk'
	ELSE ''
END 


--Determines if member needs a DM Referral: ***Ask about LOGIC for GLU Questions***
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET DMReferral =
CASE 
	WHEN Diabetes_Question =1 and A1C_Question >=8   THEN 'Immediate'
	WHEN Diabetes_Question =1 and A1C_Question >=7   THEN 'At Risk'
	WHEN Diabetes_Question =0 and A1C_Question >=6.5 THEN 'Immediate'
	WHEN Diabetes_Question =0 and A1C_Question >=5.7 THEN 'At Risk'
	WHEN Diabetes_Question =1 and GLU_Question between 200 and 240 THEN 'Immediate'
	WHEN Diabetes_Question =1 and GLU_Question between 100 and 126 THEN 'At Risk'
	ELSE ''
END  


--Determines if member needs a TG Referral: 
use Capstone2024
UPDATE dbo.EHGAggregateTable_Importb 
SET TGReferral =
CASE 
	WHEN TRIG_Question >=500 THEN 'Immediate'
		ELSE ''
END 

SELECT * FROM dbo.EHGAggregateTable_Importb

------------------------------------------------------------------------------------------------------------------------------------
--WISH LIST QUERIES

--Total Users by Locale
SELECT count(DISTINCT dbo.EHGAggregateTable_Importb.UserId) as TotalUsers, Locale
FROM dbo.EHGAggregateTable_Importb
WHERE Locale is not null
GROUP BY Locale

--Total Registered Users by Locale
SELECT count (DISTINCT dbo.UserRegLogins.UserId) as RegisteredUsers, Locale
from dbo.UserRegLogins
WHERE Locale is not null
GROUP BY Locale

--Total Registered Users That Accepted/Declined 
SELECT count (DISTINCT dbo.UserRegLogins.LicenseAcceptedDate) as AcceptedUsers, Locale
from dbo.UserRegLogins
WHERE Locale is not null
GROUP BY Locale

SELECT count (DISTINCT dbo.UserRegLogins.LicenseDeclinedDate) as DeclinedUsers, Locale
from dbo.UserRegLogins
WHERE Locale is not null
GROUP BY Locale

--Breakdown of Risk Levels:



--Total Activity Syncs by User by Locale
SELECT count (DISTINCT dbo.ActivityDeviceSyncs.UserId) as TotalSyncsbyUser, Locale
from dbo.ActivityDeviceSyncs
WHERE Locale is not null
GROUP BY Locale