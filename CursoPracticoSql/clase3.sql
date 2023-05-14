

/**
  * RETO: Seleccionar resultados que no se encuentren el el set en un set
  */

-- Not in array --
SELECT  *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id NOT IN (1,2,3,4,5);

-- Not in subquery --
SELECT  *
FROM platzi.alumnos
WHERE id NOT IN (
    SELECT id
    FROM platzi.alumnos
    WHERE tutor_id = 30
);

/**
  * Extraer partes de una fecha
  */

-- Con EXTRACT --
SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

-- Con DATE_PART --
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT  DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
        DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
        DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos;