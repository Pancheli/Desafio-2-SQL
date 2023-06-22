-- Crear una Base de Datos, llamada desafio-2tuNombre-tuApellido-3digitos

CREATE DATABASE desafio2_francisco_arce_002;

-- Entramos a la base de datos
\c desafio2_francisco_arce_002;


--Creamos la tabla con los registros dados

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);


INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- 1: ¿Cuántos registros hay?
SELECT COUNT(*) FROM INSCRITOS;

-- 2: ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM INSCRITOS;

-- 3 : ¿Cuál o cuáles son los registros de mayor antigüedad? *ocupar subconsultas*
SELECT * FROM INSCRITOS WHERE fecha = (SELECT fecha FROM INSCRITOS ORDER BY fecha LIMIT 1);

-- 4: ¿Cuántos inscritos hay por día? *un día es una fecha distinta*
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP by fecha;

-- 5: ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) FROM INSCRITOS GROUP BY fuente;

-- 6: ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP BY fecha ORDER BY sum(cantidad) DESC LIMIT 1;

-- 7: ¿Qué día se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron? *si hay más de un registro, tomar el primero*
SELECT fecha, SUM(cantidad) FROM INSCRITOS WHERE fuente = 'Blog' GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;

-- 8: ¿Cuántas personas en promedio se inscriben en un día?
SELECT AVG(cantidadtotal) FROM (SELECT fecha, SUM(cantidad) AS cantidadtotal FROM INSCRITOS GROUP BY fecha) AS columnadesumas;

-- 9 ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP BY fecha HAVING SUM(cantidad) > 50;

-- 10: ¿ Cuántas personas se registraron en promedio cada día a partir del tercer día? *ingresa manualmente la fecha del tercer día*
 SELECT AVG(cantidadtotal) FROM (SELECT fecha, SUM(cantidad) AS cantidadtotal FROM INSCRITOS WHERE fecha >= '01/03/2021' GROUP BY fecha ) AS sumadecolumnas;