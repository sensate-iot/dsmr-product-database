CREATE TABLE [dbo].[ProductTokens]
(
	[Id]               UNIQUEIDENTIFIER          NOT NULL,
	[UserId]           UNIQUEIDENTIFIER          NOT NULL,
	[Token]            UNIQUEIDENTIFIER          NOT NULL,
	[OnboardingToken]  UNIQUEIDENTIFIER          NOT NULL,
	[Enabled]          BIT                       NOT NULL DEFAULT(1),
	[Timestamp]        DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_ProductTokens] PRIMARY KEY NONCLUSTERED ([Id]),
	INDEX [IX_ProductTokens_Token] UNIQUE NONCLUSTERED ([Token]),
	INDEX [IX_ProductTokens_OnboardingToken] UNIQUE NONCLUSTERED ([OnboardingToken]),
	CONSTRAINT [FK_ProductTokens_Users] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
