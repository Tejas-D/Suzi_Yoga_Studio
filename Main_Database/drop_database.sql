/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File  Name : Drop_Database																  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.04.26																				  *
*			Description : Delete the Suzi_Yoga_Studio database												  *
* ---------------------------------------------------------------------------------------------------------- */
USE master
GO

IF EXISTS(SELECT name FROM master.dbo.sysdatabases
	WHERE name = 'Suzi_Yoga_Studio')
	DROP DATABASE Suzi_Yoga_Studio
	GO