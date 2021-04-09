CREATE TABLE [dbo].[UserDevices]
(
	[UserId]                    UNIQUEIDENTIFIER NOT NULL,
	[DeviceId]                  INT              NOT NULL,

	CONSTRAINT [PK_UserSensors] PRIMARY KEY NONCLUSTERED ([UserId], [DeviceId]),
	CONSTRAINT [FK_UserSensors_Users] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT [FK_UserSensors_Devices] FOREIGN KEY ([DeviceId]) REFERENCES [Devices] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
