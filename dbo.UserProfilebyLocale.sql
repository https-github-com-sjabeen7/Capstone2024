CREATE TABLE [dbo].[UserProfilebyLocale] (
  [UserId] [nvarchar](50) NOT NULL,
  [Locale] [nvarchar](50) NOT NULL,
  [Gender] [nvarchar](50) NOT NULL,
  [Weight] [nvarchar](50) NULL,
  [Height] [nvarchar](50) NULL,
  [GoalWeightDisplay] [nvarchar](50) NULL,
  [DailyStepsGoal] [smallint] NULL,
  [PostalCode] [nvarchar](50) NULL,
  [Udf1] [nvarchar](50) NULL,
  CONSTRAINT [PK_UserProfilebyLocale] PRIMARY KEY CLUSTERED ([UserId])
)
ON [PRIMARY]
GO