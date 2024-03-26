CREATE TABLE [dbo].[ActivityDeviceSyncs] (
  [UserId] [nvarchar](50) NOT NULL,
  [Locale] [nvarchar](50) NOT NULL,
  [Type1] [nvarchar](50) NOT NULL,
  [Source] [nvarchar](50) NOT NULL,
  [LastSyncLocal] [nvarchar](50) NOT NULL
)
ON [PRIMARY]
GO