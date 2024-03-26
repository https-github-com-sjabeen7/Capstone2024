CREATE TABLE [dbo].[All3WSESummary] (
  [UserId] [nvarchar](50) NOT NULL,
  [WellnessScoreLocaleText] [nvarchar](50) NOT NULL,
  [UserLocale] [nvarchar](50) NOT NULL,
  [TotalPoints] [tinyint] NOT NULL,
  [Text] [varchar](max) NULL,
  [ActualPoints] [tinyint] NULL,
  [ThresholdMetStr] [bit] NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO