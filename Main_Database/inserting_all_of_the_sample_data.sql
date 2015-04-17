/* ---------------------------------------------------------------------------------------------------------- *	
*			Script File Name : insert_all_of_the_sample_data												  *
*			Programmer Name : Tejas Dwarkaram																  *		 
*			Date : 2012.04.26																				  *
*			Description : Inserting rows of data into the tables											  *
* ----------------------------------------------------------------------------------------------------------- */

USE Suzi_Yoga_Studio
GO

INSERT INTO class_sessions
VALUES('md02',1,'Monday',3,'03:30:00','N'),
	('st40',3,'Wednesday',2,'16:00:00','N'),
	('md01',2,'Tuesday',1,'09:30:00','N'),
	('f32g',1,'Friday',3,'03:30:00','N')
GO

INSERT INTO members(name,surname,date_of_birth,cell_Number,email_Address,class_code,studio_number,sessions_Per_Week)
VALUES('Tejas', 'Dwarkaram', '1993.11.22', '0829424982', 'tejas_dwarkaram@eml.cc','md02', 3, 3),
	('Brandon', 'Rossouw', '1989.05.01', '0835734756', 'brandon.rossouw@gmail.com','f32g', 2, 5),
	('Dimitri', 'Gonsalves', '1968.02.28', '0836785985', 'DimzG@mitrimail.com','md02', 3, 2),
	('Devin', 'Botha', '1990.03.25', '0715454250', 'deviB@vinmail.com', 'st40', 1, 4),
	('Albert', 'Rust', '1989.12.03', '0713254459', 'rust@telkomsa.com', 'st40', 4, 2),
	('Nelio', 'Lucas', '1896.01.23', '0829654786', 'nelioL@rbgmail.com','f32g', 3, 6),
	('Mamba', 'Samba', '1990.09.03', '0840021454', 'sambam@mamail.com','st40', 1, 3)
GO

INSERT INTO exercise_Books
VALUES('ks01','Yoga For Life','Bending'),
	('sd01','Breathing New Light','Breathing Techniques'),
	('ks02','Mantra Healing','Self Realisation'),
	('tj98','Meditation through the Universe','Meditation')
GO

INSERT INTO exercises
VALUES('tj98','Rainbow Stretching','This entails the usage of the lower back, in order to stretch the lower
	 back area. This helps with improving posture, and can help to relieve the syptoms of hunchback.'
	 ,'01:00:00',25),
	('ks02','Flamingo Meditation','This meditation routine calms the mind, body and soul. It is done in a 
	flamingo stance i.e. Standing on one foot at a time, and raising ones hands above their head, 
	in the form of praying.','00:03:00',4),
	('ks02','Aathma Relief','Aathma Relief is done whilst laying flat on ones body, joining ones feet together. 
	By raising ur feet a little, without splitting them , you allow the flow of blood throughout the system.',
	'01:00:00',30),
	('tj98','Splitting Bananas','Involving splits in yoga practice allows for improved flexability of the body. 
	By spontaneously doing splits in 4 directions, the chances of arthirtis is lowered.',
	'02:00:00',6),
	('sd01', 'Aum Relaxation','This is a meditation technique that soothes the body and allows the body to 
	communicate together as one.','00:30:00',5),
	('ks01','Breath of life','This exercise, if done correctly, opens the artiries and allows for intensiv
	deep breathing. This deep breathing helps with circulation of air to the brain, as well increases the flow
	of blood to the heart','01:00:00',15),
	('sd01','Lotus Flower','Lotus is a sacred indian flower. The purpose of this exercise is to loosen joints
	and enhance flexability which can strengthen the muscles. Including biceps, triceps and calf muscles.',
	'00:45:00',10)
GO