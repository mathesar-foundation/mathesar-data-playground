/*
This simulates a realistic library data set, starting from given real data.
*/

DROP SCHEMA IF EXISTS book_sim_util CASCADE;
CREATE SCHEMA book_sim_util;
SET search_path=book_sim_util;

CREATE TABLE real_books_sim (
  "id" SERIAL PRIMARY KEY, "Title" text, "Author Last Name" text,
  "Author First Name" text, "Author Website" mathesar_types.uri,
  "Publisher" text, "Publication Year" integer, "Media" text, "Weight" text,
  "Height" text, "Thickness" text, "Length" text, "Page Count" integer,
  "Languages" text, "LC Classification" text, "ISBN" text,
  "Dewey Decimal" text, "Dewey Wording" text
);

\copy real_books_sim FROM 'real_books.tsv' WITH (FORMAT CSV, HEADER true, DELIMITER E'\t')

CREATE TABLE real_books_sim_clean AS SELECT
  MIN("id") "id",
  MIN("Title") "Title",
  MIN("Author Last Name") "Author Last Name",
  MIN("Author First Name") "Author First Name",
  MIN("Author Website")::mathesar_types.uri "Author Website",
  MIN("Publisher") "Publisher",
  MIN("Publication Year") "Publication Year",
  MIN("Media") "Media",
  MIN("Weight") "Weight",
  MIN("Height") "Height",
  MIN("Thickness") "Thickness",
  MIN("Length") "Length",
  MIN("Page Count") "Page Count",
  MIN("Languages") "Languages",
  MIN("LC Classification") "LC Classification",
  "ISBN",
  MIN("Dewey Decimal") "Dewey Decimal",
  MIN("Dewey Wording") "Dewey Wording"
FROM real_books_sim GROUP BY "ISBN";

CREATE OR REPLACE FUNCTION generate_publications(real_books_sim_clean) RETURNS
SETOF real_books_sim_clean AS $$
  DECLARE mod_row real_books_sim_clean%ROWTYPE;
  DECLARE publication_year_gap INTEGER;
  BEGIN
    mod_row = ROW($1.*);
    IF mod_row."ISBN" IS NULL THEN
      IF mod_row."Publication Year" < 2007 THEN
        -- 10-digit ISBNs before 2007
        mod_row."ISBN" = (RANDOM() * 10000000000)::BIGINT::TEXT;
        IF RANDOM() <= 0.09 THEN  -- check digit is base 11
          mod_row."ISBN" = overlay(mod_row."ISBN" placing 'X' from 10 for 1);
        END IF;
      ELSE
        -- 13-digit ISBNs starting in 2007
        mod_row."ISBN" = (RANDOM() * 10000000000 + 9780000000000)::BIGINT::TEXT;
        IF RANDOM() <= 0.09 THEN  -- check digit is base 11
          mod_row."ISBN" = overlay(mod_row."ISBN" placing 'X' from 13 for 1);
        END IF;
      END IF;
    END IF;
    RETURN NEXT mod_row;
    -- We choose a random number of publications, up to a max of 5.
    FOR i in 1..(RANDOM()*5 + 1)::INTEGER LOOP
      IF i > 1 THEN
        /*
        Publication gap is chosen uniformly at random from 1 to 13. It defines
        the gap between publication dates.
        */
        publication_year_gap = 1 + (RANDOM()*12)::INTEGER;
        mod_row."Publication Year" = mod_row."Publication Year" +  publication_year_gap;
        IF mod_row."Publication Year" < 2007 THEN
          -- 10-digit ISBNs before 2007
          mod_row."ISBN" = (RANDOM() * 10000000000)::BIGINT::TEXT;
          IF RANDOM() <= 0.09 THEN  -- check digit is base 11
            mod_row."ISBN" = overlay(mod_row."ISBN" placing 'X' from 10 for 1);
          END IF;
        ELSE
          -- 13-digit ISBNs starting in 2007
          mod_row."ISBN" = (RANDOM() * 10000000000 + 9780000000000)::BIGINT::TEXT;
          IF RANDOM() <= 0.09 THEN  -- check digit is base 11
            mod_row."ISBN" = overlay(mod_row."ISBN" placing 'X' from 13 for 1);
          END IF;
        END IF;

        IF mod_row."Publication Year" <= date_part('year', NOW()) THEN
          RETURN NEXT mod_row;
        END IF;
      END IF;
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION generate_items(real_books_sim_clean) RETURNS
SETOF record AS $$
  DECLARE max_copies_m1 INTEGER;
  DECLARE pub_year_date DATE;
  DECLARE acquisition_date DATE;
  DECLARE acquisition_price mathesar_types.mathesar_money;
  DECLARE barcode TEXT;
  BEGIN
    max_copies_m1 = 3;  -- increase this to generate more book copies.
    FOR i IN 1..((RANDOM()*max_copies_m1)::INTEGER + 1) LOOP
      pub_year_date = make_date($1."Publication Year", 1, 1);
      acquisition_date = (RANDOM()*(NOW()::DATE - pub_year_date))::INTEGER + pub_year_date;
      acquisition_price = (RANDOM()*15 + 5)::NUMERIC(4, 2);
      barcode = UPPER(md5(RANDOM()::TEXT));
      RETURN NEXT ROW(
        $1.id,
        $1."Title",
        $1."Author Last Name",
        $1."Author First Name",
        $1."Author Website",
        $1."Publisher",
        $1."Publication Year",
        $1."Media",
        $1."Page Count",
        $1."Languages",
        $1."LC Classification",
        $1."ISBN",
        $1."Dewey Decimal",
        $1."Dewey Wording",
        barcode,
        acquisition_date,
        acquisition_price
      );
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE TABLE real_books_items (
  "id" SERIAL PRIMARY KEY, "Title" text, "Author Last Name" text,
  "Author First Name" text, "Author Website" mathesar_types.uri,
  "Publisher" text, "Publication Year" integer, "Media" text,
  "Page Count" integer, "Languages" text, "LC Classification" text, "ISBN" text,
  "Dewey Decimal" text, "Dewey Wording" text, "Barcode" text UNIQUE,
  "Acquisition Date" date, "Acquisition Price" mathesar_types.mathesar_money
);

WITH publications AS (
  SELECT x.*
  FROM
    real_books_sim_clean,
    generate_publications(real_books_sim_clean) x
)
INSERT INTO real_books_items (
  "Title", "Author Last Name", "Author First Name", "Author Website",
  "Publisher", "Publication Year", "Media", "Page Count", "Languages",
  "LC Classification", "ISBN", "Dewey Decimal", "Dewey Wording", "Barcode",
  "Acquisition Date", "Acquisition Price"
)
SELECT
  y."Title", y."Author Last Name", y."Author First Name", y."Author Website",
  y."Publisher", y."Publication Year", y."Media", y."Page Count", y."Languages",
  y."LC Classification", y."ISBN", y."Dewey Decimal", y."Dewey Wording",
  y."Barcode", y."Acquisition Date", y."Acquisition Price"
FROM
  publications,
  generate_items(publications)
    AS y(
      "id" integer, "Title" text, "Author Last Name" text,
      "Author First Name" text, "Author Website" mathesar_types.uri,
      "Publisher" text, "Publication Year" integer, "Media" text,
      "Page Count" integer, "Languages" text, "LC Classification" text,
      "ISBN" text, "Dewey Decimal" text, "Dewey Wording" text, "Barcode" text,
      "Acquisition Date" date, "Acquisition Price" mathesar_types.mathesar_money
    );

CREATE TABLE "Authors" (
  id SERIAL PRIMARY KEY,
  "Author First Name" text,
  "Author Last Name" text,
  "Author Website" mathesar_types.uri
);

ALTER TABLE real_books_items ADD COLUMN "Author" integer REFERENCES "Authors";

WITH split_cte AS (
  SELECT *,
    dense_rank() OVER (
      ORDER BY
        "Author Last Name",
        "Author First Name",
        "Author Website"
      ) AS split_id
  FROM real_books_items
), extract_ins_cte AS (
  INSERT INTO "Authors"
  SELECT DISTINCT split_id, "Author First Name", "Author Last Name", "Author Website"
  FROM split_cte RETURNING 1 AS flag
)
UPDATE real_books_items SET "Author"=split_cte.split_id FROM split_cte
WHERE real_books_items.id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE real_books_items
  DROP COLUMN "Author First Name",
  DROP COLUMN "Author Last Name",
  DROP COLUMN "Author Website";

CREATE TABLE "Publishers" (id SERIAL PRIMARY KEY, "Name" text);

ALTER TABLE real_books_items ADD COLUMN "Publisher_id" integer REFERENCES "Publishers";

WITH split_cte AS (
  SELECT *, dense_rank() OVER (ORDER BY "Publisher") AS split_id
  FROM real_books_items
), extract_ins_cte AS (
  INSERT INTO "Publishers"
    SELECT DISTINCT split_id, "Publisher" FROM split_cte RETURNING 1 AS flag
)
UPDATE real_books_items SET "Publisher_id"=split_cte.split_id FROM split_cte
WHERE real_books_items.id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE real_books_items DROP COLUMN "Publisher";
ALTER TABLE real_books_items RENAME COLUMN "Publisher_id" TO "Publisher";


CREATE TABLE "Publications" (
  id SERIAL PRIMARY KEY,
  "Title" text,
  "Publication Year" integer,
  "Media" text,
  "Page Count" integer,
  "Languages" text,
  "LC Classification" text,
  "ISBN" text UNIQUE,
  "Dewey Decimal" text,
  "Dewey Wording" text,
  "Author" integer,
  "Publisher" integer
);

ALTER TABLE real_books_items ADD COLUMN "Publication" integer REFERENCES "Publications";

WITH split_cte AS (
  SELECT *,
    dense_rank() OVER (
      ORDER BY
        "Title",
        "Publication Year",
        "Media",
        "Page Count",
        "Languages",
        "LC Classification",
        "ISBN",
        "Dewey Decimal",
        "Dewey Wording",
        "Author",
        "Publisher"
      ) AS split_id
  FROM real_books_items
), extract_ins_cte AS (
  INSERT INTO "Publications"
  SELECT DISTINCT
    split_id,
    "Title",
    "Publication Year",
    "Media",
    "Page Count",
    "Languages",
    "LC Classification",
    "ISBN",
    "Dewey Decimal",
    "Dewey Wording",
    "Author",
    "Publisher"
  FROM split_cte RETURNING 1 AS flag
)
UPDATE real_books_items SET "Publication"=split_cte.split_id FROM split_cte
WHERE real_books_items.id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE real_books_items
  DROP COLUMN  "Title",
  DROP COLUMN  "Publication Year",
  DROP COLUMN  "Media",
  DROP COLUMN  "Page Count",
  DROP COLUMN  "Languages",
  DROP COLUMN  "LC Classification",
  DROP COLUMN  "ISBN",
  DROP COLUMN  "Dewey Decimal",
  DROP COLUMN  "Dewey Wording",
  DROP COLUMN  "Author",
  DROP COLUMN  "Publisher";
