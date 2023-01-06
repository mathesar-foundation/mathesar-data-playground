DROP SCHEMA IF EXISTS "Library Management" CASCADE;
CREATE SCHEMA "Library Management";
SET search_path="Library Management";

CREATE TABLE real_books_sim (
  "id" SERIAL PRIMARY KEY,
  "Title" text,
  "Author Last Name" text,
  "Author First Name" text,
  "Author Website" mathesar_types.uri,
  "Publisher" text,
  "Publication Year" integer,
  "Media" text,
  "Weight" text,
  "Height" text,
  "Thickness" text,
  "Length" text,
  "Page Count" integer,
  "Languages" text,
  "LC Classification" text,
  "ISBN" text,
  "Dewey Decimal" text,
  "Dewey Wording" text
);

CREATE TABLE "Patrons" (
  id SERIAL PRIMARY KEY, "First Name" TEXT, "Last Name" TEXT, "Email" mathesar_types.email
);
