CREATE PROCEDURE [dbo].[Admin_CreateUser]
	@firstname NVARCHAR(64),
	@lastname  NVARCHAR(64),
	@email     NVARCHAR(64),
	@msisdn    BIGINT,
	@customerId UNIQUEIDENTIFIER,
	@deviceId INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @userId UNIQUEIDENTIFIER;
	DECLARE @productTokenId UNIQUEIDENTIFIER;

	BEGIN TRAN [t1];

	SET @userId = NEWID();
	SET @productTokenId = NEWID();

	INSERT INTO [dbo].[Users] (
		[Id],
		[FirstName],
		[LastName],
		[Email],
		[Msisdn],
		[CustomerId],
		[Enabled],
		[OnboardingToken],
		[Timestamp]
	) VALUES (
		@userId,
		@firstname,
		@lastname,
		@email,
		@msisdn,
		@customerId,
		0,
		CONVERT(NVARCHAR(40), NEWID()),
		GETUTCDATE()
	);

	INSERT INTO [dbo].[ProductTokens] (
		[Id],
		[UserId],
		[Token]
	) VALUES (
		@productTokenId,
		@userId,
		NEWID()
	);

	INSERT INTO [dbo].[UserDevices] (
		[DeviceId],
		[UserId]
	) VALUES (
		@deviceId,
		@userId
	);

	COMMIT TRAN [t1];

	SELECT @customerId AS [CustomerId],
	       @userId AS [UserId],
		   @productTokenId AS [ProductTokenId],
		   @deviceId AS [DeviceId]
END
