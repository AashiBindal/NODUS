
-- Create Schema
IF SCHEMA_ID('nodus') IS NULL
    EXEC('CREATE SCHEMA nodus');
GO

-- 1. Users
IF OBJECT_ID('nodus.Users', 'U') IS NOT NULL
    DROP TABLE nodus.Users;
GO

CREATE TABLE nodus.Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20)
        CHECK (Role IN ('Student', 'Faculty', 'Admin')),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

-- 2. Branches
IF OBJECT_ID('nodus.Branches', 'U') IS NOT NULL
    DROP TABLE nodus.Branches;
GO

CREATE TABLE nodus.Branches (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100) NOT NULL
);
GO

-- 3. Semesters
IF OBJECT_ID('nodus.Semesters', 'U') IS NOT NULL
    DROP TABLE nodus.Semesters;
GO

CREATE TABLE nodus.Semesters (
    SemID INT IDENTITY(1,1) PRIMARY KEY,
    SemNumber INT NOT NULL,
    IsLocked BIT DEFAULT 1
);
GO

-- 4. Subjects
IF OBJECT_ID('nodus.Subjects', 'U') IS NOT NULL
    DROP TABLE nodus.Subjects;
GO

CREATE TABLE nodus.Subjects (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SemID INT FOREIGN KEY REFERENCES nodus.Semesters(SemID),
    SubjectName NVARCHAR(100) NOT NULL
);
GO

-- 5. Units
IF OBJECT_ID('nodus.Units', 'U') IS NOT NULL
    DROP TABLE nodus.Units;
GO

CREATE TABLE nodus.Units (
    UnitID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectID INT FOREIGN KEY REFERENCES nodus.Subjects(SubjectID),
    UnitNumber INT NOT NULL,
    UnitName NVARCHAR(100) NOT NULL
);
GO

-- 6. Sections
IF OBJECT_ID('nodus.Sections', 'U') IS NOT NULL
    DROP TABLE nodus.Sections;
GO

CREATE TABLE nodus.Sections (
    SectionID INT IDENTITY(1,1) PRIMARY KEY,
    SectionName NVARCHAR(10) NOT NULL
);
GO

-- 7. Notes
IF OBJECT_ID('nodus.Notes', 'U') IS NOT NULL
    DROP TABLE nodus.Notes;
GO

CREATE TABLE nodus.Notes (
    NoteID INT IDENTITY(1,1) PRIMARY KEY,
    UnitID INT FOREIGN KEY REFERENCES nodus.Units(UnitID),
    AuthorID INT FOREIGN KEY REFERENCES nodus.Users(UserID),
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX),
    IsPrivate BIT DEFAULT 0
);
GO

-- 8. Assignments
IF OBJECT_ID('nodus.Assignments', 'U') IS NOT NULL
    DROP TABLE nodus.Assignments;
GO

CREATE TABLE nodus.Assignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectID INT FOREIGN KEY REFERENCES nodus.Subjects(SubjectID),
    FacultyID INT FOREIGN KEY REFERENCES nodus.Users(UserID),
    Title NVARCHAR(200) NOT NULL,
    DueDate DATETIME NOT NULL,
    TargetSectionID INT FOREIGN KEY REFERENCES nodus.Sections(SectionID)
);
GO

-- 9. Submissions
IF OBJECT_ID('nodus.Submissions', 'U') IS NOT NULL
    DROP TABLE nodus.Submissions;
GO

CREATE TABLE nodus.Submissions (
    SubmissionID INT IDENTITY(1,1) PRIMARY KEY,
    AssignmentID INT FOREIGN KEY REFERENCES nodus.Assignments(AssignmentID),
    StudentID INT FOREIGN KEY REFERENCES nodus.Users(UserID),
    FileUrl NVARCHAR(500),
    SubmittedAt DATETIME DEFAULT GETDATE()
);
GO
