/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : Create_All_Base																  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.04.26																				  *
*			Description : Creating the database																  *
* ---------------------------------------------------------------------------------------------------------- */

USE master
GO

IF EXISTS(SELECT name FROM master.dbo.sysdatabases
	WHERE name = 'Suzi_Yoga_Studio')
	DROP DATABASE Suzi_Yoga_Studio
	GO

CREATE DATABASE Suzi_Yoga_Studio
ON PRIMARY
(
	NAME = 'Suzi_Yoga_Studio_Data',
	FILENAME = 'C:\Users\Student\Downloads\Suzi_Yoga_Studio080512\Main_Database\Suzi_Yoga_Studio.mdf',
	SIZE = 10,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 2
)
LOG ON
(
	
	NAME = 'Suzi_Yoga_Studio_Log',
	FILENAME = 'C:\Users\Student\Downloads\Suzi_Yoga_Studio080512\Main_Database\Suzi_Yoga_Studio_Log.ldf',
	SIZE =10,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 2
)
GO

/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : inserting_tables																  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.04.26																				  *
*			Description : Inserting the tables																  *
* ---------------------------------------------------------------------------------------------------------- */

USE Suzi_Yoga_Studio
GO

CREATE TABLE class_sessions
(
	class_code VARCHAR(6) NOT NULL,
	week INT NOT NULL,
	day VARCHAR(10) NOT NULL,
	studio_Number INT NOT NULL,
	time_Of_Session TIME NOT NULL,
	cancelled VARCHAR(1) DEFAULT 'N',
	CHECK(studio_Number IN(1,2,3,4)),
	CONSTRAINT prim_c_Code PRIMARY KEY(class_code)
)
GO

CREATE TABLE members
(
	member_Number INT NOT NULL IDENTITY(1, 1),
	name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
	date_of_birth DATE NOT NULL,
	cell_Number VARCHAR(10) DEFAULT '0000000000',
	email_Address VARCHAR(90) NULL,
	class_code VARCHAR(6) NOT NULL,
	studio_number INT NOT NULL,
	sessions_Per_Week INT NULL,
	CHECK(studio_Number IN(1,2,3,4)),
	CONSTRAINT prim_memNum PRIMARY KEY(member_Number), 
	CONSTRAINT uniq_Email UNIQUE(email_Address),
	CONSTRAINT for_Code FOREIGN KEY(class_code) REFERENCES class_sessions(class_code)	
)
GO

CREATE TABLE exercise_Books
(
	book_ID VARCHAR(30) NOT NULL,
	title VARCHAR(90) NOT NULL,
	exercise_Type VARCHAR(90) NOT NULL,
	CONSTRAINT prim_bookID PRIMARY KEY(book_ID)
)
GO


CREATE TABLE exercises
(
	book_ID VARCHAR(30) NOT NULL,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(800) NOT NULL,
	length_Of_Exercise TIME NOT NULL,
	number_Of_Times_To_Be_Done INT NOT NULL,
	CONSTRAINT for_BookID FOREIGN KEY(book_ID) REFERENCES Exercise_Books(book_ID)
)
GO