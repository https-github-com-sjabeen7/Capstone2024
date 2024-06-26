﻿CREATE TABLE [dbo].[EHGAggregateTable_Importb] (
  [UserId] [nvarchar](50) NOT NULL,
  [Date] [datetime2] NULL,
  [IsComplete] [bit] NULL,
  [LastUpdateDTm] [datetime2] NULL,
  [Gender] [nvarchar](50) NULL,
  [Locale] [nvarchar](50) NULL,
  [EmploymentStatus] [nvarchar](50) NULL,
  [ProgramStatus] [nvarchar](50) NULL,
  [A1C_Question] [float] NULL,
  [AGE_Question] [tinyint] NULL,
  [BMI_Question] [float] NULL,
  [BPMeds_Question] [tinyint] NULL,
  [BPStratPointCalc_Question] [tinyint] NULL,
  [DBP_Question] [tinyint] NULL,
  [DIABETES_Question] [bit] NULL,
  [Eat1USA_Question] [float] NULL,
  [Eat2USA_Question] [float] NULL,
  [EnduranceDuration_Question] [tinyint] NULL,
  [EnduranceFrequency_Question] [tinyint] NULL,
  [Flexibility_Question] [tinyint] NULL,
  [GLU_Question] [smallint] NULL,
  [HDL_Question] [tinyint] NULL,
  [LDL_Question] [smallint] NULL,
  [overwhelmed_Question] [bit] NULL,
  [QuitTobacco_Question] [tinyint] NULL,
  [Resistance_Question] [tinyint] NULL,
  [SBP_Question] [tinyint] NULL,
  [TC_Question] [smallint] NULL,
  [Tobacco_Question] [bit] NULL,
  [TobaccoProducts_Question] [float] NULL,
  [TRIG_Question] [smallint] NULL,
  [WAIST_Question] [tinyint] NULL,
  [Weight_Question] [float] NULL,
  [EHGHighRiskCounter_Risk] [float] NULL,
  [EHGRiskIndicator_Risk] [tinyint] NULL,
  [Age] [varchar](6) NULL,
  [RiskLevel] [varchar](8) NULL,
  [DiagnosedDM] [int] NULL,
  [UndiagnosedDM] [int] NULL,
  [ControlledDM] [int] NULL,
  [Diabetes1] [varchar](12) NULL,
  [A1C1] [varchar](12) NULL,
  [Glucose1] [varchar](12) NULL,
  [BloodPressure] [varchar](30) NULL,
  [CountNormalBP] [int] NULL,
  [CountPrehyper] [int] NULL,
  [CountHyper] [int] NULL,
  [BPMeds] [varchar](30) NULL,
  [BPMedStatus] [varchar](10) NULL,
  [TotalCholesterol] [varchar](10) NULL,
  [HDL] [varchar](10) NULL,
  [LDL] [varchar](10) NULL,
  [Triglyceride] [varchar](10) NULL,
  [BMI] [varchar](20) NULL,
  [WaistCircum] [varchar](20) NULL,
  [CountofWCMale40] [int] NULL,
  [CountofWCMale40a] [int] NULL,
  [CountofWCFemale35] [int] NULL,
  [CountofWCFemale35a] [int] NULL,
  [TobaccoUse] [char](1) NULL,
  [TobaccoProducts] [varchar](10) NULL,
  [IntenttoQuit] [varchar](10) NULL,
  [Overwhelmed] [varchar](3) NULL,
  [BPReferral] [varchar](10) NULL,
  [DMReferral] [varchar](10) NULL,
  [TGReferral] [varchar](10) NULL,
  CONSTRAINT [PK_EHGAggregateTable_Importb] PRIMARY KEY CLUSTERED ([UserId])
)
ON [PRIMARY]
GO