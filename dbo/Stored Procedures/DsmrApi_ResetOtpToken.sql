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

	IF @@ROWCOUNT >= 1
	BEGIN
		SELECT   @msisdn AS [Msisdn]
				,@token AS [Token]
	END

	COMMIT TRAN [t1]
END