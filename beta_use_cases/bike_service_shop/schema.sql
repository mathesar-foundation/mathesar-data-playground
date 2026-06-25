DROP SCHEMA IF EXISTS "Bike Shop" CASCADE;
CREATE SCHEMA "Bike Shop";
SET search_path = "Bike Shop";

CREATE TABLE "Customers" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT,
  phone TEXT
);

CREATE TABLE "Equipment Types" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL
);

CREATE TABLE "Equipment" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type_id BIGINT REFERENCES "Equipment Types" (id),
  serial_number TEXT NOT NULL UNIQUE,
  notes TEXT
);

CREATE TABLE "Mechanics" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE "Service Statuses" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE "Service Requests" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  customer_id BIGINT REFERENCES "Customers" (id),
  equipment_id BIGINT REFERENCES "Equipment" (id),
  mechanic_id BIGINT REFERENCES "Mechanics" (id),
  request_description TEXT NOT NULL,
  cost NUMERIC(10, 2),
  time_in TIMESTAMP,
  time_out TIMESTAMP
);

CREATE TABLE "Service Milestones" (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  service_request_id BIGINT REFERENCES "Service Requests" (id),
  status_id BIGINT REFERENCES "Service Statuses" (id),
  update_time TIMESTAMP DEFAULT NOW(),
  notes TEXT
);
