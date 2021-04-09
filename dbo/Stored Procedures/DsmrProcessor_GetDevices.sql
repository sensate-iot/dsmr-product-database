CREATE PROCEDURE [dbo].[DsmrProcessor_GetDevices]
	@processorServiceName NVARCHAR(32)
AS
BEGIN
	SELECT [Id],
	       [PowerSensorId],
		   [GasSensorId],
		   [EnvironmentSensorId]
	FROM [dbo].[Devices] d
	WHERE [d].[ServiceName] = @processorServiceName
	  AND [d].[Enabled] = 1
END
