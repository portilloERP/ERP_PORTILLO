--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	administrador
2	asesor
3	marketing
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	cuenta	estadoregistro
7	cuenta	user
8	cuenta	modulo
9	marketing	proyecto
10	marketing	presupuestoproyecto
11	marketing	categoria
12	marketing	campania
13	marketing	gastocampania
14	ventas	tipoevento
15	ventas	objecion
16	ventas	estadolead
17	ventas	lead
18	ventas	whatsapp
19	ventas	historicoleadasesor
20	ventas	llamada
21	ventas	estadoevento
22	ventas	evento
23	ventas	tipoproducto
24	ventas	producto
25	ventas	tipocotizacion
26	ventas	cotizacion
27	ventas	tipocuota
28	ventas	cuota
29	ventas	precio
30	ventas	proyectotipoproducto
31	ventas	desasignacionleadasesor
32	ventas	desasignacionconfiguracion
33	multimedia	videoproyecto
34	multimedia	videoproducto
35	multimedia	imagenproyecto
36	multimedia	imagenproducto
37	token_blacklist	outstandingtoken
38	token_blacklist	blacklistedtoken
39	django_celery_beat	solarschedule
40	django_celery_beat	intervalschedule
41	django_celery_beat	clockedschedule
42	django_celery_beat	crontabschedule
43	django_celery_beat	periodictasks
44	django_celery_beat	periodictask
45	ventas	estadoseparacionlead
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add estado registro	6	add_estadoregistro
22	Can change estado registro	6	change_estadoregistro
23	Can delete estado registro	6	delete_estadoregistro
24	Can view estado registro	6	view_estadoregistro
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add modulo	8	add_modulo
30	Can change modulo	8	change_modulo
31	Can delete modulo	8	delete_modulo
32	Can view modulo	8	view_modulo
33	Can add proyecto	9	add_proyecto
34	Can change proyecto	9	change_proyecto
35	Can delete proyecto	9	delete_proyecto
36	Can view proyecto	9	view_proyecto
37	Can add presupuesto proyecto	10	add_presupuestoproyecto
38	Can change presupuesto proyecto	10	change_presupuestoproyecto
39	Can delete presupuesto proyecto	10	delete_presupuestoproyecto
40	Can view presupuesto proyecto	10	view_presupuestoproyecto
41	Can add categoria	11	add_categoria
42	Can change categoria	11	change_categoria
43	Can delete categoria	11	delete_categoria
44	Can view categoria	11	view_categoria
45	Can add campania	12	add_campania
46	Can change campania	12	change_campania
47	Can delete campania	12	delete_campania
48	Can view campania	12	view_campania
49	Can add gasto campania	13	add_gastocampania
50	Can change gasto campania	13	change_gastocampania
51	Can delete gasto campania	13	delete_gastocampania
52	Can view gasto campania	13	view_gastocampania
53	Can add tipo evento	14	add_tipoevento
54	Can change tipo evento	14	change_tipoevento
55	Can delete tipo evento	14	delete_tipoevento
56	Can view tipo evento	14	view_tipoevento
57	Can add objecion	15	add_objecion
58	Can change objecion	15	change_objecion
59	Can delete objecion	15	delete_objecion
60	Can view objecion	15	view_objecion
61	Can add estado lead	16	add_estadolead
62	Can change estado lead	16	change_estadolead
63	Can delete estado lead	16	delete_estadolead
64	Can view estado lead	16	view_estadolead
65	Can add lead	17	add_lead
66	Can change lead	17	change_lead
67	Can delete lead	17	delete_lead
68	Can view lead	17	view_lead
69	Can add whats app	18	add_whatsapp
70	Can change whats app	18	change_whatsapp
71	Can delete whats app	18	delete_whatsapp
72	Can view whats app	18	view_whatsapp
73	Can add historico lead asesor	19	add_historicoleadasesor
74	Can change historico lead asesor	19	change_historicoleadasesor
75	Can delete historico lead asesor	19	delete_historicoleadasesor
76	Can view historico lead asesor	19	view_historicoleadasesor
77	Can add llamada	20	add_llamada
78	Can change llamada	20	change_llamada
79	Can delete llamada	20	delete_llamada
80	Can view llamada	20	view_llamada
81	Can add estado evento	21	add_estadoevento
82	Can change estado evento	21	change_estadoevento
83	Can delete estado evento	21	delete_estadoevento
84	Can view estado evento	21	view_estadoevento
85	Can add evento	22	add_evento
86	Can change evento	22	change_evento
87	Can delete evento	22	delete_evento
88	Can view evento	22	view_evento
89	Can add tipo producto	23	add_tipoproducto
90	Can change tipo producto	23	change_tipoproducto
91	Can delete tipo producto	23	delete_tipoproducto
92	Can view tipo producto	23	view_tipoproducto
93	Can add producto	24	add_producto
94	Can change producto	24	change_producto
95	Can delete producto	24	delete_producto
96	Can view producto	24	view_producto
97	Can add tipo cotizacion	25	add_tipocotizacion
98	Can change tipo cotizacion	25	change_tipocotizacion
99	Can delete tipo cotizacion	25	delete_tipocotizacion
100	Can view tipo cotizacion	25	view_tipocotizacion
101	Can add cotizacion	26	add_cotizacion
102	Can change cotizacion	26	change_cotizacion
103	Can delete cotizacion	26	delete_cotizacion
104	Can view cotizacion	26	view_cotizacion
105	Can add tipo cuota	27	add_tipocuota
106	Can change tipo cuota	27	change_tipocuota
107	Can delete tipo cuota	27	delete_tipocuota
108	Can view tipo cuota	27	view_tipocuota
109	Can add cuota	28	add_cuota
110	Can change cuota	28	change_cuota
111	Can delete cuota	28	delete_cuota
112	Can view cuota	28	view_cuota
113	Can add precio	29	add_precio
114	Can change precio	29	change_precio
115	Can delete precio	29	delete_precio
116	Can view precio	29	view_precio
117	Can add proyecto tipo producto	30	add_proyectotipoproducto
118	Can change proyecto tipo producto	30	change_proyectotipoproducto
119	Can delete proyecto tipo producto	30	delete_proyectotipoproducto
120	Can view proyecto tipo producto	30	view_proyectotipoproducto
121	Can add desasignacion lead asesor	31	add_desasignacionleadasesor
122	Can change desasignacion lead asesor	31	change_desasignacionleadasesor
123	Can delete desasignacion lead asesor	31	delete_desasignacionleadasesor
124	Can view desasignacion lead asesor	31	view_desasignacionleadasesor
125	Can add desasignacion configuracion	32	add_desasignacionconfiguracion
126	Can change desasignacion configuracion	32	change_desasignacionconfiguracion
127	Can delete desasignacion configuracion	32	delete_desasignacionconfiguracion
128	Can view desasignacion configuracion	32	view_desasignacionconfiguracion
129	Can add video proyecto	33	add_videoproyecto
130	Can change video proyecto	33	change_videoproyecto
131	Can delete video proyecto	33	delete_videoproyecto
132	Can view video proyecto	33	view_videoproyecto
133	Can add video producto	34	add_videoproducto
134	Can change video producto	34	change_videoproducto
135	Can delete video producto	34	delete_videoproducto
136	Can view video producto	34	view_videoproducto
137	Can add imagen proyecto	35	add_imagenproyecto
138	Can change imagen proyecto	35	change_imagenproyecto
139	Can delete imagen proyecto	35	delete_imagenproyecto
140	Can view imagen proyecto	35	view_imagenproyecto
141	Can add imagen producto	36	add_imagenproducto
142	Can change imagen producto	36	change_imagenproducto
143	Can delete imagen producto	36	delete_imagenproducto
144	Can view imagen producto	36	view_imagenproducto
145	Can add outstanding token	37	add_outstandingtoken
146	Can change outstanding token	37	change_outstandingtoken
147	Can delete outstanding token	37	delete_outstandingtoken
148	Can view outstanding token	37	view_outstandingtoken
149	Can add blacklisted token	38	add_blacklistedtoken
150	Can change blacklisted token	38	change_blacklistedtoken
151	Can delete blacklisted token	38	delete_blacklistedtoken
152	Can view blacklisted token	38	view_blacklistedtoken
153	Can add solar event	39	add_solarschedule
154	Can change solar event	39	change_solarschedule
155	Can delete solar event	39	delete_solarschedule
156	Can view solar event	39	view_solarschedule
157	Can add interval	40	add_intervalschedule
158	Can change interval	40	change_intervalschedule
159	Can delete interval	40	delete_intervalschedule
160	Can view interval	40	view_intervalschedule
161	Can add clocked	41	add_clockedschedule
162	Can change clocked	41	change_clockedschedule
163	Can delete clocked	41	delete_clockedschedule
164	Can view clocked	41	view_clockedschedule
165	Can add crontab	42	add_crontabschedule
166	Can change crontab	42	change_crontabschedule
167	Can delete crontab	42	delete_crontabschedule
168	Can view crontab	42	view_crontabschedule
169	Can add periodic tasks	43	add_periodictasks
170	Can change periodic tasks	43	change_periodictasks
171	Can delete periodic tasks	43	delete_periodictasks
172	Can view periodic tasks	43	view_periodictasks
173	Can add periodic task	44	add_periodictask
174	Can change periodic task	44	change_periodictask
175	Can delete periodic task	44	delete_periodictask
176	Can view periodic task	44	view_periodictask
177	Can add estado separacion lead	45	add_estadoseparacionlead
178	Can change estado separacion lead	45	change_estadoseparacionlead
179	Can delete estado separacion lead	45	delete_estadoseparacionlead
180	Can view estado separacion lead	45	view_estadoseparacionlead
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	9
2	1	10
3	1	11
4	1	12
5	1	25
6	1	26
7	1	27
8	1	28
9	1	33
10	1	34
11	1	35
12	1	36
13	1	45
14	1	46
15	1	47
16	1	48
17	1	65
18	1	66
19	1	67
20	1	68
21	1	85
22	1	86
23	1	87
24	1	88
25	1	93
26	1	94
27	1	95
28	1	96
29	2	65
30	2	66
31	2	67
32	2	68
33	2	85
34	2	86
35	2	87
36	2	88
37	3	65
38	3	66
39	3	67
40	3	68
41	3	45
42	3	46
43	3	47
44	3	48
\.


--
-- Data for Name: cuenta_estadoregistro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuenta_estadoregistro (estado, nombre) FROM stdin;
A	Activo
I	Inactivo
\.


--
-- Data for Name: cuenta_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuenta_modulo (id, nombre, url, "contentType_id", estado_id) FROM stdin;
1	Gestion de campañas	campania	12	A
2	Gestión de proyectos	proyecto	9	A
3	Gestion de roles	rol	3	A
4	Gestión de productos	producto	24	A
5	Gestión de leads	lead	17	A
6	Gestion de eventos	evento	22	A
7	Gestion de usuarios	usuario	7	A
\.


--
-- Data for Name: cuenta_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuenta_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "codigoAsesor", "isAdmin", estado_id) FROM stdin;
15	pbkdf2_sha256$600000$hPlu0JAXKWLg7K76Hjim23$7IZX4Zp38G2OzU7FnVH1Dr54iATQoWIpF9dqAU7B8aQ=	\N	f	Asesor2	asesor	dos	bgomezv@unsa.edu.pe	f	t	2024-03-17 18:55:37.481999-05	asesor_b	f	A
17	pbkdf2_sha256$600000$oKqllJnzQfp5A23docKPp1$Nw3VIEt0D9hg1VJ05WXJ+zgnS2P+/SxMIPGB+DzzL0g=	\N	f	Asesor4	asesor	admin	bgomezv@unsa.edu.pe	f	t	2024-03-17 18:57:41.430455-05	asesor_d	t	A
18	pbkdf2_sha256$600000$rM9TnIytZR20uciYGZjWVd$bGpS2i2y1VK0sPnYoE0/BJS3xaT9VzrPmQ3V66ZUck4=	\N	f	Marketing1	marketing	uno	bgomezv@unsa.edu.pe	f	t	2024-03-17 18:58:17.075979-05	\N	t	A
1	pbkdf2_sha256$600000$lpiHqh7MMfv2Kq54oIsMCp$JzjEsJJUZmGoq6aFcQu9iH2QwjBuGviyk2/yffRwBsE=	2024-03-17 19:07:24.491377-05	t	portilloAdmin	Administrador Portillo			t	t	2024-03-17 17:49:39.532587-05	\N	f	A
16	pbkdf2_sha256$600000$LvwrCozWg9lxKgx0060HIs$EIFvmsJIEN10D+sMK0iWHhPB/TqHmk9FYqKplKn8/hU=	\N	f	Asesor3	asesor	tres	josephgvalfa@gmail.com	f	t	2024-03-17 18:56:48.564697-05	asesor_c	f	A
14	pbkdf2_sha256$600000$WdroI0KpaCmYStCsRMYFhc$/yrKx7x8IWO8oSWKTU8HIRkZRdc95TVVV79B8diFpso=	\N	f	Asesor1	asesor	unoooooo	josephgvalfa@gmail.com	f	t	2024-03-17 18:54:45.831635-05	asesor_a	f	A
\.


--
-- Data for Name: cuenta_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuenta_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
7	14	2
8	15	2
9	16	2
10	17	2
11	18	3
\.


--
-- Data for Name: cuenta_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuenta_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-03-17 18:52:37.115337-05	7	asesor1	3		7	1
2	2024-03-17 18:52:37.121325-05	3	Asesor1	3		7	1
3	2024-03-17 18:52:37.122714-05	13	asesor11	3		7	1
4	2024-03-17 18:52:37.124187-05	11	asesor2	3		7	1
5	2024-03-17 18:52:37.125476-05	5	Asesor2	3		7	1
6	2024-03-17 18:52:37.126716-05	12	marketing1	3		7	1
7	2024-03-18 10:24:16.557363-05	SE	Separado	1	[{"added": {}}]	45	1
8	2024-03-18 10:24:32.048722-05	VE	Vendido	1	[{"added": {}}]	45	1
9	2024-03-18 10:24:46.296736-05	DE	Desistio	1	[{"added": {}}]	45	1
10	2024-03-18 10:25:17.32909-05	14	943702641	2	[{"changed": {"fields": ["EstadoSeparacionLead"]}}]	17	1
11	2024-03-18 10:28:52.49374-05	11	Samuel-913949511	2	[{"changed": {"fields": ["EstadoSeparacionLead"]}}]	17	1
12	2024-03-18 10:28:52.629136-05	11	Samuel-913949511	2	[]	17	1
13	2024-03-18 11:04:32.059922-05	16	Asesor3	2	[{"changed": {"fields": ["password"]}}]	7	1
14	2024-03-18 14:48:04.312307-05	2	Proyecto Socabaya-696969.0	1	[{"added": {}}]	10	1
15	2024-03-18 14:54:03.685198-05	6	Solange-969685859	2	[{"changed": {"fields": ["Fecha creacion"]}}]	17	1
16	2024-03-18 14:55:03.526498-05	17	888888888	2	[{"changed": {"fields": ["Fecha asignacion"]}}]	17	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-03-14 23:34:07.868808-05
2	contenttypes	0002_remove_content_type_name	2024-03-14 23:34:07.880787-05
3	auth	0001_initial	2024-03-14 23:34:07.930813-05
4	auth	0002_alter_permission_name_max_length	2024-03-14 23:34:07.939359-05
5	auth	0003_alter_user_email_max_length	2024-03-14 23:34:07.949292-05
6	auth	0004_alter_user_username_opts	2024-03-14 23:34:07.958554-05
7	auth	0005_alter_user_last_login_null	2024-03-14 23:34:07.966865-05
8	auth	0006_require_contenttypes_0002	2024-03-14 23:34:07.970196-05
9	auth	0007_alter_validators_add_error_messages	2024-03-14 23:34:07.980513-05
10	auth	0008_alter_user_username_max_length	2024-03-14 23:34:07.989492-05
11	auth	0009_alter_user_last_name_max_length	2024-03-14 23:34:08.00995-05
12	auth	0010_alter_group_name_max_length	2024-03-14 23:34:08.025525-05
13	auth	0011_update_proxy_permissions	2024-03-14 23:34:08.039164-05
14	auth	0012_alter_user_first_name_max_length	2024-03-14 23:34:08.049368-05
15	cuenta	0001_initial	2024-03-14 23:34:08.130912-05
16	admin	0001_initial	2024-03-14 23:34:08.156487-05
17	admin	0002_logentry_remove_auto_add	2024-03-14 23:34:08.169666-05
18	admin	0003_logentry_add_action_flag_choices	2024-03-14 23:34:08.195258-05
19	django_celery_beat	0001_initial	2024-03-14 23:34:08.245697-05
20	django_celery_beat	0002_auto_20161118_0346	2024-03-14 23:34:08.267133-05
21	django_celery_beat	0003_auto_20161209_0049	2024-03-14 23:34:08.282674-05
22	django_celery_beat	0004_auto_20170221_0000	2024-03-14 23:34:08.289874-05
23	django_celery_beat	0005_add_solarschedule_events_choices	2024-03-14 23:34:08.299718-05
24	django_celery_beat	0006_auto_20180322_0932	2024-03-14 23:34:08.34253-05
25	django_celery_beat	0007_auto_20180521_0826	2024-03-14 23:34:08.364638-05
26	django_celery_beat	0008_auto_20180914_1922	2024-03-14 23:34:08.394895-05
27	django_celery_beat	0006_auto_20180210_1226	2024-03-14 23:34:08.427685-05
28	django_celery_beat	0006_periodictask_priority	2024-03-14 23:34:08.44763-05
29	django_celery_beat	0009_periodictask_headers	2024-03-14 23:34:08.459765-05
30	django_celery_beat	0010_auto_20190429_0326	2024-03-14 23:34:08.70706-05
31	django_celery_beat	0011_auto_20190508_0153	2024-03-14 23:34:08.741033-05
32	django_celery_beat	0012_periodictask_expire_seconds	2024-03-14 23:34:08.754275-05
33	django_celery_beat	0013_auto_20200609_0727	2024-03-14 23:34:08.7666-05
34	django_celery_beat	0014_remove_clockedschedule_enabled	2024-03-14 23:34:08.772311-05
35	django_celery_beat	0015_edit_solarschedule_events_choices	2024-03-14 23:34:08.782547-05
36	django_celery_beat	0016_alter_crontabschedule_timezone	2024-03-14 23:34:08.790919-05
37	django_celery_beat	0017_alter_crontabschedule_month_of_year	2024-03-14 23:34:08.802563-05
38	django_celery_beat	0018_improve_crontab_helptext	2024-03-14 23:34:08.812466-05
39	marketing	0001_initial	2024-03-14 23:34:09.099274-05
40	ventas	0001_initial	2024-03-14 23:34:10.008586-05
41	multimedia	0001_initial	2024-03-14 23:34:10.182665-05
42	sessions	0001_initial	2024-03-14 23:34:10.196548-05
43	token_blacklist	0001_initial	2024-03-14 23:34:10.298664-05
44	token_blacklist	0002_outstandingtoken_jti_hex	2024-03-14 23:34:10.339324-05
45	token_blacklist	0003_auto_20171017_2007	2024-03-14 23:34:10.417814-05
46	token_blacklist	0004_auto_20171017_2013	2024-03-14 23:34:10.482308-05
47	token_blacklist	0005_remove_outstandingtoken_jti	2024-03-14 23:34:10.516212-05
48	token_blacklist	0006_auto_20171017_2113	2024-03-14 23:34:10.543196-05
49	token_blacklist	0007_auto_20171017_2214	2024-03-14 23:34:10.618763-05
50	token_blacklist	0008_migrate_to_bigautofield	2024-03-14 23:34:10.726995-05
51	token_blacklist	0010_fix_migrate_to_bigautofield	2024-03-14 23:34:10.774787-05
52	token_blacklist	0011_linearizes_history	2024-03-14 23:34:10.779565-05
53	token_blacklist	0012_alter_outstandingtoken_user	2024-03-14 23:34:10.828351-05
54	ventas	0002_estadoseparacionlead	2024-03-18 09:52:54.734537-05
55	ventas	0003_lead_estadoasignacionlead	2024-03-18 10:11:25.891797-05
56	ventas	0004_rename_estadoasignacionlead_lead_estadoseparacionlead	2024-03-18 10:21:41.352674-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tzynx9f9gkh9o62typ0fsnr4gfzk5b2t	.eJxVjE0OwiAYRO_C2hAQCsWle89Avh-QqoGktCvj3W2TLnQ1ybw38xYR1qXEtac5TiwuQovTb4dAz1R3wA-o9yap1WWeUO6KPGiXt8bpdT3cv4MCvWxrIh49sgkarc5BJwaVFZDxZJkshrClI-c5UzJI2fHgLQU3nq3KehCfLxn1OPs:1rm0XE:FDywR_FflgEGfSTdASyvmok3chjuVNtrmZ4pXKzVVYs	2024-03-31 19:07:24.493956-05
32au1igqe15h9s3ef8jb3ejly2kkfctq	.eJxVjE0OwiAYRO_C2hAQCsWle89Avh-QqoGktCvj3W2TLnQ1ybw38xYR1qXEtac5TiwuQovTb4dAz1R3wA-o9yap1WWeUO6KPGiXt8bpdT3cv4MCvWxrIh49sgkarc5BJwaVFZDxZJkshrClI-c5UzJI2fHgLQU3nq3KehCfLxn1OPs:1rmFTU:7ri9NsvdDZx69zDk0lBrrBJut663jBNlqOl76IYQR40	2024-04-01 11:04:32.068324-05
\.


--
-- Data for Name: marketing_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing_categoria (id, nombre, codigo, estado_id) FROM stdin;
1	Fisico	CF	A
2	Volante	CV	A
3	Facebook	CFB	A
4	Instagram	CI	A
5	TikTok	CT	A
6	WhatsApp	CW	A
7	Desconocido	CD	A
\.


--
-- Data for Name: marketing_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing_proyecto (id, nombre, ubicacion, codigo, descripcion, fecha_creacion, fecha_actualizacion, estado_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
1	Proyecto Socabaya	socabaya	PS		2024-03-17 19:00:38.038217-05	2024-03-17 19:00:38.038476-05	A	\N	1
2	Proyecto Alamos del Valle	Por ahi	PAL		2024-03-17 19:21:52.037143-05	2024-03-17 19:21:52.037398-05	A	\N	1
\.


--
-- Data for Name: marketing_campania; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing_campania (id, nombre, organico, codigo, fecha_estimada, fecha_cierre, "coste_realSoles", "coste_realDolares", descripcion, fecha_creacion, fecha_actualizacion, categoria_id, estado_id, proyecto_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
4	Campaña Alamos instagram	f	PAL_CI_0301	2024-03-23	2024-03-31	0	0		2024-03-17 19:22:27.178032-05	2024-03-17 19:22:27.189683-05	4	A	2	\N	1
1	Socabaya Facebook	f	PS_CFB_0301	2024-03-01	2024-03-31	257.88	70		2024-03-17 19:02:30.865284-05	2024-03-17 22:07:18.133517-05	3	A	1	\N	1
2	Socabaya Facebook Abril	f	PS_CFB_0302	2024-03-16	2024-03-24	0	0		2024-03-17 19:19:33.353222-05	2024-03-17 23:08:20.56694-05	3	A	1	\N	18
5	Campaña Organica Socabaya	t	ORGANICOPS_CFB_0303	2024-03-17	2024-03-23	0	0		2024-03-17 23:44:04.361058-05	2024-03-17 23:44:04.380071-05	3	A	1	\N	1
6	edgvdsvdsv	f	PS_CFB_0304	2024-03-17	2024-03-23	0	0		2024-03-17 23:44:27.784322-05	2024-03-17 23:44:27.797653-05	3	A	1	\N	1
3	Socabaya Tiktok	f	PS_CT_0301	2024-03-16	2024-03-31	1842	500		2024-03-17 19:20:09.878681-05	2024-03-18 11:29:06.207951-05	5	A	1	\N	18
\.


--
-- Data for Name: marketing_presupuestoproyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing_presupuestoproyecto (id, "presupuestoSoles", "gastoTotalCampaniasSoles", "presupuestoDolares", "gastoTotalCampaniasDolares", "tipoCambioSoles", "fechaPresupuesto", fecha_creacion, fecha_actualizacion, estado_id, proyecto_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
1	18420	2099.88	5000	570	3.684	2024-03-17	2024-03-17 22:06:20.162866-05	2024-03-18 11:29:06.204584-05	A	1	\N	\N
2	858842161	0	696969	0	0	2024-02-15	2024-03-18 14:47:30-05	2024-03-18 14:48:04.308445-05	A	1	\N	\N
\.


--
-- Data for Name: marketing_gastocampania; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketing_gastocampania (id, "gastoSoles", "gastoDolares", "tipoCambioSoles", "fechaGasto", fecha_creacion, fecha_actualizacion, campania_id, estado_id, "presupuestoProyecto_id", "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
1	184.2	50	3.684	2024-03-17	2024-03-17 22:07:12.31589-05	2024-03-17 22:07:12.316286-05	1	A	1	\N	1
2	73.68	20	3.684	2024-03-17	2024-03-17 22:07:18.118212-05	2024-03-17 22:07:18.11855-05	1	A	1	\N	1
5	1842	500	3.684	2024-03-18	2024-03-18 11:29:06.188815-05	2024-03-18 11:29:06.189443-05	3	A	1	\N	1
\.


--
-- Data for Name: ventas_tipoproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_tipoproducto (id, nombre, estado_id) FROM stdin;
1	Departamento	A
2	Lote	A
3	Cochera	A
4	Deposito	A
5	Condominio	A
\.


--
-- Data for Name: ventas_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_producto (id, nombre, codigo, reservado, numero, area, fecha_creacion, fecha_actualizacion, estado_id, proyecto_id, tipo_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
\.


--
-- Data for Name: multimedia_imagenproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_imagenproducto (id, imagen, producto_id) FROM stdin;
\.


--
-- Data for Name: multimedia_imagenproyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_imagenproyecto (id, imagen, proyecto_id) FROM stdin;
1	imagenes/Screenshot_from_2024-03-13_15-04-36.png	1
2	imagenes/resize_image.png	2
\.


--
-- Data for Name: multimedia_videoproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_videoproducto (id, video, producto_id) FROM stdin;
\.


--
-- Data for Name: multimedia_videoproyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_videoproyecto (id, video, proyecto_id) FROM stdin;
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1MTk0MSwiaWF0IjoxNzEwNzE1OTQxLCJqdGkiOiJlODAxZjdjN2Q1NWU0NzcxYjhkY2RlMGEyNTQ1YjdkMSIsInVzZXJfaWQiOjF9.J6DyJE52cUsCQbWWD6WJ5HiALoHjqRbU3fNw3Igj6ss	2024-03-17 17:52:21.840066-05	2025-03-17 17:52:21-05	1	e801f7c7d55e4771b8dcde0a2545b7d1
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1MTk2MywiaWF0IjoxNzEwNzE1OTYzLCJqdGkiOiI4YTNlOTYyZGZiOWU0ZTViOGUyMTlhOWVmMzVlM2VhMiIsInVzZXJfaWQiOjF9.tHtH-aWw-eFuH4-hKPpiJ49zyVSf4h9p9MtkiRngI1Q	2024-03-17 17:52:43.895739-05	2025-03-17 17:52:43-05	1	8a3e962dfb9e4e5b8e219a9ef35e3ea2
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1MjI3MywiaWF0IjoxNzEwNzE2MjczLCJqdGkiOiI3NTE2YmFiZDg0MmI0Yzc5ODQ1N2FlN2FlZjg1MjNiYSIsInVzZXJfaWQiOjF9.JiT9HfMUsbIN7uFXA-PBYGRp58kmctU16vCDiJldfyA	2024-03-17 17:57:53.764366-05	2025-03-17 17:57:53-05	1	7516babd842b4c798457ae7aef8523ba
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1NTkyNywiaWF0IjoxNzEwNzE5OTI3LCJqdGkiOiJiODAyMTkyMjQ5OTk0NmY3ODkyZTkyODBjYTUyNjE0MiIsInVzZXJfaWQiOjE0fQ.WRwk3eHZ2z-tQZJ2PO95Fg1p7dKGEc-hhrintuTVils	2024-03-17 18:58:47.471206-05	2025-03-17 18:58:47-05	14	b8021922499946f7892e9280ca526142
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1NTk4NCwiaWF0IjoxNzEwNzE5OTg0LCJqdGkiOiJjZGY5YzYzMTE5ZjI0MWRiYjkyODViMjU4YjNhN2YwZSIsInVzZXJfaWQiOjE4fQ.a-G0wPvhrgJnCLfN5fD7-cHZ-5dQSIvQAJuTHNVaXfM	2024-03-17 18:59:44.509235-05	2025-03-17 18:59:44-05	18	cdf9c63119f241dbb9285b258b3a7f0e
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODI4NiwiaWF0IjoxNzEwNzIyMjg2LCJqdGkiOiIxNDIwNWE0YWU0MDc0ODk4ODk4MzRlOWEyYjc2ODM0MyIsInVzZXJfaWQiOjE0fQ.oy6RtNtgYZcGv0tXdM7Mcrj6PIq7mTBsZJdlJYQM1Kg	2024-03-17 19:38:06.102999-05	2025-03-17 19:38:06-05	14	14205a4ae407489889834e9a2b768343
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODMzOSwiaWF0IjoxNzEwNzIyMzM5LCJqdGkiOiJiNTRkMzVmMmE1ZTY0Y2NmYjQ5OTNjYWNjMTMzZDVkNiIsInVzZXJfaWQiOjE1fQ.M-Li8ewXW0i7vXBhMmz9UrlE80zCUsuSHvyGz9nc3KU	2024-03-17 19:38:59.39097-05	2025-03-17 19:38:59-05	15	b54d35f2a5e64ccfb4993cacc133d5d6
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODM4MywiaWF0IjoxNzEwNzIyMzgzLCJqdGkiOiJhYWYxOTkyNjMzZTE0OTkwYWU0NGVjNDk0NzIwZmQ4ZiIsInVzZXJfaWQiOjE2fQ.TAbLaMdzVifjdHGef1cpe2JoWfaPXM5KNm1FTy786BU	2024-03-17 19:39:43.302325-05	2025-03-17 19:39:43-05	16	aaf1992633e14990ae44ec494720fd8f
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODU1OSwiaWF0IjoxNzEwNzIyNTU5LCJqdGkiOiI2ZDY0ZTA5NTQxMzA0NWFmYjZmOTdhOThmMmI5YWNlMyIsInVzZXJfaWQiOjE3fQ.KaNlvJZ3aXLKn_fFJGyPM1KARU1IANG2gPAbQynJLSY	2024-03-17 19:42:39.778274-05	2025-03-17 19:42:39-05	17	6d64e095413045afb6f97a98f2b9ace3
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODcxOCwiaWF0IjoxNzEwNzIyNzE4LCJqdGkiOiIzMDdiNTdhODBhOTA0ODYxYThkZDNhMTU0MDcwMjI1YiIsInVzZXJfaWQiOjE0fQ.oev3NVqhFfqUl8ChfgKMv2kTccvlsIkPk-ZxHdudHys	2024-03-17 19:45:18.286139-05	2025-03-17 19:45:18-05	14	307b57a80a904861a8dd3a154070225b
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1ODkyOSwiaWF0IjoxNzEwNzIyOTI5LCJqdGkiOiI0NDQ2MjhkMzgyNWY0OWUyYjYxMTViYTYyMDE2ZTYyOCIsInVzZXJfaWQiOjE2fQ.N_ym2KPnN1AiuoopPXpCjf-rHg2E1hRrR7KsWuB0CXQ	2024-03-17 19:48:49.076033-05	2025-03-17 19:48:49-05	16	444628d3825f49e2b6115ba62016e628
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI1OTQxNiwiaWF0IjoxNzEwNzIzNDE2LCJqdGkiOiI2NGIyNzBhZjIzNWM0MmI5ODMyN2FkNGEwNzMyZTU3ZiIsInVzZXJfaWQiOjE3fQ.is5F2u2Oh62rkuArouGtM_0qDuOzoe48HwYHvQZ36RI	2024-03-17 19:56:56.926249-05	2025-03-17 19:56:56-05	17	64b270af235c42b98327ad4a0732e57f
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI2MjA1NywiaWF0IjoxNzEwNzI2MDU3LCJqdGkiOiIyNWFkOTE5NjZiZTY0ZjE4OTRmMDE0MjBiYzhmZTZlYyIsInVzZXJfaWQiOjE3fQ.xT8faFJfNUoys-6Amxr2IKBIz1xnUecG1wMhMZUtFqM	2024-03-17 20:40:57.881919-05	2025-03-17 20:40:57-05	17	25ad91966be64f1894f01420bc8fe6ec
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI2NzA4OSwiaWF0IjoxNzEwNzMxMDg5LCJqdGkiOiIyMDZiMzhlM2ZmNWE0MjEyYjA3MzYzOTY5YzgxMjY0NCIsInVzZXJfaWQiOjF9._h56UyniOqAfe0w8Mepc-6eTjIfnwZhwNbMOAGZtfDI	2024-03-17 22:04:49.092095-05	2025-03-17 22:04:49-05	1	206b38e3ff5a4212b07363969c812644
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI2ODM3MCwiaWF0IjoxNzEwNzMyMzcwLCJqdGkiOiI3ODJhOTkzYjI3NjI0ZjI0YjI2OWMzZGQyODY0NGE0MSIsInVzZXJfaWQiOjE4fQ.O8bnVhBIKCYq3wAfypyT_g2-5TBdex4yFH82pc6waro	2024-03-17 22:26:10.7262-05	2025-03-17 22:26:10-05	18	782a993b27624f24b269c3dd28644a41
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3MTA1NywiaWF0IjoxNzEwNzM1MDU3LCJqdGkiOiI3MjI3NWE2NDdjYjg0NDNkOGE0OTI2NWE5Mzg0NzIyYiIsInVzZXJfaWQiOjF9.ko5yJ0_UspLnzV__VaKFrbjVeR92RGh4a3LpuxszTYQ	2024-03-17 23:10:57.81918-05	2025-03-17 23:10:57-05	1	72275a647cb8443d8a49265a9384722b
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3MTA2OSwiaWF0IjoxNzEwNzM1MDY5LCJqdGkiOiIzYjYyZmI3NWEzY2I0ZTMyYTA5NjZjZGRlY2Y3ZGUyZiIsInVzZXJfaWQiOjE3fQ.lgUDGEGQaCujXzr9BFfUJMiUTBACPxBTyvjtZi95Pcw	2024-03-17 23:11:09.696008-05	2025-03-17 23:11:09-05	17	3b62fb75a3cb4e32a0966cddecf7de2f
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3MTkyNSwiaWF0IjoxNzEwNzM1OTI1LCJqdGkiOiJjNzgzMTIxZTIyYzM0MWVlOTlkY2Y3Y2UxZGEyNTgyNCIsInVzZXJfaWQiOjE1fQ.SP5aKL3E7A-CsyhTm6u9RgNy2q9RENlJdkKIC3f5AnM	2024-03-17 23:25:25.295176-05	2025-03-17 23:25:25-05	15	c783121e22c341ee99dcf7ce1da25824
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3MTk4MCwiaWF0IjoxNzEwNzM1OTgwLCJqdGkiOiJkOTU0OGRlYzcwNjg0MWYyOTIwZmQzNDZhZGYzMDJlZCIsInVzZXJfaWQiOjE4fQ.PB171LQELitREdRePFCQltF75kZjhWhuraByHBJSJmY	2024-03-17 23:26:20.270998-05	2025-03-17 23:26:20-05	18	d9548dec706841f2920fd346adf302ed
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3MjA1OCwiaWF0IjoxNzEwNzM2MDU4LCJqdGkiOiI5Njc2OGNjNGMyMTg0MTEyOWY4Mzc5ODA3YjNiYTk1ZCIsInVzZXJfaWQiOjE3fQ.HBez57-ungaNSIzj60Z8TPvzNhczeFd-tAaL27_C-58	2024-03-17 23:27:38.780752-05	2025-03-17 23:27:38-05	17	96768cc4c21841129f8379807b3ba95d
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjI3Mjk5MiwiaWF0IjoxNzEwNzM2OTkyLCJqdGkiOiJhODUyNWIxNmU4MzE0OTUwYWY0Yzk1YWQ3MDEyMjZiYiIsInVzZXJfaWQiOjF9.gCWK9Owrjg6_cVgNvFZFhCvGJdnpAFgAT7zegnw7Va8	2024-03-17 23:43:12.020798-05	2025-03-17 23:43:12-05	1	a8525b16e8314950af4c95ad701226bb
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMwNzkzNCwiaWF0IjoxNzEwNzcxOTM0LCJqdGkiOiJiMWQyNjMyZTMxMTM0M2NhYWIzMWRmZWVhOTkwOGE1OSIsInVzZXJfaWQiOjF9._Wr60SPGGx4Q9Cd2GJHNskPEyI8up77QlQl14hOvBuA	2024-03-18 09:25:34.515623-05	2025-03-18 09:25:34-05	1	b1d2632e311343caab31dfeea9908a59
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMwODM3MywiaWF0IjoxNzEwNzcyMzczLCJqdGkiOiJjMDQ1NWMyYTA1NWU0OGM3ODY5YWY3MWQ5ZDU5ODIzMCIsInVzZXJfaWQiOjF9.6KnERgLIZhtVNDbl_YrLwPE6iDXew3eelKMgFmrAgrA	2024-03-18 09:32:53.837531-05	2025-03-18 09:32:53-05	1	c0455c2a055e48c7869af71d9d598230
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMwODUyMiwiaWF0IjoxNzEwNzcyNTIyLCJqdGkiOiI0ODE1ZmIxMjhkYTk0OWJlOTY2ODhlMjJmNTQyMDI4MiIsInVzZXJfaWQiOjE0fQ.Au5sHfkO3QjCSgO_GGZ7DAublGtunMtNBRjZewq9KVE	2024-03-18 09:35:22.578222-05	2025-03-18 09:35:22-05	14	4815fb128da949be96688e22f5420282
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMwODcxMSwiaWF0IjoxNzEwNzcyNzExLCJqdGkiOiIxNzE5ZDI3MzFmOWM0MzQ1YTU3NjFmYTEzNjFiMWY1NSIsInVzZXJfaWQiOjE0fQ.Cjz9N5R7kU33jHGOMC53b8BJeAu-lb3kERUvZTobhks	2024-03-18 09:38:31.275528-05	2025-03-18 09:38:31-05	14	1719d2731f9c4345a5761fa1361b1f55
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxMDAwMiwiaWF0IjoxNzEwNzc0MDAyLCJqdGkiOiI3NzYxYTA4ZjE2YjE0MjQ4YmY1NjRhODc3YjQ4YzgzOCIsInVzZXJfaWQiOjE0fQ.nH3CCBGhD_SOSOt3pl7HhXNhguy4zIhYa84z5KsqZl8	2024-03-18 10:00:02.607367-05	2025-03-18 10:00:02-05	14	7761a08f16b14248bf564a877b48c838
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxMTg2NCwiaWF0IjoxNzEwNzc1ODY0LCJqdGkiOiJhZjgyZTA5MDAyMDg0ZDc1OWY5MDZkM2ExODQwMGQwZiIsInVzZXJfaWQiOjE3fQ.xNRaUVjtEZarfWE7h3-6kDybP6aekL4iDYMT0NSaEWw	2024-03-18 10:31:04.210912-05	2025-03-18 10:31:04-05	17	af82e09002084d759f906d3a18400d0f
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxMjE0NSwiaWF0IjoxNzEwNzc2MTQ1LCJqdGkiOiJkMGYxOTgxYTY2YjE0ZWFmYTlhYWMyMDZkZmFmZTgwMyIsInVzZXJfaWQiOjE3fQ.Heg3x4NJoNkxdQu9gzwDyk6jKU_DmW5nXQ4JprqC30Q	2024-03-18 10:35:45.542948-05	2025-03-18 10:35:45-05	17	d0f1981a66b14eafa9aac206dfafe803
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxMjgxMSwiaWF0IjoxNzEwNzc2ODExLCJqdGkiOiI3ZjIyMTEyMjc2MjY0YzkyOTY0NDRlZGM4NjA4OWU1YyIsInVzZXJfaWQiOjE3fQ.rCCU2oKd6GuV5FoSpiunYJ3eR8XblH1zjWATc-7AhRA	2024-03-18 10:46:51.849656-05	2025-03-18 10:46:51-05	17	7f22112276264c9296444edc86089e5c
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxMzYyNSwiaWF0IjoxNzEwNzc3NjI1LCJqdGkiOiJkNjZhZTliNmVjNDc0YTEyYmRiMWE5YWI0MjNlZTk1ZCIsInVzZXJfaWQiOjF9.ywAJjE5Gj8mh1O8piZhp2xO7f6Ue_2aQ9p9m6GnxuuI	2024-03-18 11:00:25.975824-05	2025-03-18 11:00:25-05	1	d66ae9b6ec474a12bdb1a9ab423ee95d
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMxNDEwMCwiaWF0IjoxNzEwNzc4MTAwLCJqdGkiOiJkZGJiYzVhODNmOWY0YWNlYTA4YmFlODE3ZTdkZWE4ZCIsInVzZXJfaWQiOjF9.IOh9ew2EJ-NZbbL5XNCuzcnbdNgqtqqh28ppB4-SSe4	2024-03-18 11:08:20.786775-05	2025-03-18 11:08:20-05	1	ddbbc5a83f9f4acea08bae817e7dea8d
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMyNTk2MCwiaWF0IjoxNzEwNzg5OTYwLCJqdGkiOiI0OGZlNGJkNDM1ZGQ0ZTAxYmUwM2FkZGU3YTEyZDQ1MiIsInVzZXJfaWQiOjE3fQ.3HGaoJPmZo34ZcvMS-fI8Qdi6rrmU7cAQS2GlPcKMUU	2024-03-18 14:26:00.379707-05	2025-03-18 14:26:00-05	17	48fe4bd435dd4e01be03adde7a12d452
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMyNjg4NCwiaWF0IjoxNzEwNzkwODg0LCJqdGkiOiIwODRkY2Q2NTk4NzA0ZWMzYWExZjdjMzMxZmM4OGQ5OCIsInVzZXJfaWQiOjE4fQ.yRY0d0DKJsk3XpNufGtPvrs7LbQGACn66heachKOPRY	2024-03-18 14:41:24.889316-05	2025-03-18 14:41:24-05	18	084dcd6598704ec3aa1f7c331fc88d98
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMyNjkzMSwiaWF0IjoxNzEwNzkwOTMxLCJqdGkiOiIxZmI3MmNlNmMyYjk0NmY2OWZiNDkxMzAyM2QwNDVhMSIsInVzZXJfaWQiOjE1fQ.IVMs5h9un1ST8oZf14wXeA9EAZbNkqPEdUOFuFMtves	2024-03-18 14:42:11.738882-05	2025-03-18 14:42:11-05	15	1fb72ce6c2b946f69fb4913023d045a1
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MjMyNjk2NSwiaWF0IjoxNzEwNzkwOTY1LCJqdGkiOiIzMDU2NmVmOTA4ZGM0YWM1ODc4YjkyNDVlMjIzODEyYiIsInVzZXJfaWQiOjE4fQ.sE06aQ_qsWs6rosGExyQekjuRNsZEdqFFa3wmOatSVo	2024-03-18 14:42:45.109716-05	2025-03-18 14:42:45-05	18	30566ef908dc4ac5878b9245e223812b
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
\.


--
-- Data for Name: ventas_tipocotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_tipocotizacion (id, nombre, estado_id) FROM stdin;
\.


--
-- Data for Name: ventas_cotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_cotizacion (id, nombre, fecha, duracion, estado_id, proyecto_id, tipo_id) FROM stdin;
\.


--
-- Data for Name: ventas_tipocuota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_tipocuota (id, nombre, estado_id) FROM stdin;
1	Pago Contado	A
\.


--
-- Data for Name: ventas_cuota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_cuota (id, numero, tiempo, porcentaje, fecha, cotizacion_id, estado_id, tipo_id) FROM stdin;
\.


--
-- Data for Name: ventas_desasignacionconfiguracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_desasignacionconfiguracion (id, rango) FROM stdin;
\.


--
-- Data for Name: ventas_estadolead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_estadolead (nombre, descripcion, color, estado_id) FROM stdin;
NR	No responde	#949494	A
EP	En proceso	#949494	A
FR	Frio	#0044FF	A
TB	Tibio	#FFEE00	A
CA	Caliente	#FF0000	A
SE	Separaciones	#949494	A
CI	Cierre	#19FF00	A
\.


--
-- Data for Name: ventas_estadoseparacionlead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_estadoseparacionlead (nombre, descripcion, color, estado_id) FROM stdin;
SE	Separado	#0000000	A
VE	Vendido	#0000000	A
DE	Desistio	#0000000	A
\.


--
-- Data for Name: ventas_objecion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_objecion (id, nombre, estado_id) FROM stdin;
1	Ninguna	A
2	No estoy interesado	A
3	Número equivocado	A
4	Muy caro	A
5	Yo les devuelvo la llamada	A
6	Vuélveme a llamar	A
7	La ubicación no me gusta	A
\.


--
-- Data for Name: ventas_lead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_lead (id, nombre, apellido, asignado, celular, celular2, comentario, "horaRecepcion", llamar, importante, fecha_asignacion, fecha_desasignacion, "recienCreado", fecha_creacion, fecha_actualizacion, asesor_id, campania_id, estado_id, "estadoLead_id", objecion_id, "usuarioActualizador_id", "usuarioCreador_id", "estadoSeparacionLead_id") FROM stdin;
16			t	999999999	\N	Atencion no urgente	2024-03-17 19:31:49.723679-05	t	f	2024-03-17 19:36:46.204496-05	\N	f	2024-03-17 19:31:49.729653-05	2024-03-17 19:36:46.206088-05	15	2	A	EP	1	\N	\N	\N
10	Percy		t	911249144	913949194	Quiere atencion inmediata	2024-02-05 00:00:00-05	t	f	2024-03-17 19:36:46.251862-05	\N	f	2024-03-17 19:31:49.679059-05	2024-03-17 19:36:46.253303-05	15	2	A	EP	1	\N	\N	\N
9	Miguel	Peche	t	911393941	\N		2024-02-05 00:00:00-05	t	f	2024-03-17 19:36:46.25991-05	\N	f	2024-03-17 19:31:49.670497-05	2024-03-17 19:36:46.260931-05	16	3	A	EP	1	\N	\N	\N
8			t	983123832	988413		2024-02-05 00:00:00-05	t	f	2024-03-17 19:36:46.266074-05	\N	f	2024-03-17 19:31:49.660402-05	2024-03-17 19:36:46.267392-05	14	1	A	EP	1	\N	\N	\N
7	Juan		t	45151541	\N		2024-02-04 00:00:00-05	t	f	2024-03-17 19:36:46.273595-05	\N	f	2024-03-17 19:31:49.650999-05	2024-03-17 19:36:46.275306-05	15	2	A	EP	1	\N	\N	\N
4	Andrew	Jacobo Castillo	t	9595959595	\N		2024-02-04 00:00:00-05	t	f	2024-03-17 19:36:46.298595-05	\N	f	2024-03-17 19:31:49.622847-05	2024-03-17 19:36:46.299995-05	15	2	A	EP	1	\N	\N	\N
1	BRIAN	VELASCO	t	+51 963 852 147			2024-03-01 00:00:00-05	t	f	2024-03-17 19:04:13.964875-05	2024-03-17 23:28:38.715999-05	f	2024-03-17 19:04:13.973035-05	2024-03-17 23:28:38.73904-05	14	1	A	EP	1	17	18	\N
15			t	944857396	+98 989		2024-02-06 00:00:00-05	t	f	2024-03-17 19:36:46.212336-05	2024-03-17 23:29:34.743674-05	f	2024-03-17 19:31:49.720985-05	2024-03-17 23:29:34.75675-05	16	3	A	EP	1	17	\N	\N
2	Lead2		f	+51 963 256 894			2024-03-17 19:24:04.209549-05	t	f	2024-03-17 19:48:11.152995-05	2024-03-17 23:30:01.786641-05	f	2024-03-17 19:24:04.209614-05	2024-03-17 23:30:01.788069-05	\N	4	A	EP	1	\N	18	\N
12	Luis	Gutierrez Cueva	f	921840124	\N		2024-02-06 00:00:00-05	t	f	2024-03-17 19:36:46.235653-05	2024-03-17 23:30:22.788025-05	f	2024-03-17 19:31:49.695804-05	2024-03-17 23:30:22.789817-05	\N	3	A	EP	1	\N	\N	\N
13	Maria	Vasquez Mendez	f	952784659	\N		2024-02-06 00:00:00-05	t	f	2024-03-17 19:36:46.228453-05	2024-03-17 23:30:39.30439-05	f	2024-03-17 19:31:49.703891-05	2024-03-17 23:30:39.305988-05	\N	2	A	EP	1	\N	\N	\N
5	Carlos	Ruiz Begazo	f	363636339	\N		2024-02-04 00:00:00-05	t	f	2024-03-17 19:36:46.290605-05	2024-03-17 23:30:52.99215-05	f	2024-03-17 19:31:49.632375-05	2024-03-17 23:30:52.993414-05	\N	1	A	EP	1	\N	\N	\N
3	Jose	Martineli Alvarez	f	969685859	\N		2024-02-03 00:00:00-05	t	f	2024-03-17 19:36:46.307255-05	2024-03-17 23:31:28.263114-05	f	2024-03-17 19:31:49.613519-05	2024-03-17 23:31:28.264566-05	\N	3	A	EP	1	\N	\N	\N
14			t	943702641	\N		2024-02-06 00:00:00-05	t	f	2024-03-17 19:36:46-05	\N	f	2024-03-17 19:31:49-05	2024-03-18 10:25:17.326478-05	14	1	A	EP	1	\N	\N	SE
11	Samuel		t	913949511	\N		2024-02-05 00:00:00-05	t	f	2024-03-17 19:36:46-05	\N	f	2024-03-17 19:31:49-05	2024-03-18 10:28:52.627017-05	14	1	A	EP	1	\N	\N	DE
6	Solange	Calla Caceres	t	969685859	\N		2024-02-04 00:00:00-05	t	f	2024-03-17 19:36:46-05	\N	f	2024-03-21 19:31:49-05	2024-03-18 14:54:03.683065-05	16	3	A	EP	1	\N	\N	\N
17			t	888888888	\N	Atencion urgente	2024-03-17 19:31:49-05	t	f	2024-03-22 19:48:11-05	2024-03-18 14:32:16-05	f	2024-03-17 19:31:49-05	2024-03-18 14:55:03.52403-05	16	1	A	SE	1	17	\N	\N
\.


--
-- Data for Name: ventas_desasignacionleadasesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_desasignacionleadasesor (id, fecha, lead_id, usuario_id) FROM stdin;
1	2024-03-17 19:44:36.52309-05	2	14
2	2024-03-17 19:47:17.800837-05	17	14
3	2024-03-17 23:28:07.104927-05	1	14
4	2024-03-17 23:28:38.716139-05	1	14
5	2024-03-17 23:29:34.743728-05	15	16
6	2024-03-17 23:30:01.794264-05	2	16
7	2024-03-17 23:30:22.795725-05	12	16
8	2024-03-17 23:30:39.312167-05	13	15
9	2024-03-17 23:30:52.999147-05	5	14
10	2024-03-17 23:31:28.270446-05	3	16
11	2024-03-18 14:32:16.275719-05	17	16
\.


--
-- Data for Name: ventas_estadoevento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_estadoevento (id, nombre, estado_id) FROM stdin;
1	Creado	A
2	En Proceso	A
3	Finalizado	A
\.


--
-- Data for Name: ventas_tipoevento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_tipoevento (id, nombre, estado_id) FROM stdin;
1	Visita Campo	A
2	Visita Oficina	A
\.


--
-- Data for Name: ventas_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_evento (id, titulo, duracion, fecha_visita, observacion, fecha_creacion, fecha_actualizacion, separado, asesor_id, estado_id, "estadoEvento_id", lead_id, objecion_id, tipo_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
1	Solagne	10	2024-03-21 12:00:00-05		2024-03-18 10:41:36.870785-05	2024-03-18 10:41:36.872372-05	f	17	A	1	6	1	1	\N	17
\.


--
-- Data for Name: ventas_historicoleadasesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_historicoleadasesor (id, fecha_creacion, lead_id, usuario_id) FROM stdin;
1	2024-03-17 19:04:13.983718-05	1	14
2	2024-03-17 19:36:46.196793-05	17	14
3	2024-03-17 19:36:46.208163-05	16	15
4	2024-03-17 19:36:46.21569-05	15	16
5	2024-03-17 19:36:46.222742-05	14	14
6	2024-03-17 19:36:46.231848-05	13	15
7	2024-03-17 19:36:46.238408-05	12	16
8	2024-03-17 19:36:46.245785-05	11	14
9	2024-03-17 19:36:46.255319-05	10	15
10	2024-03-17 19:36:46.262552-05	9	16
11	2024-03-17 19:36:46.268952-05	8	14
12	2024-03-17 19:36:46.277387-05	7	15
13	2024-03-17 19:36:46.286018-05	6	16
14	2024-03-17 19:36:46.294247-05	5	14
15	2024-03-17 19:36:46.302927-05	4	15
16	2024-03-17 19:36:46.310328-05	3	16
17	2024-03-17 19:36:46.318314-05	2	14
18	2024-03-17 19:48:11.14885-05	17	16
19	2024-03-17 19:48:11.156803-05	2	16
\.


--
-- Data for Name: ventas_llamada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_llamada (id, detalle, contesto, fecha_creacion, fecha_actualizacion, asesor_id, estado_id, lead_id, objecion_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
\.


--
-- Data for Name: ventas_precio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_precio (id, precio, cotizacion_id, estado_id, "tipoProducto_id") FROM stdin;
\.


--
-- Data for Name: ventas_proyectotipoproducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_proyectotipoproducto (id, proyecto_id, tipo_producto_id) FROM stdin;
\.


--
-- Data for Name: ventas_whatsapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_whatsapp (id, detalle, respondio, fecha_creacion, fecha_actualizacion, asesor_id, estado_id, lead_id, objecion_id, "usuarioActualizador_id", "usuarioCreador_id") FROM stdin;
1	Bueno	t	2024-03-17 19:46:26.152079-05	2024-03-17 19:46:26.152375-05	14	A	17	5	\N	14
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 60, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 180, true);


--
-- Name: cuenta_modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_modulo_id_seq', 7, true);


--
-- Name: cuenta_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_user_groups_id_seq', 11, true);


--
-- Name: cuenta_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_user_id_seq', 18, true);


--
-- Name: cuenta_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 16, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 56, true);


--
-- Name: marketing_campania_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_campania_id_seq', 6, true);


--
-- Name: marketing_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_categoria_id_seq', 7, true);


--
-- Name: marketing_gastocampania_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_gastocampania_id_seq', 5, true);


--
-- Name: marketing_presupuestoproyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_presupuestoproyecto_id_seq', 2, true);


--
-- Name: marketing_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketing_proyecto_id_seq', 2, true);


--
-- Name: multimedia_imagenproducto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_imagenproducto_id_seq', 1, false);


--
-- Name: multimedia_imagenproyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_imagenproyecto_id_seq', 2, true);


--
-- Name: multimedia_videoproducto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_videoproducto_id_seq', 1, false);


--
-- Name: multimedia_videoproyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_videoproyecto_id_seq', 1, false);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 1, false);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 35, true);


--
-- Name: ventas_cotizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_cotizacion_id_seq', 1, false);


--
-- Name: ventas_cuota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_cuota_id_seq', 1, false);


--
-- Name: ventas_desasignacionconfiguracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_desasignacionconfiguracion_id_seq', 1, false);


--
-- Name: ventas_desasignacionleadasesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_desasignacionleadasesor_id_seq', 11, true);


--
-- Name: ventas_estadoevento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_estadoevento_id_seq', 3, true);


--
-- Name: ventas_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_evento_id_seq', 1, true);


--
-- Name: ventas_historicoleadasesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_historicoleadasesor_id_seq', 19, true);


--
-- Name: ventas_lead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_lead_id_seq', 17, true);


--
-- Name: ventas_llamada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_llamada_id_seq', 1, false);


--
-- Name: ventas_objecion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_objecion_id_seq', 7, true);


--
-- Name: ventas_precio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_precio_id_seq', 1, false);


--
-- Name: ventas_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_producto_id_seq', 1, false);


--
-- Name: ventas_proyectotipoproducto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_proyectotipoproducto_id_seq', 1, false);


--
-- Name: ventas_tipocotizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_tipocotizacion_id_seq', 1, false);


--
-- Name: ventas_tipocuota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_tipocuota_id_seq', 1, true);


--
-- Name: ventas_tipoevento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_tipoevento_id_seq', 2, true);


--
-- Name: ventas_tipoproducto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_tipoproducto_id_seq', 5, true);


--
-- Name: ventas_whatsapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_whatsapp_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

