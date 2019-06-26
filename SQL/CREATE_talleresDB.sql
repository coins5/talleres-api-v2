DROP DATABASE IF EXISTS talleresDB;
CREATE DATABASE talleresDB;
USE talleresDB;

CREATE TABLE Alumno (
  codigo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
  , nombre VARCHAR(64) NOT NULL
  , apellido VARCHAR(64) NOT NULL
  , email VARCHAR(256) NOT NULL
  , password VARCHAR(256) NOT NULL
);

CREATE TABLE Docente (
  codigo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
  , nombre VARCHAR(64) NOT NULL
  , apellido VARCHAR(64) NOT NULL
  , email VARCHAR(256) NOT NULL
  , password VARCHAR(256) NOT NULL
);

CREATE TABLE Matricula (
  codigo_alumno INT UNSIGNED
  , codigo_taller INT UNSIGNED
  , eval1 NUMERIC(6, 2)
  , eval2 NUMERIC(6, 2)
  , evalFinal NUMERIC(6, 2)
  , PRIMARY KEY(codigo_alumno, codigo_taller)
);

CREATE TABLE Taller (
  codigo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
  , nombre VARCHAR(64)
  , tipoTaller VARCHAR(64)
  , codigo_docente INT UNSIGNED
);

