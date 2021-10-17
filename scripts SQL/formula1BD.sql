CREATE DATABASE FORMULA1;
USE FORMULA1;
CREATE TABLE `circuitos`(
`circuito_Id` INT NOT NULL,
`circuit_ref` VARCHAR(100) NOT NULL,
`nome` VARCHAR(100) NOT NULL,
`cidade` VARCHAR(100) NOT NULL,
`pais` VARCHAR(100) NOT NULL,
`latitude` INT NOT NULL,
`longitude`INT NOT NULL,
`alt` INT NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY(`circuito_id`),
PRIMARY KEY(`circuit_ref`)
);

CREATE TABLE `constructores`(
`constructor_Id` INT NOT NULL,
`nome` VARCHAR(100) NOT NULL,
`nacionalidade` VARCHAR(100) NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY(`constructor_Id`)
);

CREATE TABLE `corridas`(
`corrida_Id` INT NOT NULL,
`ano` INT NOT NULL,
`round` INT NOT NULL,
`circuito_id` INT NOT NULL,
`nome` VARCHAR(100) NOT NULL,
`data` VARCHAR(10) NOT NULL,
`hora` VARCHAR(8) NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY(`corrida_Id`),
FOREIGN KEY(`circuito_id`) REFERENCES `circuitos`(`circuito_id`)
);

CREATE TABLE `classificação_constructores`(
`constructorStandingsId` INT NOT NULL,
`corrida_Id` INT NOT NULL,
`constructor_Id` INT NOT NULL,
`pontos` INT NOT NULL,
`posição` INT NOT NULL,
`vitórias` INT NOT NULL,
PRIMARY KEY(`constructorStandingsId`),
FOREIGN KEY(`corrida_Id`) REFERENCES `corridas`(`corrida_Id`),
FOREIGN KEY(`constructor_Id`) REFERENCES `constructores`(`constructor_Id`)
);

CREATE TABLE `constructor_Resultados`(
`constructorResultados` INT NOT NULL,
`corrida_Id`INT NOT NULL,
`constructor_Id` INT NOT NULL,
`pontos` INT NOT NULL,
PRIMARY KEY(`constructorResutados`),
FOREIGN KEY(`constructor_Id`) REFERENCES `constructores`(`constructor_Id`),
FOREIGN KEY(`corrida_Id`) REFERENCES `corridas`(`corrida_Id`)
);

CREATE TABLE `pilotos`(
`piloto_Id` INT NOT NULL,
`piloto_ref` VARCHAR(100) NOT NULL,
`número` INT NOT NULL,
`código` VARCHAR(3) NOT NULL,
`nome` VARCHAR(100) NOT NULL,
`sobrenome` VARCHAR(100) NOT NULL,
`nascimento` VARCHAR(10) NOT NULL,
`nacionalidade` VARCHAR(100) NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY(`piloto_id`),
PRIMARY KEY(`pilotoRef`)
);