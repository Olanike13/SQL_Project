-- CREATE TABLE/ENTITIES

-- Region

CREATE TABLE region(
      id SERIAL PRIMARY KEY,
	  name VARCHAR(100) NOT NULL UNIQUE
);


-- Sales_Rep

CREATE TABLE sales_rep(
      id SERIAL PRIMARY KEY,
	  name VARCHAR(100) NOT NULL,
	  region_id INT,
	  FOREIGN KEY (region_id) REFERENCES region (id)
);


-- Accounts

CREATE TABLE accounts(
      id SERIAL PRIMARY KEY,
	  name VARCHAR(100) NOT NULL,
	  website VARCHAR(100),
	  lat DECIMAL(9,6),
	  long DECIMAL(9,6),
	  primary_poc VARCHAR(100),
	  sales_rep_id INT,
	  FOREIGN KEY (sales_rep_id) REFERENCES sales_rep (id)
);

ALTER TABLE accounts 
ALTER COLUMN website TYPE TEXT;


-- Web_Events

CREATE TABLE web_events(
      id SERIAL PRIMARY KEY,
	  accounts_id INT,
	  occurred_at TIMESTAMP,
	  Channel VARCHAR(50),
	  FOREIGN KEY (accounts_id) REFERENCES accounts (id)
);

ALTER TABLE web_events RENAME COLUMN accounts_id TO account_id;


-- Orders

CREATE TABLE orders(
      id SERIAL PRIMARY KEY,
	  accounts_id INT,
	  standard_qty INT,
	  poster_qty INT,
	  total INT,
	  standard_amt_usd NUMERIC(10,2),
	  gloss_amt_usd NUMERIC(10,2),
	  poster_amt_usd NUMERIC(10,2),
	  total_amt_usd NUMERIC(12,2),
	  FOREIGN KEY (accounts_id) REFERENCES accounts (id)
);

ALTER TABLE orders RENAME COLUMN accounts_id TO account_id;