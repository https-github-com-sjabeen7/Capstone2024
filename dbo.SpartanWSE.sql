CREATE TABLE [dbo].[SpartanWSE] (
  [UserId] [nvarchar](50) NOT NULL,
  [Gender] [nvarchar](50) NOT NULL,
  [Locale] [nvarchar](50) NOT NULL,
  [TotalPoints] [tinyint] NOT NULL,
  [HRA_Question_Complete] [tinyint] NULL,
  [Biometrics_Complete] [tinyint] NULL,
  [Option_1] [nvarchar](1) NULL,
  [Option_2] [nvarchar](1) NULL,
  [Completion] [tinyint] NULL,
  [Session_Complete] [tinyint] NULL,
  [Adjustments_Redemptions] [nvarchar](1) NULL,
  [Behavioral] [tinyint] NULL,
  [Behavioral_Incentive_Value] [nvarchar](1) NULL,
  [Behavioral_Met_Date] [datetime2] NULL,
  [High_Risk_Counter] [tinyint] NULL,
  [High_Risk_Counter_Incentive_Value] [nvarchar](1) NULL,
  [High_Risk_Counter_Met_Date] [datetime2] NULL,
  CONSTRAINT [PK_SpartanWSE] PRIMARY KEY CLUSTERED ([UserId])
)
ON [PRIMARY]
GO