USE master;
GO
DROP DATABASE IF EXISTS Grimes_Chirokov_SoccerLeague;
GO
CREATE DATABASE Grimes_Chirokov_SoccerLeague;
GO
USE Grimes_Chirokov_SoccerLeague;
GO

CREATE TABLE Manager(
	managerId			INT			NOT NULL	IDENTITY	PRIMARY KEY,
	firstName			VARCHAR(30)	NOT NULL,
	lastName			VARCHAR(30)	NOT NULL,
	nationality			VARCHAR(30)	NOT NULL,
	age					INT			NOT NULL,
	club				VARCHAR(40)	NOT NULL,
	yearsManaging		INT			NOT NULL,
	preferedFormation	VARCHAR(40) NOT NULL
);

CREATE TABLE City(
	cityId		INT			NOT	NULL	IDENTITY	PRIMARY KEY,
	cityName	VARCHAR(50)		NOT NULL
);

CREATE TABLE Clubs (
    clubId              INT            NOT NULL        IDENTITY    PRIMARY KEY,
    managerId           INT            NOT NULL        foreign key references Manager(managerId),
    cityId              INT            NOT NULL        foreign key references City(cityId),
    age                 INT            NOT NULL,
    winCount            INT            NOT NULL        default(0),     
    lossCount           INT            NOT NULL        default(0),
    drawCount           INT            NOT NULL        default(0),
    leaguePoints        INT            NOT NULL        default(0),
    clubName            VARCHAR(100)   NOT NULL
);


CREATE TABLE Cleats (
    cleatId            INT            NOT NULL        IDENTITY   PRIMARY KEY,
    brand              VARCHAR(100),
    model              VARCHAR(100)
);

CREATE TABLE Players(
    playerId       INT		           NOT NULL        IDENTITY   PRIMARY KEY,
    clubId         INT            NOT NULL        foreign key references Clubs(clubId),
    cleatId        INT            NOT NULL        foreign key references Cleats(cleatId),
    firstName      VARCHAR(100)            NOT NULL,
    lastName       VARCHAR(100)            NOT NULL,
    number         INT			   NOT NULL,
    age            INT			   NOT NULL,
    nationality    VARCHAR(100)            NOT NULL,
    position       VARCHAR(100)            NOT NULL,
    IndividualId   INT            NOT NULL,
);

CREATE TABLE PlayerStats(	
	playerStatsId	INT			NOT NULL	IDENTITY	PRIMARY KEY,
	playerId		INT			NOT NULL	foreign key references Players(playerId),
	assists			INT			NOT NULL	default(0),
	appearances		INT			NOT NULL	default(0),
	yellowCards		INT			NOT NULL	default(0),
	redCards		INT			NOT NULL	default(0),
	salary			FLOAT			NOT NULL	default(0),
	contractLength		VARCHAR(30)		NOT NULL	default(0),
	gamesMissed		INT			NOT NULL	default(0),
	number			INT			NOT NULL	default(0),
	goals			INT			NOT NULL	default(0)
);
GO


SET IDENTITY_INSERT City ON
INSERT INTO City (cityId, cityName) VALUES
	-- Arsenal 
	(1, 'Islington'),
	-- Aston Villa
	(2, 'Birmingham'),
	-- AFC Bournemoth
	(3,'Bournemouth'),
	-- Brighton and Hove Albion
	(4, 'Brighton'),
	-- Burnley
	(5,'Lancashire'),
	-- Chelsea
	(6,'Fulham'),
	-- Crystal Palace
	(7,'Selhurst'),
	-- Everton
	(8,'Liverpool'),
	-- Leicester City
	(9, 'Leicester'),
	-- Liverpool
	(10, 'Liverpool'),
	-- Manchester City
	(11, 'Manchester'),
	-- Manchester United
	(12, 'Manchester'),
	-- Newcastle United
	(13, 'Tyne'),
	-- Norwich City
	(14, 'Norwich'),
	-- Sheffield United
	(15, 'Sheffield'),
	-- Southampton
	(16, 'Hampshire'),
	-- Tottenham
	(17, 'Tottenham'),
	-- Watford
	(18, 'Hertfordshire'),
	-- West Ham United
	(19, 'Stratford'),
	-- Wolverhampton Wonders
	(20,'Wolverhampton')
	SET IDENTITY_INSERT City OFF
	GO

SET IDENTITY_INSERT Cleats ON
INSERT INTO Cleats (cleatId, brand, model) VALUES
	(1, 'Nike', 'Mercurial'),
	(2, 'Adidas', 'X'),
	(3,'Nike', 'Phantom VNM'),
	(4, 'Adidas', 'Predator'),
	(5, 'Adidas', 'Nemeziz'),
	(6, 'Nike', 'Tiempo'),
	(7, 'Adidas', 'Copa'),
	(8, 'Nike','Phantom VSN'),
	(9, 'Puma', 'ONE'),
	(10, 'Puma', 'Future'),
	(11, 'Under Armor', 'Magnetico')
SET IDENTITY_INSERT Cleats OFF
GO

SET IDENTITY_INSERT Manager ON
INSERT INTO Manager (managerId, firstName, lastName, nationality, age, club, yearsManaging, preferedFormation) VALUES
	-- Arsenal 
	(1, 'Mikel', 'Arteta', 'Spain', 38, 'Arsenal', 1, '4-2-3-1'),
	-- Aston Villa
	(2, 'Dean', 'Smith', 'England', 49, 'Aston Villa', 1, '4-2-3-1'),
	-- AFC Bournemoth
	(3, 'Eddie', 'Howe', 'England', 42, 'AFC Bournemouth', 6, '4-1-4-1'),
	-- Brighton and Hove Albion
	(4, 'Graham', 'Potter', 'England', 44, 'Brighton and Hove Albion', 1, '4-3-3'),
	-- Burnley
	(5, 'Sean', 'Dyche', 'England', 48, 'Burnley', 8, '4-4-2'),
	-- Chelsea
	(6, 'Frank', 'Lampard', 'England', 41, 'Chelsea', 1, '4-3-3'),
	-- Crystal Palace
	(7, 'Roy', 'Hodgson', 'England', 72, 'Crystal Palace', 3, '4-3-3'),
	-- Everton
	(8, 'Carlo', 'Ancelotti', 'Italy', 60, 'Everton', 1, '4-4-2'),
	-- Leicester City
	(9, 'Brendan', 'Rodgers', 'England', 47, 'Leicester City', 1, '4-1-4-1'),
	-- Liverpool
	(10, 'Jürgen', 'Klopp', 'Germany', 52, 'Liverpool', 3, '4-3-3'),
	-- Manchester City
	(11, 'Pep', 'Guardiola', 'Spain', 49, 'Manchester City', 4,'4-3-3'),
	-- Manchester United
	(12, 'Ole Gunnar', 'Solskjaer', 'Norway', 47, 'Manchester United', 2,'3-4-1-2'),
	-- Newcastle United
	(13, 'Steve', 'Bruce', 'England', 59, 'Newcastle United', 1, '4-2-3-1'),
	-- Norwich City
	(14, 'Daniel', 'Farke', 'Germany', 43, 'Norwich City', 3, '4-2-3-1'),
	-- Sheffield United
	(15, 'Chris', 'Wilder', 'England', 52, 'Sheffield United', 4, '3-5-2'),
	-- Southampton
	(16, 'Ralph', 'Hasenhüttl', 'Austria', 52, 'Southampton', 2, '4-4-2'),
	-- Tottenham
	(17, 'José', 'Mourinho', 'Portugal', 57, 'Tottenham', 1, '3-4-2-1'),
	-- Watford
	(18, 'Nigel', 'Pearson', 'England', 56, 'Watford', 1, '4-2-3-1'),
	-- West Ham United
	(19, 'David', 'Moyes', 'England', 56, 'West Ham United', 1, '4-4-2'),
	-- Wolverhampton Wonders
	(20, 'Nuno Espírito', 'Santo', 'Portugal', 46, 'Wolverhampton Wonders', 3, '3-4-3')
SET IDENTITY_INSERT Manager OFF
GO

INSERT INTO Clubs (managerId, cityId, age, clubName) VALUES
	-- Arsenal 
	(1, 1, 134, 'Arsenal'),
	-- Aston Villa
	(2, 2, 145, 'Aston Villa'),
	-- AFC Bournemoth
	(3, 3, 121, 'AFC Bournemoth'),
	-- Brighton and Hove Albion
	(4, 4, 119, 'Brighton'),
	-- Burnley
	(5, 5, 137, 'Burnley'),
	-- Chelsea
	(6, 6, 115, 'Chelsea'),
	-- Crystal Palace
	(7, 7, 114, 'Crystal Palace'),
	-- Everton
	(8, 8, 142, 'Everton'),
	-- Leicester City
	(9, 9, 136, 'Leicester City'),
	-- Liverpool
	(10, 10, 128, 'Liverpool'),
	-- Manchester City
	(11, 11, 140, 'Manchester City'),
	-- Manchester United
	(12, 12, 142, 'Manchester United'),
	-- Newcastle United
	(13, 13, 128, 'Newcastle United'),
	-- Norwich City
	(14, 14, 118, 'Norwich City'),
	-- Sheffield United
	(15, 15, 131, 'Sheffield United'),
	-- Southampton
	(16, 16, 134, 'Southampton'),
	-- Tottenham
	(17, 17, 138, 'Tottenham'),
	-- Watford
	(18, 18, 139, 'Watford'),
	-- West Ham United
	(19, 19, 135, 'West Ham'),
	-- Wolverhampton Wonders
	(20, 20, 153, 'Wolves')

GO


INSERT INTO Players (clubId, cleatId, firstName, lastName, number, age, nationality, position, IndividualId) VALUES
	-- Arsenal 
	(1, 1, 'Bernd', 'Leno', 1, 28, 'Germany', 'GK', 1),
	(1, 3, 'Kieran', 'Tierny', 3, 22, 'Scotland', 'LB', 2),
	(1, 2, 'David', 'Luiz', 23, 32, 'Brazil', 'CB', 3),
	(1, 5, 'Sokratis', 'Papastathopoulos', 5, 31, 'Greece', 'CB', 4),
	(1, 1, 'Héctor', 'Bellerín', 2, 25, 'Spain', 'RB', 5),
	(1, 8, 'Joseph', 'Willock', 28, 20, 'England', 'CM', 6),
	(1, 9, 'Matteo', 'Guendouzi', 29, 21, 'France', 'CM', 7),
	(1, 2, 'Mesut', 'Özil', 10, 31, 'Germany', 'CAM', 8),
	(1, 2, 'Pierre-Emerick', 'Aubameyang', 14, 30, 'Goban', 'LM', 9),
	(1, 1, 'Nicolas', 'Pépé', 19, 24, 'Cote DIvoire', 'RM', 10),
	(1, 3, 'Alexandre', 'Lacazette', 9, 28, 'France', 'ST', 11),

	-- Aston Villa
	(2, 1, 'Tom', 'Heaton', 1, 34, 'England', 'GK', 12),
	(2, 1, 'Tyrone', 'Mings', 40, 27, 'England', 'CB', 13),
	(2, 11, 'Ezri Konsa', 'Ngoyo', 15, 22, 'England', 'CB', 14),
	(2, 10, 'Matt', 'Targett', 18, 24, 'England', 'LB', 15),
	(2, 4, 'Björn', 'Engels', 22, 25, 'Belgium', 'RB', 16),
	(2, 4, 'John', 'McGinn', 7, 25, 'Scotland', 'CM', 17),
	(2, 5, 'Conor', 'Hourihane', 14, 29, 'Ireland', 'CM', 18),
	(2, 2, 'Jack', 'Grealish', 10, 24, 'England', 'CAM', 19),
	(2, 1, 'Mahmoud Ahmed Ibrahim Hassan', 'Trézéguet', 17, 25, 'Egypt', 'LM', 20),
	(2, 3, 'Anwar', 'El Ghazi', 21, 24, 'Netherlands', 'RM', 21),
	(2, 1, 'Wesley Moraes Ferreira da', 'Silva', 9, 23, 'Brazil', 'ST', 22),

	-- AFC Bournemoth
	(3, 1,'Aaron', 'Ramsdale', 12, 21, 'England', 'GK', 23),
	(3, 1,'Steve', 'Cool', 3, 29, 'England', 'CB', 24),
	(3, 1, 'Nathan','Aké', 5, 25, 'Netherlands', 'CB', 25),
	(3, 11, 'Simon','Francis', 2, 35, 'England', 'LB', 26),
	(3, 7, 'Adam', 'Smith', 15, 28, 'England', 'RB', 27),
	(3, 8, 'Philip', 'Billing', 29, 23, 'Denmark', 'CM', 28),
	(3, 2, 'Jefferson', 'Lerma', 8, 25, 'Colombia', 'CM', 29),
	(3, 2, 'David', 'Brooks', 20, 22, 'Wales', 'RM', 30),
	(3, 11, 'Ryan', 'Fraser', 24, 26, 'Scotland', 'LM', 31),
	(3, 4,'Joshua','King', 7, 28, 'Norway', 'ST', 32),
	(3, 4, 'Harry', 'Wilson', 22, 23, 'Wales', 'ST', 33),

	-- Brighton and Hove Albion
	(4,2, 'Mat','Ryan', 1,28, 'Australia', 'GK', 34),
	(4,2, 'Dan', 'Burn', 33, 27, 'England', 'CB', 35),
	(4,1, 'Lewis','Dunk', 5, 28, 'England','CB', 36),
	(4,3, 'Shane', 'Duffy', 4, 28, 'Ireland', 'CB', 37),
	(4,7, 'Bernardo', ' Fernandes da Silva Junior', 3, 24, 'Brazil', 'LWB', 38),
	(4,6, 'Martín', 'Montoya', 22, 29, 'Spain', 'RWB', 39),
	(4,5, 'Davy', 'Pröpper', 24, 28, 'Netherlands', 'CM', 40),
	(4,6, 'Dale', 'Stephens', 6, 30, 'England', 'CM', 41),
	(4,4, 'Pascal', 'Gross', 13, 28, 'Germany', 'CAM', 42),
	(4,3, 'Neal', 'Maupay', 7, 23, 'France', 'CF', 43),
	(4,1, 'Glenn', 'Murray', 17, 36, 'England', 'CF', 44),

	-- Burnley
	(5,1, 'Nick','Pope', 1,28,'England','GK',45),
	(5,1, 'Ben','Mee', 6,30,'England','CB',46),
	(5,1, 'James','Tarkowski', 5,27,'England','CB',47),
	(5,4, 'Erik','Pieters', 23,31,'Netherlands','LB',48),
	(5,5, 'Matthew','Lowton', 2,30,'England','RB',49),
	(5,2, 'Jack','Cork', 4,30,'England','CDM',50),
	(5,2, 'Ashley','Westwood', 18,30,'England','CM',51),
	(5,2, 'Jeff','Hendrick', 13,28,'Ireland','CAM',52),
	(5,3, 'Jóhann','Gudmundsson', 7,29,'Iceland','LM',53),
	(5,6, 'Aaron','Lennon', 25,33,'England','RM',54),
	(5,8, 'Chris','Wood', 9,28,'New Zealand','ST',55),

	-- Chelsea
	(6,2, 'Kepa', 'Arrizabalaga', 1, 25, 'Spain', 'GK', 56),
	(6,4, 'Antonio', 'Rüdiger', 2, 27, 'Germany', 'CB', 57),
	(6,5, 'Kurt', 'Zouma', 63, 25, 'France', 'CB', 58),
	(6,1, 'Marcos', 'Alonso', 3, 29, 'Spain', 'LB', 59),
	(6,1, 'César', 'Azpilicueta', 28, 30, 'Spain', 'RB', 60),
	(6,3, 'NGolo', 'Kanté', 7, 29, 'France', 'CDM', 61),
	(6,2, 'Ross', 'Barkley', 8, 26, 'England', 'CM', 62),
	(6,1, 'Ruben', 'Loftus-Cheek', 12, 24, 'England', 'CM', 63),
	(6,2, 'Christian', 'Pulisic', 22, 21, 'United States', 'LW', 64),
	(6,5, 'Willian', 'Borges Da Silva', 10, 31, 'Brazil', 'RW', 65),
	(6,3, 'Callum', 'Hudson-Odobi', 20, 19, 'England', 'ST', 66),

	-- Crystal Palace
	(7,4, 'Vicente', 'Guaita', 31, 33, 'Spain', 'GK', 67),
	(7,7, 'Patrick', 'Van Aanholt', 3, 29, 'Netherlands', 'CB', 68),
	(7,2, 'Joel', 'Ward', 2, 30, 'England', 'CB', 69),
	(7,2, 'Luka', 'Milivojevic', 4, 29, 'Serbia', 'LB', 70),
	(7,2, 'Martin', 'Kelly', 34, 29, 'England', 'RB', 71),
	(7,2, 'Max', 'Meyer', 7, 24, 'Germany', 'CDM', 72),
	(7,1, 'Cheikhou', 'Kouyaté', 8, 30, 'Senegal', 'CM', 73),
	(7,1, 'James', 'McArthur', 18, 32, 'Scotland', 'CM', 74),
	(7,4, 'Christian', 'Benteke', 17, 29, 'Belgium', 'LW', 75),
	(7,3, 'Jordan', 'Ayew', 9, 28, 'Ghana', 'RW', 76),
	(7,3, 'Wilfred', 'Zaha', 11, 27, 'Cote DIvoire', 'ST', 77),

	-- Everton
	(8,5, 'Jordan', 'Pickford', 1, 26, 'England', 'GK', 78),
	(8,2, 'Leighton', 'Baines', 3, 35, 'England', 'CB', 79),
	(8,2, 'Michael', 'Keane', 5, 27, 'England', 'CB', 80),
	(8,2, 'Lucas', 'Digne', 12, 26, 'France', 'LB', 81),
	(8,3, 'Séamus', 'Coleman', 23, 31, 'Ireland', 'RB', 82),
	(8,5, 'André', 'Gomes', 21, 26, 'Portugal', 'CM', 83),
	(8,3, 'Fabian', 'Delph', 8, 30, 'England', 'CM', 84),
	(8,2, 'Richarlison', 'De Andrade', 7, 22, 'Brazil', 'CAM', 85),
	(8,2, 'Dominic', 'Calvert-Lewin', 9, 23, 'England', 'LW', 86),
	(8,1, 'Oumar', 'Niasse', 29, 30, 'Senegal', 'RW', 87),
	(8,1, 'Moise', 'Kean', 27, 20, 'Italy', 'ST',88),

	-- Leicester City
	(9,1, 'Kasper', 'Schmeichel', 1, 33, 'Denmark', 'GK', 89),
	(9,1, 'Ben', 'Chilwell', 3, 23, 'England', 'CB', 90),
	(9,1, 'Wes', 'Morgan', 5, 36, 'Jamaica', 'CB', 91),
	(9,2, 'Jonny', 'Evans', 6, 32, 'Northern Ireland', 'LB', 92),
	(9,1, 'Ricardo', 'Pereira', 21, 26, 'Portugal', 'RB', 93),
	(9,2, 'Demarai', 'Gray', 7, 23, 'England', 'CDM', 94),
	(9,2, 'Marc', 'Albrighton', 11, 30, '', 'CDM', 95),
	(9,3, 'James', 'Maddison', 10, 23, 'England', 'CAM', 96),
	(9,5, 'Wilfred', 'Ndidi', 25, 23, 'Nigeria', 'LW', 97),
	(9,5, 'Youri', 'Tielemans', 8, 22, '', 'RW', 98),
	(9,4, 'Jamie', 'Vardy', 9, 33, 'England', 'ST', 99),

	-- Liverpool
	(10,1, 'Alisson', 'Becker', 1, 27, 'Brazil', 'GK', 100),
	(10,4, 'Virgil', 'Van Dijk', 4, 28, 'Netherlands', 'CB', 101),
	(10,6, 'Joseph', 'Gomez', 12, 22, 'England', 'CB', 102),
	(10,3, 'Andrew', 'Robetson', 26, 26, 'Scotland', 'LB', 103),
	(10,2, 'Trent', 'Alexander-Arnold', 66, 21, 'England', 'RB', 104),
	(10,1, 'Fábio', 'Henrique Tavares', 3, 26, 'Brazil', 'CDM', 105),
	(10,2, 'Georginio', 'Wijnaldum', 5, 29, 'Netherlands', 'CM', 106),
	(10,2, 'Jordan', 'Henderson', 14, 29, 'England', 'CM', 107),
	(10,1, 'Sadio', 'Mane', 10, 28, 'Senegal', 'LW', 108),
	(10,1, 'Mohamed', 'Salah', 11, 27, 'Egypt', 'RW', 109),
	(10,1, 'Roberto', 'Firmino', 9, 28, 'Brazil', 'CF', 110),

	-- Manchester City
	(11,1, 'Ederson', 'Santana De Moraes', 1, 26, 'Brazil', 'GK', 111),
	(11,1, 'Aymeric', 'Laporte', 14, 25, 'France', 'CB', 112),
	(11,1, 'John', 'Stones', 5, 25, 'England', 'CB', 113),
	(11,2, 'Benjamin', 'Mendy', 22, 25, 'France', 'LB', 114),
	(11,2, 'Kyle', 'Walker', 2, 29, 'England', 'RB', 115),
	(11,4, 'Ilkay', 'Gündogan', 8, 29, 'Germany', 'CM', 116),
	(11,3, 'David', 'Silva', 21, 34, 'Spain', 'CM', 117),
	(11,1, 'Kevin', 'De Bruyne', 17, 28, 'Belgiun', 'CAM', 118),
	(11,2, 'Sergio', 'Agüero', 10, 31, 'Argentina', 'ST', 119),
	(11,2, 'Leroy', 'Sané', 19, 24, 'Germany', 'LW', 120),
	(11,1, 'Raheem', 'Sterling', 7, 25, 'England', 'RW', 121),

	-- Manchester United
	(12,1, 'David', 'De Gea', 1, 29, 'Spain', 'GK', 122),
	(12,1, 'Victor', 'Lindelöf', 2, 25, 'Sweden', 'CB', 123),
	(12,2, 'Eric', 'Bailly', 3, 26, 'Cote DIvoire', 'CB', 124),
	(12,1, 'Luke', 'Shaw', 23, 24, 'England', 'LB', 125),
	(12,2, 'Aaron', 'Wan-Bissaka', 29, 22, 'England', 'RB', 126),
	(12,1, 'Paul', 'Pogba', 6, 27, 'France', 'CM', 127),
	(12,2, 'Jesse', 'Lingard', 14, 27, 'England', 'CM', 128),
	(12,1, 'Bruno', 'Fernandes', 18, 25, 'Portugal', 'CAM', 129),
	(12,8, 'Marcus', 'Rashford', 10, 22, 'England', 'LW', 130),
	(12,2, 'Anthony', 'Martial', 9, 24, 'France', 'RW', 131),
	(12,2, 'Mason', 'Greenwood', 26, 18, 'England', 'ST', 132),

	-- Newcastle United
	(13,1, 'Martin', 'Dubravka', 1, 31, 'Slovakia', 'GK', 133),
	(13,1, 'Ciaran', 'Clark', 2, 30, 'Ireland', 'CB', 134),
	(13,1, 'Paul', 'Dummett', 3, 28, 'Wales', 'CB', 135),
	(13,1, 'Fabian', 'Schär', 5, 28, 'Switzerland', 'CB', 136),
	(13,1, 'Jonjo', 'Shelvey', 8, 28, 'England', 'CM', 137),
	(13,1, 'Matt', 'Ritchie', 11, 30, 'Scotland', 'CM', 138),
	(13,1, 'Miguel', 'Almirón', 24, 26, 'Paraguay', 'CAM', 139),
	(13,1, 'Sean', 'Longstaff', 36, 22, 'England', 'CAM', 140),
	(13,1, 'Allan', 'Saint-Maximin', 10, 23, 'France', 'LW', 141),
	(13,1, 'Dwight', 'Gayle', 12, 29, 'England', 'RW', 142),
	(13,1, 'Andy', 'Carroll', 7, 31, 'England', 'ST', 143),

	-- Norwich City
	(14,1, 'Tim', 'Krul', 1, 32, 'Netherlands', 'GK', 144),
	(14,1, 'Jamal', 'Lewis', 12, 22, 'Northern Ireland', 'CB', 145),
	(14,1, 'Timm', 'Klose', 15, 31, 'Switzerland', 'CB', 146),
	(14,1, 'Max', 'Aarons', 2, 20, 'England', 'LB', 147),
	(14,1, 'Sam', 'Byram', 3, 26, 'England', 'RB', 148),
	(14,1, 'Tom', 'Trybull', 4, 27, 'Germany', 'CDM', 149),
	(14,1, 'Marco', 'Stiepermann', 18, 29, 'Germany', 'CM', 150),
	(14,1, 'Onel', 'Hernández', 11, 27, 'Cuba', 'CM', 151),
	(14,1, 'Teemu', 'Pukki', 22, 30, 'Finland', 'LW', 152),
	(14,1, 'Josip', 'Drmic', 20, 27, 'Switzerland', 'RW', 153),
	(14,1, 'Adam', 'Idah', 35, 19, 'Ireland', 'ST', 154),

	-- Sheffield United
	(15,1, 'Dean', 'Henderson', 1, 23, 'England', 'GK', 155),
	(15,1, 'George', 'Baldock', 2, 27, 'England', 'CB', 156),
	(15,1, 'Enda', 'Stevens', 3, 29, 'Ireland', 'CB', 157),
	(15,2, 'Jack', 'OConnell', 5, 26, 'England', 'CB', 158),
	(15,2, 'John', 'Lundstram', 7, 26, 'England', 'LM', 159),
	(15,3, 'John', 'Fleck', 4, 28, 'Scotland', 'RM', 160),
	(15,2, 'Oliver', 'Norwood', 16, 29, 'Northern Ireland', 'CM', 161),
	(15,4, 'Sander', 'Berge', 32, 22, 'Norway', 'CM', 162),
	(15,4, 'Billy', 'Sharp', 10, 34, 'England', 'CAM', 163),
	(15,2, 'Lys', 'Mousset', 22, 24, 'France', 'ST', 164),
	(15,3, 'Oliver', 'McBurnie', 9, 23, 'Scotland', 'ST', 165),

	-- Southampton
	(16,4, 'Alex', 'McCarthy', 1, 30, 'England', 'GK', 166),
	(16,8, 'Jannik', 'Vestergaard', 4, 27, 'Denmark', 'CB', 167),
	(16,9, 'Ryan', 'Bertrand', 21, 30, 'England', 'CB', 168),
	(16,1, 'Yan', 'Valery', 43, 21, 'France', 'RB', 169),
	(16,1, 'Jake', 'Vokins', 29, 20, 'England', 'LB', 170),
	(16,2, 'Oriol', 'Romeu', 14, 28, 'Spain', 'CDM', 171),
	(16,2, 'James', 'Ward-Prowse', 16, 25, 'England', 'CM', 172),
	(16,3, 'Stuart', 'Armstrong', 17, 28, 'Scotland', 'CM', 173),
	(16,5, 'Michael', 'Michael', 20, 19, 'Ireland', 'LW', 174),
	(16,2, 'Danny', 'Ings', 9, 27, 'England', 'RW', 175),
	(16,1, 'Che', 'Adams', 10, 23, 'England', 'ST', 176),

	-- Tottenham
	(17,1, 'Hugo', 'Lloris', 1, 33, 'France', 'GK', 177),
	(17,3, 'Toby', 'Alderweireld', 27, 31, 'Belgium', 'CB', 178),
	(17,3, 'Jan', 'Vertonghen', 5, 32, 'Belgium', 'CB', 179),
	(17,4, 'Davinson', 'Sánchez', 6, 23, 'Colombia', 'LB', 180),
	(17,5, 'Serge', 'Aurier', 24, 27, 'Cote DIvoire', 'RB', 181),
	(17,6, 'Moussa', 'Sissoko', 17, 30, 'France', 'CM', 182),
	(17,1, 'Dele', 'Ali', 20, 24, 'England', 'CM', 183),
	(17,7, 'Son', 'Heung-Min', 7, 27, 'South Korea', 'CAM', 184),
	(17,2, 'Steven', 'Bergwijn', 23, 22, 'Netherlands', 'LW', 185),
	(17,2, 'Lucas', 'Moura', 27, 27, 'Brazil', 'RW', 186),
	(17,1, 'Harry', 'Kane', 10, 26, 'England', 'ST', 187),

	-- Watford
	(18,1, 'Ben', 'Foster', 1, 37, 'England', 'GK', 188),
	(18,1, 'Adam', 'Masina', 11, 26, 'Italy', 'CB', 189),
	(18,1, 'Craig', 'Cathcart', 15, 31, 'Northern Ireland', 'CB', 190),
	(18,1, 'Kiko', 'Femenía', 21, 29, 'Spain', 'LB', 191),
	(18,2, 'José', 'Holebas', 25, 35, 'Greece', 'RB', 192),
	(18,2, 'Etienne', 'Capoue', 29, 31, 'France', 'CM', 193),
	(18,2, 'Tom', 'Dele-Bashiru', 24, 20, 'Nigeria', 'CM', 194),
	(18,2, 'Gerard', 'Deulofeu', 7, 26, 'Spain', 'LM', 195),
	(18,3, 'Jayden', 'Bennetts', 58, 18, 'England', 'RM', 196),
	(18,2, 'Troy', 'Deeney', 9, 31, 'England', 'ST', 197),
	(18,4, 'Ismaila', 'Sarr', 23, 22, 'Senegal', 'ST', 198),

	-- West Ham United
	(19,2, 'Darren', 'Randolph', 35, 32, 'Ireland', 'GK', 199),
	(19,1, 'Aaron', 'Cresswell', 3, 30, 'England', 'CB', 200),
	(19,1, 'Fabián', 'Balbuena', 4, 28, 'Paraguay', 'CB', 201),
	(19,1, 'Arthur', 'Masuaku', 26, 26, 'The Democratic Republic Of Congo', 'LB', 202),
	(19,1, 'Pablo', 'Zabaleta', 5, 35, 'Argentina', 'RB', 203),
	(19,2, 'Mark', 'Noble', 16, 32, 'England', 'CDM', 204),
	(19,3, 'Declan', 'Rice', 41, 21, 'England', 'CDM', 205),
	(19,3, 'Robert', 'Snodgrass', 11, 32, 'Scotland', 'CM', 206),
	(19,4, 'Felipe', 'Anderson', 8, 27, 'Brazil', 'LW', 207),
	(19,4, 'Manuel', 'Lanzini', 10, 27, 'Argentina', 'RW', 208),
	(19,5, 'Sébastien', 'Haller', 22, 25, 'France', 'ST', 209),

	-- Wolverhampton Wonders
	(20,1, 'Rui', 'Patrício', 11, 32, 'Portugal', 'GK', 210),
	(20,1, 'Willy', 'Boly', 15, 29, 'France', 'CB', 211),
	(20,1, 'Conor', 'Coady', 16, 27, 'England', 'CB', 212),
	(20,2, 'Rúben', 'Neves', 8, 23, 'Portugal', 'CB', 213),
	(20,2, 'João', 'João', 28,33, 'Portugal', 'CM', 214),
	(20,2, 'Romain', 'Saïss', 27, 30, 'Morocco', 'CM', 215),
	(20,2, 'Diogo', 'Jota', 18, 23, 'Portugal', 'LM', 216),
	(20,4, 'Daniel', 'Podence', 10, 24, 'Portugal', 'RM', 217),
	(20,3, 'Pedro', 'Neto', 7, 20, 'Portugal', 'LW', 218),
	(20,1, 'Adama', 'Traoré', 37, 24, 'Spain', 'RW', 219),
	(20,3, 'Raúl', 'Jiménez', 9, 28, 'Mexico', 'ST', 220)

GO

INSERT INTO PlayerStats (playerId) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66),
	(67),
	(68),
	(69),
	(70),
	(71),
	(72),
	(73),
	(74),
	(75),
	(76),
	(77),
	(78),
	(79),
	(80),
	(81),
	(82),
	(83),
	(84),
	(85),
	(86),
	(87),
	(88),
	(89),
	(90),
	(91),
	(92),
	(93),
	(94),
	(95),
	(96),
	(97),
	(98),
	(99),
	(101),
	(102),
	(103),
	(104),
	(105),
	(106),
	(107),
	(108),
	(109),
	(110),
	(111),
	(112),
	(113),
	(114),
	(115),
	(116),
	(117),
	(118),
	(119),
	(120),
	(121),
	(122),
	(123),
	(124),
	(125),
	(126),
	(127),
	(128),
	(129),
	(130),
	(131),
	(132),
	(133),
	(134),
	(135),
	(136),
	(137),
	(138),
	(139),
	(140),
	(141),
	(142),
	(143),
	(144),
	(145),
	(146),
	(147),
	(148),
	(149),
	(150),
	(151),
	(152),
	(153),
	(154),
	(155),
	(156),
	(157),
	(158),
	(159),
	(160),
	(161),
	(162),
	(163),
	(164),
	(165),
	(166),
	(167),
	(168),
	(169),
	(170),
	(171),
	(172),
	(173),
	(174),
	(175),
	(176),
	(177),
	(178),
	(179),
	(180),
	(181),
	(182),
	(183),
	(184),
	(185),
	(186),
	(187),
	(188),
	(189),
	(190),
	(191),
	(192),
	(193),
	(194),
	(195),
	(196),
	(197),
	(198),
	(199),
	(200),
	(201),
	(202),
	(203),
	(204),
	(205),
	(206),
	(207),
	(208),
	(209),
	(210),
	(211),
	(212),
	(213),
	(214),
	(215),
	(216),
	(217),
	(218),
	(219),
	(220)

-- SELECT * FROM PlayerStats
-- SELECT * FROM Players
-- SELECT * FROM Clubs
 --SELECT * FROM Cleats
-- SELECT * FROM City
-- SELECT * FROM Manager
