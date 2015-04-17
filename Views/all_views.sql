/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : vw_TotalClassesPerMember													      *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : View total classes per member														  *
* ---------------------------------------------------------------------------------------------------------- */
USE Suzi_Yoga_Studio
GO

CREATE VIEW vw_TotalClassesPerMember
AS
SELECT name
FROM members
GO


/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : vw_ExerciseUsed															      *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : View the most commonly used														  *
* ---------------------------------------------------------------------------------------------------------- */
CREATE VIEW vw_ExerciseUsed
AS
SELECT TOP 4 name, description, length_Of_Exercise, number_Of_Times_To_Be_Done AS total_times_performed
FROM Exercises
ORDER BY number_Of_Times_To_Be_Done ASC
GO


/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : vw_Exercises																	  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : View title, name, description, and time of exercises to be						  *
* ---------------------------------------------------------------------------------------------------------- */
CREATE VIEW vw_Exercises
AS 
SELECT title, name, description, number_Of_Times_To_Be_Done 
FROM Exercise_Books JOIN Exercises 
	ON Exercise_Books.book_ID = Exercises.book_ID
GO

/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : vw_ClassAttendance															  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : View the class attendance of each													  *
* ---------------------------------------------------------------------------------------------------------- */
CREATE VIEW vw_ClassAttendance
AS
SELECT TOP 100 members.class_code, class_sessions.day,class_sessions.time_Of_Session, class_sessions.studio_Number
FROM members,class_sessions
WHERE members.class_code = class_sessions.class_code	
ORDER BY members.class_code DESC
GO