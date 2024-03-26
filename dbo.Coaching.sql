CREATE TABLE [dbo].[Coaching] (
  [CoachID] [tinyint] NOT NULL,
  [Coaching_Types] [nvarchar](100) NOT NULL,
  [CoachingTypeLookup] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_Coaching] PRIMARY KEY CLUSTERED ([CoachID])
)
ON [PRIMARY]
GO