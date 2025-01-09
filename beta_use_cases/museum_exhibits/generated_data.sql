SET search_path="Museum Exhibits";

COPY "Locations" FROM stdin;
1	Museum Location 1	3342 Thomas Walk Suite 970 Mitchellville, NM 52630
2	Museum Location 2	312 Jared Ford Suite 913 South Nicholas, OH 72577
3	Museum Location 3	59689 Brianna Flats Schmidtfort, MP 28349
4	Museum Location 4	97612 Janice Isle Suite 251 Smithtown, AS 12945
5	Museum Location 5	3120 Scott Rapid Apt. 766 North Rebeccaburgh, TN 32185
\.

COPY "Collections" FROM stdin;
1	Modern Paintings Collection	Thousand whole last certainly leader dog.
2	Ancient Sculptures Collection	Sign student would evidence detail short.
3	Historic Sculptures Collection	World mother while across big feel.
4	Exquisite Paintings Collection	More city difficult Republican ask play.
5	Rare Artifacts Collection	Wife yes thing ball long camera that.
6	Exquisite Artifacts Collection	Its road them significant serious.
7	Historic Artifacts Collection	Affect own vote article really above fast.
8	Exquisite Relics Collection	Strong next water involve perform.
9	Ancient Art Collection	Ground apply feeling wrong benefit sell.
10	Historic Vases Collection	Radio south study goal much.
\.

COPY "Acquisition Types" FROM stdin;
1	Donation	However market few citizen deep measure senior.
2	Purchase	Near consider police.
3	Bequest	Even then sing continue machine.
4	Loan	Lawyer both boy body water pick itself despite.
5	Exchange	Contain ten stay analysis word military attorney.
\.

COPY "Exhibits" FROM stdin;
1	Exquisite Sculptures Exhibit	2025-01-01	2025-02-02	2	True	Such give grow drive their character. Mouth scene measure modern deep ability free.
2	Historic Manuscripts Exhibit	2025-01-07	2025-05-17	5	True	Threat eye up line front worker red response. Fight option study fear director role show.
3	Modern Relics Exhibit	2025-01-03	2025-04-25	2	True	Thank while need half. Score he thank southern community whole. Small art knowledge crime.
4	Exquisite Vases Exhibit	2025-01-07	\N	1	True	Fire occur garden ago feel wide. Stage them instead lose college discuss reveal.
5	Modern Art Exhibit	2025-01-01	2025-04-16	4	True	Large huge could research happy responsibility car.
6	Ancient Paintings Exhibit	2025-01-02	2025-01-07	2	True	Study human view sometimes. School card what.
7	Historic Art Exhibit	2025-01-08	2025-01-30	4	True	Idea prevent my indeed this yet. Big audience today popular media.
8	Rare Vases Exhibit	2025-01-02	2025-03-05	2	True	Fall require activity science ability. Music term red.
9	Rare Artifacts Exhibit	2025-01-05	2025-04-21	2	True	For doctor point. Tough serve grow water avoid determine. Increase near glass southern fly.
10	Historic Paintings Exhibit	2025-01-08	2025-06-02	4	False	Simply skin billion clearly option table determine. Detail whole to later type short.
11	Historic Manuscripts Exhibit	2025-01-06	2025-06-22	4	False	Return help deep me family. Plan response send contain subject.
12	Rare Paintings Exhibit	2025-01-08	2025-01-31	2	True	Cultural even run yes with.
13	Exquisite Relics Exhibit	2025-01-03	2025-01-19	4	False	Loss any represent window now argue. Training into majority rise person respond thought.
14	Historic Artifacts Exhibit	2025-01-01	\N	4	True	Reveal member which without everyone green fear. Beyond me view quality seem.
15	Ancient Art Exhibit	2025-01-04	2025-04-27	3	True	Child best business conference system. Face us work. Detail note body during sure feel often bar.
\.

COPY "Items" FROM stdin;
1	Ancient Artifacts	7861969220297	2025-01-05	3	2	15
2	Ancient Vases	8820074493636	2025-01-01	5	9	4
3	Ancient Artifacts	2625026956919	2025-01-01	5	10	12
4	Historic Bowls	8695494022694	2025-01-08	1	1	\N
5	Ancient Sculptures	8518672551345	2025-01-07	1	10	13
6	Historic Paintings	3630925335627	2025-01-03	2	2	\N
7	Historic Paintings	8069955695053	2025-01-06	5	6	11
8	Ancient Bowls	3505984304054	2025-01-03	4	7	\N
9	Exquisite Manuscripts	7526113518926	2025-01-06	2	4	10
10	Historic Paintings	2125602538121	2025-01-02	1	1	2
11	Modern Relics	4707548142853	2025-01-01	2	7	8
12	Ancient Artifacts	1532720226921	2025-01-05	4	1	\N
13	Rare Bowls	8058055853272	2025-01-06	4	1	9
14	Rare Relics	1999697582984	2025-01-04	5	10	\N
15	Modern Artifacts	0695161049687	2025-01-06	1	3	11
16	Historic Sculptures	1846493212600	2025-01-04	2	5	\N
17	Exquisite Paintings	4074847383493	2025-01-05	5	2	8
18	Rare Relics	8540721566970	2025-01-02	4	6	12
19	Ancient Vases	0963776290450	2025-01-01	5	2	9
20	Rare Sculptures	3833419958528	2025-01-05	5	8	1
21	Rare Sculptures	0950298840362	2025-01-08	5	9	13
22	Ancient Art	0818100697606	2025-01-03	1	2	\N
23	Exquisite Paintings	6690314200704	2025-01-07	3	2	10
24	Exquisite Bowls	5606147743654	2025-01-06	2	5	11
25	Modern Paintings	3813534602704	2025-01-06	2	9	\N
26	Rare Paintings	6721744958290	2025-01-07	5	10	2
27	Historic Art	9485048537991	2025-01-07	3	8	11
28	Historic Artifacts	9735752321639	2025-01-01	3	6	\N
29	Rare Manuscripts	0327009188684	2025-01-07	5	1	8
30	Rare Paintings	3876964658185	2025-01-07	3	4	\N
31	Historic Paintings	3572359527899	2025-01-03	5	1	15
32	Ancient Relics	6759492550756	2025-01-04	3	9	\N
33	Rare Relics	1140458904167	2025-01-07	5	10	3
34	Exquisite Art	1465923516349	2025-01-05	5	1	14
35	Historic Vases	3287812094565	2025-01-04	1	3	\N
36	Exquisite Sculptures	1662516081011	2025-01-05	4	7	\N
37	Exquisite Vases	7475174373947	2025-01-06	4	5	12
38	Rare Paintings	2599395429414	2025-01-02	4	4	13
39	Historic Art	3098942732209	2025-01-03	5	8	\N
40	Historic Art	6889724096872	2025-01-05	1	10	14
41	Exquisite Artifacts	4031573040526	2025-01-08	3	10	9
42	Rare Artifacts	5495800649989	2025-01-03	4	8	\N
43	Modern Manuscripts	5107602652059	2025-01-07	4	10	9
44	Ancient Artifacts	3348770363312	2025-01-03	5	10	5
45	Rare Art	9743628810767	2025-01-08	3	4	\N
46	Modern Artifacts	7318515963097	2025-01-07	4	6	\N
47	Exquisite Paintings	8794344557673	2025-01-06	5	5	\N
48	Historic Sculptures	7775970437400	2025-01-06	2	10	\N
49	Ancient Artifacts	2825435332964	2025-01-04	1	7	\N
50	Modern Artifacts	4624956992552	2025-01-04	3	8	\N
\.

