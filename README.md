# SBD1_Proyecto_Magistral
## PROYECTO ELECCIONES
### GRUPO # 10

### - 201603171 Erick Erasmo Jiménez Palacios 2816057340101@ingenieria.usac.edu.gt
### - 201908251 José Pablo Cerón Urizar 3005814320101@ingenieria.usac.edu.gt
### - 201807169 Erick Abdul Chacón Barillas 3508630320101@ingenieria.usac.edu.gt
### - 202000896 Javier Alejandro Matías Guarcas 3681430070101@ingenieria.usac.edu.gt

## Análisis describiendo las reglas de normalización aplicadas al archivo de excel

### (aqui va el analisis de la normalizacion)



Los resultados de las tablas y entidades quedaron de la siguiente manera:

TABLA_LUGARES

- id_lugar # (INTEGER) (AUTOINCREMENT)

- id_eleccion (INTEGER) (TABLA_ELECCION)

- pais VARCHAR (240)

- region VARCHAR (240)

- depto VARCHAR (240)

- municipio VARCHAR (240)

- id_caracteristica (INTEGER) (TABLA_CARACTERISTICA)

TABLA_CARACTERISTICA

- id_caracteristica # (INTEGER) (AUTOINCREMENT)

- id_etnia (INTEGER) (TABLA_ETNIAS)

- analfabetos (INTEGER)

- alfabetos (INTEGER)

- primaria (INTEGER)

- nivel_medio (INTEGER)

- universitarios (INTEGER)

TABLA_ELECCION

- id_eleccion # (INTEGER) (AUTOINCREMENT)

- nombre_eleccion VARCHAR (240)

- ano_eleccion DATE

- partido (VARCHAR (240))

- nombre_partido (VARCHAR (240))
	
TABLA_ETNIA

- id_etnia	# (INTEGER) (AUTOINCREMENT)

- sexo VARCHAR (240)

- raza VARCHAR (240)



## Pasos que se siguieron para aplicar las reglas de normalización

### (aqui van los pasos de la normalizacion)

## Modelo conceptual

### (aqui va la imagen y su explicacion)

## Modelo logico

### (aqui va la imagen y su explicacion)

## Modelo entidad-relacion

### (aqui va la imagen y su explicacion)
