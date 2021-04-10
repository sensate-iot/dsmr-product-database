CREATE PROCEDURE [dbo].[DsmrApi_SelectDevicesForUser]
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT [Id]
		  ,[OnboardingToken]
		  ,[ServiceName]
		  ,[Enabled]
		  ,[PowerSensorId]
		  ,[GasSensorId]
		  ,[EnvironmentSensorId]
		  ,[Timestamp]
	FROM [dbo].[Devices] d
	INNER JOIN [dbo].[UserDevices] ud ON [ud].[DeviceId] = [d].[Id]
	WHERE [ud].[UserId] = @userId
END
