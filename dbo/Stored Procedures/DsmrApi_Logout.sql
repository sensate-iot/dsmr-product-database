CREATE PROCEDURE [dbo].[DsmrApi_Logout]
	@email NVARCHAR(64)
AS
BEGIN
	DECLARE @id UNIQUEIDENTIFIER;

	BEGIN TRAN [t1]

	SELECT @id = [Id]
	FROM [dbo].[Users]
	WHERE [Email] = @email

	UPDATE [dbo].[Users]
	SET [Enabled] = 0
	WHERE [Id] = @id

	UPDATE [dbo].[ProductTokens]
	SET [Token] = NEWID()
	WHERE [UserId] = @id

	COMMIT TRAN [t1]
END
