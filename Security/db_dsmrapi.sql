CREATE ROLE [db_dsmrapi]
GO

GRANT EXECUTE ON [dbo].[DsmrApi_GetProductToken] TO [db_dsmrapi]
GO
GRANT EXECUTE ON [dbo].[DsmrApi_GetSensorsByUserId] TO [db_dsmrapi]
GO
GRANT EXECUTE ON [dbo].[DsmrApi_SelectUserById] TO [db_dsmrapi]
GO
GRANT EXECUTE ON [dbo].[DsmrApi_SelectDevicesForUser] TO [db_dsmrapi]
GO
GRANT EXECUTE ON [dbo].[DsmrApi_Login] TO [db_dsmrapi]
GO
