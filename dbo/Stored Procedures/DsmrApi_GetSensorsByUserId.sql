CREATE PROCEDURE [dbo].[DsmrApi_GetSensorsByUserId]
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT [Id]
	      ,[PowerSensorId]
		  ,[GasSensorId]
		  ,[EnvironmentSensorId]
	FROM [dbo].[Devices]
	INNER JOIN [dbo].[UserDevices] u ON [u].[UserId] = @userId
	WHERE [u].[UserId] = @userId
END
