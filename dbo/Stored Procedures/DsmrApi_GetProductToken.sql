CREATE PROCEDURE [dbo].[DsmrApi_GetProductToken]
	@token UNIQUEIDENTIFIER
AS
BEGIN
	SELECT [Id],
	       [UserId],
	       [Token],
		   [Enabled],
		   [Timestamp]
	FROM [dbo].[ProductTokens] pt
	WHERE [pt].[Token] = @token
END
