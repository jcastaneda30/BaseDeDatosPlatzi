SELECT clients.name,books.title,authors.name,transactions.type
from transactions
join clients on transactions.client_id = clients.client_id
join books on transactions.book_id = books.book_id
join authors on books.author_id = authors.author_id;
