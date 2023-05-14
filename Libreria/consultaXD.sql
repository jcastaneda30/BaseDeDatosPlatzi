Select authors.name,Group_Concat(Distinct books.title Order By books.title Separator ' - ')As libros
From books
Inner Join authors On books.author_id = authors.author_id
Group By authors.author_id
limit 10;