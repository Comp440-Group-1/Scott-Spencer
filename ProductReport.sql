USE [s16guest60]
GO
/****** Object:  StoredProcedure [dbo].[productReport]    Script Date: 5/14/2016 11:58:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Scott Spencer
-- Create date: 5-14-2016
-- Description:	Product Report
-- =============================================
ALTER PROCEDURE [dbo].[productReport] 
	-- Add the parameters for the stored procedure here
	@productId int, 
	@versionId float,
	@month int OUTPUT
AS
BEGIN


    -- Insert statements for procedure here
	SELECT dbo.Download.fk_productId,
			dbo.Product.fk_versionId,
			CAST(DATEPART(MONTH,dbo.Download.dateDownloaded) AS VARCHAR) + '/' + 
			CAST(DATEPART(YEAR,dbo.Download.dateDownloaded) AS VARCHAR) AS "Month",  
			COUNT(*) AS 'Total Downloads'
	FROM dbo.Download, dbo.Product
	WHERE 
		dbo.Download.fk_productId = @productId
	AND
		 dbo.Product.fk_versionId = @versionId
	AND
		 dbo.Product.pk_ProductId = @productId
	AND
		 MONTH(dbo.Download.dateDownloaded) = @month 
	GROUP BY dbo.Download.fk_productId, CAST(DATEPART(MONTH,dbo.Download.dateDownloaded) AS VARCHAR) + '/' + CAST(DATEPART(YEAR,dbo.Download.dateDownloaded) AS VARCHAR), dbo.Product.fk_versionId

	
	
END
