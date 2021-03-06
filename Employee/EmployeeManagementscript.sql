USE [master]
GO
/****** Object:  Database [EmployeeMaintenance]    Script Date: 2018/10/08 8:25:38 PM ******/
CREATE DATABASE [EmployeeMaintenance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeMaintenance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EmployeeMaintenance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeMaintenance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EmployeeMaintenance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EmployeeMaintenance] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeMaintenance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeMaintenance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeMaintenance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeMaintenance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeMaintenance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeMaintenance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeMaintenance] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeMaintenance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeMaintenance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeMaintenance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeMaintenance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeMaintenance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeMaintenance] SET QUERY_STORE = OFF
GO
USE [EmployeeMaintenance]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EmployeeMaintenance]
GO
/****** Object:  User [shonisani]    Script Date: 2018/10/08 8:25:39 PM ******/
CREATE USER [shonisani] FOR LOGIN [shonisani] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [shonisani]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[EmployeeNum] [nvarchar](16) NOT NULL,
	[EmployedDate] [date] NOT NULL,
	[TerminatedDate] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[BirthDate] [date] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [PersonId], [EmployeeNum], [EmployedDate], [TerminatedDate]) VALUES (12, 12, N'903975', CAST(N'2018-10-01' AS Date), CAST(N'2018-10-07' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [BirthDate]) VALUES (12, N'Thimothy', N'Ratshivhadelo', CAST(N'2018-08-21' AS Date))
SET IDENTITY_INSERT [dbo].[Person] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmp]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteEmp]
(
	@PersonId int
)
AS
BEGIN	
	DELETE FROM Employee WHERE Employee.PersonId=@PersonId
	DELETE FROM Person WHERE Person.PersonId=@PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmp]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertEmp]
(
@EmployeeNum nvarchar(16),
@EmployedDate DateTime,
@TerminatedDate DateTime,
@FirstName nvarchar(128),
@LastName nvarchar(128),
@BirthDate DateTime
)
as
Begin
	Insert into Person(FirstName, LastName, BirthDate) values(@FirstName, @LastName, @BirthDate)
	Insert into Employee(PersonId, EmployeeNum, EmployedDate, TerminatedDate) values( SCOPE_IDENTITY(), @EmployeeNum, @EmployedDate, @TerminatedDate)
End
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllEmp]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectAllEmp]

AS
BEGIN
/*SELECT *FROM Person, Employee */ 

SELECT *
FROM Employee
JOIN Person ON Employee.PersonId = Person.PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectEmp]
(
	@PersonId int
)
AS
BEGIN
	SELECT *FROM Person, Employee WHERE Person.PersonId = @PersonId and Employee.PersonId = @PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmp]    Script Date: 2018/10/08 8:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateEmp]
(
@PersonId int,
@EmployeeNum nvarchar(16),
@EmployedDate DateTime,
@TerminatedDate DateTime,
@FirstName nvarchar(128),
@LastName nvarchar(128),
@BirthDate DateTime
)
AS
BEGIN
	UPDATE Person SET BirthDate = @BirthDate, FirstName = @FirstName, LastName = @LastName WHERE PersonId=@PersonId
	UPDATE Employee SET EmployeeNum = @EmployeeNum, EmployedDate = @EmployedDate, TerminatedDate = @TerminatedDate where Employee.PersonId = @PersonId
END
GO
USE [master]
GO
ALTER DATABASE [EmployeeMaintenance] SET  READ_WRITE 
GO
