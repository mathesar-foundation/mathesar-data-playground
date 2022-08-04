CREATE EXTENSION IF NOT EXISTS btree_gist;
TRUNCATE TABLE "Checkouts";

ALTER TABLE "Checkouts" DROP CONSTRAINT IF EXISTS sim_chck_excl;
ALTER TABLE "Checkouts"
  ADD CONSTRAINT sim_chck_excl
  EXCLUDE USING gist
    ("Item id" WITH =, tsrange("Checkout Time", "Check In Time", '[]') WITH &&) ;

SELECT pg_catalog.setval('"Library Management"."Checkouts_id_seq"', 1, false);

WITH RECURSIVE cg(n, t, itm_id, max_iid, pat_id, max_pid, ret_t) AS (
  SELECT
    1,
    '2022-06-01 10:00'::TIMESTAMP,
    ((MAX("Items".id) - 1) * RANDOM())::INTEGER + 1,
    MAX("Items".id) - 1,
    ((MAX("Patrons".id) - 1) * RANDOM())::INTEGER + 1,
    MAX("Patrons".id) - 1,
    '2022-06-01 10:00'::TIMESTAMP + '2 weeks'::INTERVAL
  FROM "Items", "Patrons"
UNION ALL
  SELECT
    n+1,
    CASE
      WHEN t::TIME<'20:00'::TIME THEN t + RANDOM()*'1 hour'::INTERVAL
      ELSE
        t + RANDOM()*'1 hours'::INTERVAL + '13 hours'::INTERVAL
    END,
    (max_iid*RANDOM())::INTEGER + 1,
    max_iid,
    (max_pid*RANDOM())::INTEGER + 1,
    max_pid,
    t + (RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() - 4)*'1 week'::INTERVAL
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
  FROM cg
ON CONFLICT DO NOTHING
;
