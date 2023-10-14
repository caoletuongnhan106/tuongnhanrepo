DROP DATABASE IF EXISTS Fresher_Training_Management_1;
CREATE DATABASE IF NOT EXISTS Fresher_Training_Management_1;
USE Fresher_Training_Management_1;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE IF NOT EXISTS Trainee(
	TraineeID 			TINYINT,
    Full_Name			NVARCHAR(50),
    Birth_Date			DATE,
    Gender				ENUM ('MALE', 'FEMALE'),
    ET_IQ				NVARCHAR(20),
    ET_Gmath			NVARCHAR(20),
    ET_English			NVARCHAR(50),
    Training_Class		TINYINT,
    Evaluation_Notes	NVARCHAR(100)
);

DROP TABLE IF EXISTS VTI_Account;
CREATE TABLE IF NOT EXISTS VTI_Account(
	TraineeID 			TINYINT NOT NULL,
    Full_Name			NVARCHAR(50),
    Birth_Date			DATE,
    Gender				ENUM ('MALE', 'FEMALE'),
    ET_IQ				NVARCHAR(20),
    ET_Gmath			NVARCHAR(20),
    ET_English			NVARCHAR(50),
    Training_Class		TINYINT,
    Evaluation_Notes	NVARCHAR(100)
);


