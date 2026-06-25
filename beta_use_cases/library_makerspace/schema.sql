DROP SCHEMA IF EXISTS "Library Makerspace" CASCADE;
CREATE SCHEMA "Library Makerspace";
SET search_path = "Library Makerspace";

CREATE TABLE "Equipment Statuses" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE "Job Statuses" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE "Equipment Types" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE "Equipment" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  location TEXT,
  status_id BIGINT REFERENCES "Equipment Statuses" (id) ON DELETE CASCADE,
  type_id BIGINT REFERENCES "Equipment Types" (id) ON DELETE CASCADE
);

CREATE TABLE "Patrons" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL
);

CREATE TABLE "Jobs" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  equipment_id BIGINT REFERENCES "Equipment" (id) ON DELETE CASCADE,
  patron_id BIGINT REFERENCES "Patrons" (id) ON DELETE CASCADE,
  status_id BIGINT REFERENCES "Job Statuses" (id) ON DELETE CASCADE,
  queue_order INT NOT NULL,
  requested_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  job_start TIMESTAMP WITH TIME ZONE,
  job_end TIMESTAMP WITH TIME ZONE
);

CREATE TABLE "Category Statuses" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type_id BIGINT REFERENCES "Equipment Types" (id) ON DELETE CASCADE,
  status_name TEXT NOT NULL,
  UNIQUE (type_id, status_name)
);

CREATE TABLE "Equipment Training" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  patron_id BIGINT REFERENCES "Patrons" (id) ON DELETE CASCADE,
  equipment_id BIGINT REFERENCES "Equipment" (id) ON DELETE CASCADE,
  trained_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE (patron_id, equipment_id)
);

CREATE OR REPLACE FUNCTION check_training()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if the patron is trained for the equipment
    IF NOT EXISTS (
        SELECT 1
        FROM "Equipment Training"
        WHERE "Equipment Training".patron_id = NEW.patron_id
          AND "Equipment Training".equipment_id = NEW.equipment_id
    ) THEN
        RAISE EXCEPTION 'Patron % is not trained on equipment %', NEW.patron_id, NEW.equipment_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_training
BEFORE INSERT OR UPDATE ON "Jobs"
FOR EACH ROW
EXECUTE FUNCTION check_training();
