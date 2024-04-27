-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-04-26 18:43:06 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE caracteristica (
    id_tipo        INTEGER NOT NULL,
    analfabetos    INTEGER NOT NULL,
    alfabetos      INTEGER NOT NULL,
    primaria       INTEGER NOT NULL,
    nivel_medio    INTEGER NOT NULL,
    universitarios INTEGER NOT NULL,
    etnia_id_etnia INTEGER NOT NULL
);

ALTER TABLE caracteristica ADD CONSTRAINT caracteristica_pk PRIMARY KEY ( id_tipo );

CREATE TABLE eleccion (
    id_eleccion     INTEGER NOT NULL,
    nombre_eleccion VARCHAR2(240) NOT NULL,
    anio_eleccion   DATE NOT NULL,
    partido         VARCHAR2(240) NOT NULL,
    nombre_partido  VARCHAR2(240) NOT NULL
);

ALTER TABLE eleccion ADD CONSTRAINT eleccion_pk PRIMARY KEY ( id_eleccion );

CREATE TABLE etnia (
    id_etnia INTEGER NOT NULL,
    sexo     VARCHAR2(240) NOT NULL,
    raza     VARCHAR2(240) NOT NULL
);

ALTER TABLE etnia ADD CONSTRAINT etnia_pk PRIMARY KEY ( id_etnia );

CREATE TABLE lugares (
    id_lugar               INTEGER NOT NULL,
    pais                   VARCHAR2(240) NOT NULL,
    region                 VARCHAR2(240) NOT NULL,
    depto                  VARCHAR2(240) NOT NULL,
    municipio              VARCHAR2(240) NOT NULL,
    eleccion_id_eleccion   INTEGER NOT NULL,
    caracteristica_id_tipo INTEGER NOT NULL
);

ALTER TABLE lugares ADD CONSTRAINT lugares_pk PRIMARY KEY ( id_lugar );

ALTER TABLE caracteristica
    ADD CONSTRAINT caracteristica_etnia_fk FOREIGN KEY ( etnia_id_etnia )
        REFERENCES etnia ( id_etnia );

ALTER TABLE lugares
    ADD CONSTRAINT lugares_caracteristica_fk FOREIGN KEY ( caracteristica_id_tipo )
        REFERENCES caracteristica ( id_tipo );

ALTER TABLE lugares
    ADD CONSTRAINT lugares_eleccion_fk FOREIGN KEY ( eleccion_id_eleccion )
        REFERENCES eleccion ( id_eleccion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
