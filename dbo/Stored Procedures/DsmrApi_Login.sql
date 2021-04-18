CREATE PROCEDURE [DsmrApi_Login]
	@email NVARCHAR(64),
	@token NVARCHAR(40)
AS
BEGIN
	BEGIN TRANSACTION [t]

	DECLARE @userId UNIQUEIDENTIFIER;

	SELECT @userId = [Id]
	FROM [dbo].[Users]
	WHERE [OnboardingToken] = @token
	  AND [Enabled] = 0
	  AND [Email] = @email

	UPDATE [dbo].[Users]
	SET [Enabled] = 1
	WHERE [Id] = @userId

	SELECT TOP(1) @userId AS [UserId]
		         ,[Token]
		         ,CONVERT(BIT, @@ROWCOUNT) AS [UserOnboarded]
	FROM [dbo].[ProductTokens]
	WHERE [UserId] = @userId

	COMMIT TRANSACTION [t]
END
