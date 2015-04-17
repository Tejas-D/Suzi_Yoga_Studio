/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : ind_studioNum																  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : Index the studio number column 													  *
* ---------------------------------------------------------------------------------------------------------- */
USE Suzi_Yoga_Studio
GO

CREATE INDEX ind_studioNum
ON members(studio_Number)
GO

/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : ind_extype																	  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.07																				  *
*			Description : Index the exercise type column													  *
* ---------------------------------------------------------------------------------------------------------- */

CREATE INDEX ind_extype
ON exercise_Books(exercise_Type)
GO
