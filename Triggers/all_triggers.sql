/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : trg_underage																	  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.10																				  *
*			Description : creating a trigger to check the age of the new member								  *
* ----------------------------------------------------------------------------------------------------------- */
USE Suzi_Yoga_Studio
GO

CREATE TRIGGER young_person
		ON Members AFTER INSERT
		AS IF UPDATE(date_of_birth)
		BEGIN
			DECLARE @age INT
			DECLARE @new_Birth DATE
			SET @new_Birth = (SELECT date_of_birth FROM inserted)
			SET @age = (YEAR(GETDATE())-(YEAR(@new_Birth)))
			IF(@age<16)
				BEGIN
					RAISERROR('You are not of the appropriate age as yet.Only over 16 allowed.',16,10)
					ROLLBACK TRANSACTION
				END
		END
GO

/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : trg_cancellation																  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.05.10																				  *
*			Description : creating a trigger to inform suzi of the members that need to be informed if there  *
*						  is a cancellation																	  *
* ----------------------------------------------------------------------------------------------------------- */
CREATE TRIGGER inform_cancel
	ON class_sessions AFTER UPDATE
	AS IF UPDATE(cancelled)
	DECLARE @cancelYes VARCHAR(1)
	DECLARE @classcode VARCHAR(6)
	SET @cancelYes = (SELECT cancelled FROM inserted)
	SET @classcode = (SELECT class_code FROM inserted)
	BEGIN
		IF(@cancelYes = 'Y')
			BEGIN
				SELECT name, cell_Number, email_Address
				INTO #tempTable
				FROM members, class_sessions
				WHERE members.class_code = @classcode
			END
	END
	PRINT 'The following members need to be informed of the cancellation'
	SELECT * 
	FROM #tempTable
GO