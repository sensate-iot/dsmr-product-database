CREATE PROCEDURE [DsmrApi_ResetOtpToken]
	@email NVARCHAR(64) 
AS
BEGIN
	DECLARE @token UNIQUEIDENTIFIER;
	SET @token = NEWID();

	UPDATE [dbo].[Users]
	SET [OnboardingToken] = @token
	WHERE [Email] = @email

	IF @@ROWCOUNT = 1
	BEGIN
		SELECT   @email AS [Email]
				,@token AS [Token]
	END
END
