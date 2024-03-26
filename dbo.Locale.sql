CREATE TABLE [dbo].[Locale] (
  [LocaleID] [tinyint] NOT NULL,
  [Locale_for_PBI] [nvarchar](50) NOT NULL,
  [LocaleLookup] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_Locale] PRIMARY KEY CLUSTERED ([LocaleID])
)
ON [PRIMARY]
GO