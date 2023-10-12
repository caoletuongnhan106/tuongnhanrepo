DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department(
	DepartmentID 	TINYINT NOT NULL PRIMARY KEY,
    DepartName 		NVARCHAR(30)
);

DROP TABLE IF EXISTS Position;
CREATE TABLE IF NOT EXISTS Position (
	PositionID 		TINYINT NOT NULL,
    PositionName 	NVARCHAR(30)
);

DROP TABLE IF EXISTS Account;
CREATE TABLE IF NOT EXISTS Account (
	AccountID 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    Email 			VARCHAR(30),
    Username 		NVARCHAR(30),
    FullName 		NVARCHAR(30),
    DepartmentID 	TINYINT NOT NULL,
    PositionID 		INT,
    CreateDate 		DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
);

DROP TABLE IF EXISTS GroupTable;
CREATE TABLE IF NOT EXISTS GroupTable (
	GroupID 		TINYINT NOT NULL PRIMARY KEY,
    GroupName 		NVARCHAR(30),
    CreateID 		TINYINT NOT NULL,
    CreateDate 		DATETIME
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE IF NOT EXISTS GroupAccount (
	GroupID 	TINYINT NOT NULL,
    AccountID 	TINYINT ,
    JoinDate 	DATETIME,
    FOREIGN KEY (GroupID) REFERENCES GroupTable (GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE IF NOT EXISTS TypeQuestion (
	TypeID 		TINYINT NOT NULL PRIMARY KEY,
    TypeName 	NVARCHAR(30)
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE IF NOT EXISTS CategoryQuestion (
	CategoryID 		TINYINT NOT NULL PRIMARY KEY,
    CategoryName 	NVARCHAR(30)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE IF NOT EXISTS Question (
	QuestionID 	TINYINT NOT NULL PRIMARY KEY,
    Content 	NVARCHAR(1000),
    CategoryID 	TINYINT NOT NULL,
    TypeID 		TINYINT,
    CreatorID 	TINYINT,
    CreateDate 	DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE IF NOT EXISTS Answer (
	AnswerID 	TINYINT,
    Content 	NVARCHAR(1000),
    QuestionID 	TINYINT PRIMARY KEY,
    isCorrect 	ENUM ('true','false'),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE IF NOT EXISTS Exam (
	ExamID 		TINYINT PRIMARY KEY,
    Code 		TINYINT,
    Title 		NVARCHAR(50),
    CategoryID 	TINYINT,
    Duration 	TIME,
    CreatorID 	TINYINT,
    CreateDate 	DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE IF NOT EXISTS ExamQuestion (
	ExamID 		TINYINT,
    QuestionID 	TINYINT,
    FOREIGN KEY (QuestionID) REFERENCES Answer(QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
);

INSERT INTO Position (PositionID, PositionName)
VALUES
	(1, 'Marketing'),
    (2, 'Sale'),
    (3, 'Giam doc'),
    (4, 'Pho Giam Doc'),
    (5, 'Thu ki');
    
INSERT INTO Account (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
	(1, 'abc@gmail.com', 'Binh', 'Nguyen Van Binh', 101, 'Sale', '2023/10/08' ),
    (2, 'dfc@gmail.com', 'Huyen', 'Le Thi Huyen', 102, 'Thu ki', '2023/04/05'),
    (3, 'atd@gmail.com', 'Thang', 'Pham Le Thang', 103, 'Marketing', '2023/01/29'),
    (4, 'nki@gmail.com', 'Van', 'Tran Le Van', 104, 'Pho Giam Doc', '2023/07/19'),
    (5, 'tuk@gmail.com', 'Linh', 'Le Thuy Linh', 105, 'Giam Doc', '2023/05/19');
    
INSERT INTO GroupTable (GroupID, GroupName, CreateID, CreateDate)
VALUES
	(123, 'ABC', 1234, 2023/11/24),
	(234, 'BCD', 2345, 2023/06/10),
	(456, 'EFG', 3456, 2023/07/15),
	(567, 'CVB', 4567, 2023/12/23),
	(789, 'JKL', 6789, 2023/04/28);

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
	(123, 1, 2023/10/27),
    (789, 4, 2023/04/07),
    (456, 5, 2023/05/29),
    (234, 3, 2023/11/04),
    (567, 2, 2023/06/15);
    
    
INSERT INTO TypeQuestion (TypeID, TypeName)
VALUES
	(01,'ABC'),
    (02, 'BCD'),
    (03, 'EFT'),
    (04, 'GHT'),
    (05, 'POG');
    
INSERT INTO CategoryQuestion (CategoryID, CategoryName)
VALUES
	(1, 'Java'),
    (2, 'Net'),
    (3, 'PHP'),
    (4, 'Ruby'),
    (5, 'SQL');
    
INSERT INTO Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES	
    (1, 'ADFDSDV', 2, 01, 1, 2023/06/27),
    (2, 'DSGSFHF', 5, 02, 4, 2023/02/13),
    (3, 'OUHOUYU', 1, 04, 3, 2023/07/24),
    (4, 'WRTRETR', 3, 05, 2, 2023/12/06),
    (5, 'XVBCBVG', 4, 03, 5, 2023/01/30);
    
INSERT INTO Answer (AnswerID, Content, QuestionID, isCorrect)
VALUES
	(1, 'XVBCBVG', 5, 'true'),
    (2, 'WRTRETR', 4, 'false'),
    (3, 'OUHOUYU', 3, 'true'),
    (4, 'DSGSFHF', 2,'true'),
    (5, 'ADFDSDV', 1, 'false');
    
INSERT INTO Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
	(1, 101, 'HK1', 1, 120, 3, 2023/07/24),
    (2, 102, 'HK2', 2, 90, 1, 2023/06/27),
    (3, 103, 'HK1A', 3, 90, 2, 2023/12/06),
    (4, 104, 'HK1B', 4, 90, 5, 2023/01/30),
    (5, 105, 'HK2A', 5, 120, 4, 2023/02/13);

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
	(),
    (),
    (),
    (),
    ();


	



    









