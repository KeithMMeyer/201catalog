/*
	Jake Trapp, Christion Brown, Keith Meyer, Noah Black, Michael Galgoczy
	4/19/19
	Oakmont Industries GameSource
*/
USE Master
GO

/****** Object:  Database GameSource     ******/
IF DB_ID('GameSource') IS NOT NULL
	DROP DATABASE GameSource
GO

CREATE DATABASE GameSource
GO 

USE GameSource
GO

/****** Object:  Table Games     ******/
CREATE TABLE Games (
	GameID			INT	PRIMARY KEY IDENTITY,
	Name			VARCHAR(50)		NOT NULL,
	ImgLink			VARCHAR(50)		NOT NULL,
	Rating			VARCHAR(10)		NOT NULL,
	Genre			VARCHAR(50)		NOT NULL,
	ReleaseDate		INT				NOT NULL,
	Publisher		VARCHAR(50)		NOT NULL,
	Description		VARCHAR(500)	NOT NULL,
	Price			FLOAT			NOT NULL,
	GamePage		VARCHAR(150)	NOT NULL,
	StreamLink		VARCHAR(150)	NOT NULL
)
GO

/****** Object:  Table Reviews     ******/
CREATE TABLE Reviews (
	ReviewID		INT	PRIMARY KEY IDENTITY,
	GameID			INT	NOT NULL,
	UserID			INT NOT NULL,
	Rating			INT,
	Description		VARCHAR(500) NOT NULL
)
GO

/****** Object:  Table Users     ******/
CREATE TABLE Users (
	UserID			INT	PRIMARY KEY IDENTITY,
	UserFName		VARCHAR(20)	NOT NULL,
	UserLName		VARCHAR(20) NOT NULL,
	UserName		VARCHAR(20)	NOT NULL,
	Password		VARCHAR(20)	NOT NULL
)
GO

/****** Object:  Table Requests     ******/
CREATE TABLE Requests (
	RequestID		INT	PRIMARY KEY IDENTITY,
	RequesteeEmail	VARCHAR(50) NOT NULL,
	GameName		VARCHAR(20)	NOT NULL,
	GameYear		INT,
	GamePublisher	VARCHAR(20),
	Comment		VARCHAR(500)
)
GO



/****** Object:  View Reviews     ******/
CREATE VIEW vwReviews AS(
	SELECT r.*, u.UserFName, u.UserLName
	FROM Reviews r, Users u
	WHERE r.UserID = u.UserID
)
GO

/****** Object:  View Games     ******/
CREATE VIEW vwGames AS(
	SELECT g.*, CONVERT(DECIMAL(10,2), AVG(CAST(r.Rating AS FLOAT))) AS AvgRating 
	FROM Games g, Reviews r
	WHERE r.GameID = g.gameID
	GROUP BY g.GameID, g.Name, g.ImgLink, g.Rating, g.Genre,
	g.ReleaseDate, g.Publisher, g.Description, g.Price,
	g.GamePage, g.StreamLink
)
GO

INSERT Games(Name, ImgLink, Rating, Genre, ReleaseDate,
Publisher, Description, Price, GamePage, StreamLink) VALUES
('Super Mario Bros', 'SMB.jpg', 'PG', 'Platform Game', 1985 ,'Nintendo',
'Super Mario Bros. Description', 5.99,
'SuperMarioBros.html',
'https://www.netflix.com/jp-en/title/60026907'),
('GTA V', 'GTAV.jpg', 'R', 'Violence Game', 2013, 'Rockstar North', 'GTA V Description', 29.99,
'GTAV.html',
'https://www.twitch.tv/directory/game/Grand%20Theft%20Auto%20V'),
('Sonic the Hedgehog','STHH.png','G','Platform Game', 1991,
'Sega','Sonic the Hedgehog Description', 59.90,
'SonicTheHedgehog.html',
'https://www.netflix.com/title/70217161'),
('Minecraft','Minecraft.jpg','PG-13','Building Game', 2009,
'Mojang','Minecraft Description', 26.95,
'Minecraft.html',
'http://pluto.tv/guide/minecraft'),
('Assassins Creed','AC.jpg','R','Assassin Game', 2007,
'Ubisoft','Assassins Creed Description', 49.99,
'AssassinsCreed.html',
'https://www.foxmovies.com/movies/assassins-creed'),
('Metal Gear','MG.jpg','R','Sneaky Game', 1987,
'Konami','Metal Gear Description', 18.99,
'MetalGear.html',
'https://www.youtube.com/watch?v=gtgNUFSoHv8'),
('Donkey Kong','DK.png','G','Platform Game', 1981,
'Nintendo','Donkey Kong Description', 1499.99,
'DonkyKong.html',
'https://www.youtube.com/watch?v=HfKoEWN65Qo'),
('Tetris','Tetris.jpg','G','Puzzle Game', 1989,
'Alexey Pajitnov','Tetris Description', 15.22,
'Tetris.html',
'https://www.youtube.com/watch?v=QQ5U-rN7Veg'),
('Pac-Man','PM.jpg','PG','Chase Game', 1980,
'Namco','Pac-Man Description',299.99,
'Pac-Man.html',
'https://www.youtube.com/watch?v=i_OjztdQ8iw'),
('Fortnite','FN.jpg','R','Killing Game', 2017,
'Epic Games','Fortnite Description', 39.99,
'Fortnite.html',
'https://www.epicgames.com/fortnite/en-US/watch-fortnite')
GO

INSERT INTO Users(UserFName, UserLName, UserName, Password) VALUES
('Marlon', 'Brando', 'MBrando@gmail.com', 'PassWD69'),
('Clark', 'Gable', 'ClarkGable@gmail.com', 'GoneWithTheWind10'),
('Humphrey', 'Bogart', 'Bogey@gmail.com', 'caSaBLanCa'),
('Robert', 'Mitchum', 'MitchumRB@gmail.com', 'SecretWord169'),
('James', 'Stewart', 'JimmyS@gmail.com', 'RearWindow069'),
('Marlon', 'Brando', 'MBrando@gmail.com', 'PassWD69'),
('Henry', 'Fonda', 'HenryFonda@gmail.com', '012AngryMen!')
GO

INSERT INTO Reviews(GameID, UserID, Rating, Description) VALUES
(1, 1, 1, 'Worst Game Ever'),
(1, 2, 5, 'Could have been worse'),
(1, 3, 10, 'Best Game Ever'),
(1, 4, 7, 'I liked it, but I did not love it'),
(1, 5, 3, 'Would have been more fun to pick my nose'),
(2, 1, 1, 'Totally Illegal'),
(2, 2, 10, 'Had to go to rehab I was so addicted'),
(2, 4, 1, 'No fun at all'),
(2, 6, 7, 'Somewhat fun but not fun enough'),
(2, 7, 3, 'Totally Average'),
(10, 1, 1, 'Worst Game Ever'),
(9, 1, 1, 'Worst Game Ever'),
(3, 1, 1, 'Worst Game Ever'),
(4, 1, 1, 'Worst Game Ever'),
(5, 1, 1, 'Worst Game Ever'),
(6, 1, 1, 'Worst Game Ever'),
(7, 1, 1, 'Worst Game Ever'),
(8, 1, 1, 'Fucking worst Game Ever')
GO

ALTER TABLE Reviews
WITH NOCHECK ADD CONSTRAINT FK_Reviews_Games
FOREIGN KEY(GameID)
REFERENCES Games (GameID)
ON UPDATE CASCADE
GO

ALTER TABLE Reviews
CHECK CONSTRAINT FK_Reviews_Games
GO

ALTER TABLE Reviews
WITH NOCHECK ADD CONSTRAINT FK_Reviews_Users
FOREIGN KEY(UserID)
REFERENCES Users (UserID)
ON UPDATE CASCADE
GO

ALTER TABLE Reviews
CHECK CONSTRAINT FK_Reviews_Users
GO

/****** Procedure:  getGames     ******/
CREATE PROCEDURE getGames
AS
	SELECT * FROM Games
GO

/****** Procedure:  getGameByName     ******/
CREATE PROCEDURE getGameByName
	@name VARCHAR(50)
AS
	SELECT * FROM Games
	WHERE Name LIKE '%' + @name + '%'
GO

/****** Procedure:  getGameByID     ******/
CREATE PROCEDURE getGameByID
	@id INT
AS
	SELECT * FROM vwGames
	WHERE GameID = @id
GO

/****** Procedure:  getUserByID     ******/
CREATE PROCEDURE getUserByID
	@id INT
AS
	SELECT * FROM Users
	WHERE UserID = @id
GO

/****** Procedure:  getReviewsByGame     ******/
CREATE PROCEDURE getReviewsByGame
	@id INT
AS
	SELECT * 
	FROM vwReviews
	WHERE GameID = @id
GO

/****** Procedure:  submitRequest    ******/
CREATE PROCEDURE submitRequest
	@requesteeEmail VARCHAR(50),
	@gameName VARCHAR(50),
	@gameYear INT,
	@gamePublisher VARCHAR(50),
	@comment VARCHAR(500)
AS
	INSERT INTO Requests(RequesteeEmail, GameName, GameYear, 
						GamePublisher, Comment) VALUES
	(@requesteeEmail, @gameName, @gameYear, 
	@gamePublisher, @comment)
GO

/****** Procedure:  submitReview    ******/
CREATE PROCEDURE submitReview
	@gameID			INT,
	@userID			INT,
	@rating			INT,
	@description	VARCHAR(500)
AS
	INSERT INTO Reviews(GameID, UserID, Rating, Description) VALUES
	(@gameID, @userID, @rating, @description)
GO

USE master
GO

ALTER DATABASE GameSource SET READ_WRITE 
GO

USE GameSource
GO
