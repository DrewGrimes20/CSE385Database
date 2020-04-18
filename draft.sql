/*
Authors:
Alex Chirokov
Andrew Grimes
*/

USE master;
GO

DROP DATABASE IF EXISTS PremierLeague;
GO

CREATE DATABASE PremierLeague;
GO

USE PremierLeague;
GO
--=====================TABLES

CREATE TABLE PlayerStats(	
	playerStatsId	INT			NOT NULL	IDENTITY	PRIMARY KEY,
	playerId		INT			NOT NULL	foreign key references Players(playerId),
	assists			INT			NOT NULL,
	appearances		INT			NOT NULL,
	yellowCards		INT			NOT	NULL,
	redCards		INT			NOT NULL,
	salary			FLOAT		NOT	NULL,
	contractLength	VARCHAR(30)	NOT	NULL,
	gamesMissed		INT			NOT	NULL,
	number			INT			NOT NULL,
	goals			INT			NOT NULL
);

CREATE TABLE City(
	cityId		INT			NOT	NULL	IDENTITY	PRIMARY KEY,
	cityName	VARCHAR(50)	NOT NULL,
	countryName	VARCHAR(50)	NOT	NULL
);

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