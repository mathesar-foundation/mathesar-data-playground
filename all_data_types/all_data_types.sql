drop table if exists "all_types";
create table "all_types" (
  "id" serial not null,
  "text" text,
  "number" integer,
  "money" mathesar_types.mathesar_money,
  "boolean" boolean,
  "date" date,
  "date_time" timestamp,
  "time" time,
  "duration" interval,
  "email" mathesar_types.email,
  "uri" mathesar_types.uri,
  constraint "all_types_id" primary key ("id")
);

insert into all_types ("text") values
( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ),
( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ), ( NULL ),
( NULL ), ( NULL ), ( NULL ), ( NULL );

update all_types set "text" = v.v
from (values
  (1  , 'Lorem'),
  (2  , 'ipsum'),
  (3  , 'Dolor sit amet'),
  (4  , 'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'),
  (5  , 'Sed ut perspiciatis'),
  (6  , 'Unde'),
  (7  , NULL),
  (8  , 'Omnis iste natus error sit voluptatem accusantium'),
  (9  , 'Lorem ipsum'),
  (10 , 'dolor sit amet'),
  (11 , 'Lorem'),
  (12 , 'Ut enim ad minima veniam'),
  (13 , 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium'),
  (14 , 'Deleniti atque corrupti quos'),
  (15 , 'Culpa qui officia deserunt mollitia animi'),
  (16 , 'Nam libero tempore, cum soluta nobis est'),
  (17 , 'Maxime placeat facere possimus'),
  (18 , 'Tenetur a sapiente'),
  (19 , 'Autem vel lorem ipsum'),
  (20 , 'Rerum facilis')
) as v(id, v)
where v.id = all_types.id;


update all_types set "number" = v.v
from (values
  (1  , 87),
  (2  , -1),
  (3  , 128763276),
  (4  , 4),
  (5  , 1234),
  (6  , 123),
  (7  , 1009),
  (8  , NULL),
  (9  , -18712),
  (10 , 7617),
  (11 , 155),
  (12 , 8781),
  (13 , 5471),
  (14 , 1),
  (15 , 229),
  (16 , 15778),
  (17 , 25781),
  (18 , 72),
  (19 , 6),
  (20 , -18)
) as v(id, v)
where v.id = all_types.id;

update all_types set "money" = v.v
from (values
  (1  , 0.7),
  (2  , 981.24),
  (3  , NULL),
  (4  , 0),
  (5  , -17.99),
  (6  , 18.01),
  (7  , -8),
  (8  , 1),
  (9  , 12372187),
  (10 , 1271.08),
  (11 , -1238762.16),
  (12 , 0.27),
  (13 , -0.25),
  (14 , 76),
  (15 , 917.3),
  (16 , 1876.45),
  (17 , 515),
  (18 , 917.25),
  (19 , 25.18),
  (20 , 4)
) as v(id, v)
where v.id = all_types.id;

update all_types set "boolean" = v.v
from (values
  (1  , true),
  (2  , false),
  (3  , true),
  (4  , false),
  (5  , true),
  (6  , true),
  (7  , true),
  (8  , false),
  (9  , true),
  (10 , false),
  (11 , true),
  (12 , true),
  (13 , NULL),
  (14 , true),
  (15 , true),
  (16 , false),
  (17 , true),
  (18 , true),
  (19 , false),
  (20 , false)
) as v(id, v)
where v.id = all_types.id;

update all_types set "date" = v.v
from (values
  (1  , '1960-07-24'::date),
  (2  , '2046-06-19'::date),
  (3  , '1946-04-26'::date),
  (4  , '2025-04-15'::date),
  (5  , '1899-01-14'::date),
  (6  , '1983-07-19'::date),
  (7  , '1897-04-10'::date),
  (8  , '1932-09-29'::date),
  (9  , '1962-03-16'::date),
  (10 , '1935-05-08'::date),
  (11 , '2050-04-28'::date),
  (12 , '1918-05-27'::date),
  (13 , '2001-02-23'::date),
  (14 , '1951-12-17'::date),
  (15 , '1963-04-28'::date),
  (16 , '2044-01-10'::date),
  (17 , NULL),
  (18 , '1906-03-30'::date),
  (19 , '2016-02-26'::date),
  (20 , '1888-06-08'::date)
) as v(id, v)
where v.id = all_types.id;

update all_types set "date_time" = v.v
from (values
  (1  , '2014-04-21T17:30:44'::timestamp),
  (2  , '1925-11-12T16:21:01'::timestamp),
  (3  , '1950-07-29T23:54:39'::timestamp),
  (4  , '1965-08-24T19:25:50'::timestamp),
  (5  , '2045-03-15T05:45:13'::timestamp),
  (6  , '2005-10-21T03:43:04'::timestamp),
  (7  , '2001-01-26T02:58:18'::timestamp),
  (8  , '1945-04-15T20:53:19'::timestamp),
  (9  , '1893-11-22T15:05:11'::timestamp),
  (10 , NULL),
  (11 , '1955-06-21T18:13:15'::timestamp),
  (12 , '1914-11-15T08:27:55'::timestamp),
  (13 , '2020-12-22T05:01:03'::timestamp),
  (14 , '1957-08-27T07:14:27'::timestamp),
  (15 , '1883-08-18T15:37:52'::timestamp),
  (16 , '2037-05-23T15:35:04'::timestamp),
  (17 , '1896-12-06T21:42:30'::timestamp),
  (18 , '1907-10-15T13:18:05'::timestamp),
  (19 , '1981-09-24T18:14:16'::timestamp),
  (20 , '1901-01-30T23:39:04'::timestamp)
) as v(id, v)
where v.id = all_types.id;

update all_types set "time" = v.v
from (values
  (1  , '05:44:25'::time),
  (2  , NULL),
  (3  , '22:09:31'::time),
  (4  , '09:57:22'::time),
  (5  , '11:29:42'::time),
  (6  , '22:17:54'::time),
  (7  , '22:34:54'::time),
  (8  , '22:50:33'::time),
  (9  , '01:52:33'::time),
  (10 , '03:13:18'::time),
  (11 , '17:56:16'::time),
  (12 , '16:16:55'::time),
  (13 , '10:20:54'::time),
  (14 , '13:36:23'::time),
  (15 , '19:23:59'::time),
  (16 , '08:45:36'::time),
  (17 , '18:36:22'::time),
  (18 , '15:21:18'::time),
  (19 , '15:09:55'::time),
  (20 , '07:43:34'::time)
) as v(id, v)
where v.id = all_types.id;

update all_types set "duration" = v.v
from (values
  (1  , '2800539 seconds'::interval),
  (2  , '614820 seconds'::interval),
  (3  , '0 seconds'::interval),
  (4  , '7555366 hours'::interval),
  (5  , '4002 years 2 months'::interval),
  (6  , '1 seconds'::interval),
  (7  , '-6066349 seconds'::interval),
  (8  , '850646 seconds'::interval),
  (9  , '2 minutes'::interval),
  (10 , '2489664 seconds'::interval),
  (11 , '50 days'::interval),
  (12 , '232540 seconds'::interval),
  (13 , '-1 seconds'::interval),
  (14 , '-7151712 seconds'::interval),
  (15 , 'P1Y2M3DT4H5M6S'::interval),
  (16 , '745 seconds'::interval),
  (17 , NULL),
  (18 , '49045 seconds'::interval),
  (19 , '9121553 seconds'::interval),
  (20 , '67964 seconds'::interval)
) as v(id, v)
where v.id = all_types.id;

update all_types set "email" = v.v
from (values
  (1  , 'b.huff@haney.com'),
  (2  , 'harry.h5@beck.net'),
  (3  , 'waltermanning@freeman.com'),
  (4  , 'l.stevens@lopez.com'),
  (5  , 'lauras@hurley.com'),
  (6  , 'c.curtis12@brown.com'),
  (7  , 'y.ho@johnson.info'),
  (8  , 'tevans46@thompson.net'),
  (9  , 'c.taylor@miller.org'),
  (10 , 'kwright@odonnell.com'),
  (11 , 'jenniferw20@morrison-patton.com'),
  (12 , 'b.watson33@bell-beard.biz'),
  (13 , 'kathyb@le.org'),
  (14 , 'jpeterson11@williams.com'),
  (15 , 'thamilton76@smith.net'),
  (16 , 'jasongriffin@wilkinson.com'),
  (17 , 'ritab@powell.com'),
  (18 , 'deanna.s54@cook.org'),
  (19 , NULL),
  (20 , 'jessef88@stewart.com')
) as v(id, v)
where v.id = all_types.id;

update all_types set "uri" = v.v
from (values
  (1  , 'http://harris.info'),
  (2  , 'https://diaz.net'),
  (3  , 'https://edwards.info'),
  (4  , 'https://jennifercastillo.com'),
  (5  , 'https://catherineedwards.com'),
  (6  , 'https://seanrobinson.com'),
  (7  , 'http://hannahjensen.org'),
  (8  , 'https://dunlap.com'),
  (9  , 'https://munoz.com'),
  (10 , NULL),
  (11 , 'https://bonnieevans.com'),
  (12 , 'https://example.net'),
  (13 , 'https://example.com'),
  (14 , 'https://my.biz'),
  (15 , 'https://example.org'),
  (16 , 'https://example.nz.co'),
  (17 , 'https://foo.coop'),
  (18 , 'https://a.tech'),
  (19 , 'https://notsosureaboutthis.ai'),
  (20 , 'https://really.io')
) as v(id, v)
where v.id = all_types.id;
 
 

