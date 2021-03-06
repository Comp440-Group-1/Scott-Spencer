USE [s16guest60]
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 5/14/2016 11:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Scott Spencer
-- Create date: 5-14-2016
-- Description:	UpdateProduct
-- =============================================
ALTER PROCEDURE [dbo].[updateProduct] 
	-- Add the parameters for the stored procedure here
	@versionNumber float
	
AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Version
		VALUES (@versionNumber)
	END TRY
	BEGIN CATCH
		PRINT 'Entry error: Version number already exists'
	END CATCH;
END
