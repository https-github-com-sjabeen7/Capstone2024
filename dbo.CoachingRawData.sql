CREATE TABLE [dbo].[CoachingRawData] (
  [CoachProgramSetName1] [nvarchar](100) NOT NULL,
  [Name] [nvarchar](100) NOT NULL,
  [ProgramTypeDesc] [nvarchar](50) NOT NULL,
  [UserId] [nvarchar](50) NOT NULL,
  [Username] [nvarchar](1) NULL,
  [DOB] [nvarchar](1) NULL,
  [FirstName] [nvarchar](1) NULL,
  [LastName] [nvarchar](1) NULL,
  [LocaleName] [nvarchar](50) NOT NULL,
  [Language] [nvarchar](1) NULL,
  [EmailAddress] [nvarchar](1) NULL,
  [HomePhone] [nvarchar](1) NULL,
  [WorkPhone] [nvarchar](1) NULL,
  [BookedDTm] [datetime2] NOT NULL,
  [PreviousAppointment] [nvarchar](50) NULL,
  [PrevSessionCoach] [nvarchar](50) NULL,
  [NextSessionStart] [datetime2] NULL,
  [NextSessionCoach] [nvarchar](50) NULL,
  [SesssionsCompleted] [bit] NULL,
  [Textbox12] [tinyint] NOT NULL,
  [OverdueSession] [nvarchar](1) NULL,
  [CompleteDate] [date] NULL,
  [CompleteDate2] [int] NULL
)
ON [PRIMARY]
GO