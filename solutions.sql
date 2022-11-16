-- ### Order
-- 1. Find all subjects sorted by subject
-- SELECT * FROM books ORDER BY subject_id DESC;

SELECT * FROM subjects ORDER BY subject;

-- 2. Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"

SELECT * FROM books WHERE title='Little Women';

-- 4. Find all books containing the word "Python"

SELECT * FROM books WHERE title IN ('Python');
SELECT * FROM books WHERE title LIKE ('%Python');

-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location= 'Main St' ORDER BY subject ;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM subjects FULL OUTER JOIN books ON subject_id=subjects.id WHERE subject='Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT title, first_name, last_name, subject FROM authors INNER JOIN books ON author_id=authors.id INNER JOIN subjects on subject_id=subjects.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

  isbn    | cost  | retail | stock 
------------+-------+--------+-------
 0385121679 | 29.00 |  36.95 |    65


SELECT title, retail FROM editions INNER JOIN books ON book_id=books.id INNER JOIN stock on stock.isbn=editions.isbn;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title books - book_id
-- 	* ISBN number stock->editions->books
-- 	* Publisher name editions.publisher_id->publishers.id
-- 	* Retail price

SELECT title, retail, name, stock.isbn FROM editions INNER JOIN books ON book_id=books.id INNER JOIN stock on stock.isbn=editions.isbn INNER JOIN publishers on editions.publisher_id=publishers.id WHERE title='Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name 
-- 	* ship date 
-- 	* book title 

-- editions->(isbn, book_id)
-- books->(books.title, books.id)
-- shipments->(ship_date, isbn, customer_id)
-- customers->(customers.id, first_name, last_name)

SELECT first_name, last_name, shipments.ship_date, title FROM editions INNER JOIN books ON book_id=books.id INNER JOIN shipments on shipments.isbn=editions.isbn INNER JOIN customers ON customers.id= customer_id;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books

SELECT COUNT(*) FROM books;

-- 12. Get the COUNT of all Locations

SELECT COUNT(location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT books.id, title, edition, COUNT(edition) FROM books FULL OUTER JOIN editions ON book_id=books.id GROUP BY edition, id;