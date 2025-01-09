DROP SCHEMA IF EXISTS "Museum Exhibits" CASCADE;
CREATE SCHEMA "Museum Exhibits";
SET search_path = "Museum Exhibits";


create table "Acquisition Types" (
  id bigint primary key generated always as identity,
  type_name text not null unique,
  description text
);

create table "Collections" (
  id bigint primary key generated always as identity,
  name text not null,
  description text
);

create table "Locations" (
  id bigint primary key generated always as identity,
  name text not null,
  address text
);

create table "Exhibits" (
  id bigint primary key generated always as identity,
  name text not null,
  start_date date not null,
  end_date date,
  location_id bigint not null references "Locations" (id),
  featured boolean default false,
  description text
);

create table "Items" (
  id bigint primary key generated always as identity,
  name text not null,
  serial_number text not null unique,
  acquisition_date date not null,
  acquisition_type_id bigint not null references "Acquisition Types" (id),
  collection_id bigint not null references "Collections" (id),
  exhibit_id bigint references "Exhibits" (id)
);
