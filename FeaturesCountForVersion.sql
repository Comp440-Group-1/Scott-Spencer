USE [s16guest60]
GO
/****** Object:  StoredProcedure [dbo].[FeaturesCountForVersion]    Script Date: 5/15/2016 12:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Scott Spencer
-- Create date: 5-14-2016
-- Description:	new features count
-- =============================================
ALTER PROCEDURE [dbo].[FeaturesCountForVersion] 
	-- Add the parameters for the stored procedure here
	@versionNumber float,
	@Total int = 0
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 
	FROM dbo.Version
	WHERE
		dbo.Version.pk_versionId = @versionNumber)
	BEGIN
    -- Insert statements for procedure here
		SELECT @Total = COUNT(*)
		FROM
		(
		SELECT   dbo.Product.fk_versionId
		FROM dbo.Product
		WHERE
			dbo.Product.fk_versionId = @versionNumber
		)tot;
		IF @Total > 0
		BEGIN
				PRINT  CONVERT(VARCHAR(50),@versionNumber,128) + ' has ' + CONVERT(VARCHAR(50),@Total,128) + ' new features'
		END
		ELSE
			PRINT 'IT is a bug-fix release. There are no new features'
	
	END
	ELSE
		PRINT 'Error: version does not exist'
END

