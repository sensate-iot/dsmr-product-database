CREATE PROCEDURE [dbo].[DsmrApi_SelectUserById]
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT TOP (1) [Id]
	  ,[CustomerId]
	  ,[FirstName]
	  ,[LastName]
	  ,[Email]
	  ,[Enabled]
	  ,[Timestamp]
	FROM [dbo].[Users] u
	WHERE [u].[Id] = @userId
END
