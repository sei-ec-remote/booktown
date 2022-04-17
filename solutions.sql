-- ### Order
-- 1. Find all subjects sorted by subject
--
SELECT *
  FROM subjects
  ORDER BY subject;

-- 2. Find all subjects sorted by location
--
SELECT *
  FROM subjects
  ORDER BY location;


-- ### Where
-- 3. Find the book "Little Women"
--
SELECT *
  FROM books
  WHERE title = 'Little Women';


-- 4. Find all books containing the word "Python"
--
SELECT *
  FROM books
  WHERE title LIKE '%Python%';


-- 5. Find all subjects with the location "Main St" sort them by subject
--
SELECT *
  FROM subjects
  WHERE location = 'Main St'
  ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
--
SELECT title
  FROM books b
  JOIN subjects s
  ON s.id = b.subject_id
  WHERE subject = 'Computers';


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
--
SELECT b.title, a.first_name, a.last_name, s.subject
  FROM books b
	JOIN authors a
		ON b.author_id = a.id
	JOIN subjects s
		ON b.subject_id = s.id;


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
--
SELECT b.title, s.retail
	FROM stock s
	JOIN editions e
	ON s.isbn = e.isbn
	JOIN books b
	ON e.book_id = b.id
	ORDER BY s.retail DESC;


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
--
SELECT b.title, e.isbn, p.name, s.retail
	FROM stock s
	JOIN editions e
	ON s.isbn = e.isbn
	JOIN books b
	ON e.book_id = b.id
	JOIN publishers p
	ON e.publisher_id = p.id
	WHERE b.title = 'Dune';


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
--
SELECT c.first_name, c.last_name, s.ship_date, b.title
	FROM shipments s
	JOIN customers c
	ON s.customer_id = c.id
	JOIN editions e
	ON s.isbn = e.isbn
	JOIN books b
	ON e.book_id = b.id
	ORDER BY s.ship_date ASC;



-- ### Grouping and Counting

-- 11. Get the COUNT of all books
--
-- Question didn't specify, so here's the count without separate editions:
SELECT COUNT(title)
	FROM books;
-- And the count of the books including multiple editions:
SELECT COUNT(title)
	FROM editions e
	JOIN books b
	ON b.id = e.book_id;


-- 12. Get the COUNT of all Locations
--
SELECT COUNT(location)
	FROM subjects;


-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
--
SELECT location, COUNT(location)
	FROM subjects
	WHERE location IS NOT null
	GROUP BY location;


-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
--
SELECT e.book_id, b.title, COUNT(e.edition)
	FROM books b
	JOIN editions e
	ON e.book_id = b.id
	GROUP BY e.book_id, b.title;
