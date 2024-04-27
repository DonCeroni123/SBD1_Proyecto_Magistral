


-- Crear una tabla temporal en MySQL para cargar los datos del archivo Excel


CREATE TEMPORARY TABLE IF NOT EXISTS temp_caracteristica (
    columna1 INT,
    columna2 INT,
    columna3 INT,
    columna4 INT,
    columna5 INT,
    columna6 INT,
    columna7 INT

);

-- Cargar datos desde el archivo Excel a la tabla temporal
LOAD DATA INFILE 'ruta'
INTO TABLE temp_caracteristica
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Si necesitas transformar o limpiar los datos antes de insertarlos en la tabla final, puedes hacerlo aquí

-- Insertar datos desde la tabla temporal a la tabla final
INSERT INTO caracteristica (id_tipo, analfabetos, alfabetos, primaria, nivel_medio, universitarios, etnia_id_etnia)
SELECT columna1, columna2, columna3, columna4, columna5, columna6, columna7
FROM temp_caracteristica;

-- Eliminar la tabla temporal
DROP TEMPORARY TABLE IF EXISTS temp_caracteristica;



-- tabla eleccion
CREATE TEMPORARY TABLE IF NOT EXISTS temp_eleccion(
    columna1 INT,
    columna2 VARCHAR(240),
    columna3 DATE,
    columna4 VARCHAR(240),
    columna5 VARCHAR(240)
);

LOAD DATA INFILE 'RUTA'
INTO TABLE temp_eleccion
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO eleccion (id_eleccion, nombre_eleccion, anio_eleccion, partido, nombre_partido)
SELECT columna1, columna2, columna3, columna4, columna5
FROM temp_eleccion;

DROP TEMPORARY TABLE IF EXISTS temp_eleccion;

-- tabla etnia
CREATE TEMPORARY TABLE IF NOT EXISTS temp_etnia(
    columna1 INT,
    columna2 VARCHAR(240),
    columna3 VARCHAR(240)
    
);

LOAD DATA INFILE 'RUTA'
INTO TABLE temp_etnia
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etnia (id_etnia, sexo, raza)
SELECT columna1, columna2, columna3
FROM temp_etnia;

DROP TEMPORARY TABLE IF EXISTS temp_etnia;

-- tabla lugares
CREATE TEMPORARY TABLE IF NOT EXISTS temp_lugares(
    columna1 INT,
    columna2 VARCHAR(240),
    columna3 VARCHAR(240),
    columna4 VARCHAR(240),
    columna5 VARCHAR(240),
    columna6 INT,
    columna7 INT
    
);

LOAD DATA INFILE 'RUTA'
INTO TABLE temp_lugares
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO lugares (id_lugar, pais, region, depto, municipio, eleccion_id_eleccion, caracteristica_id_tipo)
SELECT columna1, columna2, columna3, columna4, columna5, columna6, columna7
FROM temp_etnia;

DROP TEMPORARY TABLE IF EXISTS temp_lugares;




