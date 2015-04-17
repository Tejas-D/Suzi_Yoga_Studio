/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : sp_UpdateExerciseTimeUsed													  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.03																				  *
*			Description : Stored Procedure to updare the number of times a certain exercise must be used	  *
* ----------------------------------------------------------------------------------------------------------- */

USE Suzi_Yoga_Studio
GO

CREATE PROCEDURE sp_UpdateExerciseTimeUsed(@book_ID VARCHAR(30), @times INT)
	AS 
	UPDATE Exercises
	SET number_Of_Times_To_Be_Done = @times
	WHERE book_ID = @book_ID
GO

/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : sp_Report																	  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : Get the report for a certin class													  *
* ---------------------------------------------------------------------------------------------------------- */
CREATE PROCEDURE sp_Report(@class_code VARCHAR(6))
AS

	DECLARE @day VARCHAR(10) 
	DECLARE @studio_Number VARCHAR(10)
	DECLARE @name VARCHAR(45)
	DECLARE @cell VARCHAR(10)
	DECLARE @time VARCHAR(15)
	DECLARE @counter INT
	DECLARE @totalMembers INT
	DECLARE @auto VARCHAR (2)
	DECLARE @memNum INT
	DECLARE @mID INT

	SET @day = (SELECT day FROM class_sessions WHERE @class_code = class_sessions.class_code )
	SET @time = (SELECT time_Of_Session FROM class_sessions WHERE @class_code = class_sessions.class_code )
	SET @studio_Number = (SELECT studio_Number FROM class_sessions WHERE @class_code = class_sessions.class_code )

		PRINT'YOGA CLASS REPORT:'
		PRINT'__________________'
		PRINT'Class Code:		' + @class_code
		PRINT'Week Day:		' + @day + '				[Time:		' + @time + ']'
		PRINT'Studio Number	' + @studio_Number
		PRINT''
		PRINT'No.	Member name			Contact number'
		PRINT'________________________________________'
		
		--SELECT name, cell_Number
		--FROM members
		--WHERE members.class_code = @class_code
		
	SELECT @totalMembers = COUNT(members.class_code)
	FROM members
	WHERE members.class_code = @class_code

	SET @auto = 1
	SET @counter = 0
	
	SELECT @mID = (members.member_Number)
	FROM members
	
	SELECT *
	FROM members
	WHERE member_Number = @mID
		
	WHILE @counter<@totalMembers 
	BEGIN
		SELECT @name = members.name, @cell = members.cell_Number
		FROM members
		WHERE members.class_code = @class_code
		Print @auto +'	' + @name + '				'+ @cell
		SET @auto = @auto + 1
		SET @counter = @counter + 1
	END
GO

/* ---------------------------------------------------------------------------------------------------------- *
*			Script File Name : sp_DeleteBook																  *
*			Programmer Name : Tejas Dwarkaram																  *
*			Date : 2012.04.26																				  *
*			Description : Stored Procedure to delete a book record from the exercise books table			  *
* ----------------------------------------------------------------------------------------------------------- */

CREATE PROCEDURE sp_DeleteBook(@book_ID VARCHAR(30))
	AS 
	IF(@book_ID = (SELECT bookID FROM vw_Exercises))
	BEGIN
		PRINT'The book that needs to be deleted cannot be deleted at this time.'
	END 
	ELSE
	BEGIN
		DELETE FROM Exercise_Books
		WHERE book_ID = @book_ID
	END
GO
	
/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : sp_AddNewExercise															  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.03																				  *
*			Description : Stored Procedure to add a new exercise record to the Exercises table				  *
* ----------------------------------------------------------------------------------------------------------- */
CREATE PROCEDURE sp_AddNewExercise(@bookID VARCHAR(30), @name VARCHAR(100), @description VARCHAR(800), @length TIME, @timesDone INT)
	AS 
	INSERT INTO Exercises
	VALUES (@bookID,@name,@description,@length,@timesDone)
GO