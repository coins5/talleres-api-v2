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
  , eval1 DECIMAL(6, 4) NOT NULL DEFAULT 0.0
  , eval2 DECIMAL(6, 4) NOT NULL DEFAULT 0.0
  , evalFinal DECIMAL(6, 4) NOT NULL DEFAULT 0.0
  , PRIMARY KEY(codigo_alumno, codigo_taller)
);

CREATE TABLE Taller (
  codigo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
  , nombre VARCHAR(64)
  , tipoTaller VARCHAR(64)
  , codigo_docente INT UNSIGNED
);


DELIMITER //
DROP PROCEDURE IF EXISTS getAlumnosFromTaller //
CREATE PROCEDURE getAlumnosFromTaller (
    _codigo_taller INT UNSIGNED
)
BEGIN
    SELECT
        A.codigo AS codigo
        , A.nombre AS nombre
        , A.apellido AS apellido
        , A.email AS email
        , M.eval1
        , M.eval2
        , M.evalFinal
    FROM
         Matricula AS M
         INNER JOIN Taller AS T
            ON M.codigo_taller = T.codigo
        INNER JOIN Alumno AS A
            ON M.codigo_alumno = A.codigo
    WHERE
        T.codigo = _codigo_taller
    ;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS getTalleres //
CREATE PROCEDURE getTalleres ()
BEGIN
    SELECT
        T.codigo AS codigo_taller
        , T.nombre AS nombre_taller
        , T.tipoTaller
        , D.codigo AS codigo_docente
        , D.nombre AS nombre_docente
    FROM
        Docente AS D
        INNER JOIN Taller AS T
            ON D.codigo = T.codigo_docente
    ;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS getTalleresFromDocente //
CREATE PROCEDURE getTalleresFromDocente (
    _codigo_docente INT UNSIGNED
)
BEGIN
    SELECT
        T.codigo
        , T.nombre
        , T.tipoTaller
    FROM
        Docente AS D
        INNER JOIN Taller AS T
            ON D.codigo = T.codigo_docente
    WHERE
        D.codigo = _codigo_docente
    ;
END //
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS getNotasFromAlumno //
CREATE PROCEDURE getNotasFromAlumno (
    _codigo_alumno INT UNSIGNED
)
BEGIN
    SELECT
        M.codigo_taller
        , M.eval1
        , M.eval2
        , M.evalFinal
        , T.nombre AS nombre_taller
        , T.tipoTaller
        , T.codigo_docente
    FROM
        Alumno AS A
        INNER JOIN Matricula AS M
            ON M.codigo_alumno = A.codigo
        INNER JOIN Taller AS T
            ON M.codigo_taller = T.codigo
    WHERE
        A.codigo = _codigo_alumno
    ;
END //
DELIMITER ;