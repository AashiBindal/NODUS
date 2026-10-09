-- MS SQL Server DDL Schema for NODUS

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) CHECK (Role IN ('Student', 'Faculty', 'Admin')),
    CreatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100) NOT NULL
);

CREATE TABLE Semesters (
    SemID INT PRIMARY KEY IDENTITY(1,1),
    SemNumber INT NOT NULL,
    IsLocked BIT DEFAULT 1
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY IDENTITY(1,1),
    SemID INT FOREIGN KEY REFERENCES Semesters(SemID),
    SubjectName NVARCHAR(100) NOT NULL
);

CREATE TABLE Units (
    UnitID INT PRIMARY KEY IDENTITY(1,1),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    UnitNumber INT NOT NULL,
    UnitName NVARCHAR(100) NOT NULL
);

CREATE TABLE Sections (
    SectionID INT PRIMARY KEY IDENTITY(1,1),
    SectionName NVARCHAR(10) NOT NULL -- e.g., Sec A, Sec B
);

CREATE TABLE Notes (
    NoteID INT PRIMARY KEY IDENTITY(1,1),
    UnitID INT FOREIGN KEY REFERENCES Units(UnitID),
    AuthorID INT FOREIGN KEY REFERENCES Users(UserID),
    Title NVARCHAR(200) NOT NULL,
    Content TEXT,
    IsPrivate BIT DEFAULT 0 -- 0: Faculty Public, 1: Student Private Self-Note
);

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    FacultyID INT FOREIGN KEY REFERENCES Users(UserID),
    Title NVARCHAR(200) NOT NULL,
    DueDate DATETIME NOT NULL,
    TargetSectionID INT FOREIGN KEY REFERENCES Sections(SectionID)
);

CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY IDENTITY(1,1),
    AssignmentID INT FOREIGN KEY REFERENCES Assignments(AssignmentID),
    StudentID INT FOREIGN KEY REFERENCES Users(UserID),
    FileUrl NVARCHAR(500),
    SubmittedAt DATETIME DEFAULT GETDATE()
);
