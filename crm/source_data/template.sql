drop schema if exists "CRM" cascade;
create schema "CRM";
set search_path="CRM";

create table contact (
  id serial primary key,
  full_name text,
  informal_name text,
  notes text
);
comment on column contact.informal_name is 'How we refer to the person in conversation, e.g. the person''s first name or nickname';

create table tag (
  id serial primary key,
  label text not null unique
);

create table contact_tag (
  id serial primary key,
  contact integer not null,
  tag integer not null,
  unique (contact, tag),
  foreign key (contact) references contact (id),
  foreign key (tag) references tag (id)
);

create table email (
  id serial primary key,
  contact integer not null,
  address text not null,
  is_primary boolean not null default true,
  source text,
  foreign key (contact) references contact (id)
);
comment on column email.source is 'Where we obtained the email address from';

create table website_type (
  id serial primary key,
  label text not null unique
);

create table website (
  id serial primary key,
  contact integer not null,
  url text,
  type integer not null,
  foreign key (contact) references contact (id),
  foreign key (type) references website_type (id)
);

create table interaction (
  id serial primary key,
  contact integer not null,
  datetime timestamp not null default now(),
  subject text,
  body text,
  foreign key (contact) references contact (id)
);

copy contact from stdin;
__CONTACT_TSV_DATA__
\.

copy email from stdin;
__EMAIL_TSV_DATA__
\.

copy website_type from stdin;
__WEBSITE_TYPE_TSV_DATA__
\.

copy website from stdin;
__WEBSITE_TSV_DATA__
\.

copy interaction from stdin;
__INTERACTION_TSV_DATA__
\.

copy tag from stdin;
__TAG_TSV_DATA__
\.

copy contact_tag from stdin;
__CONTACT_TAG_TSV_DATA__
\.

SELECT setval( pg_get_serial_sequence('contact', 'id'), (select max(id) + 1 from contact), false );
SELECT setval( pg_get_serial_sequence('email', 'id'), (select max(id) + 1 from email), false );
SELECT setval( pg_get_serial_sequence('website_type', 'id'), (select max(id) + 1 from website_type), false );
SELECT setval( pg_get_serial_sequence('website', 'id'), (select max(id) + 1 from website), false );
SELECT setval( pg_get_serial_sequence('interaction', 'id'), (select max(id) + 1 from interaction), false );
SELECT setval( pg_get_serial_sequence('tag', 'id'), (select max(id) + 1 from tag), false );
SELECT setval( pg_get_serial_sequence('contact_tag', 'id'), (select max(id) + 1 from contact_tag), false );

