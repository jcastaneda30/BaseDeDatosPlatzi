SELECT *
FROM platzi.alumnos 
offset(
select count(*)/2
from platzi.alumnos)

/**
  * RETO: Selecciona los primeros 5 registros
  * sin contar con el ID.
  */

-- Con fetch --
SELECT *
FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;

-- Con limit --
SELECT *
FROM platzi.alumnos
LIMIT 5;

-- Con subquery y window function --
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <= 5;

/**
 * Encuentra la segunda colegiatura más alta
 * encuentra todos los alumnos con esa misma colegiatura
 */

-- Contar por join entre las tablas --
SELECT DISTINCT colegiatura
FROM platzi.alumnos a1
WHERE 2=(
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos a2
	WHERE a1.colegiatura<=a2.colegiatura
);

-- Sencillo con limit --
SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

-- Join con subquery --

SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;


-- Subquery en Where --

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);