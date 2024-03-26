CREATE TABLE [dbo].[MobileAppCode] (
  [UserId] [nvarchar](50) NOT NULL,
  [Group1] [nvarchar](50) NOT NULL,
  [Generated] [tinyint] NOT NULL,
  [Linked] [tinyint] NOT NULL,
  [Generated2] [tinyint] NOT NULL,
  [Linked3] [tinyint] NOT NULL,
  [Generated1] [smallint] NOT NULL,
  [Linked1] [smallint] NOT NULL,
  CONSTRAINT [PK_MobileAppCode] PRIMARY KEY CLUSTERED ([UserId])
)
ON [PRIMARY]
GO