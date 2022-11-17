-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * 
    FROM subjects;

--  id |     subject      |     location     
-- ----+------------------+------------------
--   0 | Arts             | Creativity St
--   1 | Business         | Productivity Ave
--   2 | Children's Books | Kids Ct
--   3 | Classics         | Academic Rd
--   4 | Computers        | Productivity Ave
--   5 | Cooking          | Creativity St
--   6 | Drama            | Main St
--   7 | Entertainment    | Main St
--   8 | History          | Academic Rd
--   9 | Horror           | Black Raven Dr
--  10 | Mystery          | Black Raven Dr
--  11 | Poetry           | Sunset Dr
--  12 | Religion         | 
--  13 | Romance          | Main St
--  14 | Science          | Productivity Ave
--  15 | Science Fiction  | Main St

-- 2. Find all subjects sorted by location
SELECT * 
    FROM subjects 
    ORDER by location;

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

-- ### Where
-- 3. Find the book "Little Women"
SELECT title 
    FROM books 
    WHERE title = 'Little Women';

    title     
--------------
 Little Women

-- 4. Find all books containing the word "Python"
SELECT title 
    FROM books 
    WHERE title 
    LIKE '%Python';

       title        
--------------------
 Programming Python
 Learning Python

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * 
    FROM subjects 
    WHERE location = 'Main St' 
    ORDER by subject;

 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title 
    FROM subjects 
    JOIN books 
    ON subjects.id = books.subject_id 
    WHERE subject = 'Computers';

        title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
SELECT title 
    FROM books;

            title            
-----------------------------
 The Shining
 Dune
 2001: A Space Odyssey
 The Cat in the Hat
 Bartholomew and the Oobleck
 Franklin in the Dark
 Goodnight Moon
 Little Women
 The Velveteen Rabbit
 Dynamic Anatomy
 The Tell-Tale Heart
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL

-- 	* Author's first name
SELECT first_name 
    FROM authors 
    JOIN books 
    ON authors.id = books.author_id;

    first_name    
------------------
 John
 Paulette
 Margery Williams
 Louisa May
 Stephen
 Frank
 Burne
 Margaret Wise
 Edgar Allen
 Mark
 Mark
 Tom
 Arthur C.
 Theodor Seuss
 Theodor Seuss

-- 	* Author's last name
SELECT last_name 
    FROM authors 
    JOIN books 
    ON authors.id = books.author_id;

  last_name   
--------------
 Worsley
 Bourgeois
 Bianco
 Alcott
 King
 Herbert
 Hogarth
 Brown
 Poe
 Lutz
 Lutz
 Christiansen
 Clarke
 Geisel
 Geisel

-- 	* Book subject
-- 8. Find all books that are listed in the stock table

SELECT books.title, stock.retail
    FROM stock
    LEFT JOIN editions 
    ON stock.isbn = editions.isbn
    LEFT JOIN books 
    ON editions.book_id = books.id
    ORDER BY stock.retail 
    DESC;

                title            | retail 
-----------------------------+--------
 2001: A Space Odyssey       |  46.95
 Dune                        |  45.95
 The Shining                 |  36.95
 The Cat in the Hat          |  32.95
 Goodnight Moon              |  28.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Cat in the Hat          |  23.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 2001: A Space Odyssey       |  22.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Bartholomew and the Oobleck |  16.95

-- 	* Sort them by retail price (most expensive first)

please see above ^^

-- 	* Display ONLY: title and price

please see above ^^

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
SELECT title 
    FROM books 
    WHERE title = 'Dune';

 title 
-------
 Dune

-- 	* ISBN number
SELECT stock.isbn
    FROM stock
    LEFT JOIN editions ON stock.isbn = editions.isbn
    LEFT JOIN books ON editions.book_id = books.id
    WHERE title = 'Dune';

    isbn    
------------
 0441172717
 044100590X

-- 	* Publisher name
SELECT publishers.name
    FROM publishers
    LEFT JOIN editions 
    ON publishers.id = publisher_id
    LEFT JOIN books 
    ON editions.book_id = books.id
    WHERE title = 'Dune';

name    
-----------
 Ace Books
 Ace Books

-- 	* Retail price
SELECT stock.retail
    FROM stock
    LEFT JOIN editions 
    ON stock.isbn = editions.isbn
    LEFT JOIN books 
    ON editions.book_id = books.id
    WHERE title = 'Dune';

retail 
--------
  21.95
  45.95

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
SELECT DISTINCT first_name 
    FROM customers
    JOIN shipments
    ON customer_id = shipments.customer_id
    ORDER by first_name 
    ASC;

 first_name 
------------
 Adam
 Annie
 Chad
 Christine
 Chuck
 Dave
 Don
 Ed
 Eric
 James
 Jean
 Jenny
 Jonathan
 Julie
 Kate
 Kathy
 Laura
 Owen
 Ramon
 Rich
 Richard
 Royce
 Shirley
 Tammy
 Tim
 Trevor
 Wendy

-- 	* Customer last name
SELECT DISTINCT last_name 
    FROM customers
    JOIN shipments
    ON customer_id = shipments.customer_id
    ORDER by last_name 
    ASC;

 last_name 
-----------
 Allen
 Anderson
 Becker
 Bennett
 Black
 Bollman
 Brown
 Clark
 Corner
 Eisele
 Gerdes
 Gould
 Holloway
 Jackson
 King
 Morrill
 Olson
 Owens
 Robertson
 Robinson
 Thomas
 Williams
 Young

-- 	* ship date
SELECT DISTINCT ship_date 
    FROM customers
    JOIN shipments
    ON customer_id = shipments.customer_id
    ORDER by ship_date 
    ASC;

    ship_date        
------------------------
 2001-08-05 12:34:04-04
 2001-08-06 10:49:44-04
 2001-08-06 12:29:21-04
 2001-08-06 14:46:36-04
 2001-08-07 13:58:36-04
 2001-08-07 14:31:57-04
 2001-08-07 14:56:42-04
 2001-08-07 16:00:48-04
 2001-08-08 11:36:44-04
 2001-08-08 12:53:46-04
 2001-08-08 13:46:13-04
 2001-08-09 10:30:07-04
 2001-08-09 12:30:46-04
 2001-08-10 10:29:52-04
 2001-08-10 11:29:42-04
 2001-08-10 16:47:52-04
 2001-08-11 12:55:05-04
 2001-08-11 13:52:34-04
 2001-08-11 16:34:08-04
 2001-08-12 11:46:35-04
 2001-08-12 15:09:47-04
 2001-08-12 16:39:22-04
 2001-08-13 12:42:10-04
 2001-08-13 12:47:04-04
 2001-08-14 10:33:47-04
 2001-08-14 11:42:58-04
 2001-08-14 13:36:41-04
 2001-08-14 16:41:39-04
 2001-08-14 16:45:51-04
 2001-08-14 16:49:00-04
 2001-08-15 14:57:40-04
 2001-08-15 17:02:01-04
 2001-09-14 19:46:32-04
 2001-09-14 20:42:22-04
 2001-09-22 14:23:28-04
 2001-09-22 23:58:56-04

-- 	* book title
SELECT DISTINCT books.title
    FROM shipments
    LEFT JOIN editions 
    ON shipments.isbn = editions.isbn
    LEFT JOIN books 
    ON editions.book_id = books.id
    ORDER BY books.title 
    ASC;

        title            
-----------------------------
 2001: A Space Odyssey
 Bartholomew and the Oobleck
 Dune
 Dynamic Anatomy
 Franklin in the Dark
 Goodnight Moon
 Little Women
 The Cat in the Hat
 The Shining
 The Tell-Tale Heart
 The Velveteen Rabbit

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(books)
    FROM stock
    LEFT JOIN editions 
    ON stock.isbn = editions.isbn
    LEFT JOIN books 
    ON editions.book_id = books.id;

 count 
-------
    16

-- 12. Get the COUNT of all Locations
SELECT count(location) 
    FROM subjects
    JOIN books
    ON subjects.id = books.subject_id;

 count 
-------
    15

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT count(location), location
    FROM subjects
    JOIN books
    ON subjects.id = books.subject_id
    GROUP BY location;

 count |     location     
-------+------------------
     1 | Academic Rd
     2 | Black Raven Dr
     3 | Main St
     1 | Creativity St
     4 | Kids Ct
     4 | Productivity Ave

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT count(editions.book_id), books.title, books.id
    FROM books
    JOIN editions
    ON editions.book_id = books.id;




-- notes:
                     List of relations
 Schema |         Name          |   Type   |     Owner     
--------+-----------------------+----------+---------------
 public | alternate_stock       | table    | alinaishizaki
 public | authors               | table    | alinaishizaki
 public | book_backup           | table    | alinaishizaki --<-- subject_id 
 public | book_ids              | sequence | alinaishizaki
 public | book_queue            | table    | alinaishizaki --<-- subject_id 
 public | books                 | table    | alinaishizaki --<-- subject_id 
 public | customers             | table    | alinaishizaki
 public | daily_inventory       | table    | alinaishizaki
 public | distinguished_authors | table    | alinaishizaki
 public | editions              | table    | alinaishizaki
 public | employees             | table    | alinaishizaki
 public | favorite_authors      | table    | alinaishizaki
 public | favorite_books        | table    | alinaishizaki
 public | money_example         | table    | alinaishizaki
 public | my_list               | table    | alinaishizaki
 public | numeric_values        | table    | alinaishizaki
 public | publishers            | table    | alinaishizaki
 public | schedules             | table    | alinaishizaki
 public | shipments             | table    | alinaishizaki
 public | states                | table    | alinaishizaki
 public | stock                 | table    | alinaishizaki
 public | stock_backup          | table    | alinaishizaki
 public | subject_ids           | sequence | alinaishizaki
 public | subjects              | table    | alinaishizaki  --<-- subject_id
 public | text_sorting          | table    | alinaishizaki
