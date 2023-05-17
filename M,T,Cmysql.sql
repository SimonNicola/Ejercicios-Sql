SET AUTOCOMMIT = 1;
SELECT @@AUTOCOMMIT;
DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;
CREATE TABLE producto (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 precio DOUBLE
);
INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');


-- 1. ¿Qué devolverá esta consulta?

SELECT *
FROM producto;

/* se habran insertado los datosd del primero al tercero */

-- 2. Vamos a intentar deshacer la transacción actual
ROLLBACK;


-- 3. ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT *
FROM producto;

/* pense que el rollback iba a deshacer los  cambios del 1, pero segun veo sigen hechos  */

-- 4. Ejecutamos la siguiente transacción

INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SELECT * FROM producto;
ROLLBACK;

-- 5. ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;
/* Devuelvera los tres primeros ya que deshacemos los cambios del rollback */

 6. Ejecutamos la siguiente transacción
INSERT INTO producto (id, nombre) VALUES (5, 'Quinto');
ROLLBACK;

-- 7. ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;

/* Entiendo que como no se ha empezado la transaction no se pudo hacer el rollback? */

-- 8. Desactivamos el modo AUTOCOMMIT y borramos el contenido de la tabla
SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;
DELETE FROM producto WHERE id > 0;

-- 9. Comprobamos que la tabla esta vacia
SELECT * FROM producto;

-- 10. Insertamos dos filas nuevas
INSERT INTO producto (id, nombre) VALUES (6, 'Sexto');
INSERT INTO producto (id, nombre) VALUES (7, 'Séptimo');
SELECT * FROM producto;

-- 11. Hacemos un ROLLBACK
ROLLBACK;

-- 12. ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;

/* rehace los cambios que hicimos desde el ultimo autocommit?  */


-- 13. Ejecutamos la siguiente transacción
SET AUTOCOMMIT = 0;
START TRANSACTION;
CREATE TABLE fabricante (id INT UNSIGNED);
INSERT INTO fabricante (id) VALUES (1);
SELECT * FROM fabricante;
ROLLBACK;

-- 14. ¿Se puede hacer ROLLBACK de instrucciones de tipo DDL (CREATE, ALTER, DROP,RENAME y TRUNCATE)?
si