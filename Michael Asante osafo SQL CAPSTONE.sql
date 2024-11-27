-- Creating a Database --
CREATE DATABASE FAMOUS;
USE FAMOUS;

-- Table 1: Famous_People--
CREATE TABLE Famous_People (
  Person_ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Name TEXT NOT NULL,
  Profession TEXT NOT NULL,
  Birthplace TEXT,
  Birthdate DATE
);

-- Table 2: Movie_Stars --
CREATE TABLE Movie_Stars (
  Person_ID INTEGER,
  Movie_Title TEXT NOT NULL,
  Role TEXT NOT NULL,
  Release_Year DATE NOT NULL,
  FOREIGN KEY (Person_ID) REFERENCES Famous_People(Person_ID)
);

-- Table 3: Singers --
CREATE TABLE Singers (
  Person_ID INTEGER,
  Song_Title TEXT NOT NULL,
  Genre TEXT NOT NULL,
  Release_Year DATE NOT NULL,
  FOREIGN KEY (Person_ID) REFERENCES Famous_People(Person_ID)
);

-- Table 4: Authors --
CREATE TABLE Authors (
  Person_ID INTEGER,
  Book_Title TEXT NOT NULL,
  Genre TEXT NOT NULL,
  Release_Year DATE NOT NULL,
  FOREIGN KEY (Person_ID) REFERENCES Famous_People(Person_ID)
);

-- Table 5: Fictional_Characters --
CREATE TABLE Fictional_Characters (
  Person_ID INTEGER,
  Character_Name TEXT NOT NULL,
  Book_Title TEXT NOT NULL,
  Relationship TEXT,
  FOREIGN KEY (Person_ID) REFERENCES Famous_People(Person_ID)
);

-- Table 6: Relationships --
CREATE TABLE Relationships (
  Person_ID1 INTEGER,
  Person_ID2 INTEGER,
  Relationship_Type TEXT NOT NULL,
  FOREIGN KEY (Person_ID1) REFERENCES Famous_People(Person_ID),
  FOREIGN KEY (Person_ID2) REFERENCES Famous_People(Person_ID)
);

-- Insert  values into Famous_people Table --
INSERT INTO Famous_People (Name, Profession, Birthplace, Birthdate)
VALUES 
("Leonardo DiCaprio", "Actor", "Los Angeles, CA", "1974-11-11"),
("Beyoncé", "Singer", "Houston, TX", "1981-09-04"),
("J.R.R. Tolkien", "Author", "Bloemfontein, South Africa", "1892-01-03"),
("Tony Stark", "Fictional Character", "New York City", "1970-05-29"),
("Ariana Grande", "Singer", "Boca Raton, FL", "1993-06-26");

-- Insert values into Movie_stars Table -- 
INSERT INTO Movie_Stars (Person_ID, Movie_Title, Role, Release_Year)
VALUES 
(1, "Titanic", "Jack Dawson", "1997-12-19"),
(1, "The Revenant", "Hugh Glass", "2015-12-25"),
(4, "Iron Man", "Tony Stark", "2008-04-14");

-- Inserting values into Singers Table --
INSERT INTO Singers (Person_ID, Song_Title, Genre, Release_Year)
VALUES 
(2, "Crazy in Love", "Pop", "2003-07-08"),
(5, "Thank U, Next", "Pop", "2019-11-08"),
(2, "Single Ladies", "R&B", "2008-10-13");

-- Inserting values into Authors tables --
INSERT INTO Authors (Person_ID, Book_Title, Genre, Release_Year)
VALUES 
(3, "The Lord of the Rings", "Fantasy", "1954-07-29"),
(3, "The Hobbit", "Fantasy", "1937-09-21");
SELECT * FROM Authors;

INSERT INTO Fictional_Characters (Person_ID, Character_Name, Book_Title, Relationship)
VALUES 
(4, "Tony Stark", "Iron Man", "Protagonist");

INSERT INTO Relationships (Person_ID1, Person_ID2, Relationship_Type)
VALUES 
(1, 2, "Collaborators"),
(4, 5, "Friends"),
(3, 1, "Inspirational Figure");

-- Query 
SELECT * FROM Relationships;

-- List all movies starring Leonardo DiCaprio
SELECT Movie_Title, Role, Release_Year FROM Movie_Stars WHERE Person_ID = 1;

-- List all songs by Beyoncé
SELECT Song_Title, Genre, Release_Year FROM Singers WHERE Person_ID = 2;

-- List all books by J.R.R. Tolkien
SELECT Book_Title, Genre, Release_Year FROM Authors WHERE Person_ID = 3;

-- List all relationships between famous people
SELECT FP1.Name, FP2.Name, R.Relationship_Type 
FROM Relationships R 
JOIN Famous_People FP1 ON R.Person_ID1 = FP1.Person_ID 
JOIN Famous_People FP2 ON R.Person_ID2 = FP2.Person_ID;

