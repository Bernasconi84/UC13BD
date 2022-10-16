--DDL CRIA ESTRUTURA
CREATE DATABASE RpgOnlineDB

USE RpgOnlineDB

CREATE TABLE Usuarios(
    UsuarioID INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
)
CREATE TABLE Classes(
    ClasseID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
CREATE TABLE Personagens(
    PersonagemID INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID),
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)
CREATE TABLE Habilidades(
   HabilidadeID INT PRIMARY KEY IDENTITY,
   Nome VARCHAR(100) UNIQUE NOT NULL
)
CREATE TABLE ClasseHabilidade(
   ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
   HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

ALTER TABLE Personagens
ALTER COLUMN NomePersonagem VARCHAR(100)

--DML COLOCAR DADOS
 INSERT INTO Usuarios VALUES ('well@well.com', '123456')  
 INSERT INTO Usuarios VALUES ('will@will.com', '987654') 
 INSERT INTO Classes VALUES ('Barbaro','este é o braboo')
 INSERT INTO Habilidades VALUES ('Tacape nas ideias'),('pescotapa'),('tesoura voadora'),('catiripapo')
 INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Epaminondas', 1, 1)
 INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Aucatunistato', 2, 1)
 INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) Values(1, 1), (1, 4), (1, 2)

 UPDATE Usuarios
 SET Senha = '123456789'
 WHERE UsuarioID = 1

--DQL CONSULTAS
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens

INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID


--EXEMPLOS JOIN

CREATE DATABASE ExemplosJoin

USE  ExemplosJoin

--DDL
CREATE TABLE TabelaA(
    Nome VARCHAR(50) NULL
)
CREATE TABLE TabelaB(
    Nome VARCHAR(50) NULL
)

--DML
INSERT INTO TabelaA VALUES ('Luana')
INSERT INTO TabelaA VALUES ('Fabia')
INSERT INTO TabelaA VALUES ('Julia')
INSERT INTO TabelaA VALUES ('Luiz')

INSERT INTO TabelaB VALUES ('Alvaro'),('Luiz'),('Matheus'), ('Luana')

--DQL

SELECT * FROM TabelaA 
SELECT * FROM TabelaB

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA 
INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA 
LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA 
RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA 
FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome