SET search_path="Hardware Store";

COPY "Store Locations" FROM stdin;
1	Trevino Group	71605 Andrews Parks Suite 687 Brandonstad, PA 99796
2	Brewer Inc	02266 Cherry Locks Suite 010 Bartonport, MT 94578
3	Sanders-King	6995 Petty Wall Lake Tiffany, IL 62558
4	Mercado, Rogers and Brown	225 Day Junction West Breannaberg, PA 88210
5	Price-Nichols	96728 Katie Heights West Brian, MD 51538
\.

COPY "Customers" FROM stdin;
1	Ashley	Ward	scott22@example.net	+1-459-556-9681x0513	6063 Gregory Hills Suite 535 Acostastad, FM 71631
2	Dustin	Caldwell	cortezkaren@example.com	001-834-270-6744x842	0007 Amber Common East Corey, MA 59143
3	Gabrielle	Baker	sarah33@example.com	001-990-383-2710x67743	06813 Allen Motorway Suite 843 New Alicia, OR 46076
4	Erik	Peterson	cohenchad@example.net	(366)572-8254x71350	7671 Katherine Forge Frankshire, MD 07599
5	Kevin	Evans	jasonbarnett@example.com	(466)305-9881	46125 Jeffrey Gateway Suite 565 West Thomasbury, ID 24569
6	John	Webb	johnsonlori@example.org	(737)710-3216x46641	1940 King Unions Suite 415 Whiteland, TX 68939
7	Peter	Merritt	edward25@example.org	8617950872	45850 Wilkinson Rue Lake Anthonyfort, MP 89881
8	Brandon	Rodriguez	michaelaadams@example.com	(298)949-0999	3974 Miller Loaf Gilbertfurt, MN 17810
9	Rebecca	Curry	shelbyjackson@example.com	8516621372	PSC 6178, Box 0751 APO AE 21593
10	Jeffrey	Johnson	isaiahmeza@example.com	372-686-6707x4126	72132 Victoria Rapids Port Diana, IL 70209
11	Darren	Estrada	alexandra25@example.com	001-518-586-9532	3318 Wilkins Fall Lake Karen, MS 75639
12	Eric	Welch	holmesaimee@example.org	798.666.4566x616	4608 Smith Canyon Suite 432 East Eugenetown, ND 72115
13	Katie	Baker	danielgarner@example.net	(986)514-0418x125	5679 Edwards Streets Apt. 911 Boydchester, OH 22398
14	Brandon	Clark	moralesderek@example.org	+1-663-778-2532x421	79055 Fletcher Path Robertfurt, NY 15838
15	William	Townsend	rbailey@example.org	506.776.8121x3772	4322 Michael Streets Apt. 870 Ortizfurt, FL 42290
16	Alex	Brooks	snydertony@example.com	4203760327	PSC 6413, Box 0489 APO AP 10741
17	Katie	Jacobs	rebeccathompson@example.org	682.881.8241x67063	3605 Patrick Springs New Zacharyville, VA 94333
18	Michelle	Allen	omiller@example.com	001-887-617-1236x0552	3636 Davis Lakes Apt. 702 East Debraport, MN 85425
19	Theresa	Bradley	robert79@example.com	359-723-0264	269 Audrey Spur Apt. 224 Linshire, CA 04630
20	Brandi	Morris	kayladaniels@example.org	384-405-6200x75369	29153 Jack Extension Graveschester, OK 68775
\.

COPY "Assets" FROM stdin;
1	Compact Workbench	4764648751354	64.9	\N	weekly	Aisle 17 - Shelf 5	2
2	5Pc Collapsible Xl Socket Set	0693950909884	86.98	\N	monthly	Aisle 12 - Shelf 3	5
3	Hammer	0359539144960	44.24	\N	weekly	Aisle 17 - Shelf 5	4
4	Compact Workbench	2147208530446	37.28	\N	weekly	Aisle 9 - Shelf 6	4
5	Basic 10Pc Wrench Set	5963850343947	47.81	\N	monthly	Aisle 14 - Shelf 1	4
6	Professional Collapsible Portable Workbench	3997985927064	81.04	\N	weekly	Aisle 13 - Shelf 7	4
7	Lightweight Xl Wheelbarrow	4394073379078	45.9	\N	monthly	Aisle 5 - Shelf 3	1
8	10Pc Cordless Socket Set	8701477472612	37.52	\N	weekly	Aisle 11 - Shelf 8	4
9	Lightweight Xl Wheelbarrow	9807094026623	90.55	\N	daily	Aisle 20 - Shelf 10	5
10	Lightweight 5Pc Xl Wrench Set	4058705276493	85.36	\N	daily	Aisle 17 - Shelf 9	2
11	Lightweight Ergonomic Power Saw	1915300091919	22.79	\N	monthly	Aisle 7 - Shelf 1	5
12	Industrial 5Pc Oversized Wrench Set	1072012338524	10.59	5.97	weekly	Aisle 8 - Shelf 9	3
13	Collapsible Xl Leaf Blower	9823535206072	31.38	19.15	daily	Aisle 13 - Shelf 4	5
14	Sm Lawn Mower	1611063723578	58.26	\N	weekly	Aisle 8 - Shelf 1	2
15	Portable Wheelbarrow	2039239952000	67.73	\N	daily	Aisle 19 - Shelf 10	5
16	Industrial Hammer	9939312769798	92.19	\N	daily	Aisle 14 - Shelf 9	5
17	Compact Leaf Blower	2745014889828	95.48	\N	weekly	Aisle 2 - Shelf 6	5
18	Professional Portable Hand Axe	7452365900441	70.37	\N	monthly	Aisle 3 - Shelf 4	2
19	Adjustable Portable Leaf Blower	8006841347245	74.22	\N	monthly	Aisle 20 - Shelf 1	5
20	Adjustable Sm Screwdriver Set	3923792733420	88.32	\N	weekly	Aisle 20 - Shelf 3	2
21	20Pc Wrench Set	2846183087104	37.97	\N	monthly	Aisle 2 - Shelf 10	2
22	Basic Shovel	7233252203780	27.21	\N	monthly	Aisle 13 - Shelf 4	3
23	Industrial Cordless Portable Workbench	4982498374862	66.43	\N	monthly	Aisle 20 - Shelf 10	5
24	Air Compressor	7640743027402	10.74	6.64	weekly	Aisle 10 - Shelf 6	2
25	Professional Compact Shovel	8295562014684	38.39	\N	daily	Aisle 4 - Shelf 5	5
26	Adjustable Air Compressor	3644877144800	7.95	\N	monthly	Aisle 20 - Shelf 2	3
27	Industrial Heavy-Duty Power Saw	9805106083701	56.45	\N	daily	Aisle 15 - Shelf 2	5
28	20Pc Ergonomic Portable Socket Set	6075017960634	30.33	\N	daily	Aisle 3 - Shelf 7	4
29	Basic Portable Hand Axe	5075274507710	10.12	7.35	monthly	Aisle 11 - Shelf 3	3
30	Lightweight Wrench Set	2081585744990	31.79	\N	monthly	Aisle 4 - Shelf 4	4
31	Basic Sm Chainsaw	6841447246224	43.26	\N	daily	Aisle 20 - Shelf 9	3
32	Basic 10Pc Compact Wrench Set	5922008160713	74.25	\N	weekly	Aisle 12 - Shelf 6	5
33	15Pc Pliers Set	2647656594217	50.93	\N	weekly	Aisle 7 - Shelf 8	5
34	Deluxe 10Pc Wrench Set	1236030580468	68.57	\N	monthly	Aisle 3 - Shelf 7	5
35	Leaf Blower	3429746782594	95.79	\N	monthly	Aisle 2 - Shelf 4	2
36	Heavy-Duty Hammer	5708790566632	87.33	57.81	daily	Aisle 20 - Shelf 3	5
37	Lightweight Compact Hand Axe	1618822852180	47.96	34.07	weekly	Aisle 3 - Shelf 10	1
38	Xl Shovel	6895488918480	97.63	\N	monthly	Aisle 17 - Shelf 7	4
39	Deluxe Hammer	0580594807181	42.42	\N	weekly	Aisle 19 - Shelf 10	3
40	Cordless Oversized Chainsaw	8523528320723	88.6	\N	monthly	Aisle 10 - Shelf 9	4
41	Professional 5Pc Portable Wrench Set	6464548168952	46.02	\N	daily	Aisle 16 - Shelf 3	4
42	5Pc Pliers Set	4989176347521	57.23	\N	weekly	Aisle 20 - Shelf 4	5
43	15Pc Cordless Compact Socket Set	3889867276080	39.76	\N	monthly	Aisle 14 - Shelf 6	4
44	Shovel	6583295690841	65.29	\N	monthly	Aisle 18 - Shelf 1	4
45	Deluxe Compact Wheelbarrow	9141358850495	67.18	\N	monthly	Aisle 6 - Shelf 9	4
46	Lightweight Cordless Sm Lawn Mower	8010330382884	60.49	\N	weekly	Aisle 5 - Shelf 3	5
47	Compact Lawn Mower	5067919914588	53.57	\N	weekly	Aisle 4 - Shelf 4	3
48	20Pc Compact Socket Set	7456728595190	38.8	\N	daily	Aisle 4 - Shelf 2	3
49	15Pc Xl Wrench Set	0285394729090	31.91	\N	weekly	Aisle 2 - Shelf 10	3
50	Basic Oversized Wrench Set	1671457610006	47.13	\N	monthly	Aisle 19 - Shelf 5	1
\.

COPY "Transactions" FROM stdin;
1	38	14	Return	2025-01-11 10:29:38.641904	154.19	Television child stay simple as.
2	10	12	Rental	2025-01-14 17:53:15.142980	211.07	Race themselves them yet unit.
3	26	8	Rental	2025-01-01 15:17:08.017574	358.34	Little across moment allow early will sometimes.
4	34	11	Rental	2025-01-13 17:05:16.510237	275.76	Each full their clearly find marriage site spend.
5	14	12	Return	2025-01-07 05:20:41.305944	494.71	Might interesting scene opportunity.
6	30	10	Rental	2025-01-16 13:23:03.240775	450.3	Wide reason news high dream.
7	3	8	Rental	2025-01-14 00:46:20.580798	109.75	Product glass front candidate.
8	15	4	Return	2025-01-13 18:19:17.317374	26.44	Wrong fight deal home fish moment.
9	23	14	Return	2025-01-01 21:22:38.067740	61.49	Well bag blood performance somebody.
10	26	2	Rental	2025-01-09 13:12:06.210819	149.81	Inside begin stage message it art.
11	20	8	Return	2025-01-01 09:31:42.965164	403.28	Chance born interest couple project everybody treat.
12	50	20	Return	2025-01-15 18:42:29.604983	28.23	Change produce wall energy list public.
13	46	14	Rental	2025-01-01 06:17:38.359206	179.14	Three member collection forward young today nice.
14	32	20	Sale	2025-01-13 03:12:23.368580	176.83	Someone floor pay prevent paper Democrat.
15	30	9	Rental	2025-01-06 16:37:09.982674	168.57	Onto stop lay crime.
16	36	7	Sale	2025-01-11 15:13:15.639642	237.1	Compare official power positive loss.
17	43	13	Sale	2025-01-09 05:06:34.563619	380.9	Read receive without eight similar unit.
18	32	2	Sale	2025-01-10 17:38:13.758519	98.54	Within today over hundred.
19	37	8	Sale	2025-01-03 15:46:32.724208	313.6	Everyone stuff give when.
20	14	16	Sale	2025-01-13 21:03:17.200600	139.59	Address sign another simple book.
21	48	1	Return	2025-01-14 17:49:50.493488	299.81	Together voice too city day.
22	39	7	Sale	2025-01-06 14:40:28.259804	91.73	Politics degree improve day.
23	23	9	Rental	2025-01-14 09:26:19.755088	224.17	Last much great radio security.
24	31	13	Rental	2025-01-16 10:31:18.716804	133.42	Wife color issue bill.
25	43	4	Rental	2025-01-13 01:41:14.413522	272.9	Truth paper certainly.
26	19	1	Rental	2025-01-02 13:02:11.629915	413.65	Sometimes guy lot account bar total expect major.
27	4	12	Return	2025-01-15 22:53:35.743362	358.93	Direction red team seven cost sing five.
28	42	18	Sale	2025-01-11 15:18:31.178994	234.63	Stuff less activity same.
29	19	17	Sale	2025-01-13 08:20:10.697422	431.55	Realize old enough to never federal game.
30	33	20	Return	2025-01-06 10:30:03.636599	282.16	Wide night voice expect.
31	24	5	Rental	2025-01-13 09:44:07.467851	133.0	Level think popular note debate.
32	42	18	Sale	2025-01-04 17:32:17.971929	252.81	Ready what outside evening and capital.
33	17	16	Rental	2025-01-13 20:22:36.720834	141.13	Field have total section issue doctor people.
34	42	7	Sale	2025-01-13 03:22:20.801136	228.12	True help manage want season authority might.
35	16	5	Sale	2025-01-10 19:39:03.496366	52.52	American century full actually international commercial bag of.
36	49	1	Return	2025-01-11 01:19:48.236142	277.69	Course act become recent money to.
37	13	2	Sale	2025-01-10 10:09:21.684744	323.22	Politics truth now no last rather thing during.
38	36	6	Sale	2025-01-10 02:11:47.237427	490.87	Movie senior itself dark fly show.
39	23	15	Sale	2025-01-12 04:29:12.383708	276.7	Development face service list son per system.
40	8	6	Rental	2025-01-01 06:16:15.704939	205.21	Enjoy real hold likely suffer drive language.
41	21	1	Sale	2025-01-02 06:22:09.363593	342.24	Continue upon rise word rock name per husband.
42	4	11	Sale	2025-01-03 17:31:41.267555	13.13	Stop show community white not edge heavy.
43	23	17	Rental	2025-01-07 03:14:32.829909	487.24	Culture third action available century whatever.
44	47	12	Rental	2025-01-13 07:17:37.270696	180.43	South course clearly gas mother fill else style.
45	43	17	Rental	2025-01-04 13:33:33.843472	225.13	Respond clear respond identify.
46	50	1	Rental	2025-01-16 03:05:44.428561	361.25	Tell paper whether health finish win.
47	25	20	Return	2025-01-15 03:50:08.729208	76.95	Under production hundred enough note government.
48	29	13	Return	2025-01-11 16:32:45.006137	440.54	Structure at wide fine out another.
49	38	13	Sale	2025-01-16 11:12:28.585670	417.98	Human include admit indicate tax.
50	3	6	Return	2025-01-15 11:46:31.087954	258.48	That one order key reflect quite.
51	22	4	Sale	2025-01-09 02:56:13.875788	384.42	By discussion order resource small nothing.
52	29	16	Return	2025-01-09 10:55:03.673645	286.64	Government wide toward memory know management school.
53	11	2	Sale	2025-01-01 03:41:03.524182	368.28	Cell morning job.
54	38	19	Rental	2025-01-05 18:34:55.128522	386.51	Call campaign condition cell seat.
55	40	9	Rental	2025-01-15 22:35:10.772769	456.73	Guy anyone act same guess.
56	41	5	Return	2025-01-05 19:22:37.757410	11.74	Price language test image.
57	3	13	Rental	2025-01-04 10:30:15.977328	246.17	Field report your onto Mr local.
58	30	18	Return	2025-01-07 23:47:57.472533	248.4	Mean against write yourself understand family field.
59	30	14	Sale	2025-01-14 17:56:34.286029	207.07	Might interview whether cup fight employee.
60	24	4	Return	2025-01-01 23:55:47.053550	125.21	Kind thing employee.
\.

COPY "Rentals" FROM stdin;
1	51	2025-01-08 02:57:11.052869	2025-01-11 03:19:30.184497	2025-01-08 02:57:11.052869	2025-01-11 03:19:30.184497	3 days, 0:22:19.131628
2	57	2025-01-08 15:06:13.708507	2025-01-08 21:44:09.995479	2025-01-08 15:06:13.708507	2025-01-08 21:44:09.995479	6:37:56.286972
3	35	2025-01-08 09:18:24.179434	2025-01-13 13:17:41.526040	2025-01-08 09:18:24.179434	2025-01-13 13:17:41.526040	5 days, 3:59:17.346606
4	17	2025-01-04 07:11:17.644689	2025-01-10 23:58:41.902182	2025-01-04 07:11:17.644689	2025-01-10 23:58:41.902182	6 days, 16:47:24.257493
5	17	2025-01-13 07:58:47.902249	2025-01-15 07:23:17.796954	2025-01-13 07:58:47.902249	2025-01-15 07:23:17.796954	1 day, 23:24:29.894705
6	47	2025-01-13 23:48:52.076232	2025-01-15 19:24:36.521039	2025-01-13 23:48:52.076232	2025-01-15 19:24:36.521039	1 day, 19:35:44.444807
7	58	2025-01-07 10:09:06.309845	2025-01-15 23:46:52.861104	2025-01-07 10:09:06.309845	2025-01-15 23:46:52.861104	8 days, 13:37:46.551259
8	42	2025-01-15 12:17:34.657850	2025-01-16 10:26:39.580255	2025-01-15 12:17:34.657850	2025-01-16 10:26:39.580255	22:09:04.922405
9	10	2025-01-03 16:32:06.042506	2025-01-14 02:11:36.444795	2025-01-03 16:32:06.042506	2025-01-14 02:11:36.444795	10 days, 9:39:30.402289
10	5	2025-01-14 13:02:14.863178	2025-01-15 14:08:51.841079	2025-01-14 13:02:14.863178	2025-01-15 14:08:51.841079	1 day, 1:06:36.977901
11	17	2025-01-14 09:45:56.160443	2025-01-14 23:51:20.247861	2025-01-14 09:45:56.160443	2025-01-14 23:51:20.247861	14:05:24.087418
12	44	2025-01-10 19:48:13.045856	2025-01-13 07:00:49.559386	2025-01-10 19:48:13.045856	2025-01-13 07:00:49.559386	2 days, 11:12:36.513530
13	15	2025-01-06 22:32:25.584957	2025-01-11 22:02:14.829104	2025-01-06 22:32:25.584957	2025-01-11 22:02:14.829104	4 days, 23:29:49.244147
14	9	2025-01-12 22:22:03.437372	2025-01-15 09:36:36.880715	2025-01-12 22:22:03.437372	2025-01-15 09:36:36.880715	2 days, 11:14:33.443343
15	56	2025-01-13 07:35:08.545202	2025-01-14 17:00:47.409960	2025-01-13 07:35:08.545202	2025-01-14 17:00:47.409960	1 day, 9:25:38.864758
16	18	2025-01-06 19:33:30.641766	2025-01-07 05:03:26.074224	2025-01-06 19:33:30.641766	2025-01-07 05:03:26.074224	9:29:55.432458
17	13	2025-01-05 08:13:36.901505	2025-01-14 15:52:12.278558	2025-01-05 08:13:36.901505	2025-01-14 15:52:12.278558	9 days, 7:38:35.377053
18	13	2025-01-12 04:55:23.526789	2025-01-13 18:32:45.552281	2025-01-12 04:55:23.526789	2025-01-13 18:32:45.552281	1 day, 13:37:22.025492
19	53	2025-01-12 02:52:10.584372	2025-01-15 03:03:33.009250	2025-01-12 02:52:10.584372	2025-01-15 03:03:33.009250	3 days, 0:11:22.424878
20	19	2025-01-10 10:32:34.600275	2025-01-12 06:23:39.150088	2025-01-10 10:32:34.600275	2025-01-12 06:23:39.150088	1 day, 19:51:04.549813
21	35	2025-01-10 12:16:54.921721	2025-01-13 18:37:00.603293	2025-01-10 12:16:54.921721	2025-01-13 18:37:00.603293	3 days, 6:20:05.681572
22	51	2025-01-12 12:28:30.250854	2025-01-16 06:57:51.286906	2025-01-12 12:28:30.250854	2025-01-16 06:57:51.286906	3 days, 18:29:21.036052
23	59	2025-01-10 20:23:45.440837	2025-01-16 11:17:17.055649	2025-01-10 20:23:45.440837	2025-01-16 11:17:17.055649	5 days, 14:53:31.614812
24	55	2025-01-12 01:28:58.815454	2025-01-13 17:46:31.143322	2025-01-12 01:28:58.815454	2025-01-13 17:46:31.143322	1 day, 16:17:32.327868
25	29	2025-01-07 12:30:10.076787	2025-01-08 10:42:50.812055	2025-01-07 12:30:10.076787	2025-01-08 10:42:50.812055	22:12:40.735268
26	12	2025-01-05 11:17:33.459758	2025-01-09 02:03:13.046710	2025-01-05 11:17:33.459758	2025-01-09 02:03:13.046710	3 days, 14:45:39.586952
27	3	2025-01-06 10:46:21.723989	2025-01-08 00:47:39.232241	2025-01-06 10:46:21.723989	2025-01-08 00:47:39.232241	1 day, 14:01:17.508252
28	36	2025-01-16 12:58:22.985702	2025-01-16 13:13:28.307940	2025-01-16 12:58:22.985702	2025-01-16 13:13:28.307940	0:15:05.322238
29	49	2025-01-13 15:57:26.112898	2025-01-16 04:22:54.553319	2025-01-13 15:57:26.112898	2025-01-16 04:22:54.553319	2 days, 12:25:28.440421
30	47	2025-01-15 08:55:55.139504	2025-01-15 11:18:10.383965	2025-01-15 08:55:55.139504	2025-01-15 11:18:10.383965	2:22:15.244461
\.

