DROP TABLE IF EXISTS patrons_sim CASCADE;
DROP TABLE IF EXISTS books_sim CASCADE;

CREATE TABLE books_sim (
    id integer NOT NULL,
    title text,
    isbn text,
    author_first_name text,
    author_last_name text,
    author_website mathesar_types.uri,
    publisher text,
    publication_year numeric,
    acquisition_date date,
    acquisition_price mathesar_types.mathesar_money
);

CREATE SEQUENCE books_sim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE books_sim_id_seq OWNED BY books_sim.id;

CREATE TABLE patrons_sim (
    id integer NOT NULL,
    first_name text,
    last_name text,
    email mathesar_types.email
);

CREATE SEQUENCE patrons_sim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE patrons_sim_id_seq OWNED BY patrons_sim.id;

ALTER TABLE ONLY books_sim ALTER COLUMN id SET DEFAULT nextval('books_sim_id_seq'::regclass);

ALTER TABLE ONLY patrons_sim ALTER COLUMN id SET DEFAULT nextval('patrons_sim_id_seq'::regclass);

COPY books_sim (id, title, isbn, author_first_name, author_last_name, author_website, publisher, publication_year, acquisition_date, acquisition_price) FROM stdin;
1	Training Up Wall Everything	1-367-95276-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1949	1976-05-20	7.03
2	Training Up Wall Everything	1-367-95276-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1949	2000-05-26	9.67
3	Training Up Wall Everything	1-367-95276-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1949	1975-07-29	2.49
4	Training Up Wall Everything	1-367-95276-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1949	1995-05-11	12.52
5	Safe Tree Over Face Officer	1-253-92768-5	Kimberly	Johnson	https://kimberlyjohnson.net	Rocha PLC	1908	1978-11-18	10.99
6	Safe Tree Over Face Officer	1-253-92768-5	Kimberly	Johnson	https://kimberlyjohnson.net	Rocha PLC	1908	2018-03-25	10.93
7	Land Character Wear Data	1-938919-35-1	Jennifer	Newman	\N	Rocha PLC	1962	1962-12-04	10.60
8	Land Character Wear Data	1-76302-814-3	Jennifer	Newman	\N	Rocha PLC	1975	1976-03-20	3.18
9	Land Character Wear Data	1-76302-814-3	Jennifer	Newman	\N	Rocha PLC	1975	1996-11-20	12.24
10	Member Student Girl Two	0-7500-7373-X	Jose	Munoz	https://munoz.com	Rocha PLC	2006	2014-09-01	8.47
11	Hair Wish With Plant Record	1-903291-27-5	Anthony	Herrera	\N	Rocha PLC	1957	2002-01-16	3.23
12	Hair Wish With Plant Record	1-903291-27-5	Anthony	Herrera	\N	Rocha PLC	1957	1991-01-23	2.03
13	Take Black Issue Physical	0-454-84942-7	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1925	1955-01-24	7.29
14	Take Black Issue Physical	0-454-84942-7	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1925	2004-03-08	0.18
15	Space Music Rest Crime	0-358-39621-2	Melissa	Harris	http://harris.info	Wright LLC	1933	2006-12-16	8.14
16	Space Music Rest Crime	0-358-39621-2	Melissa	Harris	http://harris.info	Wright LLC	1933	1966-01-22	12.17
17	Space Music Rest Crime	0-86272-328-0	Melissa	Harris	http://harris.info	Wright LLC	1964	1987-06-14	0.46
18	Run Perhaps Company Think	0-567-08852-9	Jennifer	Newman	\N	Wright LLC	1906	1975-08-09	13.85
19	Cut Probably Member During	0-327-46240-X	Sean	Robinson	https://seanrobinson.com	Stokes, Campos and Rich	1972	1984-11-04	1.75
20	Cut Probably Member During	0-327-46240-X	Sean	Robinson	https://seanrobinson.com	Stokes, Campos and Rich	1972	1978-01-19	3.88
21	Edge Throw Tonight Ahead	1-4956-2122-7	Vincent	Edwards	https://edwards.info	Rocha PLC	1917	1929-07-29	8.26
22	Of Fish While Future Believe	1-957562-64-1	Bonnie	Evans	https://bonnieevans.com	Rocha PLC	1965	1998-09-07	12.01
23	Economic Real Return Street	1-76660-210-X	Zachary	Medina	\N	Rocha PLC	1965	1971-09-09	1.31
24	In Play Player	0-586-20042-8	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2000	2016-03-24	14.59
25	In Play Player	0-586-20042-8	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2000	2012-04-16	3.36
26	Similar Expert Per Rock	1-909102-61-X	Sean	Robinson	https://seanrobinson.com	Rocha PLC	2010	2020-12-02	10.83
27	Similar Expert Per Rock	1-909102-61-X	Sean	Robinson	https://seanrobinson.com	Rocha PLC	2010	2018-02-06	9.60
28	Similar Expert Per Rock	1-909102-61-X	Sean	Robinson	https://seanrobinson.com	Rocha PLC	2010	2019-10-17	14.32
29	Similar Expert Per Rock	1-909102-61-X	Sean	Robinson	https://seanrobinson.com	Rocha PLC	2010	2015-05-25	4.02
30	Similar Expert Per Rock	1-909102-61-X	Sean	Robinson	https://seanrobinson.com	Rocha PLC	2010	2015-02-09	6.41
31	Economic Too Level	0-237-81994-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1952	1985-01-04	2.06
32	Economic Too Level	0-237-81994-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1952	2012-08-14	7.77
33	People Forward Week He	1-57907-875-3	Kimberly	Johnson	https://kimberlyjohnson.net	Rocha PLC	1952	1977-01-31	13.57
34	People Forward Week He	1-57907-875-3	Kimberly	Johnson	https://kimberlyjohnson.net	Rocha PLC	1952	1959-11-01	10.55
35	Industry Yet Director Future	1-891871-35-8	Vincent	Edwards	https://edwards.info	Rocha PLC	1936	1948-12-26	7.45
36	Industry Yet Director Future	1-891871-35-8	Vincent	Edwards	https://edwards.info	Rocha PLC	1936	1962-06-08	10.39
37	Mention Add Size City Kid	1-72019-089-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2013	2014-12-27	9.23
38	Mention Add Size City Kid	1-72019-089-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2013	2021-09-09	10.27
39	Mention Add Size City Kid	1-72019-089-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2013	2013-10-01	12.78
40	Mention Add Size City Kid	1-72019-089-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2013	2014-05-16	10.82
41	Mention Add Size City Kid	1-72019-089-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2013	2021-12-13	12.35
42	Mention Add Size City Kid	0-412-00241-8	Jennifer	Castillo	https://jennifercastillo.com	Wright LLC	2019	2022-04-28	2.11
43	Mention Add Size City Kid	0-438-20690-8	Jennifer	Castillo	https://jennifercastillo.com	Wright LLC	2019	2021-11-13	2.77
44	Agree Beyond Artist Size	0-262-17066-3	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1928	2022-05-02	0.59
45	Agree Beyond Artist Size	0-489-53721-9	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1931	1961-04-15	6.09
46	I Worker Suffer Likely	1-5243-9118-2	Vincent	Edwards	https://edwards.info	Rocha PLC	1900	1992-01-30	1.12
47	Day Beyond Property	0-05-000136-1	Jennifer	Castillo	https://jennifercastillo.com	Wright LLC	2007	2020-08-22	4.80
48	Military Myself Sport Wrong	1-373-47086-0	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1958	2017-06-15	8.25
49	Military Myself Sport Wrong	1-4395-1864-5	Jennifer	Castillo	https://jennifercastillo.com	Stokes, Campos and Rich	2003	2015-11-28	12.79
50	Military Myself Sport Wrong	1-4395-1864-5	Jennifer	Castillo	https://jennifercastillo.com	Stokes, Campos and Rich	2003	2010-10-22	13.96
51	Military Myself Sport Wrong	1-4395-1864-5	Jennifer	Castillo	https://jennifercastillo.com	Stokes, Campos and Rich	2003	2019-02-10	12.98
52	Way Trade Sea	1-80236-999-6	Melissa	Harris	http://harris.info	Wright LLC	1933	1934-01-24	1.03
53	Him Let After Mrs Coach	0-942287-33-9	Anthony	Herrera	\N	Stokes, Campos and Rich	1994	2000-12-20	5.29
54	Real Would Anyone	1-7326369-4-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1954	2004-03-09	5.14
55	Real Would Anyone	0-05-930457-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1985	1997-01-18	11.83
56	Real Would Anyone	0-05-930457-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1985	1999-12-29	8.31
57	Real Would Anyone	0-05-930457-X	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1985	2004-02-14	9.27
58	Real Would Anyone	1-57173-762-6	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2015	2015-06-23	6.63
59	Real Would Anyone	1-57173-762-6	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	2015	2020-08-26	13.27
60	Top Time Agreement Support	0-341-80937-3	Zachary	Medina	\N	Rocha PLC	1900	2007-10-21	14.36
61	Hand Raise Son Probably Do	0-85808-026-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1920	1929-04-02	3.62
62	Hand Raise Son Probably Do	0-85808-026-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1920	1924-11-17	10.78
63	Hand Raise Son Probably Do	0-85808-026-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1920	1993-10-24	9.77
64	Hand Raise Son Probably Do	0-85808-026-5	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1920	2020-04-28	5.45
65	Hand Raise Son Probably Do	1-149-58278-2	Jennifer	Castillo	https://jennifercastillo.com	Rocha PLC	1938	1985-06-15	9.55
66	Claim Student Use Long Blood	0-10-580468-1	Vincent	Edwards	https://edwards.info	Rocha PLC	1906	2004-08-31	11.05
67	Claim Student Use Long Blood	0-10-580468-1	Vincent	Edwards	https://edwards.info	Rocha PLC	1906	1915-01-29	14.94
68	Thus Listen Scene Positive	0-376-64561-X	Raymond	Diaz	https://diaz.net	Rocha PLC	1992	2015-09-29	12.39
69	Stage Argue Court Film	0-518-77297-7	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1982	1985-12-14	7.85
70	Stage Argue Court Film	0-518-77297-7	Hannah	Jensen	http://hannahjensen.org	Rocha PLC	1982	2009-05-09	9.22
71	Wish Gun Specific Rate On	0-379-53048-1	Rose	Dunlap	https://dunlap.com	Rocha PLC	1994	2005-08-28	13.34
72	Full Field Despite Music	1-352-26248-7	Melissa	Harris	http://harris.info	Rocha PLC	2003	2011-03-26	4.28
73	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2018-07-08	3.09
74	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2011-08-30	13.06
75	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2006-10-15	11.77
76	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2010-04-21	3.73
77	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2005-01-22	9.60
78	Full Field Despite Music	0-638-82929-1	Melissa	Harris	http://harris.info	Rocha PLC	2005	2005-10-22	3.76
79	Rock Unit Up Explain	0-88903-678-0	Jennifer	Newman	\N	Stokes, Campos and Rich	1975	2008-10-29	7.21
80	Too Marriage Listen	0-672-25434-4	Anthony	Herrera	\N	Stokes, Campos and Rich	1900	2009-09-18	6.03
81	Around Process Course	1-01-810638-3	Vincent	Edwards	https://edwards.info	Rocha PLC	1988	1994-03-11	3.89
82	Star Move Song	1-104-30801-0	Jennifer	Newman	\N	Rocha PLC	1968	1971-12-26	7.72
83	Music Since Market Family	0-693-69318-5	Anthony	Herrera	\N	Rocha PLC	1933	2011-10-22	1.88
84	Music Since Market Family	0-693-69318-5	Anthony	Herrera	\N	Rocha PLC	1933	2016-10-12	5.57
85	Music Since Market Family	0-693-69318-5	Anthony	Herrera	\N	Rocha PLC	1933	1951-01-07	13.37
86	Music Since Market Family	0-693-69318-5	Anthony	Herrera	\N	Rocha PLC	1933	2017-10-23	10.81
87	Hour Sometimes Lot Number	0-546-24462-9	Melissa	Harris	http://harris.info	Rocha PLC	1918	2001-07-31	14.76
88	Hour Sometimes Lot Number	0-546-24462-9	Melissa	Harris	http://harris.info	Rocha PLC	1918	1967-05-07	8.91
89	Hour Sometimes Lot Number	0-546-24462-9	Melissa	Harris	http://harris.info	Rocha PLC	1918	2007-08-02	12.06
90	Hour Sometimes Lot Number	1-113-76756-1	Melissa	Harris	http://harris.info	Stokes, Campos and Rich	1944	1949-02-17	4.69
91	Hour Sometimes Lot Number	1-113-76756-1	Melissa	Harris	http://harris.info	Stokes, Campos and Rich	1944	1991-02-06	14.48
92	Toward Apply Drive	1-68751-170-5	Jennifer	Castillo	https://jennifercastillo.com	Stokes, Campos and Rich	2016	2021-06-08	3.23
93	Pass Street Year	1-01-127740-9	Rose	Dunlap	https://dunlap.com	Rocha PLC	1932	1990-08-16	2.73
94	Pass Street Year	1-01-127740-9	Rose	Dunlap	https://dunlap.com	Rocha PLC	1932	1938-04-02	10.10
95	Head Mr Majority Claim Phone	0-613-92702-8	Raymond	Diaz	https://diaz.net	Stokes, Campos and Rich	2018	2021-02-07	0.16
96	Head Mr Majority Claim Phone	0-613-92702-8	Raymond	Diaz	https://diaz.net	Stokes, Campos and Rich	2018	2021-01-28	5.28
97	South Nice Service Parent	1-992273-43-X	Rose	Dunlap	https://dunlap.com	Rocha PLC	2006	2009-08-03	6.97
98	South Nice Service Parent	1-992273-43-X	Rose	Dunlap	https://dunlap.com	Rocha PLC	2006	2013-08-14	13.75
99	South Nice Service Parent	0-7626-9346-0	Rose	Dunlap	https://dunlap.com	Rocha PLC	2010	2015-06-04	5.74
100	South Nice Service Parent	0-7626-9346-0	Rose	Dunlap	https://dunlap.com	Rocha PLC	2010	2010-01-26	13.08
101	South Nice Service Parent	0-7626-9346-0	Rose	Dunlap	https://dunlap.com	Rocha PLC	2010	2012-02-23	6.66
102	But Read Best	0-17-619869-5	Jennifer	Castillo	https://jennifercastillo.com	Stokes, Campos and Rich	1927	1995-02-03	0.10
103	Us Son Threat Girl	0-358-81989-X	Jose	Munoz	https://munoz.com	Rocha PLC	1959	2000-10-14	1.69
104	Bar Order Might Per	1-951979-00-1	Melissa	Harris	http://harris.info	Rocha PLC	1919	2010-07-09	4.66
105	Bar Order Might Per	1-951979-00-1	Melissa	Harris	http://harris.info	Rocha PLC	1919	2008-10-29	13.43
106	Bar Order Might Per	1-07-390158-0	Melissa	Harris	http://harris.info	Wright LLC	1989	2014-03-21	13.55
107	Bar Order Might Per	1-07-390158-0	Melissa	Harris	http://harris.info	Wright LLC	1989	1990-09-16	11.42
108	Bar Order Might Per	1-61274-202-5	Melissa	Harris	http://harris.info	Wright LLC	1991	2008-01-30	12.08
109	Bar Order Might Per	1-350-61945-0	Melissa	Harris	http://harris.info	Rocha PLC	1994	2011-04-11	10.75
110	On Letter Experience	0-13-716532-3	Catherine	Edwards	https://catherineedwards.com	Rocha PLC	1918	2021-07-26	3.17
111	Land Possible Else Week	0-945973-59-4	Melissa	Harris	http://harris.info	Rocha PLC	1946	2003-11-09	6.38
112	Hundred Former Expect	0-7058-7216-5	Zachary	Medina	\N	Rocha PLC	1997	2007-01-09	2.08
113	Hundred Former Expect	0-7058-7216-5	Zachary	Medina	\N	Rocha PLC	1997	2021-09-15	12.53
114	Hundred Former Expect	0-7058-7216-5	Zachary	Medina	\N	Rocha PLC	1997	2010-04-02	4.52
115	Step Staff Significant Hot	0-9587449-9-8	Catherine	Edwards	https://catherineedwards.com	Rocha PLC	1973	2021-06-24	14.18
116	Truth Head Bank Lay	0-7622-9704-2	Raymond	Diaz	https://diaz.net	Wright LLC	2009	2020-11-23	12.87
117	Truth Head Bank Lay	0-7622-9704-2	Raymond	Diaz	https://diaz.net	Wright LLC	2009	2012-01-08	2.09
\.

COPY patrons_sim (id, first_name, last_name, email) FROM stdin;
1	Barry	Huff	b.huff@haney.com
2	Harry	Hall	harry.h5@beck.net
3	Walter	Manning	waltermanning@freeman.com
4	Lori	Stevens	l.stevens@lopez.com
5	Laura	Soto	lauras@hurley.com
6	Calvin	Curtis	c.curtis12@brown.com
7	Yvonne	Ho	y.ho@johnson.info
8	Toni	Evans	tevans46@thompson.net
9	Connor	Taylor	c.taylor@miller.org
10	Kristen	Wright	kwright@odonnell.com
11	Jennifer	Walters	jenniferw20@morrison-patton.com
12	Benjamin	Watson	b.watson33@bell-beard.biz
13	Kathy	Butler	kathyb@le.org
14	Jason	Peterson	jpeterson11@williams.com
15	Traci	Hamilton	thamilton76@smith.net
16	Jason	Griffin	jasongriffin@wilkinson.com
17	Rita	Brown	ritab@powell.com
18	Deanna	Shepherd	deanna.s54@cook.org
19	Nicole	Jones	nicole.jones66@dixon.org
20	Jesse	Fischer	jessef88@stewart.com
21	Tyler	Gonzalez	t.gonzalez@washington.com
22	Mary	Knox	mknox45@fletcher-rodriguez.net
23	Eduardo	Rojas	eduardorojas13@peterson-curry.com
24	Joshua	Hooper	jhooper@bowers.com
25	Autumn	Harrington	autumn.h19@mathews.com
26	Heather	Wheeler	heatherwheeler@peterson-delgado.com
27	Andrew	Vaughan	a.vaughan@roy.com
28	Luke	Vang	luke.vang46@palmer.com
29	Patrick	Shepherd	pshepherd13@white-bradford.info
30	Alexander	Phillips	alexander.phillips38@alvarez.com
\.

SELECT pg_catalog.setval('books_sim_id_seq', 117, true);

SELECT pg_catalog.setval('patrons_sim_id_seq', 30, true);

ALTER TABLE ONLY books_sim
    ADD CONSTRAINT books_sim_pkey PRIMARY KEY (id);

ALTER TABLE ONLY patrons_sim
    ADD CONSTRAINT patrons_sim_pkey PRIMARY KEY (id);
