/*
This simulates a realistic library data set, starting from given real data.
Start by copying the TSV in this directory to `real_books_sim`.
*/

DROP SCHEMA IF EXISTS book_sim_util CASCADE;
CREATE SCHEMA book_sim_util;

CREATE TABLE book_sim_util.real_books_sim (
  "id" SERIAL PRIMARY KEY, "Title" text, "Author Last Name" text,
  "Author First Name" text, "Author Website" mathesar_types.uri,
  "Publisher" text, "Publication Year" integer, "Media" text, "Weight" text,
  "Height" text, "Thickness" text, "Length" text, "Page Count" integer,
  "Languages" text, "LC Classification" text, "ISBN" text,
  "Dewey Decimal" text, "Dewey Wording" text
);

\copy book_sim_util.real_books_sim FROM

CREATE OR REPLACE FUNCTION book_sim_util.generate_publications(real_books_sim) RETURNS
SETOF real_books_sim AS $$
  DECLARE mod_row real_books_sim%ROWTYPE;
  DECLARE publication_year_gap INTEGER;
  BEGIN
    mod_row = ROW($1.*);
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
        IF mod_row."Publication Year" <= date_part('year', NOW()) THEN
          RETURN NEXT mod_row;
        END IF;
      END IF;
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION book_sim_util.generate_items(real_books_sim) RETURNS
SETOF record AS $$
  DECLARE max_copies_m1 INTEGER;
  DECLARE pub_year_date DATE;
  DECLARE acquisition_date DATE;
  DECLARE acquisition_price mathesar_types.mathesar_money;
  BEGIN
    max_copies_m1 = 3;  -- increase this to generate more book copies.
    FOR i IN 1..((RANDOM()*max_copies_m1)::INTEGER + 1) LOOP
      pub_year_date = make_date($1."Publication Year", 1, 1);
      acquisition_date = (RANDOM()*(NOW()::DATE - pub_year_date))::INTEGER + pub_year_date;
      acquisition_price = (RANDOM()*15 + 5)::NUMERIC(4, 2);
      RETURN NEXT ROW(
        $1.*,
        acquisition_date,
        acquisition_price
      );
    END LOOP;
  END;
$$ LANGUAGE plpgsql IMMUTABLE RETURNS NULL ON NULL INPUT;


CREATE TABLE book_sim_util.real_books_items (
  "id" SERIAL PRIMARY KEY, "Title" text, "Author Last Name" text,
  "Author First Name" text, "Author Website" mathesar_types.uri,
  "Publisher" text, "Publication Year" integer, "Media" text, "Weight" text,
  "Height" text, "Thickness" text, "Length" text, "Page Count" integer,
  "Languages" text, "LC Classification" text, "ISBN" text,
  "Dewey Decimal" text, "Dewey Wording" text, "Acquisition Date" date,
  "Acquisition Price" mathesar_types.mathesar_money
);

WITH publications AS (
  SELECT x.*
  FROM
    real_books_sim,
    book_sim_util.generate_publications(real_books_sim) x
)
INSERT INTO real_books_items (
  "Title", "Author Last Name", "Author First Name", "Author Website",
  "Publisher", "Publication Year", "Media", "Weight", "Height", "Thickness",
  "Length", "Page Count", "Languages", "LC Classification", "ISBN",
  "Dewey Decimal", "Dewey Wording", "Acquisition Date", "Acquisition Price"
)
SELECT
  y."Title", y."Author Last Name", y."Author First Name", y."Author Website",
  y."Publisher", y."Publication Year", y."Media", y."Weight", y."Height",
  y."Thickness", y."Length", y."Page Count", y."Languages",
  y."LC Classification", y."ISBN", y."Dewey Decimal", y."Dewey Wording",
  y."Acquisition Date", y."Acquisition Price"
FROM
  publications,
  book_sim_util.generate_items(publications)
    AS y(
      "id" integer, "Title" text, "Author Last Name" text,
      "Author First Name" text, "Author Website" mathesar_types.uri,
      "Publisher" text, "Publication Year" integer, "Media" text, "Weight" text,
      "Height" text, "Thickness" text, "Length" text, "Page Count" integer,
      "Languages" text, "LC Classification" text, "ISBN" text,
      "Dewey Decimal" text, "Dewey Wording" text, "Acquisition Date" date,
      "Acquisition Price" mathesar_types.mathesar_money
    );
