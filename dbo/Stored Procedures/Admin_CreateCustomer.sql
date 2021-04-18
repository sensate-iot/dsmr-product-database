CREATE PROCEDURE [dbo].[Admin_CreateCustomer]
	@firstname NVARCHAR(64),
	@lastname  NVARCHAR(64),
	@email     NVARCHAR(64),
	@processingServiceName NVARCHAR(32),
	@pwrSensorId NVARCHAR(24),
	@envSensorId NVARCHAR(24),
	@gasSensorId NVARCHAR(24)
AS
BEGIN
	DECLARE @customerId UNIQUEIDENTIFIER;
	DECLARE @userId UNIQUEIDENTIFIER;
	DECLARE @productTokenId UNIQUEIDENTIFIER;
	DECLARE @deviceId INT;

	BEGIN TRAN [t1];

	SET @customerId = NEWID();
	SET @userId = NEWID();
	SET @productTokenId = NEWID();

	INSERT INTO [dbo].[Customers] (
		[Id],
		[FirstName],
		[LastName],
		[Email],
		[Timestamp]
	) VALUES (
		@customerId,
		@firstname,
		@lastname,
		@email,
		GETUTCDATE()
	);

	INSERT INTO [dbo].[Users] (
		[Id],
		[FirstName],
		[LastName],
		[Email],
		[CustomerId],
		[Enabled],
		[OnboardingToken],
		[Timestamp]
	) VALUES (
		@userId,
		@firstname,
		@lastname,
		@email,
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

	INSERT INTO [dbo].[Devices] (
		 [PowerSensorId]
		,[EnvironmentSensorId]
		,[GasSensorId]
		,[ServiceName]
		,[Enabled]
		,[Timestamp]
		,[OnboardingToken]
	) VALUES (
		@pwrSensorId,
		@envSensorId,
		@gasSensorId,
		@processingServiceName,
		0,
		GETUTCDATE(),
		NEWID()
	);

	SET @deviceId = SCOPE_IDENTITY();

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
