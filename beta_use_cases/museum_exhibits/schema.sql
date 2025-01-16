DROP SCHEMA IF EXISTS "Museum Exhibits" CASCADE;
CREATE SCHEMA "Museum Exhibits";
SET search_path = "Museum Exhibits";

CREATE TABLE "Acquisition Types" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type_name TEXT NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE "Collections" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE "Locations" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  address TEXT
);

CREATE TABLE "Exhibits" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  location_id BIGINT NOT NULL REFERENCES "Locations" (id),
  featured BOOLEAN DEFAULT FALSE,
  description TEXT
);

CREATE TABLE "Items" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  serial_number TEXT NOT NULL UNIQUE,
  acquisition_date DATE NOT NULL,
  acquisition_type_id BIGINT NOT NULL REFERENCES "Acquisition Types" (id),
  exhibit_id BIGINT REFERENCES "Exhibits" (id)
);

CREATE TABLE "Item_Collections" (
  item_id BIGINT NOT NULL REFERENCES "Items" (id) ON DELETE CASCADE,
  collection_id BIGINT NOT NULL REFERENCES "Collections" (id) ON DELETE CASCADE,
  PRIMARY KEY (item_id, collection_id)
);
