SET search_path="Hardware Store";

COPY store_locations FROM stdin;
1	Carter, Frederick and Savage	640 Lisa Mills Suite 954 New Taylor, IN 86383
2	Turner PLC	675 Tiffany Overpass Port Joshua, FL 56565
3	Phillips and Sons	USNV Moyer FPO AA 18953
4	Carter and Sons	Unit 7406 Box 1836 DPO AE 88772
5	Aguilar, Wilson and Weeks	90848 Natasha Drive Apt. 256 Romerofort, MT 92939
\.

COPY customers FROM stdin;
1	Wesley	Williams	arieldunn@example.com	3063045099	06619 Collins Isle Apt. 085 Schultzbury, OR 85177
2	Michael	May	maria92@example.com	4789984391	911 Martin Expressway Suttonshire, MI 06905
3	Patricia	Johnson	benjaminmiranda@example.org	994-687-2413x429	8577 Theresa Way Suite 071 New Jennabury, FL 76510
4	James	Powell	hicksrebekah@example.net	001-851-677-3847x300	Unit 5454 Box 9515 DPO AA 90554
5	Lisa	Riddle	jensenkaitlyn@example.com	(957)613-0419x66974	PSC 8874, Box 9141 APO AA 56803
6	Noah	Roach	kevin44@example.net	+1-458-782-6666x298	115 Nicole Ports Tiffanyfurt, OK 77407
7	James	Lane	donnawilliams@example.net	001-556-384-1617x648	53192 Price Stream Suite 622 Lake Lori, AR 47568
8	Anthony	Blankenship	allison48@example.org	819-372-9252x009	65722 Matthew Highway Suite 175 Lake Shawn, ID 15958
9	Marisa	Brown	michael38@example.net	340.540.9346	USNV White FPO AP 34137
10	Phillip	Whitney	bentonstacy@example.org	742-740-3049	38683 Melissa Falls Suite 302 South Raymond, KS 85881
11	Charles	Simpson	kimberlyclarke@example.com	856.818.5317	994 Zachary Island Suite 388 North Jack, NY 07833
12	Christopher	Brock	tiffanychang@example.net	(476)730-2656	9043 Charles Pine Simsmouth, WY 70168
13	Daniel	Becker	james31@example.org	342.729.5627	682 Gibson Key Apt. 621 Elizabethstad, MT 36307
14	Kimberly	Aguirre	kristenhanson@example.com	292.202.7540x28051	19599 Allen Isle New Miguelshire, OK 48794
15	Gabriel	Fitzgerald	hinesadam@example.com	001-710-563-0091x4202	150 Long Flat Morganberg, LA 97513
16	Shawn	Rodriguez	wsmith@example.com	(215)371-3379x6973	86349 Martinez Burgs Wrightchester, WV 72835
17	Christopher	Esparza	ttaylor@example.com	+1-240-991-3478x105	09721 Ryan Ways Apt. 995 Robertland, MO 03213
18	Jasmine	Reese	nguyenbrandon@example.org	570-581-8272	0865 Michael Causeway Port Todd, DC 68041
19	Charles	Jensen	lmelendez@example.com	(621)564-8511	805 Walters Brook Apt. 136 Cruzberg, KY 75463
20	Austin	Bennett	brandonwest@example.com	+1-585-810-6010x70347	Unit 7022 Box 3529 DPO AE 16846
\.

COPY assets FROM stdin;
1	Intelligent Granite Shoes	8007473149863	87.29	\N	daily	Aisle 18 - Shelf 2	3
2	Concrete Chicken	9139209953938	22.78	\N	monthly	Aisle 1 - Shelf 8	1
3	Computer	5746682917285	74.68	57.67	daily	Aisle 18 - Shelf 1	1
4	Granite Chair	3368561544515	85.52	\N	daily	Aisle 15 - Shelf 9	1
5	Steel Tuna	1623983631215	62.77	37.51	weekly	Aisle 6 - Shelf 3	4
6	Rustic Steel Soap	0687215135521	70.46	\N	weekly	Aisle 9 - Shelf 9	1
7	Gorgeous Chair	5899494742474	10.75	\N	daily	Aisle 6 - Shelf 2	3
8	Practical Frozen Hat	3122859151201	63.53	\N	monthly	Aisle 9 - Shelf 5	4
9	Keyboard	3001405063123	21.37	\N	weekly	Aisle 20 - Shelf 10	2
10	Cotton Chair	5922413915533	33.0	\N	daily	Aisle 20 - Shelf 9	3
11	Awesome Towels	4976413877088	31.31	20.13	daily	Aisle 11 - Shelf 8	1
12	Handmade Mouse	8759486771295	64.04	\N	monthly	Aisle 20 - Shelf 4	5
13	Mouse	0228715317972	78.56	\N	daily	Aisle 12 - Shelf 2	2
14	Ergonomic Salad	9068295755341	94.19	\N	weekly	Aisle 2 - Shelf 4	2
15	Towels	2431645855911	51.93	\N	weekly	Aisle 4 - Shelf 1	3
16	Soft Chair	2213960358465	15.56	\N	monthly	Aisle 14 - Shelf 10	1
17	Tasty Metal Computer	2043415890727	95.26	\N	weekly	Aisle 2 - Shelf 7	1
18	Fantastic Keyboard	1956114726598	35.42	20.48	daily	Aisle 17 - Shelf 3	1
19	Pants	7904869831177	5.9	\N	monthly	Aisle 8 - Shelf 5	3
20	Generic Chips	3436242364681	49.96	\N	weekly	Aisle 6 - Shelf 1	2
21	Tasty Fresh Tuna	8260655877514	11.75	\N	daily	Aisle 19 - Shelf 8	4
22	Car	3957294257924	78.27	\N	daily	Aisle 15 - Shelf 9	2
23	Unbranded Pants	8446283473742	40.29	\N	daily	Aisle 9 - Shelf 2	1
24	Hat	9486383382208	79.08	39.75	weekly	Aisle 9 - Shelf 9	5
25	Wooden Pants	8183733618963	52.14	38.82	daily	Aisle 14 - Shelf 7	1
26	Unbranded Concrete Hat	2095263250734	30.31	\N	weekly	Aisle 17 - Shelf 7	1
27	Chair	4474770598054	9.17	\N	weekly	Aisle 8 - Shelf 5	1
28	Handcrafted Bike	8832488843952	92.34	\N	weekly	Aisle 20 - Shelf 9	2
29	Chicken	3931904222991	87.89	\N	monthly	Aisle 15 - Shelf 5	4
30	Soft Computer	1700319361647	56.76	\N	monthly	Aisle 18 - Shelf 6	2
31	Gloves	0453657652144	31.47	24.18	weekly	Aisle 5 - Shelf 3	3
32	Licensed Chicken	6192301129222	6.63	5.0	daily	Aisle 12 - Shelf 9	2
33	Licensed Keyboard	1639999971009	70.33	\N	daily	Aisle 12 - Shelf 6	2
34	Gorgeous Plastic Bacon	5199177976470	17.49	\N	weekly	Aisle 14 - Shelf 10	1
35	Sausages	2937696074054	35.59	22.35	daily	Aisle 9 - Shelf 1	3
36	Generic Bike	3102240092689	48.6	34.04	daily	Aisle 8 - Shelf 4	1
37	Metal Mouse	4300212799218	97.33	\N	daily	Aisle 14 - Shelf 10	3
38	Practical Car	7764763499725	84.93	\N	daily	Aisle 8 - Shelf 3	5
39	Rubber Computer	5075665692049	30.99	\N	daily	Aisle 16 - Shelf 3	4
40	Mouse	2117080579949	72.91	\N	weekly	Aisle 5 - Shelf 5	2
41	Gorgeous Wooden Ball	2300025571720	51.46	\N	weekly	Aisle 7 - Shelf 9	3
42	Practical Chips	0461641688659	39.28	\N	daily	Aisle 1 - Shelf 8	2
43	Shirt	1525012389312	70.99	\N	weekly	Aisle 8 - Shelf 2	2
44	For repair Salad	0179868643848	28.36	14.81	daily	Aisle 16 - Shelf 3	5
45	Fantastic Granite Shoes	7676731638008	28.29	21.16	monthly	Aisle 15 - Shelf 3	3
46	Fantastic Granite Cheese	5245478705469	93.88	\N	daily	Aisle 5 - Shelf 4	3
47	Shoes	9749600313639	9.81	\N	weekly	Aisle 17 - Shelf 7	1
48	Practical Pants	3602621812443	65.58	\N	weekly	Aisle 4 - Shelf 6	3
49	Sausages	5629894319132	93.07	52.0	monthly	Aisle 18 - Shelf 5	3
50	Sleek Soap	2093470489565	40.61	\N	monthly	Aisle 18 - Shelf 3	5
\.

COPY transactions FROM stdin;
1	31	20	Sale	2024-11-01 22:59:07.189638	122.03	Space least choice social five accept blue.
2	49	1	Rental	2024-11-22 10:55:01.526508	159.43	Tv road perhaps beautiful read.
3	47	9	Rental	2024-04-14 02:33:20.797077	389.6	Resource spring their direction pressure election share.
4	33	17	Rental	2024-11-11 17:47:01.384588	250.22	Trouble major stop model mean prove.
5	28	8	Return	2024-06-16 19:38:02.795334	244.43	Performance beat this enjoy after yeah.
6	4	1	Rental	2024-02-22 04:00:01.895758	330.67	Little age nature course.
7	42	10	Rental	2024-04-23 04:07:50.391961	489.75	Family bill treat know.
8	48	18	Rental	2024-10-04 19:37:40.311776	294.17	That gun usually late parent catch course.
9	45	13	Rental	2024-06-10 10:38:06.415696	485.45	Force lose fly success.
10	25	20	Return	2024-04-25 19:02:07.780638	459.79	Lose same catch thing response agreement.
11	48	16	Return	2024-04-25 09:22:32.980771	465.43	Plant off industry really.
12	16	16	Sale	2024-06-13 02:57:05.819755	210.31	Eight thing reflect prevent.
13	19	8	Return	2024-10-28 13:50:21.944662	353.67	Computer move above close.
14	22	8	Return	2024-04-26 20:57:15.309832	136.76	Remain worry change air green.
15	28	5	Rental	2024-02-12 22:09:08.325404	56.47	Few amount southern your at back.
16	32	1	Return	2024-09-17 03:09:16.193854	204.37	Accept pattern young appear majority make source.
17	10	15	Sale	2024-12-15 22:26:24.280406	454.59	Watch church poor price.
18	11	8	Rental	2024-01-05 15:07:20.354733	164.85	Race already ahead loss same.
19	22	13	Rental	2024-07-04 05:26:32.922664	31.63	Music put leg seem.
20	46	13	Rental	2024-07-01 20:05:53.914224	334.4	Policy pull time affect sign start billion.
21	2	17	Sale	2024-08-29 15:26:46.060725	349.79	Far nothing employee mean.
22	6	2	Sale	2024-03-06 01:03:36.357301	196.3	Executive fish maintain.
23	24	1	Rental	2024-08-10 23:14:11.750472	481.48	Skin nice build him east great something hotel.
24	13	8	Rental	2024-03-24 10:29:57.757277	379.37	Scientist decide avoid perform organization notice.
25	43	2	Return	2024-04-05 05:24:40.296772	150.73	Here class behavior four.
26	12	14	Rental	2024-08-13 08:39:18.660565	77.24	Sometimes itself data book serious couple series capital.
27	8	7	Rental	2024-11-10 02:39:37.703400	204.67	Guy manage think down data nation myself number.
28	20	4	Sale	2024-03-08 22:21:07.133925	484.4	Raise establish recent college true.
29	27	7	Rental	2024-05-06 10:49:06.928351	325.15	Life training family save purpose join worker job.
30	17	16	Rental	2024-11-19 18:36:49.755465	332.74	Street several indeed also become open.
31	19	13	Return	2024-11-14 08:43:17.308758	32.63	Blood few have no.
32	47	17	Return	2024-12-12 01:12:52.579498	459.86	Finally end call season special style fund bit.
33	34	19	Return	2024-12-04 05:08:22.548678	394.45	National teacher mean despite.
34	34	13	Rental	2024-10-08 11:21:02.406745	469.08	Present politics friend growth message enter.
35	7	20	Return	2024-09-05 09:28:23.396513	364.66	View draw point machine professor.
36	35	4	Sale	2024-07-24 09:52:02.130058	214.2	Claim challenge billion your doctor pull.
37	3	1	Sale	2024-06-27 10:53:11.904119	164.59	Appear time shoulder side success least might.
38	45	10	Sale	2024-02-22 13:56:56.500692	234.16	Inside road seem red can conference various whatever.
39	10	18	Rental	2024-08-19 11:59:46.856828	135.03	Director material beat property shoulder artist.
40	7	14	Return	2024-09-14 10:37:09.590910	394.55	Very spend media hear build morning.
41	26	10	Sale	2024-08-28 14:56:44.863271	295.66	Figure sometimes then manager none.
42	17	13	Sale	2024-03-30 21:47:14.625391	50.89	Threat friend low human another.
43	14	7	Return	2024-11-17 17:48:31.884007	174.19	As add dinner bar.
44	19	6	Sale	2024-07-08 00:37:38.184280	26.79	Certain early throughout good agent.
45	19	12	Sale	2024-06-23 23:31:03.640362	336.33	Cell level his score today feel mission.
46	43	17	Sale	2024-08-08 14:26:04.329524	498.75	Responsibility lose rather however among hope.
47	26	2	Sale	2024-05-23 03:10:07.740827	420.66	Structure one generation order government film.
48	14	11	Return	2024-04-19 12:57:04.737519	212.81	Ready let more religious.
49	15	14	Return	2024-06-23 11:17:05.368718	215.08	Media safe they plan after my provide.
50	37	3	Rental	2024-02-02 06:31:05.703618	19.03	According also bring onto per market fear.
51	49	3	Rental	2024-03-10 18:08:31.327135	32.68	Measure best community across like experience as.
52	22	16	Rental	2024-03-26 09:17:53.875899	321.79	Power none discussion sense face.
53	4	6	Sale	2024-10-18 22:49:32.730216	490.89	Price mean technology pull.
54	13	11	Return	2024-12-08 20:02:10.607357	216.26	Cultural surface majority free born.
55	19	5	Rental	2024-05-27 01:55:26.162600	183.31	Official hit threat similar concern positive.
56	39	5	Sale	2024-06-19 06:28:22.486034	98.24	Industry free every surface natural.
57	13	12	Sale	2024-05-09 08:34:19.307976	30.91	What theory enough cultural management expect.
58	23	5	Return	2024-10-25 16:00:41.270648	219.17	Plant push education popular evening might.
59	12	14	Sale	2024-12-05 20:42:00.464917	300.81	Star over compare modern cut speech.
60	35	13	Return	2024-08-28 15:16:43.944784	315.42	Key skill big population determine away.
\.

COPY rentals FROM stdin;
1	49	2024-10-22 05:32:17.315691	2024-11-08 15:17:16.671484	2024-10-22 05:32:17.315691	2024-11-08 15:17:16.671484	17 days, 9:44:59.355793
2	50	2024-07-10 13:08:36.665407	2024-08-17 10:27:49.065628	2024-07-10 13:08:36.665407	2024-08-17 10:27:49.065628	37 days, 21:19:12.400221
3	17	2024-06-19 07:24:12.272996	2024-07-13 08:36:48.155990	2024-06-19 07:24:12.272996	2024-07-13 08:36:48.155990	24 days, 1:12:35.882994
4	60	2024-06-16 01:11:02.127862	2024-07-07 12:31:08.756719	2024-06-16 01:11:02.127862	2024-07-07 12:31:08.756719	21 days, 11:20:06.628857
5	8	2024-01-07 22:19:25.038395	2024-11-27 19:24:39.465769	2024-01-07 22:19:25.038395	2024-11-27 19:24:39.465769	324 days, 21:05:14.427374
6	60	2024-03-31 22:24:21.013417	2024-06-12 00:04:16.626114	2024-03-31 22:24:21.013417	2024-06-12 00:04:16.626114	72 days, 1:39:55.612697
7	52	2024-04-01 16:00:51.230341	2024-04-21 15:12:47.311876	2024-04-01 16:00:51.230341	2024-04-21 15:12:47.311876	19 days, 23:11:56.081535
8	13	2024-11-24 22:42:36.076653	2024-11-27 19:20:42.081830	2024-11-24 22:42:36.076653	2024-11-27 19:20:42.081830	2 days, 20:38:06.005177
9	46	2024-06-12 12:52:05.508162	2024-08-24 13:24:20.711523	2024-06-12 12:52:05.508162	2024-08-24 13:24:20.711523	73 days, 0:32:15.203361
10	60	2024-07-27 23:38:40.742496	2024-11-05 17:41:10.911722	2024-07-27 23:38:40.742496	2024-11-05 17:41:10.911722	100 days, 18:02:30.169226
11	32	2024-05-26 23:59:31.273943	2024-06-22 20:27:56.589433	2024-05-26 23:59:31.273943	2024-06-22 20:27:56.589433	26 days, 20:28:25.315490
12	21	2024-02-06 09:00:39.876759	2024-08-19 12:01:33.787755	2024-02-06 09:00:39.876759	2024-08-19 12:01:33.787755	195 days, 3:00:53.910996
13	36	2024-12-05 12:58:29.695365	2024-12-07 06:37:19.508875	2024-12-05 12:58:29.695365	2024-12-07 06:37:19.508875	1 day, 17:38:49.813510
14	31	2024-09-04 19:07:42.797423	2024-10-02 22:08:22.363613	2024-09-04 19:07:42.797423	2024-10-02 22:08:22.363613	28 days, 3:00:39.566190
15	24	2024-06-12 06:03:10.060741	2024-11-11 02:02:20.844152	2024-06-12 06:03:10.060741	2024-11-11 02:02:20.844152	151 days, 19:59:10.783411
16	59	2024-05-02 06:21:51.643284	2024-11-26 00:11:56.881904	2024-05-02 06:21:51.643284	2024-11-26 00:11:56.881904	207 days, 17:50:05.238620
17	43	2024-10-23 05:00:10.771328	2024-10-28 04:40:47.187539	2024-10-23 05:00:10.771328	2024-10-28 04:40:47.187539	4 days, 23:40:36.416211
18	10	2024-11-04 04:03:14.727847	2024-11-06 11:06:44.144086	2024-11-04 04:03:14.727847	2024-11-06 11:06:44.144086	2 days, 7:03:29.416239
19	48	2024-08-08 11:05:58.803392	2024-08-29 21:41:11.218263	2024-08-08 11:05:58.803392	2024-08-29 21:41:11.218263	21 days, 10:35:12.414871
20	18	2024-08-16 07:21:08.478049	2024-08-27 05:32:06.753006	2024-08-16 07:21:08.478049	2024-08-27 05:32:06.753006	10 days, 22:10:58.274957
21	54	2024-02-24 21:51:16.256449	2024-10-21 05:51:18.561430	2024-02-24 21:51:16.256449	2024-10-21 05:51:18.561430	239 days, 8:00:02.304981
22	26	2024-04-02 05:39:49.109801	2024-04-27 07:32:05.064690	2024-04-02 05:39:49.109801	2024-04-27 07:32:05.064690	25 days, 1:52:15.954889
23	55	2024-09-20 05:27:12.896785	2024-09-23 03:59:45.695031	2024-09-20 05:27:12.896785	2024-09-23 03:59:45.695031	2 days, 22:32:32.798246
24	35	2024-07-19 23:14:51.044505	2024-10-18 22:33:27.422140	2024-07-19 23:14:51.044505	2024-10-18 22:33:27.422140	90 days, 23:18:36.377635
25	18	2024-01-25 15:25:10.135688	2024-09-20 08:15:45.169797	2024-01-25 15:25:10.135688	2024-09-20 08:15:45.169797	238 days, 16:50:35.034109
26	26	2024-08-13 06:33:43.373324	2024-09-08 19:01:06.847440	2024-08-13 06:33:43.373324	2024-09-08 19:01:06.847440	26 days, 12:27:23.474116
27	54	2024-01-23 19:16:51.792275	2024-10-25 15:13:25.309392	2024-01-23 19:16:51.792275	2024-10-25 15:13:25.309392	275 days, 19:56:33.517117
28	20	2024-05-23 19:00:07.340401	2024-09-12 02:00:23.026675	2024-05-23 19:00:07.340401	2024-09-12 02:00:23.026675	111 days, 7:00:15.686274
29	38	2024-01-02 23:21:46.175665	2024-02-16 21:45:45.970719	2024-01-02 23:21:46.175665	2024-02-16 21:45:45.970719	44 days, 22:23:59.795054
30	34	2024-07-23 05:34:41.030561	2024-09-12 10:13:48.604865	2024-07-23 05:34:41.030561	2024-09-12 10:13:48.604865	51 days, 4:39:07.574304
\.

