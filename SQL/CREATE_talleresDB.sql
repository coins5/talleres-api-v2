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
  , evalVirtual DECIMAL(6, 4) NOT NULL DEFAULT 0.0
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
        , M.evalVirtual
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
        , COUNT(M.codigo_alumno) AS alumnos
    FROM
        Docente AS D
        INNER JOIN Taller AS T
            ON D.codigo = T.codigo_docente
        INNER JOIN Matricula AS M
            ON T.codigo = M.codigo_taller
    WHERE
        D.codigo = _codigo_docente
    GROUP BY
        T.codigo
        , T.nombre
        , T.tipoTaller
    ;
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS getRB_alumnos //
CREATE PROCEDURE getRB_alumnos (
    _codigo INT
)
BEGIN
    
    SELECT 	codigo, nombre, apellido, email, password
    FROM 	Alumno
    WHERE 	CASE WHEN _codigo = -1 THEN codigo = codigo ELSE codigo = _codigo END;
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
        , M.evalVirtual
        , M.evalFinal
        , T.nombre AS nombre_taller
        , T.tipoTaller
        , T.codigo_docente
        , D.nombre AS nombre_docente
        , D.apellido AS apellido_docente
    FROM
        Alumno AS A
        INNER JOIN Matricula AS M
            ON M.codigo_alumno = A.codigo
        INNER JOIN Taller AS T
            ON M.codigo_taller = T.codigo
        INNER JOIN Docente AS D
            ON T.codigo_docente = D.codigo
    WHERE
        A.codigo = _codigo_alumno
    ;
END //
DELIMITER ;


INSERT INTO Alumno(nombre, apellido, email, password) VALUES ('Alumno1', 'Apellido1', 'correo@correo.com', '123456');
INSERT INTO Alumno(nombre, apellido, email, password) VALUES ('Alumno2', 'Apellido2', 'correo@correo.com', '123456');
INSERT INTO Alumno(nombre, apellido, email, password) VALUES ('Alumno3', 'Apellido3', 'correo@correo.com', '123456');
INSERT INTO Alumno(nombre, apellido, email, password) VALUES ('Alumno4', 'Apellido4', 'correo@correo.com', '123456');
INSERT INTO Alumno(nombre, apellido, email, password) VALUES ('Alumno5', 'Apellido5', 'correo@correo.com', '123456');


INSERT INTO Docente(nombre, apellido, email, password) VALUES ('Docente1', 'Apellido1', 'correo@correo.com', '123456');
INSERT INTO Docente(nombre, apellido, email, password) VALUES ('Docente2', 'Apellido2', 'correo@correo.com', '123456');
INSERT INTO Docente(nombre, apellido, email, password) VALUES ('Docente3', 'Apellido3', 'correo@correo.com', '123456');
INSERT INTO Docente(nombre, apellido, email, password) VALUES ('Docente4', 'Apellido4', 'correo@correo.com', '123456');
INSERT INTO Docente(nombre, apellido, email, password) VALUES ('Docente5', 'Apellido5', 'correo@correo.com', '123456');


INSERT INTO Taller(nombre, tipoTaller, codigo_docente) VALUES
    ('Taller 1', 'practico', 1)
    , ('Taller 2', 'blended', 1)
    , ('Taller 3', 'teorico', 1)
    , ('Taller 4', 'practico', 2)
    , ('Taller 5', 'blended', 2)
    , ('Taller 6', 'teorico', 2)
    , ('Taller 7', 'teorico', 3)
    , ('Taller 8', 'teorico', 4)
    , ('Taller 9', 'teorico', 5)
    , ('Taller 10', 'teorico', 5)
;

