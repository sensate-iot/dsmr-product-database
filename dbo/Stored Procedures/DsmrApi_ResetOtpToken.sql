CREATE PROCEDURE [DsmrApi_ResetOtpToken]
	@email NVARCHAR(64),
	@token NVARCHAR(40)
AS
BEGIN
	DECLARE @msisdn BIGINT

	BEGIN TRAN [t1]

	SELECT @msisdn = [Msisdn]
	FROM [dbo].[Users]
	WHERE [Email] = @email

	UPDATE [dbo].[Users]
	SET [OnboardingToken] = @token
	WHERE [Email] = @email

	COMMIT TRAN [t1]

	IF @@ROWCOUNT = 1
	BEGIN
		SELECT   @msisdn AS [Email]
				,@token AS [Token]
	END
END
