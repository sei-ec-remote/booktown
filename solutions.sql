-- ### Order
-- 1. Find all subjects sorted by subject
-- SELECT subject
-- FROM subjects
-- ORDER BY subject

--      subject      
-- ------------------
--  Arts
--  Business
--  Children's Books
--  Classics
--  Computers
--  Cooking
--  Drama
--  Entertainment
--  History
--  Horror
--  Mystery
--  Poetry
--  Religion
--  Romance
--  Science
--  Science Fiction
-- (16 rows)

-- 2. Find all subjects sorted by location
-- SELECT *
-- FROM subjects
-- ORDER BY location

--  id |     subject      |     location     
-- ----+------------------+------------------
--   8 | History          | Academic Rd
--   3 | Classics         | Academic Rd
--  10 | Mystery          | Black Raven Dr
--   9 | Horror           | Black Raven Dr
--   0 | Arts             | Creativity St
--   5 | Cooking          | Creativity St
--   2 | Children's Books | Kids Ct
--   7 | Entertainment    | Main St
--   6 | Drama            | Main St
--  13 | Romance          | Main St
--  15 | Science Fiction  | Main St
--  14 | Science          | Productivity Ave
--   4 | Computers        | Productivity Ave
--   1 | Business         | Productivity Ave
--  11 | Poetry           | Sunset Dr
--  12 | Religion         | 

-- ### Where
-- 3. Find the book "Little Women"
-- SELECT *
-- FROM books
-- WHERE title = 'Little Women'

--  id  |    title     | author_id | subject_id 
-- -----+--------------+-----------+------------
--  190 | Little Women |        16 |          6

-- 4. Find all books containing the word "Python"
-- SELECT *
-- FROM books
-- WHERE title like '%Python%'

--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject

-- SELECT * 
-- FROM subjects
-- WHERE location = 'Main St'
-- ORDER BY subject

--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St



-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
-- SELECT books.title
-- FROM books
-- JOIN subjects
-- ON books.subject_id  = subjects.id
-- WHERE subject = 'Computers'

--         title         
-- ----------------------
--  Practical PostgreSQL
--  Perl Cookbook
--  Learning Python
--  Programming Python
-- (4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- SELECT books.title, authors.first_name, authors.last_name, subjects.subject
-- FROM books
-- JOIN authors
-- ON books.author_id=authors.id
-- JOIN subjects
-- ON books.subject_id=subjects.id

--             title            |    first_name    |  last_name   |     subject      
-- -----------------------------+------------------+--------------+------------------
--  Practical PostgreSQL        | John             | Worsley      | Computers
--  Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
--  The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
--  Little Women                | Louisa May       | Alcott       | Drama
--  The Shining                 | Stephen          | King         | Horror
--  Dune                        | Frank            | Herbert      | Science Fiction
--  Dynamic Anatomy             | Burne            | Hogarth      | Arts
--  Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
--  The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
--  Programming Python          | Mark             | Lutz         | Computers
--  Learning Python             | Mark             | Lutz         | Computers
--  Perl Cookbook               | Tom              | Christiansen | Computers
--  2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
--  The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
--  Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
-- (15 rows)



-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- SELECT books.title, stock.cost
-- FROM stock
-- JOIN editions
-- ON editions.isbn = stock.isbn
-- JOIN books
-- ON books.id = editions.book_id

--             title            | cost  
-- -----------------------------+-------
--  The Cat in the Hat          | 30.00
--  The Shining                 | 24.00
--  Bartholomew and the Oobleck | 16.00
--  Franklin in the Dark        | 23.00
--  Goodnight Moon              | 25.00

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- SELECT books.title, editions.isbn, publishers.name, stock.retail
-- FROM books
-- JOIN editions
-- ON books.id = editions.book_id
-- JOIN stock
-- ON editions.isbn = stock.isbn
-- JOIN publishers
-- ON publishers.id = editions.publisher_id
-- WHERE books.title = 'Dune'

--  title |    isbn    |   name    | retail 
-- -------+------------+-----------+--------
--  Dune  | 0441172717 | Ace Books |  21.95
--  Dune  | 044100590X | Ace Books |  45.95


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
-- SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
-- FROM shipments
-- JOIN editions
-- ON editions.isbn=shipments.isbn
-- JOIN books
-- ON editions.book_id=books.id
-- JOIN customers
-- ON shipments.customer_id=customers.id

--  Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
--  Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
--  James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
--  Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
--  Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
--  Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
--  Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
--  Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
--  Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
--  Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
--  James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
--  Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
--  Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
--  Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
--  Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
--  Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
--  Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
--  Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
--  Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
--  Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
--  Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy




-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*)
FROM books

--  count 
-- -------
--     15
-- (1 row)

-- 12. Get the COUNT of all Locations


-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
