CREATE TABLE [dbo].[Customers]
(
	[Id]                        UNIQUEIDENTIFIER          NOT NULL,
	[FirstName]					NVARCHAR(64)              NOT NULL,
	[LastName]                  NVARCHAR(64)              NOT NULL,
	[Email]                     NVARCHAR(64)              NOT NULL,
	[Msisdn]                    BIGINT                    NOT NULL,
	[Timestamp]                 DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_Customers] PRIMARY KEY NONCLUSTERED ([Id] ASC)
)
