CREATE TABLE [dbo].[Devices]
(
	[Id]               INT                       NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
	[ServiceName]      NVARCHAR(32)              NOT NULL,
	[Enabled]          BIT                       NOT NULL DEFAULT(1),
	[PowerSensorId]    NVARCHAR(24)              NOT NULL,
	[GasSensorId]      NVARCHAR(24),
	[EnvironmentSensorId] NVARCHAR(24),
	[Timestamp]        DATETIME                  NOT NULL DEFAULT(GETUTCDATE())

	CONSTRAINT [PK_Devices] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	INDEX [IX_Devices_PowerSensorId] NONCLUSTERED ([PowerSensorId]),
	INDEX [IX_Devices_ServiceName] NONCLUSTERED ([ServiceName])
)
