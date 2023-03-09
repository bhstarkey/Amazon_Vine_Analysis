CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

SELECT * FROM review_id_table;
SELECT * FROM products_table;
SELECT * FROM customers_table;
SELECT * FROM vine_table;

CREATE TABLE votes_table
AS (SELECT *
	FROM vine_table
	WHERE total_votes >=20);
	
SELECT * FROM votes_table	
	
CREATE TABLE helpful_votes_table
AS (SELECT *
	FROM votes_table
	WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5);	

SELECT * FROM helpful_votes_table

CREATE TABLE paid_votes
AS (SELECT *
	FROM helpful_votes_table
	WHERE vine = 'Y');	
	
SELECT * FROM paid_votes;	
	
CREATE TABLE not_paid_votes
AS (SELECT *
	FROM helpful_votes_table
	WHERE vine = 'N');		
	
SELECT * FROM not_paid_votes

CREATE TABLE not_paid_percent
AS (SELECT
	(SELECT COUNT (star_rating) AS five_star_reviews FROM not_paid_votes WHERE star_rating = 5) AS five_star_reviews,
	(SELECT COUNT (review_id) AS total_reviews FROM not_paid_votes) AS total_reviews);

SELECT * FROM not_paid_percent;

CREATE TABLE not_paid_five_star
AS (SELECT five_star_reviews, total_reviews, CAST(five_star_reviews AS FLOAT)/CAST(total_reviews AS FLOAT) AS percentage
FROM not_paid_percent);
	
SELECT * FROM not_paid_five_star;	
	
CREATE TABLE paid_review_count
AS (SELECT
	(SELECT COUNT (star_rating) AS five_star_reviews FROM paid_votes WHERE star_rating = 5) AS five_star_reviews,
	(SELECT COUNT (review_id) AS total_reviews FROM paid_votes) AS total_reviews);

SELECT * FROM paid_review_count;

CREATE TABLE paid_five_star
AS (SELECT five_star_reviews, total_reviews, CAST(five_star_reviews AS FLOAT)/CAST(total_reviews AS FLOAT) AS percentage
FROM paid_review_count);
	
SELECT * FROM paid_five_star;	