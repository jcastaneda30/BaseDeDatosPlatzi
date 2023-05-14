SELECT nationality, count(book_id) as libros, avg(price) prom_price, STD(price) des_price
FROM books AS b 
JOIN authors as a
on books.author_id = authors.author_id
GROUP BY nationality 
ORDER BY prom_price desc;