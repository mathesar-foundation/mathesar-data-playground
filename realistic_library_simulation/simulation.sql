/*
This simulates a realistic library data set, starting from given real data.
*/
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
FROM real_books_sim WHERE "Publication Year" IS NOT NULL GROUP BY "ISBN";

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
      IF i > 1 AND RANDOM() < 0.05 THEN
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
          -- 13-digit ISBNs starting in 2007; first 3 digits should be 978
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
  DECLARE max_copies NUMERIC;
  DECLARE pub_year_date DATE;
  DECLARE acquisition_date DATE;
  DECLARE acquisition_price mathesar_types.mathesar_money;
  DECLARE barcode TEXT;
  BEGIN
    max_copies = 3;  -- increase this to generate more book copies.
    FOR i IN 1..(max_copies / (2 * max_copies - RANDOM() * (2 * max_copies-1)))::INTEGER LOOP
      pub_year_date = make_date($1."Publication Year", 1, 1);
      acquisition_date = (RANDOM()*(NOW()::DATE - pub_year_date))::INTEGER + pub_year_date;
      acquisition_price = (RANDOM()*15 + 5)::NUMERIC(4, 2);
      barcode = UPPER(md5(RANDOM()::TEXT));
      RETURN NEXT ROW(
        $1.id, $1."Title", $1."Author Last Name", $1."Author First Name",
        $1."Author Website", $1."Publisher", $1."Publication Year", $1."Media",
        $1."Page Count", $1."Languages", $1."LC Classification", $1."ISBN",
        $1."Dewey Decimal", $1."Dewey Wording", barcode, acquisition_date,
        acquisition_price
      );
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE TABLE "Items" (
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
INSERT INTO "Items" (
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
  "Media" text,
  "Page Count" integer,
  "Languages" text,
  "LC Classification" text,
  "ISBN" text UNIQUE,
  "Dewey Decimal" text,
  "Dewey Wording" text,
  "Author" integer REFERENCES "Authors",
  "Publisher" integer REFERENCES "Publishers"
);

ALTER TABLE "Items" ADD COLUMN "Publication" integer REFERENCES "Books";

WITH split_cte AS (
  SELECT *,
    dense_rank() OVER (
      ORDER BY
        "Title", "Publication Year", "Media", "Page Count", "Languages",
        "LC Classification", "ISBN", "Dewey Decimal", "Dewey Wording", "Author",
        "Publisher"
      ) AS split_id
  FROM "Items"
), extract_ins_cte AS (
  INSERT INTO "Books"
  SELECT DISTINCT
    split_id, "Title", "Publication Year", "Media", "Page Count", "Languages",
    "LC Classification", "ISBN", "Dewey Decimal", "Dewey Wording", "Author",
    "Publisher"
  FROM split_cte RETURNING 1 AS flag
)
UPDATE "Items" SET "Publication"=split_cte.split_id FROM split_cte
WHERE "Items".id = split_cte.id AND exists (SELECT flag FROM extract_ins_cte);

ALTER TABLE "Items"
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

CREATE TABLE "Checkouts" (
  id SERIAL PRIMARY KEY,
  "Item" integer REFERENCES "Items",
  "Patron" integer REFERENCES "Patrons",
  "Checkout Time" timestamp NOT NULL,
  "Due Date" date NOT NULL,
  "Check In Time" timestamp
);

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
