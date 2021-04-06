CREATE TABLE [dbo].[CustomerSensors]
(
	[CustomerId]                UNIQUEIDENTIFIER NOT NULL,
	[SensorId]                  INT              NOT NULL,

	CONSTRAINT [PK_CustomerSensors] PRIMARY KEY NONCLUSTERED ([CustomerId], [SensorId]),
	CONSTRAINT [FK_CustomerSensors_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([Id])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)
