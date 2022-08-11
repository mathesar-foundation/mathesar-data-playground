-- This SQL file simulates checkouts for any library data set conforming to the
-- data model specified in the storyboard.
--
-- There are a number of relevant parameters.
-- In the base term of the RCTE, the datetime sets the start time of the
-- simulation. This datetime occurs twice, and should be the same in both places
-- (though mistakes on this will affect only one entry). It runs until the
-- current real time. The library is assumed to be open from 10am to 8pm, with
-- some fuzziness around the limits, and check outs occur within these hours.
-- We disallow overlapping checkouts for the same item.  For simulating check
-- in, we assume a normal distribution around the due date (2 weeks from check
-- out), 24 hours per day (maybe a drop box).

SET search_path="Library Management";
CREATE EXTENSION IF NOT EXISTS btree_gist;
TRUNCATE TABLE "Checkouts";

ALTER TABLE "Checkouts" DROP CONSTRAINT IF EXISTS sim_chck_excl;
ALTER TABLE "Checkouts"
  ADD CONSTRAINT sim_chck_excl
  EXCLUDE USING gist
    ("Item id" WITH =, tsrange("Checkout Time", "Check In Time", '[]') WITH &&);

SELECT pg_catalog.setval('"Library Management"."Checkouts_id_seq"', 1, false);

WITH RECURSIVE cg(t, itm_id, max_iid, pat_id, max_pid, ret_t) AS (
  SELECT
    '2022-05-01 10:00'::TIMESTAMP,
    ((MAX("Items".id) - 1) * RANDOM())::INTEGER + 1,
    MAX("Items".id) - 1,
    ((MAX("Patrons".id) - 1) * RANDOM())::INTEGER + 1,
    MAX("Patrons".id) - 1,
    '2022-05-01 10:00'::TIMESTAMP + '2 weeks'::INTERVAL
  FROM "Items", "Patrons"
UNION ALL
  SELECT
    t + RANDOM()*'12 hours'::INTERVAL,
    (max_iid*RANDOM())::INTEGER + 1,
    max_iid,
    (max_pid*RANDOM())::INTEGER + 1,
    max_pid,
    t + (RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() - 4)*'2 weeks'::INTERVAL
      + '2 weeks'::INTERVAL
  FROM cg where t < NOW()
)
INSERT INTO "Checkouts" ("Item id", "Patron id", "Checkout Time", "Due Date", "Check In Time")
  SELECT
    itm_id,
    pat_id,
    t,
    t + '2 weeks'::INTERVAL,
    CASE
      WHEN ret_t > t AND ret_t <= NOW() THEN ret_t
      ELSE null
    END
  FROM cg INNER JOIN "Items" ON (cg.itm_id = "Items".id)
    WHERE cg.t > "Items"."Acquisition Date"
      AND cg.t::TIME BETWEEN '10:00' AND '20:00'
      AND date_part('dow', cg.t) NOT IN (0, 6)
  ORDER BY t
ON CONFLICT DO NOTHING
;
ALTER TABLE "Checkouts" DROP CONSTRAINT IF EXISTS sim_chck_excl;
