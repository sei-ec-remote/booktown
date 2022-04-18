-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject ASC;
-- 2. Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location ASC;
-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books WHERE title LIKE '%Little Women%';
-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject, location FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject ASC;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books JOIN subjects ON books.subject_id=subjects.id WHERE subject LIKE 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT title, first_name, last_name, subject FROM books JOIN authors ON books.author_id=authors.id JOIN subjects ON books.subject_id=subjects.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT title, retail FROM books JOIN editions ON books.id=editions.book_id JOIN stock ON editions.isbn=stock.isbn ORDER BY retail DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT title,stock.isbn, publishers.name, retail FROM books JOIN editions ON books.id=editions.book_id JOIN stock ON editions.isbn=stock.isbn JOIN publishers ON publishers.id=editions.publisher_id WHERE title LIKE '%Dune%';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT first_name, last_name, ship_date, title FROM books JOIN editions ON books.id=editions.book_id JOIN shipments ON editions.isbn=shipments.isbn JOIN customers ON customers.id=shipments.customer_id ORDER BY ship_date ASC;
-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;  
-- 12. Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT title, books.id, COUNT(editions.book_id) FROM books JOIN editions ON books.id=editions.book_id GROUP BY title, books.id; 