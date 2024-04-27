-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-04-26 18:43:06 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g

CREATE TABLE caracteristica (
    id_tipo        INT NOT NULL,
    analfabetos    INT NOT NULL,
    alfabetos      INT NOT NULL,
    primaria       INT NOT NULL,
    nivel_medio    INT NOT NULL,
    universitarios INT NOT NULL,
    etnia_id_etnia INT NOT NULL,
    PRIMARY KEY (id_tipo)
);

CREATE TABLE eleccion (
    id_eleccion     INT NOT NULL,
    nombre_eleccion VARCHAR(240) NOT NULL,
    anio_eleccion   DATE NOT NULL,
    partido         VARCHAR(240) NOT NULL,
    nombre_partido  VARCHAR(240) NOT NULL,
    PRIMARY KEY (id_eleccion)
);

CREATE TABLE etnia (
    id_etnia INT NOT NULL,
    sexo     VARCHAR(240) NOT NULL,
    raza     VARCHAR(240) NOT NULL,
    PRIMARY KEY (id_etnia)
);

CREATE TABLE lugares (
    id_lugar               INT NOT NULL,
    pais                   VARCHAR(240) NOT NULL,
    region                 VARCHAR(240) NOT NULL,
    depto                  VARCHAR(240) NOT NULL,
    municipio              VARCHAR(240) NOT NULL,
    eleccion_id_eleccion   INT NOT NULL,
    caracteristica_id_tipo INT NOT NULL,
    PRIMARY KEY (id_lugar)
);

ALTER TABLE caracteristica
    ADD CONSTRAINT caracteristica_etnia_fk FOREIGN KEY (etnia_id_etnia)
        REFERENCES etnia (id_etnia);

ALTER TABLE lugares
    ADD CONSTRAINT lugares_caracteristica_fk FOREIGN KEY (caracteristica_id_tipo)
        REFERENCES caracteristica (id_tipo);

ALTER TABLE lugares
    ADD CONSTRAINT lugares_eleccion_fk FOREIGN KEY (eleccion_id_eleccion)
        REFERENCES eleccion (id_eleccion);