SET search_path="Nonprofit Grant Tracking";

COPY "Grants" FROM stdin;
1	Mirandafurt Time to Read	Ever discover lay success. Popular yard site physical. Media push able foot us tend.	20560.71	2020-06-16	2024-09-22
2	South Paigefort Literacy Program	Rich lot determine worry story nor prove. Defense into these themselves improve base senior true.	38957.42	2022-05-19	2022-07-29
3	Calvinmouth Literacy Program	Century difference help seat.	36293.85	2023-02-23	2024-06-08
4	East Shawn Time to Read	International ability until friend interest. Ahead detail nation girl.	40919.9	2023-08-02	2022-07-09
5	Emilyburgh Building Readers	Such white movie instead happy why. Knowledge base leave trial. Paper director style might value development.	35555.2	2020-07-20	2024-09-18
6	Moniquefurt Building Readers	Wait community every least. Sit audience leave against center Republican.	7439.65	2021-07-20	2020-07-26
7	North Madisonside Building Readers	Station article stop throughout pass section. Military huge state seek serve opportunity modern.	27374.36	2024-02-05	2022-12-04
8	Ericland Building Readers	Wish discover happy your seem ago. Word rest federal network.	4744.98	2022-07-13	2024-01-17
9	South Kristen Community Reading Initiative	Join candidate site near none shake join. Data never air. Up management bag trip yeah.	8185.23	2024-08-10	2022-03-09
10	Barrymouth Time to Read	Ever challenge production challenge difficult same dinner. Close face form. Several window top discussion.	47852.93	2021-09-24	2022-02-20
11	West Shawnstad Time to Read	Science worry responsibility wide. System nor care once south meet.	45127.51	2021-10-02	2021-08-31
12	Kingland Read and Succeed	Worker kitchen evidence carry author.	20604.19	2021-05-08	2022-01-22
13	Moorebury Literacy Program	Old course born particularly either future. Short attorney direction point.	12723.6	2022-06-08	2020-03-10
14	Kimberlyport Literacy Program	Scientist few have much dinner church. Professor realize into. State because difference no gun health.	7436.28	2022-01-14	2024-08-28
15	Yoderton Building Readers	Mrs happy show could floor. Away term check.	15972.76	2022-07-09	2022-09-09
16	West James Time to Read	American money even with. Yes mother deep mission whom business. Increase property gun free field door.	25983.05	2020-03-31	2024-08-02
17	Fowlerfurt Read and Succeed	Place know dinner war become whom check. Article forward focus audience. Already man still music free cold.	24207.67	2021-06-24	2021-12-15
18	Garzabury Read and Succeed	Loss team main figure hit can. Begin senior rich about ten yet your. Just store arm herself both mention bed. Wish argue job sister.	21446.09	2024-03-07	2022-11-15
19	Holtview Community Reading Initiative	Station old place determine race. Responsibility history eat some two. Former pass glass adult social foreign myself.	31677.06	2021-02-25	2021-12-25
20	Lake Rebeccafurt Community Reading Initiative	Wait enough enjoy seem war tonight least. Discover water resource against everything region. Throughout detail listen generation do capital single.	24176.07	2020-10-25	2020-02-15
\.

COPY "Staff" FROM stdin;
1	Sarah Branch	Coordinator
2	James Cuevas	Administrator
3	Victoria Costa	Coordinator
4	Brian Clark	Administrator
5	David Peters	Finance Officer
6	Christina Price	Coordinator
7	Beth Shannon	Administrator
8	Marcus Cox	Program Manager
9	Mrs. Janet Mays	Administrator
10	Sarah Odom	Program Manager
11	Ellen Murphy	Program Manager
12	Kelly Russell	Administrator
13	Emma Shaw	Finance Officer
14	Renee Fox	Administrator
15	Timothy Martinez	Finance Officer
\.

COPY "Lifecycle Stages" FROM stdin;
1	Application Submitted	Career check better news artist power official. Art southern drop probably fast catch. Power agency red successful down give free teach.
2	Review Process	Natural last campaign call assume wind law. Everything office recently without law issue while.
3	Approved	Series commercial American money company. Catch success city laugh sister else.
4	Fund Disbursed	Ahead white treat small hundred drop after. Attack back fight tend shake. Lose many inside tree.
5	Implementation	Walk wide serious major wish yeah should. Compare approach read from drive.
6	Final Report	Often choice admit but. Likely south girl minute.
\.

COPY "Grant Lifecycle" FROM stdin;
1	17	3	8	2025-01-01 23:01:09.302967
2	2	2	4	2025-01-05 04:37:25.748302
3	9	1	9	2025-01-08 02:20:05.010619
4	15	2	3	2025-01-03 08:51:58.382561
5	13	2	3	2025-01-05 21:03:30.384342
6	8	2	12	2025-01-16 01:02:23.357373
7	19	4	4	2025-01-05 04:32:06.337236
8	19	3	11	2025-01-13 04:25:54.491900
9	3	3	1	2025-01-12 01:28:36.476066
10	18	2	3	2025-01-11 00:03:34.332647
13	12	6	10	2025-01-01 16:04:40.429566
14	18	4	12	2025-01-04 04:44:02.778167
15	10	3	6	2025-01-12 08:43:00.378012
16	2	6	4	2025-01-05 19:51:32.403716
17	18	3	10	2025-01-16 00:22:19.465580
18	16	2	10	2025-01-09 07:27:56.594906
19	3	6	14	2025-01-03 14:04:21.093857
20	4	6	6	2025-01-12 17:24:48.507572
21	16	5	3	2025-01-02 08:08:19.705695
22	15	5	1	2025-01-02 01:01:36.816840
23	12	2	1	2025-01-03 01:56:27.607091
25	1	1	4	2025-01-03 08:31:36.603785
27	9	5	4	2025-01-03 15:44:15.496038
28	8	4	4	2025-01-05 20:58:22.970851
29	1	2	12	2025-01-02 15:59:56.479601
30	17	5	14	2025-01-12 23:18:34.977835
31	3	5	1	2025-01-15 23:15:01.088765
32	14	6	3	2025-01-14 18:55:42.485923
33	10	1	4	2025-01-12 14:40:14.505989
34	19	1	3	2025-01-04 15:02:11.476928
35	1	5	12	2025-01-11 12:47:16.679809
36	10	6	13	2025-01-13 19:31:04.269175
37	20	6	13	2025-01-12 04:42:14.324461
39	8	6	7	2025-01-08 08:21:55.603816
40	3	2	15	2025-01-05 10:33:43.935986
42	6	2	13	2025-01-09 12:34:03.728249
43	13	5	4	2025-01-13 10:35:36.171886
44	1	4	1	2025-01-02 21:44:01.380399
46	13	4	10	2025-01-14 10:08:24.603706
47	10	5	15	2025-01-09 23:51:24.157053
48	11	6	4	2025-01-01 13:20:44.106455
49	17	2	15	2025-01-03 04:59:09.806400
50	6	1	15	2025-01-04 15:10:18.177152
\.

COPY "Grant Allocations" FROM stdin;
1	14	1924.67	3641.29
2	6	2473.16	104.72
3	13	3817.23	2404.98
4	20	1361.09	3137.25
5	20	1096.94	1493.9
6	3	2521.53	3811.58
7	13	3104.41	2965.79
8	10	2525.86	4488.7
9	13	3048.99	3507.54
10	7	4479.25	41.89
11	9	1823.97	806.5
12	8	2355.36	3418.43
13	15	1362.66	331.03
14	11	4592.34	1387.3
15	19	2734.38	2303.21
16	14	805.47	3123.89
17	6	1263.36	4151.05
18	16	2396.67	22.43
19	9	1387.45	2833.53
20	11	3392.78	3781.49
21	12	2459.42	756.17
22	7	1207.52	4768.76
23	2	3735.55	2242.26
24	5	2963.03	1080.31
25	13	1053.23	306.83
26	2	944.89	2397.22
27	12	1262.85	1476.51
28	9	3881.34	3624.98
29	11	2766.7	4755.4
30	1	4031.01	968.46
31	10	4752.34	3674.41
32	9	3542.73	4667.71
33	9	4985.84	2229.88
34	5	1108.8	1637.5
35	4	811.14	1024.91
36	14	1038.06	4343.46
37	9	4817.11	4700.2
38	19	2031.59	4446.95
39	12	1753.27	1965.34
40	5	3326.81	1000.13
\.

