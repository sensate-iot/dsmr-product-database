CREATE ROLE [db_processor]
GO

GRANT EXECUTE ON [dbo].[DsmrProcessor_GetDevices] TO [db_processor]
GO
