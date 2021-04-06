CREATE PROCEDURE [dbo].[Admin_CreateCustomer]
	@firstname NVARCHAR(64),
	@lastname  NVARCHAR(64),
	@email     NVARCHAR(64)
AS
BEGIN
	DECLARE @customerId UNIQUEIDENTIFIER;
	DECLARE @userId UNIQUEIDENTIFIER;
	DECLARE @productTokenId UNIQUEIDENTIFIER;

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
		[Timestamp]
	) VALUES (
		@userId,
		@firstname,
		@lastname,
		@email,
		@customerId,
		0,
		GETUTCDATE()
	);

	INSERT INTO [dbo].[ProductTokens] (
		[Id],
		[UserId],
		[Token],
		[OnboardingToken]
	) VALUES (
		@productTokenId,
		@userId,
		NEWID(),
		NEWID()
	);

	COMMIT TRAN [t1];

	SELECT @customerId AS [CustomerId],
	       @userId AS [UserId],
		   @productTokenId AS [ProductTokenId]
END
