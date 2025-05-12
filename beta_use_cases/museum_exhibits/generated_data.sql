SET search_path="Museum Exhibits";

COPY "Locations" FROM stdin;
1	Museum Location 1	96178 Shaw Station New Charles, SC 93243
2	Museum Location 2	20618 Krystal Park Suite 943 North Cherylmouth, WI 08589
3	Museum Location 3	9471 Cheryl Station Suite 488 Ramseyton, OR 12788
4	Museum Location 4	705 Butler Causeway Suite 166 Port Anthony, MO 73573
5	Museum Location 5	PSC 4330, Box 7699 APO AA 73204
\.

COPY "Collections" FROM stdin;
1	20Th Century Cubist Collection	Raise real yet Mrs. Decision thus shake least.
2	Renaissance Baroque Collection	Several travel determine decade son.
3	20Th Century Impressionist Collection	Yet national nice.
4	20Th Century Abstract Collection	Get continue television. From result late likely.
5	Renaissance Baroque Collection	College least apply put direction poor hospital.
6	19Th Century Modernist Collection	Country myself bit start anyone. Bed head edge.
7	20Th Century Cubist Collection	Wife administration leg garden glass Congress.
8	Ancient Cubist Collection	Fall hundred candidate peace sea record pattern.
9	19Th Century Impressionist Collection	Unit single interesting than.
10	Renaissance Baroque Collection	Green phone fish reality.
\.

COPY "Acquisition Types" FROM stdin;
1	Donation	Upon candidate center baby.
2	Purchase	Individual feel the particular.
3	Bequest	Great lawyer main heavy pick.
4	Loan	Task father attorney.
5	Exchange	Take check teacher talk again.
\.

COPY "Exhibits" FROM stdin;
1	The Evolution Of Butterfly Sketches	2025-01-11	2025-05-15	3	False	Everything majority less. South crime open start.
2	Perspectives On The Home Manuscript	2025-01-11	2025-03-08	5	False	Save for prepare group human some wind. Claim future base she.
3	The Evolution Of The Home Sculpture	2025-01-12	\N	1	False	Professor from certain enter sound he suggest.
4	Liminal Retreat In Urban Landscapes Sculpture	2025-01-04	2025-07-04	2	True	Color project world three public.
5	Reclaiming The Landscape Sculpture	2025-01-10	\N	3	True	Approach including modern success whole. Unit market least yard life inside agreement.
6	Silence: Exploring Landscape Portrait Series	2025-01-02	2025-03-08	1	True	Understand remain perhaps people hit since. Simple dog sister somebody.
7	Silence: Exploring Butterfly Vase	2025-01-04	2025-07-09	3	True	From another talk quality nor minute option. East officer sort rock significant bank network.
8	Decontextualizing Isolation Sketches	2025-01-15	2025-05-22	1	False	Able soon necessary upon color chair run. Which concern believe necessary.
9	Perspectives On The Home Artifact	2025-01-02	2025-05-02	5	False	His bank human never newspaper discussion. Use itself wish.
10	Silence: Exploring The Home Pot	2025-01-06	2025-07-09	4	False	Avoid meet ball study.
11	Perspectives On Bird Sculpture	2025-01-15	2025-07-06	2	True	Open strong go.
12	Reclaiming The Urban Landscapes Portrait Series	2025-01-09	2025-04-19	5	False	Though save cover indeed case hear write. Approach get a audience forward his wonder.
13	Perspectives On Urban Landscapes Vase	2025-01-01	2025-03-12	3	False	Heart cause outside argue sort her sing. However board employee.
14	Reclaiming The Butterfly Portrait Series	2025-01-02	2025-05-05	1	True	Information treat story food relationship rule. Ball recognize cold investment mind.
15	Perspectives On Butterfly Sculpture	2025-01-01	\N	4	True	Of mean choice staff you. Cost price course series your. Expert size allow create.
\.

COPY "Items" FROM stdin;
1	Bronze vase	1862193314406	2025-01-05	3	\N
2	Landscape weathered baroque portrait series	9535874743896	2025-01-05	3	6
3	Baroque asian bronze vase	4800379049251	2025-01-06	1	\N
4	Philosophical medieval egyptian manuscript	6379059931400	2025-01-09	3	7
5	Baroque asian vase	9933923670481	2025-01-08	5	5
6	Polished asian painting	0144935136233	2025-01-06	3	2
7	Weathered greek modernist portrait series	7268749722130	2025-01-09	5	7
8	Baroque medieval european bowl and plate	2275542342859	2025-01-02	5	\N
9	Isolation weathered modernist butterfly drawing	5388368939145	2025-01-11	2	\N
10	Baroque roman pen bowl and plate	6414803832043	2025-01-01	4	14
11	Impressionist portrait series	0029966751542	2025-01-03	1	\N
12	Philosophical 20th century manuscript	6586913183244	2025-01-10	4	11
13	The home weathered egyptian landscape drawing	1516486210936	2025-01-04	3	\N
14	The home cubist medieval european clay bowl and plate	3938295034066	2025-01-13	4	\N
15	Ancient artifact	7984733976401	2025-01-14	3	\N
16	Rough painting	9480842383768	2025-01-13	2	\N
17	Literary 20th century roman manuscript	8075779896132	2025-01-09	4	12
18	Rough greek impressionist portrait series	0003882794715	2025-01-07	3	13
19	Polished egyptian baroque portrait series	1933437898119	2025-01-11	4	14
20	Landscape roman modernist landscape drawing	4354869487967	2025-01-07	3	15
21	Clay sculpture	6001343163166	2025-01-15	4	12
22	Baroque sculpture	8196716726333	2025-01-12	5	11
23	Landscape medieval european sculpture	9074954082819	2025-01-14	5	\N
24	Rough medieval european cubist portrait series	4886834291786	2025-01-05	5	\N
25	Urban landscapes roman pot	2692004359925	2025-01-02	2	13
26	Landscape charcoal artifact	2383142547670	2025-01-01	4	12
27	Weathered cubist portrait series	9540678654064	2025-01-14	3	15
28	The home egyptian pot	7154717552949	2025-01-12	1	\N
29	The home cubist pot	2218589397260	2025-01-13	3	3
30	Isolation smooth medieval european modernist painting	3499690477112	2025-01-14	1	12
31	Landscape medieval european impressionist painting	5221016819300	2025-01-12	1	\N
32	Abstract roman vase	9188117485055	2025-01-15	2	5
33	Urban landscapes scientific polished asian baroque sketches	2375255060412	2025-01-04	4	\N
34	The home 19th century artifact	9567257514625	2025-01-02	4	12
35	Medieval european painting	0424561107495	2025-01-09	1	7
36	Bird abstract asian charcoal vase	1020427654432	2025-01-02	1	6
37	Bird cubist roman marble bowl and plate	5633822694994	2025-01-11	1	\N
38	Baroque pot	6399700317773	2025-01-10	3	\N
39	Cubist egyptian pot	1939386479751	2025-01-01	3	\N
40	Scientific 19th century asian manuscript	5012449018725	2025-01-02	2	12
41	Egyptian baroque wood sculpture	3923255267295	2025-01-05	2	\N
42	Asian impressionist portrait series	1364389777274	2025-01-15	1	13
43	Ancient greek artifact	6729603764594	2025-01-14	3	\N
44	Religious ancient roman manuscript	7533693134972	2025-01-06	2	\N
45	Bird weathered greek baroque painting	6604095702333	2025-01-02	1	10
46	Bird cubist pot	1439136675278	2025-01-02	3	2
47	Medieval european vase	8903998365378	2025-01-14	5	\N
48	Bird roman bowl and plate	6659922405512	2025-01-08	4	\N
49	19th century asian artifact	1103195281151	2025-01-09	1	7
50	Landscape marble artifact	5726845015164	2025-01-03	1	13
\.

COPY "Item_Collections" FROM stdin;
1	6
1	4
1	3
2	10
2	6
3	4
4	5
5	9
5	10
5	5
6	9
6	1
6	3
7	6
7	8
7	2
8	6
9	1
10	7
10	2
11	2
11	7
11	10
12	1
12	5
13	5
13	4
14	1
14	7
15	1
15	4
16	4
16	6
16	7
17	6
17	4
17	8
18	5
19	5
20	2
20	10
20	7
21	9
22	10
23	1
23	9
24	7
25	10
25	2
25	6
26	4
27	9
28	9
29	8
29	3
29	1
30	7
31	2
31	7
32	7
32	1
33	2
33	4
34	7
34	9
35	1
35	3
36	5
37	7
38	3
39	8
40	1
41	2
41	4
41	6
42	8
42	10
43	4
43	6
44	3
44	5
44	6
45	5
45	2
45	3
46	6
46	4
47	2
47	1
47	10
48	7
48	2
49	5
50	4
50	9
50	7
\.

