-- /////////////////////////////////////////// --
--              O R D E R                      --
-- /////////////////////////////////////////// --

-- # 1. Find all subjects sorted by subject

SELECT subject FROM subjects;
   
-- =========================================== --

-- # 2. Find all subjects sorted by location

SELECT location FROM subjects;

-- =========================================== --

-- /////////////////////////////////////////// --
--              W H E R E                      --
-- /////////////////////////////////////////// --

-- # 3. Find the book "Little Women"

SELECT * FROM books WHERE title = 'Little Women';

-- =========================================== --

-- # 4. Find all books containing the word "Python"

SELECT * FROM books WHERE title LIKE '%Python%';

-- =========================================== --
-- # 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location LIKE 'Main St' ORDER BY subject;

-- =========================================== --

-- /////////////////////////////////////////// --
--              J O I N S                      --
-- /////////////////////////////////////////// --

-- # 6. Find all books about Computers and list ONLY the book titles

SELECT title FROM subjects JOIN books ON books.subject_id=subjects.id WHERE subject = 'Computers';

-- =========================================== --
-- # 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT title, authors.first_name, authors.last_name, subject  FROM subjects JOIN books ON books.subject_id = subjects.id JOIN authors ON authors.id = books.author_id;

-- =========================================== --
-- # 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT title, stock.cost FROM books JOIN editions ON editions.book_id = books.id JOIN stock ON stock.isbn = editions.isbn ORDER BY stock.cost DESC;

-- =========================================== --
-- # 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price



-- =========================================== --
-- # 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title



-- =========================================== --

-- /////////////////////////////////////////// --
--     G R O U P I N G  &  C O U N T I N G     --
-- /////////////////////////////////////////// --

-- # 11. Get the COUNT of all books

SELECT COUNT (*) from books;

-- =========================================== --
-- # 12. Get the COUNT of all Locations

SELECT COUNT (location) from subjects;

-- =========================================== --
-- # 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- =========================================== --
-- # 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

-- SELECT title, id, COUNT(editions) FROM books JOIN editions ON editions.book_id = books.id GROUP BY title;
--  SELECT books.title, books.id, COUNT(editions) FROM books JOIN editions ON editions.book_id = books.id GROUP BY title;
--  SELECT books.title, editions.book_id, COUNT(editions) FROM books JOIN editions ON editions.book_id = books.id GROUP BY title;
-- Why don't these work ^^^^??? 

SELECT title, COUNT(editions) FROM books JOIN editions ON editions.book_id = books.id GROUP BY title;

-- =========================================== --
