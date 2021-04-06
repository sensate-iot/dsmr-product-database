CREATE TABLE [dbo].[Users]
(
	[Id]                        UNIQUEIDENTIFIER          NOT NULL,
	[CustomerId]                UNIQUEIDENTIFIER          NOT NULL,
	[FirstName]					NVARCHAR(64)	          NOT NULL,
	[LastName]                  NVARCHAR(64)              NOT NULL,
	[Email]                     NVARCHAR(64)              NOT NULL,
	[Enabled]					BIT		                  NOT NULL,
	[Timestamp]                 DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED ([Id]),
	CONSTRAINT [FK_Users_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
