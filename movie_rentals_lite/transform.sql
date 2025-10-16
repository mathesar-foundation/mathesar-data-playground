
ALTER TABLE cast_roles     DROP CONSTRAINT cast_roles_movie_fkey;
ALTER TABLE cast_roles     DROP CONSTRAINT cast_roles_person_fkey;
ALTER TABLE crew_roles     DROP CONSTRAINT crew_roles_movie_fkey;
ALTER TABLE crew_roles     DROP CONSTRAINT crew_roles_person_fkey;
ALTER TABLE emails         DROP CONSTRAINT emails_customer_fkey;
ALTER TABLE emails         DROP CONSTRAINT emails_location_type_fkey;
ALTER TABLE items          DROP CONSTRAINT items_movie_fkey;
ALTER TABLE items          DROP CONSTRAINT items_store_fkey;
ALTER TABLE movies_genres  DROP CONSTRAINT movies_genres_movie_fkey;
ALTER TABLE movies_genres  DROP CONSTRAINT movies_genres_genre_fkey;
ALTER TABLE movies_studios DROP CONSTRAINT movies_studios_movie_fkey;
ALTER TABLE movies_studios DROP CONSTRAINT movies_studios_studio_fkey;
ALTER TABLE phones         DROP CONSTRAINT phones_customer_fkey;
ALTER TABLE phones         DROP CONSTRAINT phones_location_type_fkey;
ALTER TABLE rentals        DROP CONSTRAINT rentals_customer_fkey;
ALTER TABLE rentals        DROP CONSTRAINT rentals_item_fkey;

CREATE INDEX ON cast_roles     (movie);
CREATE INDEX ON cast_roles     (person);
CREATE INDEX ON crew_roles     (movie);
CREATE INDEX ON crew_roles     (person);
CREATE INDEX ON emails         (customer);
CREATE INDEX ON emails         (location_type);
CREATE INDEX ON items          (movie);
CREATE INDEX ON items          (store);
CREATE INDEX ON movies_genres  (movie);
CREATE INDEX ON movies_genres  (genre);
CREATE INDEX ON movies_studios (movie);
CREATE INDEX ON movies_studios (studio);
CREATE INDEX ON phones         (customer);
CREATE INDEX ON phones         (location_type);
CREATE INDEX ON rentals        (customer);
CREATE INDEX ON rentals        (item);


-- Remove all but the top 99 movies by vote count. And keep Galaxy Quest.
DELETE FROM movies WHERE vote_count < 14200 AND id <> 1;

-- Remove all but the first 20 cast roles, per movie
WITH
  r AS (
    SELECT
      cast_roles.id,
      row_number() OVER (PARTITION BY movies.id ORDER BY cast_roles.id) AS rank
    FROM cast_roles
    JOIN movies ON movies.id = cast_roles.movie
  ),
  q AS ( SELECT * FROM r WHERE r.rank > 20 )
DELETE FROM cast_roles
USING q
WHERE cast_roles.id = q.id;

-- Remove all but the first 20 crew roles, per movie
WITH
  r AS (
    SELECT
      crew_roles.id,
      row_number() OVER (PARTITION BY movies.id ORDER BY crew_roles.id) AS rank
    FROM crew_roles
    JOIN movies ON movies.id = crew_roles.movie
  ),
  q AS ( SELECT * FROM r WHERE r.rank > 20 )
DELETE FROM crew_roles
USING q
WHERE crew_roles.id = q.id;

-- Remove many of the stores
DELETE FROM stores WHERE id > 50;

-- Remove orphans
DELETE FROM movies_genres t WHERE NOT EXISTS (SELECT 1 FROM movies r WHERE r.id = t.movie);
DELETE FROM genres t WHERE NOT EXISTS (SELECT 1 FROM movies_genres r WHERE r.genre = t.id);
DELETE FROM movies_studios t WHERE NOT EXISTS (SELECT 1 FROM movies r WHERE r.id = t.movie);
DELETE FROM studios t WHERE NOT EXISTS (SELECT 1 FROM movies_studios r WHERE r.studio = t.id);
DELETE FROM cast_roles t WHERE NOT EXISTS (SELECT 1 FROM movies r WHERE r.id = t.movie);
DELETE FROM crew_roles t WHERE NOT EXISTS (SELECT 1 FROM movies r WHERE r.id = t.movie);
DELETE FROM people t WHERE
  NOT EXISTS (SELECT 1 FROM cast_roles r WHERE r.person = t.id) AND
  NOT EXISTS (SELECT 1 FROM crew_roles r WHERE r.person = t.id);
DELETE FROM items t WHERE NOT EXISTS (SELECT 1 FROM movies r WHERE r.id = t.movie);
DELETE FROM items t WHERE NOT EXISTS (SELECT 1 FROM stores r WHERE r.id = t.store);
DELETE FROM stores t WHERE NOT EXISTS (SELECT 1 FROM items r WHERE r.store = t.id);
DELETE FROM rentals t WHERE NOT EXISTS (SELECT 1 FROM items r WHERE r.id = t.item);
DELETE FROM customers t WHERE NOT EXISTS (SELECT 1 FROM rentals r WHERE r.customer = t.id);
DELETE FROM emails t WHERE NOT EXISTS (SELECT 1 FROM customers r WHERE r.id = t.customer);
DELETE FROM phones t WHERE NOT EXISTS (SELECT 1 FROM customers r WHERE r.id = t.customer);


ALTER TABLE cast_roles ADD CONSTRAINT cast_roles_movie_fkey
FOREIGN KEY (movie) REFERENCES movies (id);

ALTER TABLE cast_roles ADD CONSTRAINT cast_roles_person_fkey
FOREIGN KEY (person) REFERENCES people (id);

ALTER TABLE crew_roles ADD CONSTRAINT crew_roles_movie_fkey
FOREIGN KEY (movie) REFERENCES movies (id);

ALTER TABLE crew_roles ADD CONSTRAINT crew_roles_person_fkey
FOREIGN KEY (person) REFERENCES people (id);

ALTER TABLE emails ADD CONSTRAINT emails_customer_fkey
FOREIGN KEY (customer) REFERENCES customers (id);

ALTER TABLE emails ADD CONSTRAINT emails_location_type_fkey
FOREIGN KEY (location_type) REFERENCES location_types (id);

ALTER TABLE items ADD CONSTRAINT items_movie_fkey
FOREIGN KEY (movie) REFERENCES movies (id);

ALTER TABLE items ADD CONSTRAINT items_store_fkey
FOREIGN KEY (store) REFERENCES stores (id);

ALTER TABLE movies_genres ADD CONSTRAINT movies_genres_movie_fkey
FOREIGN KEY (movie) REFERENCES movies (id);

ALTER TABLE movies_genres ADD CONSTRAINT movies_genres_genre_fkey
FOREIGN KEY (genre) REFERENCES genres (id);

ALTER TABLE movies_studios ADD CONSTRAINT movies_studios_movie_fkey
FOREIGN KEY (movie) REFERENCES movies (id);

ALTER TABLE movies_studios ADD CONSTRAINT movies_studios_studio_fkey
FOREIGN KEY (studio) REFERENCES studios (id);

ALTER TABLE phones ADD CONSTRAINT phones_customer_fkey
FOREIGN KEY (customer) REFERENCES customers (id);

ALTER TABLE phones ADD CONSTRAINT phones_location_type_fkey
FOREIGN KEY (location_type) REFERENCES location_types (id);

ALTER TABLE rentals ADD CONSTRAINT rentals_customer_fkey
FOREIGN KEY (customer) REFERENCES customers (id);

ALTER TABLE rentals ADD CONSTRAINT rentals_item_fkey
FOREIGN KEY (item) REFERENCES items (id);



