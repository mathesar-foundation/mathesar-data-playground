/*
This simulates a realistic library data set, starting from given real data.
*/
CREATE TABLE real_books_sim_clean AS SELECT
  MIN("id") "id",
  MIN("Title") "Title",
  MIN("Author First Name") "Author First Name",
  MIN("Author Last Name") "Author Last Name",
  MIN("Author Website")::mathesar_types.uri "Author Website",
  MIN("Publisher") "Publisher",
  MIN("Publication Year") "Publication Year",
  "ISBN"
FROM real_books_sim WHERE "Publication Year" IS NOT NULL GROUP BY "ISBN";

CREATE OR REPLACE FUNCTION add_isbn_dashes(isbn TEXT) RETURNS TEXT AS $$
  DECLARE mid_hspot INTEGER;
  DECLARE hspot_mod INTEGER;
  DECLARE dash_isbn TEXT;
  BEGIN
    hspot_mod = length(isbn) - 10;
    mid_hspot = (RANDOM() * 7 + 2.5)::INTEGER;
    dash_isbn = overlay(
      overlay(
        overlay(isbn placing '-' from 10 + hspot_mod for 0)
        placing '-' from mid_hspot + hspot_mod for 0
      )
      placing '-' from (RANDOM() * (mid_hspot - 2) + 1.5)::INTEGER + hspot_mod for 0
    );
    IF hspot_mod > 0 THEN
      dash_isbn = overlay(dash_isbn placing '-' from hspot_mod + 1 for 0);
    END IF;
    return dash_isbn;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;

CREATE OR REPLACE FUNCTION generate_isbn(year INTEGER) RETURNS TEXT AS $$
  DECLARE isbn TEXT;
  DECLARE hspot INTEGER;
  BEGIN
    hspot = (RANDOM() * 7 + 2.5)::INTEGER;
    isbn = lpad((RANDOM() * 10000000000)::BIGINT::TEXT, 10, '0');
    IF RANDOM() <= 0.09 THEN  -- check digit is base 11
      isbn = overlay(isbn placing 'X' from 10 for 1);
    END IF;
    IF year >= 2007 THEN
      isbn = '978' || isbn;
    END IF;
    RETURN isbn;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION generate_publications(real_books_sim_clean) RETURNS
SETOF real_books_sim_clean AS $$
  DECLARE mod_row real_books_sim_clean%ROWTYPE;
  DECLARE publication_year_gap INTEGER;
  BEGIN
    mod_row = ROW($1.*);
    IF mod_row."ISBN" IS NULL THEN
      mod_row."ISBN" = generate_isbn(mod_row."Publication Year");
    END IF;
    IF mod_row."ISBN" NOT LIKE '%-%' THEN
      mod_row."ISBN" = add_isbn_dashes(mod_row."ISBN");
    END IF;
    RETURN NEXT mod_row;
    -- We choose a random number of publications, up to a max of 5.
    FOR i in 1..(RANDOM()*5 + 1)::INTEGER LOOP
      IF i > 1 AND RANDOM() < 0.05 THEN
        /*
        Publication gap is chosen uniformly at random from 1 to 13. It defines
        the gap between publication dates.
        */
        publication_year_gap = 1 + (RANDOM()*12)::INTEGER;
        mod_row."Publication Year" = mod_row."Publication Year" +  publication_year_gap;
        mod_row."ISBN" = add_isbn_dashes(generate_isbn(mod_row."Publication Year"));
        IF mod_row."Publication Year" <= date_part('year', NOW()) THEN
          RETURN NEXT mod_row;
        END IF;
      END IF;
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION generate_items(real_books_sim_clean) RETURNS
SETOF record AS $$
  DECLARE max_copies NUMERIC;
  DECLARE pub_year_date DATE;
  DECLARE acquisition_date DATE;
  DECLARE acquisition_price mathesar_types.mathesar_money;
  DECLARE barcode TEXT;
  BEGIN
    max_copies = 3;  -- change this to generate different numbers of book copies.
    FOR i IN 1..(max_copies / (2 * max_copies - RANDOM() * (2 * max_copies-1)))::INTEGER LOOP
      pub_year_date = make_date($1."Publication Year", 1, 1);
      acquisition_date = (RANDOM()*(NOW()::DATE - pub_year_date))::INTEGER + pub_year_date;
      acquisition_price = (RANDOM()*15 + 5)::NUMERIC(4, 2);
      barcode = overlay(
        overlay(
          overlay(left(UPPER(md5(RANDOM()::TEXT)), 16) placing '-' from 13 for 0)
          placing '-' from 9 for 0
        )
        placing '-' from 5 for 0
      );
      RETURN NEXT ROW(
        $1.id, $1."Title", $1."Author First Name", $1."Author Last Name",
        $1."Author Website", $1."Publisher", $1."Publication Year",
        $1."ISBN", barcode, acquisition_date, acquisition_price
      );
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE TABLE "Items" (
  "id" SERIAL PRIMARY KEY, "Title" text, "Author First Name" text,
  "Author Last Name" text, "Author Website" mathesar_types.uri,
  "Publisher" text, "Publication Year" integer, "ISBN" text,
  "Barcode" text UNIQUE, "Acquisition Date" date,
  "Acquisition Price" mathesar_types.mathesar_money
);

WITH publications AS (
  SELECT x.*
  FROM
    real_books_sim_clean,
    generate_publications(real_books_sim_clean) x
)
INSERT INTO "Items" (
  "Title", "Author First Name", "Author Last Name", "Author Website",
  "Publisher", "Publication Year", "ISBN", "Barcode", "Acquisition Date",
  "Acquisition Price"
)
SELECT
  y."Title", y."Author First Name", y."Author Last Name", y."Author Website",
  y."Publisher", y."Publication Year", y."ISBN", y."Barcode",
  y."Acquisition Date", y."Acquisition Price"
FROM
  publications,
  generate_items(publications)
    AS y(
      "id" integer, "Title" text, "Author First Name" text,
      "Author Last Name" text, "Author Website" mathesar_types.uri,
      "Publisher" text, "Publication Year" integer, "ISBN" text,"Barcode" text,
      "Acquisition Date" date, "Acquisition Price" mathesar_types.mathesar_money
    );


\copy "Items" TO 'library_books.tsv' WITH (FORMAT CSV, HEADER true, DELIMITER E'\t')


CREATE TABLE "Authors" (
  id SERIAL PRIMARY KEY,
  "First Name" text,
  "Last Name" text,
  "Website" mathesar_types.uri
);

ALTER TABLE "Items" ADD COLUMN "Author" integer REFERENCES "Authors";

WITH split_cte AS (
  SELECT *,
    dense_rank() OVER (
      ORDER BY
        "Author Last Name",
        "Author First Name",
        "Author Website"
      ) AS split_id
  FROM "Items"
), extract_ins_cte AS (
  INSERT INTO "Authors"
  SELECT DISTINCT split_id, "Author First Name", "Author Last Name", "Author Website"
  FROM split_cte RETURNING 1 AS flag
)
UPDATE "Items" SET "Author"=split_cte.split_id FROM split_cte
WHERE "Items".id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE "Items"
  DROP COLUMN "Author First Name",
  DROP COLUMN "Author Last Name",
  DROP COLUMN "Author Website";

CREATE TABLE "Publishers" (id SERIAL PRIMARY KEY, "Name" text);

ALTER TABLE "Items" ADD COLUMN "Publisher_id" integer REFERENCES "Publishers";

WITH split_cte AS (
  SELECT *, dense_rank() OVER (ORDER BY "Publisher") AS split_id
  FROM "Items"
), extract_ins_cte AS (
  INSERT INTO "Publishers"
    SELECT DISTINCT split_id, "Publisher" FROM split_cte RETURNING 1 AS flag
)
UPDATE "Items" SET "Publisher_id"=split_cte.split_id FROM split_cte
WHERE "Items".id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE "Items" DROP COLUMN "Publisher";
ALTER TABLE "Items" RENAME COLUMN "Publisher_id" TO "Publisher";


CREATE TABLE "Books" (
  id SERIAL PRIMARY KEY,
  "Title" text,
  "Publication Year" integer,
  "ISBN" text UNIQUE,
  "Author" integer REFERENCES "Authors",
  "Publisher" integer REFERENCES "Publishers"
);

ALTER TABLE "Items" ADD COLUMN "Publication" integer REFERENCES "Books";

WITH split_cte AS (
  SELECT *,
    dense_rank() OVER (
      ORDER BY
        "Title", "Publication Year", "ISBN", "Author", "Publisher"
      ) AS split_id
  FROM "Items"
), extract_ins_cte AS (
  INSERT INTO "Books"
  SELECT DISTINCT
    split_id, "Title", "Publication Year", "ISBN", "Author", "Publisher"
  FROM split_cte RETURNING 1 AS flag
)
UPDATE "Items" SET "Publication"=split_cte.split_id FROM split_cte
WHERE "Items".id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE "Items"
  DROP COLUMN  "Title",
  DROP COLUMN  "Publication Year",
  DROP COLUMN  "ISBN",
  DROP COLUMN  "Author",
  DROP COLUMN  "Publisher";

CREATE TABLE "Checkouts" (
  id SERIAL PRIMARY KEY,
  "Item" integer REFERENCES "Items",
  "Patron" integer REFERENCES "Patrons",
  "Checkout Time" timestamp NOT NULL,
  "Due Date" date NOT NULL,
  "Check In Time" timestamp
);

DROP TABLE real_books_sim CASCADE;
DROP TABLE real_books_sim_clean CASCADE;

WITH numbers_cte AS (
  SELECT
    "Title",
    COUNT(DISTINCT "Publication Year") as num_publications
  FROM "Books"
  GROUP BY "Title"
)
SELECT num_publications editions, COUNT(1) num_titles
FROM numbers_cte
GROUP BY editions
ORDER BY editions;

WITH numbers_cte_2 AS (
  SELECT
    "Publication",
    COUNT(DISTINCT "Barcode") as num_barcodes
  FROM "Items"
  GROUP BY "Publication"
)
SELECT num_barcodes copies, COUNT(1) num_publications
FROM numbers_cte_2
GROUP BY copies
ORDER BY copies;
