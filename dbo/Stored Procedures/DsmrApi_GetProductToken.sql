CREATE PROCEDURE [dbo].[DsmrApi_GetProductToken]
	@token UNIQUEIDENTIFIER
AS
BEGIN
	SELECT [UserId],
	       [Token],
		   [Enabled],
		   [Timestamp]
	FROM [dbo].[ProductTokens]
END
