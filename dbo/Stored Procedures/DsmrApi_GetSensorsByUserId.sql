CREATE PROCEDURE [dbo].[DsmrApi_GetSensorsByUserId]
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT [SensorId]
	FROM [dbo].[CustomerSensors]
	INNER JOIN [dbo].[Users] u ON [u].[Id] = @userId
	INNER JOIN [dbo].[Customers] c ON [c].[Id] = [u].[CustomerId]
	WHERE [u].[Enabled] = 1
END
