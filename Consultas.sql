-- Reporte 1 --
SELECT
    e.nombre_eleccion,
    e.anio_eleccion,
    l.pais,
    MAX(e.nombre_partido) AS partido_ganador
FROM
    eleccion e
    INNER JOIN lugares l ON e.id_eleccion = l.id_eleccion
GROUP BY
    e.nombre_eleccion,
    e.anio_eleccion,
    l.pais;

-- Reporte 2 --
WITH VotosMujeres AS (
    SELECT
        L.pais,
        L.depto,
        SUM(C.alfabetos) AS votos_mujeres
    FROM
        LUGARES L
        JOIN CARACTERISTICA C ON L.id_caracteristica = C.id_tipo
        JOIN ETNIA ET ON C.id_etnia = ET.id_etnia
    WHERE
        ET.sexo = 'MUJERES'
    GROUP BY
        L.pais,
        L.depto
)
SELECT
    V.pais,
    V.depto,
    V.votos_mujeres,
    (V.votos_mujeres / (SELECT SUM(votos_mujeres) FROM VotosMujeres WHERE pais = V.pais)) * 100 AS porcentaje
FROM
    VotosMujeres V

-- Reporte 3 --
select l.pais as Nombre_Pais,
	   e.nombre_partido as Nombre_Partido,
       count(*) as Numero_Alcaldias
from lugares l
join eleccion e on l.id_eleccion = e.id_eleccion
group by l.pais, e.nombre_partido
having count(*) = (
	select max(alcaldias_ganadas)
    from (
		select count(*) as alcaldias_ganadas
        from lugares l_inner
        join eleccion e_inner on l_inner.id_eleccion = e_inner.id_eleccion
        where l_inner.pais = l.pais
        group by e_inner.nombre_partido
	) as subquery
)
order by l.pais;

-- Reporte 4 --
select distinct l.region, l.pais 
from lugares as l join caracteristica as c on c.id_tipo = l.id_caracteristica 
join etnia as e on e.id_etnia = c.id_etnia 
where e.raza = "INDIGENAS" 
GROUP BY 
l.region,
l.pais;

-- Reporte 5 --
SELECT l.depto,
       SUM(CASE WHEN e.sexo = 'MUJERES' THEN c.universitarios ELSE 0 END) AS mujeres_universitarias_votaron,
       SUM(CASE WHEN e.sexo = 'HOMBRES' THEN c.universitarios ELSE 0 END) AS hombres_universitarios_votaron,
       (SUM(CASE WHEN e.sexo = 'MUJERES' THEN c.universitarios ELSE 0 END) / 
        NULLIF(SUM(CASE WHEN e.sexo = 'HOMBRES' THEN c.universitarios ELSE 0 END), 0)) * 100 AS porcentaje_mujeres_vs_hombres
FROM lugares l
INNER JOIN caracteristica c ON l.id_caracteristica = c.id_tipo
INNER JOIN etnia e ON c.id_etnia = e.id_etnia
GROUP BY l.depto;

-- Reporte 6 --
select l.pais,
	   l.region,
       sum(c.universitarios)/count(distinct l.depto) as promedio_votos_por_departamento
from lugares l
inner join caracteristica c on l.id_caracteristica = c.id_tipo
group by l.pais, l.region;

-- Reporte 7 --
SELECT l.pais,
       e.raza,
       (SUM(c.universitarios) / total_votos.total_por_raza) * 100 AS porcentaje_votos_por_raza
FROM lugares l
INNER JOIN caracteristica c ON l.id_caracteristica = c.id_tipo
INNER JOIN etnia e ON c.id_etnia = e.id_etnia
INNER JOIN (
    SELECT e.id_etnia, SUM(universitarios) AS total_por_raza
    FROM caracteristica c
    INNER JOIN etnia e ON c.id_etnia = e.id_etnia
    GROUP BY e.id_etnia
) AS total_votos ON e.id_etnia = total_votos.id_etnia
GROUP BY l.pais, e.raza, total_votos.total_por_raza;

-- Reporte 8 --
SELECT l.pais AS país_Elecciones_reñidas
FROM Lugares l
INNER JOIN Eleccion e ON l.id_eleccion = e.id_eleccion
GROUP BY l.pais
ORDER BY ABS(COUNT(DISTINCT e.partido) - COUNT(*)) ASC
LIMIT 1;

-- Reporte 9 --
SELECT
    l.pais AS nombre_pais,
    ROUND(MAX(c.analfabetos / (c.analfabetos + c.alfabetos) * 100),2) AS porcentaje_analfabetos
FROM
    Lugares l
JOIN Eleccion e ON l.id_eleccion = e.id_eleccion
JOIN Caracteristica c ON l.id_caracteristica = c.id_tipo
GROUP BY
    l.pais
ORDER BY porcentaje_analfabetos DESC
LIMIT 1;

-- Reporte 10 --
SELECT l.depto, COUNT(*) AS total_votos
FROM Lugares l
INNER JOIN Eleccion e ON l.id_eleccion = e.id_eleccion
WHERE l.pais = 'Guatemala' AND l.depto != 'Guatemala'
GROUP BY l.depto
HAVING total_votos > (
    SELECT COUNT(*)
    FROM Lugares
    INNER JOIN Eleccion ON Lugares.id_eleccion = Eleccion.id_eleccion
    WHERE pais = 'Guatemala' AND depto = 'Guatemala'
)
ORDER BY total_votos DESC;