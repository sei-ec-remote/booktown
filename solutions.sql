-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject ASC;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books JOIN subjects ON subjects.id = books.subject_id WHERE subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
        -- SELECT title FROM books; Getting all the book titles
-- 	* Author's first name
        -- SELECT first_name  FROM authors; Getting all author first name
-- 	* Author's last name
        -- SELECT last_name  FROM authors; Getting all author last name
-- 	* Book subject
        -- SELECT subject FROM subjects; Getting all Subjects

SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books 
JOIN subjects ON subjects.id = books.subject_id 
JOIN authors ON authors.id = books.author_id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
    -- books.title & stock.retail
SELECT books.title, stock.retail FROM stock 
JOIN editions ON editions.isbn = stock.isbn
JOIN books ON editions.book_id = books.id
ORDER BY stock.retail DESC;


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- books.title
-- 	* ISBN number
--editions.isbn
-- 	* Publisher name
--publishers.name
-- 	* Retail price
--stock.retail
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM stock
JOIN editions ON editions.isbn = stock.isbn
JOIN books on books.id = editions.book_id
JOIN publishers on publishers.id = editions.publisher_id
WHERE title = 'Dune';



-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name , shipments.ship_date , books.title FROM customers
JOIN shipments ON shipments.customer_id = customers.id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books on books.id = editions.book_id
ORDER BY ship_date ASC;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT subjects.location, COUNT(subjects.location) FROM subjects GROUP BY subjects.location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) FROM editions
JOIN books ON books.id = editions.book_id
GROUP BY id
ORDER BY count ASC;