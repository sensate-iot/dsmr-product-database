CREATE TABLE [dbo].[ProductTokens]
(
	[Id]               UNIQUEIDENTIFIER          NOT NULL,
	[UserId]           UNIQUEIDENTIFIER          NOT NULL,
	[Token]            UNIQUEIDENTIFIER          NOT NULL,
	[OnboardingToken]  UNIQUEIDENTIFIER          NOT NULL,
	[Timestamp]        DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_ProductTokens] PRIMARY KEY NONCLUSTERED ([Id]),
	CONSTRAINT [FK_ProductTokens_Users] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
