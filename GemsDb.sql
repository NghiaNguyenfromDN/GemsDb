USE master;
GO

-- Tạo database
CREATE DATABASE GemsDb
ON PRIMARY (
    NAME = GemsDb,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GemsDb.mdf',
    SIZE = 72MB,
    FILEGROWTH = 64MB
)
LOG ON (
    NAME = GemsDb_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GemsDb_log.ldf',
    SIZE = 72MB,
    FILEGROWTH = 64MB
);
GO

-- Thiết lập cơ bản
ALTER DATABASE GemsDb SET COMPATIBILITY_LEVEL = 160;
ALTER DATABASE GemsDb SET RECOVERY FULL;
ALTER DATABASE GemsDb SET MULTI_USER;
ALTER DATABASE GemsDb SET PAGE_VERIFY CHECKSUM;
GO

USE GemsDb;
GO

-- Bảng EF Migrations
CREATE TABLE dbo.__EFMigrationsHistory (
    MigrationId NVARCHAR(150) NOT NULL PRIMARY KEY,
    ProductVersion NVARCHAR(32) NOT NULL
);
GO

-- Bảng Chunks
CREATE TABLE dbo.Chunks (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Content NVARCHAR(MAX) NOT NULL,
    Text NVARCHAR(MAX) NULL,
    FileName NVARCHAR(MAX) NOT NULL,
    VectorJson NVARCHAR(MAX) NULL
);
GO
