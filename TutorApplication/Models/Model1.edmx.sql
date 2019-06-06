
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/02/2018 21:02:15
-- Generated from EDMX file: I:\26thClass\TutorApplication\TutorApplication\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [OnlineTutor];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Hire_Schedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hire] DROP CONSTRAINT [FK_Hire_Schedule];
GO
IF OBJECT_ID(N'[dbo].[FK_Hire_Student]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hire] DROP CONSTRAINT [FK_Hire_Student];
GO
IF OBJECT_ID(N'[dbo].[FK_Hire_Tutor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hire] DROP CONSTRAINT [FK_Hire_Tutor];
GO
IF OBJECT_ID(N'[dbo].[FK_Payment_Hire]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Payment] DROP CONSTRAINT [FK_Payment_Hire];
GO
IF OBJECT_ID(N'[dbo].[FK_Tutor_Subject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tutor] DROP CONSTRAINT [FK_Tutor_Subject];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_tblUserInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_tblUserInfo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Hire]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hire];
GO
IF OBJECT_ID(N'[dbo].[Payment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Payment];
GO
IF OBJECT_ID(N'[dbo].[Qualification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Qualification];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Schedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedule];
GO
IF OBJECT_ID(N'[dbo].[Student]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Student];
GO
IF OBJECT_ID(N'[dbo].[Subject]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subject];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tblUserInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblUserInfo];
GO
IF OBJECT_ID(N'[dbo].[Tutor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tutor];
GO
IF OBJECT_ID(N'[dbo].[UserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRole];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hires'
CREATE TABLE [dbo].[Hires] (
    [HireId] int IDENTITY(1,1) NOT NULL,
    [Tutorid] int  NULL,
    [StudentId] int  NULL,
    [ScheduleId] int  NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [TotalFee] decimal(18,0)  NULL
);
GO

-- Creating table 'Payments'
CREATE TABLE [dbo].[Payments] (
    [PaymentId] int IDENTITY(1,1) NOT NULL,
    [HireId] int  NULL,
    [Status] bit  NULL,
    [PaymentDate] datetime  NULL,
    [BankVoucherNo] nvarchar(50)  NULL
);
GO

-- Creating table 'Qualifications'
CREATE TABLE [dbo].[Qualifications] (
    [QualificationId] int IDENTITY(1,1) NOT NULL,
    [TutorId] int  NULL,
    [Instution] nvarchar(50)  NULL,
    [Board] nvarchar(50)  NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [CGPA] nvarchar(50)  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(50)  NULL
);
GO

-- Creating table 'Schedules'
CREATE TABLE [dbo].[Schedules] (
    [ScheduleId] int IDENTITY(1,1) NOT NULL,
    [FromTime] nvarchar(50)  NULL,
    [ToTime] nvarchar(50)  NULL,
    [TutorId] int  NULL,
    [Status] nvarchar(50)  NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL,
    [DOB] datetime  NULL,
    [Contact] nvarchar(50)  NULL,
    [Gender] nvarchar(50)  NULL,
    [EmailId] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [SubjectId] int IDENTITY(1,1) NOT NULL,
    [SubjectName] nvarchar(50)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tblUserInfoes'
CREATE TABLE [dbo].[tblUserInfoes] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [EmailId] nvarchar(50)  NULL,
    [Password] nvarchar(50)  NULL,
    [Firstname] nvarchar(50)  NULL,
    [Lastname] nvarchar(50)  NULL
);
GO

-- Creating table 'Tutors'
CREATE TABLE [dbo].[Tutors] (
    [TutorId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL,
    [DOB] datetime  NULL,
    [Nationality] nvarchar(50)  NULL,
    [HourlyRate] decimal(18,0)  NULL,
    [Contact] nvarchar(50)  NULL,
    [EmailId] nvarchar(50)  NULL,
    [Photo] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL,
    [SubjectId] int  NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [UserRoleId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NULL,
    [RoleId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [HireId] in table 'Hires'
ALTER TABLE [dbo].[Hires]
ADD CONSTRAINT [PK_Hires]
    PRIMARY KEY CLUSTERED ([HireId] ASC);
GO

-- Creating primary key on [PaymentId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments]
    PRIMARY KEY CLUSTERED ([PaymentId] ASC);
GO

-- Creating primary key on [QualificationId] in table 'Qualifications'
ALTER TABLE [dbo].[Qualifications]
ADD CONSTRAINT [PK_Qualifications]
    PRIMARY KEY CLUSTERED ([QualificationId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [ScheduleId] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [PK_Schedules]
    PRIMARY KEY CLUSTERED ([ScheduleId] ASC);
GO

-- Creating primary key on [StudentId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentId] ASC);
GO

-- Creating primary key on [SubjectId] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([SubjectId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserId] in table 'tblUserInfoes'
ALTER TABLE [dbo].[tblUserInfoes]
ADD CONSTRAINT [PK_tblUserInfoes]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [TutorId] in table 'Tutors'
ALTER TABLE [dbo].[Tutors]
ADD CONSTRAINT [PK_Tutors]
    PRIMARY KEY CLUSTERED ([TutorId] ASC);
GO

-- Creating primary key on [UserRoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([UserRoleId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ScheduleId] in table 'Hires'
ALTER TABLE [dbo].[Hires]
ADD CONSTRAINT [FK_Hire_Schedule]
    FOREIGN KEY ([ScheduleId])
    REFERENCES [dbo].[Schedules]
        ([ScheduleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Hire_Schedule'
CREATE INDEX [IX_FK_Hire_Schedule]
ON [dbo].[Hires]
    ([ScheduleId]);
GO

-- Creating foreign key on [StudentId] in table 'Hires'
ALTER TABLE [dbo].[Hires]
ADD CONSTRAINT [FK_Hire_Student]
    FOREIGN KEY ([StudentId])
    REFERENCES [dbo].[Students]
        ([StudentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Hire_Student'
CREATE INDEX [IX_FK_Hire_Student]
ON [dbo].[Hires]
    ([StudentId]);
GO

-- Creating foreign key on [Tutorid] in table 'Hires'
ALTER TABLE [dbo].[Hires]
ADD CONSTRAINT [FK_Hire_Tutor]
    FOREIGN KEY ([Tutorid])
    REFERENCES [dbo].[Tutors]
        ([TutorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Hire_Tutor'
CREATE INDEX [IX_FK_Hire_Tutor]
ON [dbo].[Hires]
    ([Tutorid]);
GO

-- Creating foreign key on [HireId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_Payment_Hire]
    FOREIGN KEY ([HireId])
    REFERENCES [dbo].[Hires]
        ([HireId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Payment_Hire'
CREATE INDEX [IX_FK_Payment_Hire]
ON [dbo].[Payments]
    ([HireId]);
GO

-- Creating foreign key on [RoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserRole_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_Role'
CREATE INDEX [IX_FK_UserRole_Role]
ON [dbo].[UserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [SubjectId] in table 'Tutors'
ALTER TABLE [dbo].[Tutors]
ADD CONSTRAINT [FK_Tutor_Subject]
    FOREIGN KEY ([SubjectId])
    REFERENCES [dbo].[Subjects]
        ([SubjectId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tutor_Subject'
CREATE INDEX [IX_FK_Tutor_Subject]
ON [dbo].[Tutors]
    ([SubjectId]);
GO

-- Creating foreign key on [UserId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserRole_tblUserInfo]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[tblUserInfoes]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_tblUserInfo'
CREATE INDEX [IX_FK_UserRole_tblUserInfo]
ON [dbo].[UserRoles]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------