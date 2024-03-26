CREATE TABLE [dbo].[UserRegLogins] (
  [UserId] [nvarchar](50) NOT NULL,
  [Locale] [nvarchar](50) NOT NULL,
  [CreateDate] [date] NULL,
  [LicenseAcceptedDate] [date] NULL,
  [LicenseDeclinedDate] [date] NULL,
  [LastLoginDate] [date] NULL,
  [LoginCount] [smallint] NOT NULL,
  CONSTRAINT [PK_UserRegLogins] PRIMARY KEY CLUSTERED ([UserId])
)
ON [PRIMARY]
GO