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
1	Thomas Müller	Tom	\N
2	\N	\N	\N
3	Stefan	Stefan	\N
4	Isabel García	Isa	\N
5	\N	\N	\N
6	Carlo Bianchi	Carlo	\N
7	Juan Pérez	\N	\N
8	John Bianchi	John	\N
9	Kimiko Suzuki	Kimi	\N
10	Tatiana	\N	\N
11	Pablo Ramírez-Cortez	\N	\N
12	Ömer Demir	Ömer	\N
13	Sarah	Sarah	- Generally has been very active on our Matrix channel helping users troubleshoot problems.
14	François Dubois	Francis	\N
15	\N	\N	\N
16	Ricardo Sánchez	Ricky	\N
17	David Müller	Dave	\N
18	Yelena Ivanova	Yelena	Has published several popular data-related python packages
19	Marta Sánchez	\N	\N
20	Takeshi Tanaka	Takeshi	\N
21	Vanessa Fernández	Vane	\N
22	Hiroshi Tanaka	\N	\N
23	\N	\N	\N
24	Kazuo Tanaka	\N	\N
25	Victor Ivanov	\N	\N
26	Aylin Yılmaz	Aylin	\N
27	Laura Amanda García	\N	\N
28	Zaira Martínez	Zai	\N
29	Rafael García	Rafa	\N
30	Qiang Li	Qiang	\N
31	Carmen Ruiz	\N	\N
32	Boris Volkov	Borya	\N
33	Oscar Fernández	\N	\N
34	Amara Singh	\N	\N
35	Laila Khan	\N	\N
36	André Dubois	Andy	\N
37	Olivia Williams	Olivia	\N
38	Aiko Yamada	\N	\N
39	Susana Martínez	Susy	\N
40	Satoko Suzuki	\N	\N
41	Ayşe Yılmaz	\N	\N
42	Zofia Nowak	Zosia	\N
43	Ludwig Fischer	Ludwig	\N
44	\N	\N	\N
45	Ivanov Borislav	\N	\N
46	Verónica Sánchez	Vero	\N
47	Xiao Li	Xiaoxiao	\N
48	\N	\N	\N
49	Halima Ahmed	Lima	\N
50	Natalia Ivanova	Natasha	\N
\.

copy email from stdin;
1	2	gkm@abzm.co.biz	True	GitHub
2	4	isabel.garcia83@cryptomail.biz	True	Personal website
3	5	wheat.bear@aol.com	True	\N
4	6	carlo.bianchi88@ghostinbox.org	True	Personal website
5	7	juan.perez96@tempinbox.net	True	Survey
6	8	j.bianchi89@tmp.biz	True	Email newsletter signup
7	9	kimiko.suzuki85@gmail.com	True	Personal website
8	10	tatiana78@tempinbox.biz	True	GitHub Profile
9	11	pablo.ramirez-cortez83@tempinbox.net	True	website
10	14	francois.dubois95@tmp.org	True	unknown
11	16	ricardo.sanchez93@disposableinbox.net	True	survey
12	17	david.muller91@gmail.com	True	Help ticket
13	18	yelena.ivanova90@pseudomail.org	True	Git commit history
14	19	marta.sanchez84@yahoo.com	True	unknown
15	20	takeshi.tanaka80@tempmail.co	True	Personal website
16	21	vanessa.fernandez82@dummyinbox.biz	True	Personal website
17	22	hiroshi.tanaka89@fakebox.io	True	Git commit history
18	24	kazuo.tanaka87@gmail.com	True	\N
19	25	victor.ivanov85@gmail.com	True	\N
20	26	aylin.yilmaz82@discardmail.co	True	\N
21	27	laura.garcia91@fakebox.io	True	\N
22	27	lag@foocorp.com	False	\N
23	28	zaira.martinez90@gmail.com	True	\N
24	29	rafael.garcia87@fakemail.com	True	\N
25	30	qiang.li87@disposableinbox.co	True	\N
26	31	carmen.ruiz87@fake-mail.net	True	\N
27	32	boris.volkov94@example.org	True	\N
28	34	amara.singh79@hotmail.com	True	\N
29	34	asingh@mdph.net	False	\N
30	35	laila.khan75@dummyemail.org	True	\N
31	36	andre.dubois79@disposableinbox.co	True	\N
32	37	olivia.williams92@fakeemail.net	True	\N
33	38	aiko.yamada86@disposablemail.io	True	\N
34	39	susana.martinez81@fake-domain.com	True	\N
35	39	susan@susanamartinez.com	False	\N
36	40	satoko.suzuki88@cryptomail.biz	True	\N
37	42	zofia.nowak92@tmp.biz	True	\N
38	43	ludwig.fischer80@gmail.com	True	\N
39	46	veronica.sanchez80@protonmail.com	True	\N
40	47	xiao.li88@github.com	True	\N
\.

copy website_type from stdin;
1	GitHub profile
2	Reddit profile
3	Personal website
4	Reddit Profile
\.

copy website from stdin;
1	4	https://isabelgarcia.com	3
2	6	https://www.carlobianchi.com	3
3	7	https://juanperez.com	3
4	8	https://github.com/bianchi	1
5	9	https://www.kimikosuzuki.com	3
6	10	https://www.tatiana.com	3
7	11	https://reddit.com/u/pabloramirezcortez	4
8	11	https://pabloramirezcortez.com/	3
9	14	https://francoisdubois.com	3
10	15	https://github.com/onefooboo	1
11	16	https://ricardosanchez.com	3
12	17	https://davidmuller.com	3
13	18	https://github.com/yelenaivanova	1
14	18	https://yelenaivanova.net/	3
15	19	https://www.martasanchez.com	3
16	20	https://www.takeshitanaka.com	3
17	21	https://vanessafernandez.com	3
18	22	https://www.hiroshitanaka.com	3
19	23	https://github.com/graysky	1
20	24	https://github.com/kazuotanaka	1
21	25	https://www.victorivanov.com	3
22	26	https://aylinyilmaz.com	3
23	28	https://zairamartinez.com	3
24	29	https://www.rafaelgarcia.com	3
25	30	https://reddit.com/u/qiangli	4
26	31	https://github.com/carmenruiz	1
27	32	https://reddit.com/u/borisvolkov	4
28	34	https://github.com/amarasingh	1
29	35	https://github.com/lailakhan	1
30	36	https://reddit.com/u/andredubois	4
31	37	https://www.oliviawilliams.com	3
32	38	https://github.com/aikoyamada	1
33	39	https://www.susanamartinez.com	3
34	40	https://satokosuzuki.com	3
35	42	https://zofianowak.com	3
36	43	https://ludwigfischer.com	3
37	44	https://github.com/catmonkey91	1
38	46	https://github.com/veronicasanchez	1
39	47	https://github.com/xiaoli	1
40	48	https://reddit.com/u/nobodyherebutmeee	2
\.

copy interaction from stdin;
1	7	2024-01-22	Intro call	- Started the call with a brief introduction, exchanged pleasantries. Mark seemed friendly and enthusiastic about discussing the app concept.\n    \n- Mark began by describing his role as a software developer in a small startup specializing in e-commerce solutions. He emphasized the fast-paced nature of his work and the need for efficient project management tools.\n    \n- Asked Mark about his current workflow and pain points. He mentioned struggling with task prioritization, team collaboration, and keeping track of deadlines amidst constant project iterations.\n    \n- Mark expressed frustration with existing project management tools, citing their complexity and lack of customization options. He prefers simple, flexible solutions that adapt to his team's evolving needs.\n    \n- Discussed potential features of the app. Mark showed particular interest in:\n    \n    - Kanban-style task boards for visual project tracking.\n    - Customizable task labels and tags for organizing tasks based on priority and project phase.\n    - Integration with version control systems like Git for seamless code collaboration.\n    - Automated progress reports and notifications to keep the team informed about project updates.\n- Asked Mark about his experience with similar apps. He mentioned using Trello and Jira but found them overly complex for his team's needs. He's open to exploring new alternatives that offer a better balance between simplicity and functionality.\n    \n- Shared a brief overview of our app concept and how it aims to address the pain points Mark described. He seemed intrigued and requested more information about the app's development timeline and potential pricing model.\n    \n- Mark expressed interest in participating in beta testing to provide feedback and suggested reaching out to other developers in his network who might benefit from the app.\n    \n- Ended the call with a summary of action items:\n    \n    - Follow up via email with more details about the app's development roadmap and beta testing opportunities.\n    - Schedule a follow-up call with Mark to discuss any further questions or feedback he may have.\n\n**Key Takeaways:**\n\n- Mark's feedback highlights the importance of simplicity and flexibility in designing the app's user interface and feature set.\n- Integrating with popular developer tools like Git is crucial for meeting the needs of tech-savvy users like Mark.\n- Engaging with potential users like Mark early in the development process is essential for shaping the app's functionality and ensuring market fit.
2	8	2024-01-17	User Call	"**User:** John D., 43, software engineer, Chicago townhouse\n\n**Call started:** 10:02 AM EST\n\n**John:** ""Hey, thanks for taking my call! So, this EcoGro app... sounds pretty cool.""\n\n**Me:** ""Thanks for joining, John! Absolutely, tell me what you think.""\n\n**John:** ""I'm a total plant newbie, but my wife LOVES herbs. Problem is, our townhouse gets like, zero sunlight.""\n\n**Me:** (makes mental note: sunlight pain point) ""Hmm, I understand. Does EcoGro help with limited light situations?""\n\n**John:** ""Not sure yet, but the app itself looks slick. I like the plant pics and badges for growing stuff.""\n\n**Me:** ""Glad you think so! We wanted it to be fun and engaging.""\n\n**John:** ""Okay, so back to my no-sun problem. Can it still suggest stuff I can grow?""\n\n**Me:** ""We offer personalized recommendations, but sunlight is definitely a factor. I can check with the team...""\n\n**John:** ""Awesome! Listen, my wife would probably flip for a pre-made herb kit. Like, starter stuff that's already picked out.""\n\n**Me:** (eyes widen) ""Interesting! We haven't explored that yet, but it's a great idea. We could partner with plant suppliers...""\n\n**John:** ""Exactly! Imagine, pre-potted, ready-to-grow herbs, customized for our sad, dark townhouse... she'd be ecstatic.""\n\n**Me:** ""John, you might be onto something revolutionary here. Let me run this by the product team, see if it's feasible.""\n\n**John:** (laughs) ""Revolutionize my wife's herb garden? Sounds good to me. But seriously, keep me updated, I'm genuinely interested.""\n\n**Me:** ""Absolutely! Speaking of updates, any other feedback on the app itself?""\n\n**John:** ""Honestly, just more plant variety would be great. And maybe some tips for brown thumbs like me... like, what NOT to do?""\n\n**Me:** ""Noted! We're constantly adding new plants, and beginner guides are definitely on the roadmap.""\n\n**John:** ""Sounds good. Hey, one last thing: my wife loves sharing stuff on social media. Could EcoGro integrate with that somehow?""\n\n**Me:** (scribbles furiously) ""Another fantastic suggestion! Sharing successes and connecting with other plant lovers... that could be huge.""\n\n**John:** ""Right? Okay, gotta run, but keep me in the loop, Plant Whisperer!""\n\n**Me:** (chuckles) ""Will do, John! Thanks for the invaluable feedback. Talk soon.""\n\n**Call ended:** 10:32 AM EST\n\n**Takeaways:**\n\n- John represents a key user segment (beginners, limited light).\n- Pre-made herb kit idea has major potential, needs exploration.\n- More plant variety and beginner guides are in high demand.\n- Social media integration could boost engagement and virality.\n\n**Next steps:**\n\n- Discuss pre-made kit concept with product & supply chain teams.\n- Prioritize adding more plant varieties and beginner content.\n- Explore potential social media integration options.\n- Schedule follow-up call with John to test new features and get further feedback.\n\n**Overall, this call was incredibly fruitful. John's enthusiasm and specific suggestions provided valuable insights that will shape the future of EcoGro. Keeping him engaged and involved will be key to our success.**"
3	10	2023-10-09	User interview	**Key Points Discussed:**\n\n1. **User Profile:** Tatiana is a 28-year-old graphic designer freelancing from home. She is highly organized and prefers tools that streamline her workflow.\n    \n2. **Pain Points:**\n    \n    - Current apps lack integration with her existing productivity tools (Adobe Creative Suite, Trello, Google Calendar).\n    - Difficulty in managing client communication and project deadlines simultaneously.\n    - Desire for a centralized platform to track project progress and collaborate with clients.\n3. **Feature Wishlist:**\n    \n    - Integration with popular productivity tools for seamless workflow management.\n    - Visual timeline for project milestones and deadlines.\n    - In-app communication functionality to streamline client interactions.\n    - Ability to share project progress with clients in real-time.\n    - Customizable templates for different project types (logos, website designs, branding).\n4. **Competitor Analysis:**\n    \n    - Tatiana currently uses Asana and Slack but finds the workflow disjointed.\n    - She's open to exploring new apps that offer a more cohesive experience tailored to her needs.\n5. **Feedback on App Concept:**\n    \n    - Tatiana expresses enthusiasm for the proposed app concept, highlighting its potential to address her pain points effectively.\n    - Emphasizes the importance of a user-friendly interface and intuitive navigation.\n    - Eager to participate in beta testing and provide further feedback during development.\n\n**Next Steps:**\n\n1. **Internal Meeting:** Discuss Tatiana's feedback with the development team to refine feature prioritization and roadmap planning.\n    \n2. **Prototype Development:** Start prototyping core features based on user requirements, focusing on seamless integration with existing productivity tools and intuitive UX/UI design.\n    \n3. **Beta Testing:** Reach out to Tatiana and other potential users for beta testing once the prototype is ready, gathering additional insights for iteration and improvement.\n    \n4. **Regular Updates:** Maintain open communication with Tatiana throughout the development process, keeping her informed about milestones and seeking feedback at key stages.\n    \n\n**Additional Notes:**\n\n- Tatiana's feedback reaffirms the market demand for a comprehensive project management solution tailored to the needs of creative professionals.\n- Integration with third-party APIs will be crucial for enhancing the app's functionality and interoperability with existing tools in Tatiana's workflow.
4	6	2024-01-17	User interview session	During our call with Carlo, we aimed to gain a comprehensive understanding of his needs and requirements for our data-oriented product. Carlo was enthusiastic and engaged throughout the discussion, providing valuable insights into his workflow and pain points.\n\n**Background:**\n\nCarlo is currently working as a data analyst for a medium-sized marketing agency specializing in digital advertising campaigns. He emphasized the increasing complexity and volume of data they handle on a daily basis, highlighting the need for efficient tools to streamline their analytical processes.\n\n**Key Points Discussed:**\n\n1. **Data Integration Challenges:**\n    \n    Carlo expressed frustration with the disparate sources of data they deal with, including website analytics, social media metrics, and ad campaign performance data. Integrating these sources manually is time-consuming and error-prone, leading to inefficiencies in their workflow.\n    \n2. **Data Cleaning and Preparation:**\n    \n    A significant portion of Carlo's time is spent cleaning and preparing data for analysis. He highlighted the importance of tools that can automate this process to ensure data accuracy and consistency.\n    \n3. **Visualization and Reporting:**\n    \n    Carlo emphasized the need for intuitive visualization tools that can translate complex datasets into easily understandable insights. He mentioned that current reporting solutions lack flexibility and often fail to meet the specific requirements of their clients.\n    \n4. **Scalability and Performance:**\n    \n    With the growing volume of data they handle, scalability and performance are critical factors for Carlo's team. He emphasized the need for a robust solution that can handle large datasets without compromising on speed or reliability.\n    \n5. **Collaboration and Sharing:**\n    \n    Collaboration is essential within Carlo's team, as well as with clients and stakeholders. He highlighted the importance of features that facilitate collaboration, such as real-time sharing of reports and dashboards, as well as commenting and annotation capabilities.\n    \n6. **Security and Compliance:**\n    \n    Given the sensitive nature of the data they work with, security and compliance are paramount for Carlo's organization. He expressed the need for features that ensure data privacy and compliance with industry regulations, such as GDPR and CCPA.\n    \n7. **Customization and Flexibility:**\n    \n    One-size-fits-all solutions often fall short of meeting Carlo's team's specific requirements. He emphasized the importance of customization and flexibility, allowing users to tailor the platform to their unique needs and workflows.\n    \n\n**Action Items:**\n\n1. **Product Demonstration:**\n    \n    We agreed to schedule a follow-up meeting to provide Carlo with a demonstration of our product, showcasing how it addresses his pain points and fulfills his requirements.\n    \n2. **Feature Prioritization:**\n    \n    Based on Carlo's feedback, we will prioritize features related to data integration, cleaning, and visualization, ensuring that our product meets the immediate needs of his team.\n    \n3. **Security and Compliance Assurance:**\n    \n    We will provide Carlo with detailed information regarding our platform's security measures and compliance certifications to address his concerns in these areas.\n    \n4. **Customization Options:**\n    \n    Carlo expressed interest in exploring customization options for our product. We will discuss the feasibility of implementing customizable features that align with his team's specific requirements.\n    \n\n**Conclusion:**\n\nOur conversation with Carlo provided valuable insights into the challenges faced by data analysts in marketing agencies. By addressing his needs and requirements, we aim to develop a data-oriented product that not only streamlines analytical processes but also enhances collaboration, scalability, and security. Moving forward, we are committed to working closely with Carlo and his team to ensure that our product meets their expectations and delivers tangible value to their organization.\n\n**Next Steps:**\n\n1. Schedule a follow-up meeting for product demonstration.\n2. Prioritize features based on Carlo's feedback.\n3. Provide detailed information on security and compliance measures.\n4. Explore customization options to align with Carlo's team's requirements.
5	7	2023-11-03	Signup troubleshooting email thread	"Email subject: Issue with account setup\n\n**Juan**:\n\nHello,\n\nI recently signed up for your new web app and I'm excited to start using it. However, I'm encountering some issues with setting up my account. Whenever I try to log in, it says my credentials are incorrect, even though I'm certain I'm entering the correct information. Can you please assist me with this?\n\nThanks, Juan\n\n---\n\n**Kelly**:\n\nHi Juan,\n\nThank you for reaching out and for your interest in our web app. I'm sorry to hear that you're having trouble setting up your account. Let's get this sorted out for you.\n\nCould you please provide me with the email address you used to sign up for the account? This will help me locate your account in our system and investigate further.\n\nLooking forward to your response.\n\nBest regards, Sarah\n\n---\n\n**Juan**:\n\nHi Sarah,\n\nThanks for your quick response. The email address I used to sign up is juan.perez96@tempinbox.net. I appreciate your help in resolving this issue.\n\nBest regards, Juan\n\n---\n\n**Kelly**:\n\nHi Juan,\n\nThank you for providing your email address. I've located your account in our system. It seems like there might be a technical glitch causing the login issue.\n\nTo assist you better, could you please let me know if you are trying to log in via the web app or the mobile app? Additionally, are you receiving any error messages or codes when attempting to log in?\n\nYour cooperation will help us pinpoint the issue and provide you with a solution promptly.\n\nBest regards, Sarah\n\n---\n\n**Juan**:\n\nHi Sarah,\n\nI appreciate your assistance. I've been trying to log in via the web app using my laptop. When I attempt to log in, it just says ""Invalid username or password"" without any error codes. I've tried resetting my password multiple times, but the issue persists.\n\nLooking forward to your guidance on resolving this.\n\nBest regards, Juan\n\n---\n\n**Kelly**:\n\nHi Juan,\n\nThank you for the additional information. It's helpful to know that you're using the web app on your laptop.\n\nSince you've already tried resetting your password without success, let's try a different approach. Could you please try logging in using a different web browser or an incognito/private browsing window? Sometimes browser cache or cookies can cause login issues, and this step might help us narrow down the problem.\n\nPlease give this a try and let me know if you're still encountering the same issue. We'll proceed from there based on your response.\n\nBest regards, Sarah\n\n---\n\n**Juan**:\n\nHi Sarah,\n\nThanks for the suggestion. I just tried logging in using a different browser, and I'm still getting the same ""Invalid username or password"" message. It seems like the issue persists despite changing browsers.\n\nDo you have any other recommendations for troubleshooting? I'm eager to get started with using the app.\n\nBest regards, Juan\n\n---\n\n**Kelly**:\n\nHi Juan,\n\nThank you for trying that step. Since changing browsers didn't resolve the issue, let's delve deeper into troubleshooting.\n\nCould you please confirm if you're able to successfully log in to your account using the mobile app? This will help us determine if the problem is isolated to the web app or if it's account-related.\n\nAdditionally, if you're comfortable with it, I could initiate a manual password reset for your account on my end. This might help bypass any potential technical glitches with the automated password reset process.\n\nLooking forward to your response so we can move forward with resolving this issue for you.\n\nBest regards, Sarah"
6	13	2024-02-13	User Interview Notes	**App:** EcoGro - Personalized urban gardening app\n\n**User:** Sarah - 32, environmental consultant, Brooklyn apartment dweller\n\n## Key Takeaways:\n\n- **Loves the concept:** Sarah was immediately excited about the personalized gardening features and the potential to grow fresh food at home despite minimal space.\n- **Pain points:** Struggles with limited balcony sunlight and identifying suitable plants. Misses having access to a fresh herb garden like she had growing up.\n- **Feature suggestions:**\n    \n    - **Light level indicator:** Integrates with weather data and user location to suggest plants based on available sunlight.\n    - **Container recommendations:** Suggests appropriate container sizes and types based on chosen plants and balcony dimensions.\n    - **Herb garden starter kit:** Pre-selected, low-maintenance herb collection tailored to user preferences and balcony conditions.\n    \n- **Technical considerations:** Light level indicator might require additional research and API integration. Container recommendations could be integrated with existing plant data. Starter kit development might require partnerships with plant suppliers.\n- **App design feedback:** Prefers simple, clean interface with high-quality plant photos. Enjoys the gamification elements like earning badges for successful harvests.\n- **Overall impression:** Sarah is an ideal target user with genuine enthusiasm for the app. Addressing her pain points and incorporating suggested features could significantly enhance her experience and encourage adoption.\n\n## Next steps:\n\n- Discuss feasibility of light level indicator with data science team.\n- Design mockups for container recommendations and starter kit feature.\n- Research potential plant supply partnerships.\n- Schedule follow-up call with Sarah to test updated prototype and gather further feedback.\n\n## Additional notes:\n\n- Sarah mentioned potential interest in sharing her gardening journey on social media. Explore integration with social media platforms.\n- She expressed concerns about the environmental impact of using plastic pots. Consider researching sustainable container options.\n\n**Overall, this user interview provided valuable insights into the needs and desires of our target audience. Implementing the suggested features and addressing pain points will be crucial for the success of the EcoGro app.**
\.

copy tag from stdin;
1	User
2	Contractor
3	Contributor
4	Staff
\.

copy contact_tag from stdin;
1	1	1
2	1	3
3	2	1
4	3	1
5	4	1
6	5	1
7	6	1
8	7	1
9	8	1
10	9	1
11	10	1
12	11	1
13	12	1
14	13	1
15	14	1
16	15	1
17	16	1
18	17	1
19	18	1
20	19	1
21	20	1
22	21	3
23	22	1
24	24	1
25	26	1
26	27	1
27	28	1
28	29	1
29	30	1
30	31	1
31	32	1
32	33	4
33	34	1
34	35	2
35	36	1
36	37	1
37	39	1
38	40	1
39	42	1
40	42	3
41	43	1
42	43	3
43	44	1
44	45	1
45	47	1
46	48	1
47	50	1
\.

SELECT setval( pg_get_serial_sequence('contact', 'id'), (select max(id) + 1 from contact), false );
SELECT setval( pg_get_serial_sequence('email', 'id'), (select max(id) + 1 from email), false );
SELECT setval( pg_get_serial_sequence('website_type', 'id'), (select max(id) + 1 from website_type), false );
SELECT setval( pg_get_serial_sequence('website', 'id'), (select max(id) + 1 from website), false );
SELECT setval( pg_get_serial_sequence('interaction', 'id'), (select max(id) + 1 from interaction), false );
SELECT setval( pg_get_serial_sequence('tag', 'id'), (select max(id) + 1 from tag), false );
SELECT setval( pg_get_serial_sequence('contact_tag', 'id'), (select max(id) + 1 from contact_tag), false );

