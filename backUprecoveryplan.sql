BACKUP DATABASE [s16guest60] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\Backup\s16guest60.bak' WITH NOFORMAT, NOINIT,  NAME = N's16guest60-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--SQL Server Agent was not running so I was unable automatic backups
--If it were running I would schedule a backup everyday at 3:00am
