exec productReport
@productId = 1,
@versionId = 1.1,
@month = 1

exec productReport
@productId = 5,
@versionId = 2.1,
@month = 1

exec productReport
@productId = 2,
@versionId = 1.1,
@month = 1

exec updateProduct
@versionNumber = 2.3
SELECT * FROM dbo.version

exec FeaturesCountForVersion
@versionNumber = 1.1

exec FeaturesCountForVersion
@versionNumber = 0