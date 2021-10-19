CREATE DATABASE FORMULA1;
USE FORMULA1;

CREATE TABLE circuitos (
    circuito_Id INTEGER NOT NULL,
    circuit_Ref VARCHAR(14) NOT NULL,
    nome VARCHAR(37) NOT NULL,
    cidade VARCHAR(21) NOT NULL,
    país VARCHAR(12) NOT NULL,
    latitude VARCHAR(8) NOT NULL,
    longitude VARCHAR(8) NOT NULL,
    url VARCHAR(71) NOT NULL,
    PRIMARY KEY (circuito_id)
);

CREATE TABLE construtores (
    constructor_Id INTEGER NOT NULL,
    constructor_Ref VARCHAR(20) NOT NULL,
    nome VARCHAR(25) NOT NULL,
    nacionalidade VARCHAR(13) NOT NULL,
    url VARCHAR(73) NOT NULL,
    PRIMARY KEY (constructor_Id)
);

CREATE TABLE corridas (
    race_Id INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    round INTEGER NOT NULL,
    circuito_Id INTEGER NOT NULL,
    nome VARCHAR(29) NOT NULL,
    datas DATE NOT NULL,
    hora VARCHAR(8),
    url VARCHAR(63) NOT NULL,
    PRIMARY KEY (race_Id),
    FOREIGN KEY (circuito_id)
        REFERENCES circuitos (circuito_id)
);

CREATE TABLE classificação_constructores(
  constructorStandingsId INTEGER  NOT NULL, 
  corrida_Id             INTEGER  NOT NULL,
  constructor_Id         INTEGER  NOT NULL,
  pontos                 NUMERIC(5,1) NOT NULL,
  posição                INTEGER  NOT NULL,
  vitórias               INTEGER  NOT NULL,
PRIMARY KEY(constructorStandingsId),
FOREIGN KEY(corrida_Id) REFERENCES corridas(race_Id),
FOREIGN KEY(constructor_Id) REFERENCES construtores(constructor_Id)
);

CREATE TABLE constructor_Resultados(
  constructorResultados INTEGER  NOT NULL,
  corrida_Id            INTEGER  NOT NULL,
  constructor_Id        INTEGER  NOT NULL,
  pontos                NUMERIC(3,1) NOT NULL,
PRIMARY KEY(constructorResultados),
FOREIGN KEY(constructor_Id) REFERENCES construtores(constructor_Id),
FOREIGN KEY(corrida_Id) REFERENCES corridas(race_Id)
);

CREATE TABLE pilotos(
   piloto_Id     INTEGER  NOT NULL,
   pilotoRef     VARCHAR(18) NOT NULL,
   número        INTEGER ,
   código        VARCHAR(4),
   nome          VARCHAR(17) NOT NULL,
   sobrenome     VARCHAR(23) NOT NULL,
   nascimento    VARCHAR(10) NOT NULL,
   nacionalidade VARCHAR(17) NOT NULL,
   url           VARCHAR(65),
PRIMARY KEY(piloto_Id)
);

CREATE TABLE qualificatória(
   qualificação_Id INTEGER  NOT NULL, 
   corrida_Id      INTEGER  NOT NULL,
   piloto_Id       INTEGER  NOT NULL,
   constructor_Id  INTEGER  NOT NULL,
   número          INTEGER  NOT NULL,
   posição         INTEGER  NOT NULL,
   q1              VARCHAR(9),
   q2              VARCHAR(8),
   q3              VARCHAR(8),
PRIMARY KEY(qualificação_Id),
FOREIGN KEY(corrida_Id) REFERENCES corridas(race_Id),
FOREIGN KEY(piloto_Id) REFERENCES pilotos(piloto_Id),
FOREIGN KEY(constructor_Id) REFERENCES construtores(constructor_Id)
);

CREATE TABLE classificação_Pilotos(
   classificaçãoPilotos_Id INTEGER  NOT NULL,
   corrida_Id              INTEGER  NOT NULL,
   piloto_Id               INTEGER  NOT NULL,
   pontos                  NUMERIC(5,2) NOT NULL,
   posição                 INTEGER  NOT NULL,
   vitórias                INTEGER  NOT NULL,
PRIMARY KEY(classificaçãoPilotos_Id),
FOREIGN KEY(corrida_Id) REFERENCES corridas(race_Id),
FOREIGN KEY(piloto_Id) REFERENCES pilotos(piloto_Id)
);

CREATE TABLE temporadas(
   ano INTEGER  NOT NULL,
   url VARCHAR(68) NOT NULL,
PRIMARY KEY(ano)
);


