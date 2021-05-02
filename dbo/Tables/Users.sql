CREATE TABLE [dbo].[Users]
(
	[Id]                        UNIQUEIDENTIFIER          NOT NULL,
	[CustomerId]                UNIQUEIDENTIFIER          NOT NULL,
	[FirstName]					NVARCHAR(64)	          NOT NULL,
	[LastName]                  NVARCHAR(64)              NOT NULL,
	[Email]                     NVARCHAR(64)              NOT NULL,
	[Msisdn]                    BIGINT                    NOT NULL,
	[Enabled]					BIT		                  NOT NULL,
	[OnboardingToken]           NVARCHAR(40)              NULL,
	[Timestamp]                 DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED ([Id]),
	CONSTRAINT [FK_Users_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	INDEX [IX_Users_OnboardingToken] UNIQUE NONCLUSTERED ([OnboardingToken])
)
