CREATE DATABASE Cinema
USE Cinema
CREATE TABLE Actors
(
Id int identity (1,1)  PRIMARY KEY,
Name nvarchar (50),
Surname nvarchar(60),
Age int
)
INSERT INTO Actors (Name,Surname,Age)
Values ('Sabina','Novruzova',21),
      ('Aysha','Ulukhanova',20),
	  ('Zulfiyya','Huseynova',20),
	  ('Aysu','Mammadova',19)

SELECT * FROM Actors

	 
CREATE TABLE Customers
(
Id int identity (1,1)  PRIMARY KEY,
Name nvarchar (50),
Surname nvarchar(60),
Age int
)
INSERT INTO Customers (Name,Surname,Age)
Values ('Sebine','Camalova',22),
('Nezrin','Quliyeva',21),
('Dilshad','Cahangirova',22),
('Nigar','Murselova',23)
SELECT * FROM Customers


CREATE TABLE [Sessions] 
(
Id int identity (1,1)  PRIMARY KEY,
Time datetime
)
INSERT INTO [Sessions]([Time])
VALUES('23:00'),
      ('12:00'),
	  ('10:00'),
	  ('22:30'),
	  ('17:00')

SELECT * FROM  [Sessions]
CREATE TABLE Halls 
(
Id int identity (1,1)  PRIMARY KEY,
Name nvarchar(255),
SeatCount int
)
INSERT INTO Halls(Name,SeatCount)
VALUES
('DenizMall',100),
      ('28May',150),
	  ('GenclikMall',200),
	  ('ParkCinema',250),
	  ('Sumqayit',300)
SELECT * FROM Halls

CREATE TABLE Films
(
Id int identity (1,1)  PRIMARY KEY,
Name nvarchar(255),
ReleaseDate datetime
)

INSERT INTO Films (Name,ReleaseDate)
Values ('Morbius',1-04-2022),
('Sonic the Hedgehog 2',1-04-2021),
('Runway 34',29-04-2021),
('Tiger 3',21-03-2021)
SELECT * FROM Films


CREATE TABLE FilmActors
(
Id int identity (1,1)  PRIMARY KEY,
FilmId int references Films(Id),
ActorId int references Actors(Id)
)
INSERT INTO FilmActors(FilmId,ActorId)
VALUES(1,1),
      (2,2),
	  (3,3),
	  (4,4)
	 
SELECT * FROM  FilmActors

CREATE TABLE FilmGenres
(
Id int identity (1,1) PRIMARY KEY,
FilmId int references Films(Id),
GenreId int references Genres(Id)
)
INSERT INTO FilmGenres(FilmId,GenreId)
VALUES(1,1),
      (2,2),
	  (3,3),
	  (4,4),
	  (4,1)
SELECT * FROM FilmGenres

CREATE TABLE Genres
(
Id int identity (1,1)  PRIMARY KEY,
Name nvarchar(255)
)

INSERT INTO Genres(Name)
VALUES('Horror'),
      ('Dramatic'),
	  ('Action'),
	  ('Comedy')

SELECT * FROM Genres

)
CREATE TABLE Tickets
(
Id int identity (1,1)  PRIMARY KEY,
SoldDate datetime,
Price decimal,
Place int,
CustomerId int references Customers(Id),
HallId int references Halls(Id),
FilmId  int references Films (Id),
SessionId  int references [Sessions] (Id)
)
INSERT INTO Tickets(SoldDate,Price,Place,CustomerId,HallId,FilmId,SessionId)
VALUES(13-04-2022,5,15,1,1,1,1),
      (10-04-2022,10,12,2,2,2,2),
	  (10-07-2019,2,4,3,3,3,3),
	  (23-04-2010,3,30,4,4,4,4),
	  (02-02-2022,15,8,4,4,4,5)
 SELECT * FROM Tickets

 CREATE PROCEDURE usp_BuyTicket
AS
SELECT Films.Name,Films.ReleaseDate
FROM Films
JOIN Tickets
ON
Films.Id=Tickets.Id
exec usp_BuyTicket


