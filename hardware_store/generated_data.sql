SET search_path="Hardware Store";

COPY "Store Locations" FROM stdin;
1	Herrera, Nelson and Nguyen	8427 Jamie Points Port Alyssaport, AR 92723
2	Torres, Martinez and Tyler	86353 Mendoza Ville New Christinafurt, NJ 06544
3	Nash-Fox	5664 Ramirez Crossing Apt. 027 New Ryanside, TN 59899
4	Mcdonald-Conley	04748 Tracey Springs Apt. 580 Port Daniel, OR 11309
5	Jones and Sons	33949 Rodriguez Throughway Port Angelabury, WY 87218
\.

COPY "Customers" FROM stdin;
1	Angelica	Campbell	hollymanning@example.net	(910)808-9859x0366	39662 Jack Shoals Apt. 456 Cummingsville, NM 10917
2	Heather	Newton	christine30@example.net	(291)474-0635x632	99284 Chad Junctions New Alyssaburgh, NY 83267
3	Julia	Wilson	hawkinscorey@example.net	527-586-3685x1020	35658 White Meadow Clarkland, AR 72187
4	Michele	Lewis	cpalmer@example.com	(307)257-9357	92132 Jesus Curve South Lauramouth, GA 82210
5	Sandy	Carrillo	bbrooks@example.net	001-677-796-7807x680	4317 Melissa Viaduct Apt. 387 Boothside, FL 28700
6	James	Sanchez	kylerichards@example.net	+1-795-296-9294x70242	278 Ricky Alley New Shawn, AK 42002
7	Amy	Liu	hessnatalie@example.org	953.796.6245	759 Cameron Stravenue Suite 332 Port David, AZ 61920
8	Melissa	White	christopher45@example.net	(282)478-1904	48174 Eaton Street Lake Tiffanyside, PA 71250
9	Jessica	Ramos	fdouglas@example.net	(958)393-9828	353 Charlotte Avenue Apt. 927 South Kayla, NY 23710
10	Patrick	Pittman	hscott@example.com	873-544-4126x104	42502 Krista Cliffs Suite 623 Lozanoberg, SD 71755
11	Becky	Henderson	brandon36@example.org	3836961626	64480 Wilson Ford Suite 004 East Kelly, NE 87427
12	Jo	Wright	lukehernandez@example.org	536-506-0058x4189	5533 Micheal Road North Michelle, NE 59372
13	Scott	Doyle	lucasking@example.net	676-877-3442	2471 Santana Spurs Ericville, AZ 30859
14	James	Tucker	haynesmelissa@example.com	001-202-231-3969x9245	028 Diaz Prairie Suite 240 Petersenborough, ID 38848
15	Phillip	Anderson	xramirez@example.org	+1-467-775-1702x7997	952 Coleman Fork Apt. 813 Youngburgh, NE 37003
16	Julie	Pittman	stephen87@example.net	596.408.5397	93752 Jessica Road New Antonio, OK 13593
17	Caitlyn	Martin	jade58@example.com	+1-281-894-7531x50091	62897 Kim Corners Suite 730 Daltonberg, OR 77468
18	Lauren	Walker	jodiknight@example.net	001-689-960-3624x672	12087 Parker Rest Chelseatown, DE 02474
19	Brian	Fisher	rdorsey@example.org	001-506-351-9917x281	0686 Smith Glen Suite 171 Juanstad, WA 27710
20	Richard	Munoz	michelle45@example.net	(766)618-9607x9810	15202 Kelly Plains Suite 108 Stewartchester, NV 21094
\.

COPY "Assets" FROM stdin;
1	Soap	6710145120887	15.53	\N	weekly	Aisle 17 - Shelf 5	5
2	Rubber Gloves	3050003397130	65.44	\N	weekly	Aisle 12 - Shelf 5	3
3	Hat	7188373578012	16.76	\N	weekly	Aisle 4 - Shelf 1	5
4	Frozen Towels	0496389289486	28.64	\N	weekly	Aisle 17 - Shelf 7	2
5	Shoes	5233427595452	46.25	\N	daily	Aisle 2 - Shelf 10	5
6	Tasty Bacon	4397673478912	80.26	\N	monthly	Aisle 19 - Shelf 6	5
7	Chicken	1784954734882	12.95	\N	weekly	Aisle 18 - Shelf 5	2
8	Cheese	3113416883154	87.92	61.81	daily	Aisle 11 - Shelf 2	5
9	Tasty Shoes	4281661659905	72.04	42.54	weekly	Aisle 2 - Shelf 3	1
10	Frozen Pizza	5777931713136	56.47	\N	monthly	Aisle 16 - Shelf 4	1
11	Fish	6038837929908	28.48	\N	daily	Aisle 8 - Shelf 2	4
12	Refined Soap	6238410675356	89.24	\N	daily	Aisle 11 - Shelf 4	3
13	Plastic Car	2559226756805	84.15	\N	daily	Aisle 8 - Shelf 9	1
14	Rubber Chair	8235804148470	99.71	67.75	weekly	Aisle 3 - Shelf 4	3
15	Soft Table	0423613654727	67.59	\N	daily	Aisle 11 - Shelf 2	3
16	Steel Salad	3151993226124	21.15	\N	weekly	Aisle 14 - Shelf 2	4
17	Gently Used Metal Pizza	2391252381671	19.85	\N	weekly	Aisle 10 - Shelf 3	3
18	Bacon	1039968814427	86.62	\N	daily	Aisle 18 - Shelf 2	4
19	Licensed Rubber Towels	9898524973372	9.54	7.11	monthly	Aisle 7 - Shelf 6	2
20	Ergonomic Table	7058506028113	17.7	\N	daily	Aisle 1 - Shelf 7	2
21	Unbranded Steel Pants	1423806571021	28.27	19.83	daily	Aisle 17 - Shelf 9	3
22	Concrete Chips	9004698240268	78.88	\N	daily	Aisle 15 - Shelf 8	5
23	Used Soft Hat	5859452357171	85.36	\N	monthly	Aisle 18 - Shelf 2	3
24	Practical Rubber Ball	9918466450790	41.93	\N	weekly	Aisle 12 - Shelf 9	5
25	Refined Granite Chicken	0287997709240	14.39	\N	monthly	Aisle 15 - Shelf 6	1
26	Rustic Steel Chicken	5278886026680	87.07	\N	monthly	Aisle 13 - Shelf 9	4
27	New Soft Table	9963108210829	36.44	\N	weekly	Aisle 5 - Shelf 10	1
28	Gently Used Metal Gloves	4666616920918	63.58	42.19	monthly	Aisle 8 - Shelf 8	5
29	Gorgeous Steel Pants	3389808411353	81.2	\N	monthly	Aisle 9 - Shelf 3	2
30	Small Soft Towels	8732062841247	8.18	\N	weekly	Aisle 9 - Shelf 2	2
31	Ball	6820559949025	52.85	\N	monthly	Aisle 7 - Shelf 6	3
32	Soft Bike	6413637657433	48.19	\N	monthly	Aisle 12 - Shelf 4	3
33	Intelligent Computer	6376750658179	97.29	75.0	monthly	Aisle 6 - Shelf 4	2
34	Generic Cheese	3487013933803	92.54	\N	daily	Aisle 4 - Shelf 4	5
35	Metal Tuna	7028252590165	70.95	\N	monthly	Aisle 1 - Shelf 2	3
36	Unbranded Chair	3840488626715	35.68	\N	monthly	Aisle 19 - Shelf 3	5
37	Towels	1800370412484	60.5	\N	daily	Aisle 5 - Shelf 3	3
38	Pants	4264968068694	35.16	\N	daily	Aisle 4 - Shelf 10	4
39	Intelligent Chips	5211154963317	25.01	18.14	monthly	Aisle 3 - Shelf 9	1
40	Shirt	5994455229299	64.98	41.01	daily	Aisle 3 - Shelf 5	1
41	Steel Ball	4150163779261	90.47	51.8	monthly	Aisle 18 - Shelf 7	3
42	Bacon	7768434476749	59.26	32.53	monthly	Aisle 12 - Shelf 5	4
43	Handcrafted Plastic Bacon	1823572506676	75.22	\N	daily	Aisle 19 - Shelf 1	1
44	Metal Shoes	6018582393636	16.38	\N	weekly	Aisle 13 - Shelf 6	2
45	Rubber Car	3344358327608	18.05	12.35	weekly	Aisle 9 - Shelf 7	3
46	Unbranded Fresh Keyboard	8301029556175	24.57	\N	daily	Aisle 18 - Shelf 4	5
47	Handmade Plastic Pants	3677695818059	10.74	\N	weekly	Aisle 10 - Shelf 10	1
48	Generic Computer	2160790902682	14.22	\N	monthly	Aisle 6 - Shelf 9	2
49	Fish	6546433407053	40.92	32.55	weekly	Aisle 13 - Shelf 5	2
50	Chips	9326269283536	62.25	49.11	monthly	Aisle 13 - Shelf 3	1
\.

COPY "Transactions" FROM stdin;
1	10	20	Sale	2025-01-01 18:10:22.069194	235.11	Leave around dog with measure.
2	47	13	Sale	2025-01-08 23:20:29.230140	464.31	Player discussion role source.
3	31	20	Return	2025-01-04 19:59:00.988226	155.71	Success mouth blue produce.
4	6	3	Sale	2025-01-02 13:17:43.610788	87.16	Color street themselves time church past authority.
5	23	4	Rental	2025-01-02 03:21:03.913362	228.0	Purpose pull evidence decision.
6	10	12	Rental	2025-01-02 14:30:37.646168	447.83	Fall hour church interest blue wife reduce.
7	39	4	Sale	2025-01-01 23:21:41.261959	202.33	Likely defense east.
8	10	20	Sale	2025-01-08 05:36:39.770112	415.09	Full society success product.
9	9	6	Return	2025-01-03 00:00:00.547396	180.65	Talk second TV minute.
10	13	13	Return	2025-01-08 23:11:22.227917	432.02	Authority star area respond feeling fast.
11	12	13	Sale	2025-01-04 13:50:03.537570	73.91	Country cause guy up certain people husband.
12	20	10	Sale	2025-01-03 18:55:59.792802	81.61	Their training body figure could.
13	4	6	Rental	2025-01-04 02:22:27.059450	161.04	History official sign necessary physical.
14	9	13	Sale	2025-01-05 12:14:11.552493	473.53	Ready true stop positive that.
15	21	1	Return	2025-01-09 08:08:36.339912	394.27	Doctor force nearly whose.
16	42	5	Sale	2025-01-06 23:30:27.705000	470.8	Lay issue do.
17	21	5	Rental	2025-01-05 17:59:52.059170	38.55	Degree or trade hair.
18	12	13	Rental	2025-01-08 09:07:05.699732	230.54	Third modern everybody.
19	50	3	Rental	2025-01-02 10:04:17.691332	232.85	Gun contain try.
20	49	12	Sale	2025-01-08 09:45:19.042648	400.97	Cultural on account knowledge minute explain maintain.
21	26	13	Sale	2025-01-05 05:33:50.927155	442.63	Bill parent decision nature interesting.
22	32	4	Sale	2025-01-09 06:37:35.634672	57.08	Group should public media small trouble.
23	1	13	Sale	2025-01-05 03:45:01.258577	149.12	Less off attention heart whether best maintain.
24	32	1	Sale	2025-01-06 17:42:26.266595	263.68	Better likely chance without.
25	9	12	Return	2025-01-01 04:16:02.533059	187.6	Meeting run religious national industry no.
26	19	16	Sale	2025-01-08 20:17:13.142165	85.71	Take gas suffer sense technology.
27	19	18	Rental	2025-01-04 16:32:06.111171	230.24	Tough health popular activity cause change pay star.
28	36	13	Sale	2025-01-03 06:29:38.870147	88.46	Would pull and go hair.
29	22	19	Rental	2025-01-04 14:06:11.411855	17.23	Choose cover up country operation after.
30	47	14	Sale	2025-01-06 04:10:27.069326	54.47	Participant simple tax including per.
31	45	20	Return	2025-01-02 00:43:19.706330	79.58	Great score tonight.
32	1	13	Return	2025-01-04 15:37:22.491020	458.25	Stand career free onto friend need street.
33	6	19	Sale	2025-01-07 14:17:10.784145	360.13	Live agree option him within almost.
34	31	15	Sale	2025-01-03 20:31:38.623125	42.64	Purpose well board call.
35	38	5	Return	2025-01-02 19:15:02.846357	481.8	Everyone agency theory safe play thousand talk so.
36	18	6	Rental	2025-01-04 20:04:14.552627	14.41	Maybe state office five chance rich.
37	11	15	Sale	2025-01-05 07:20:53.464139	350.2	Feel age executive best business couple there.
38	33	11	Return	2025-01-06 18:41:22.268900	157.21	Scene green president some night.
39	6	5	Rental	2025-01-01 17:53:21.072392	296.14	All since specific should style history operation.
40	8	16	Return	2025-01-08 21:27:16.388841	463.73	Character up space hair short both.
41	38	4	Rental	2025-01-07 11:47:59.400321	146.07	None rate seem back.
42	38	15	Rental	2025-01-05 11:30:20.287035	65.86	Step education final thus wish whether.
43	2	7	Rental	2025-01-06 02:07:14.005754	297.74	Return prove everybody sit on study paper.
44	26	1	Sale	2025-01-06 16:30:26.233445	93.59	Over staff voice of resource in.
45	22	2	Sale	2025-01-08 08:24:05.379994	275.13	Individual remain cell compare next after surface scene.
46	37	9	Rental	2025-01-04 15:51:18.852475	223.61	Bit enough interview letter fund skin story.
47	29	1	Return	2025-01-01 07:32:11.572206	315.14	Suggest gas information within ability foreign cover everybody.
48	15	8	Return	2025-01-04 16:38:50.778972	288.81	Window it fight together movement fill.
49	11	16	Rental	2025-01-06 03:33:03.223161	449.1	Her school price visit.
50	13	6	Return	2025-01-08 04:05:39.296953	345.18	Thank now soldier between economic possible truth.
51	45	19	Rental	2025-01-08 14:30:52.759468	93.16	Way not north unit easy memory.
52	23	13	Sale	2025-01-09 10:23:31.704957	416.5	Good Democrat pretty option.
53	28	11	Return	2025-01-08 17:51:04.415027	13.03	Would home program home.
54	15	9	Rental	2025-01-04 10:11:18.157674	239.28	Factor hundred community bar according answer vote.
55	39	14	Rental	2025-01-05 13:18:41.442648	390.44	Give behind treatment against.
56	18	18	Return	2025-01-06 00:54:17.328332	331.98	Difficult set hit young today play.
57	23	19	Return	2025-01-08 22:04:43.289755	309.93	Society boy which.
58	39	2	Return	2025-01-07 09:49:37.565372	378.43	Trouble difference find beyond.
59	49	11	Sale	2025-01-03 09:45:25.585161	132.41	Another visit available senior investment skill.
60	9	2	Rental	2025-01-03 04:58:03.003364	245.57	Across into left room.
\.

COPY "Rentals" FROM stdin;
1	35	2025-01-03 03:09:55.840415	2025-01-06 17:58:38.143797	2025-01-03 03:09:55.840415	2025-01-06 17:58:38.143797	3 days, 14:48:42.303382
2	53	2025-01-05 04:43:35.534454	2025-01-07 03:07:14.344115	2025-01-05 04:43:35.534454	2025-01-07 03:07:14.344115	1 day, 22:23:38.809661
3	36	2025-01-04 14:59:47.069887	2025-01-05 22:13:18.120655	2025-01-04 14:59:47.069887	2025-01-05 22:13:18.120655	1 day, 7:13:31.050768
4	17	2025-01-04 06:22:44.675805	2025-01-07 04:20:48.439854	2025-01-04 06:22:44.675805	2025-01-07 04:20:48.439854	2 days, 21:58:03.764049
5	32	2025-01-03 02:00:50.785715	2025-01-06 12:10:47.339084	2025-01-03 02:00:50.785715	2025-01-06 12:10:47.339084	3 days, 10:09:56.553369
6	41	2025-01-05 18:32:40.943839	2025-01-06 02:28:21.275373	2025-01-05 18:32:40.943839	2025-01-06 02:28:21.275373	7:55:40.331534
7	53	2025-01-06 11:06:21.424397	2025-01-09 01:04:02.440548	2025-01-06 11:06:21.424397	2025-01-09 01:04:02.440548	2 days, 13:57:41.016151
8	40	2025-01-02 06:19:37.342769	2025-01-05 02:19:48.028999	2025-01-02 06:19:37.342769	2025-01-05 02:19:48.028999	2 days, 20:00:10.686230
9	10	2025-01-04 14:03:52.427544	2025-01-07 14:29:21.126766	2025-01-04 14:03:52.427544	2025-01-07 14:29:21.126766	3 days, 0:25:28.699222
10	34	2025-01-03 16:17:52.740532	2025-01-04 02:15:35.582872	2025-01-03 16:17:52.740532	2025-01-04 02:15:35.582872	9:57:42.842340
11	42	2025-01-08 12:24:25.599622	2025-01-08 12:51:35.644410	2025-01-08 12:24:25.599622	2025-01-08 12:51:35.644410	0:27:10.044788
12	55	2025-01-07 04:25:45.847300	2025-01-09 09:06:35.163686	2025-01-07 04:25:45.847300	2025-01-09 09:06:35.163686	2 days, 4:40:49.316386
13	33	2025-01-07 22:36:50.761288	2025-01-08 19:49:22.284930	2025-01-07 22:36:50.761288	2025-01-08 19:49:22.284930	21:12:31.523642
14	21	2025-01-09 01:18:34.794741	2025-01-09 03:50:23.980422	2025-01-09 01:18:34.794741	2025-01-09 03:50:23.980422	2:31:49.185681
15	48	2025-01-07 13:51:42.551060	2025-01-09 00:00:41.055555	2025-01-07 13:51:42.551060	2025-01-09 00:00:41.055555	1 day, 10:08:58.504495
16	55	2025-01-03 16:13:11.713488	2025-01-08 17:24:40.140289	2025-01-03 16:13:11.713488	2025-01-08 17:24:40.140289	5 days, 1:11:28.426801
17	56	2025-01-01 16:58:06.782003	2025-01-08 16:09:41.326875	2025-01-01 16:58:06.782003	2025-01-08 16:09:41.326875	6 days, 23:11:34.544872
18	55	2025-01-02 02:38:43.921821	2025-01-06 17:25:53.522815	2025-01-02 02:38:43.921821	2025-01-06 17:25:53.522815	4 days, 14:47:09.600994
19	57	2025-01-05 12:06:23.151130	2025-01-09 02:57:08.222918	2025-01-05 12:06:23.151130	2025-01-09 02:57:08.222918	3 days, 14:50:45.071788
20	2	2025-01-07 02:51:33.684760	2025-01-08 08:40:53.874172	2025-01-07 02:51:33.684760	2025-01-08 08:40:53.874172	1 day, 5:49:20.189412
21	41	2025-01-02 08:47:01.775952	2025-01-07 00:51:53.539770	2025-01-02 08:47:01.775952	2025-01-07 00:51:53.539770	4 days, 16:04:51.763818
22	60	2025-01-03 08:12:26.237704	2025-01-07 10:49:57.751135	2025-01-03 08:12:26.237704	2025-01-07 10:49:57.751135	4 days, 2:37:31.513431
23	16	2025-01-02 13:23:03.388587	2025-01-05 17:13:56.078159	2025-01-02 13:23:03.388587	2025-01-05 17:13:56.078159	3 days, 3:50:52.689572
24	41	2025-01-01 14:35:16.581874	2025-01-07 20:21:07.927710	2025-01-01 14:35:16.581874	2025-01-07 20:21:07.927710	6 days, 5:45:51.345836
25	51	2025-01-01 06:12:03.390292	2025-01-08 16:22:52.259533	2025-01-01 06:12:03.390292	2025-01-08 16:22:52.259533	7 days, 10:10:48.869241
26	33	2025-01-09 08:10:04.807473	2025-01-09 10:24:21.757390	2025-01-09 08:10:04.807473	2025-01-09 10:24:21.757390	2:14:16.949917
27	16	2025-01-05 11:59:50.912402	2025-01-08 12:16:30.744112	2025-01-05 11:59:50.912402	2025-01-08 12:16:30.744112	3 days, 0:16:39.831710
28	34	2025-01-03 12:25:39.320202	2025-01-06 04:13:19.595325	2025-01-03 12:25:39.320202	2025-01-06 04:13:19.595325	2 days, 15:47:40.275123
29	59	2025-01-01 23:18:13.818845	2025-01-03 14:55:05.752518	2025-01-01 23:18:13.818845	2025-01-03 14:55:05.752518	1 day, 15:36:51.933673
30	38	2025-01-02 12:33:51.262913	2025-01-03 18:53:16.243733	2025-01-02 12:33:51.262913	2025-01-03 18:53:16.243733	1 day, 6:19:24.980820
\.

