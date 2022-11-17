-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects;
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
SELECT * FROM subjects ORDER by location;
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

-- 4. Find all books containing the word "Python"
-- 5. Find all subjects with the location "Main St" sort them by subject


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)


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
