/*1. ¿qué nacionalidades hay?- v
2. ¿cuántos escritores hay de cada nacionalidad?-
3. ¿cuántos libros hay de cada nacionalidad?-
4. ¿cuál es el promedio/desviación standard del precio de
libros?-
5. idem, pero por nacionalidad-
6. cuál es el precio máximo/mínimo de un libro-
7. ¿cómo quedaría el reporte de préstamos?|*/
--1
SELECT nationality from authors
GROUP BY nationality;
--2.
SELECT nationality,count(nationality) as authors_nation 
from authors
where nationality is not NULL
GROUP BY nationality;
--3
SELECT nationality,count(books.book_id) 
from authors
inner join books on authors.author_id = books.author_id
where nationality is not NULL 
GROUP BY authors.nationality;
--4
SELECT avg(books.price) 
from books;
SELECT STD(books.price) 
from books;