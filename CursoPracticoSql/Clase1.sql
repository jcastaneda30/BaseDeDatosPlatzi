SELECT * 
FROM platzi.alumnos
FETCH first 5 rows only;

SELECT * 
FROM platzi.alumnos
limit 5;

SELECT * 
FROM (SELECT ROW_NUMBER() OVER() AS ROW_ID, *
	 FROM platzi.alumnos) as alumnos_with_row_number
	 where ROW_ID < 6;