--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_sequence
    START WITH 1000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_sequence OWNER TO postgres;

--
-- Name: event_idseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_idseq
    START WITH 1000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_idseq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: event_user_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_user_provider (
    eventid integer NOT NULL,
    userid integer NOT NULL,
    photographer_id integer,
    photographer_name text,
    decorator_id integer,
    decorator_name text,
    caterer_id integer,
    caterer_name text,
    florist_id integer,
    florist_name text,
    baker_id integer,
    baker_name text
);


ALTER TABLE public.event_user_provider OWNER TO postgres;

--
-- Name: eventorganizers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventorganizers (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(20),
    website character varying(255),
    city character varying(100),
    description text,
    image_url character varying(255)
);


ALTER TABLE public.eventorganizers OWNER TO postgres;

--
-- Name: eventorganizers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventorganizers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventorganizers_id_seq OWNER TO postgres;

--
-- Name: eventorganizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventorganizers_id_seq OWNED BY public.eventorganizers.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    eventid integer NOT NULL,
    userid integer NOT NULL,
    eventname character varying(100) NOT NULL,
    eventtype character varying(100) NOT NULL,
    eventdate date NOT NULL,
    totalguests integer NOT NULL,
    location character varying(100) NOT NULL,
    cuisinepreferences character varying(255),
    decorationtheme character varying(255),
    entertainmentpreferences character varying(255)
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_eventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_eventid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_eventid_seq OWNER TO postgres;

--
-- Name: events_eventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_eventid_seq OWNED BY public.events.eventid;


--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_id_seq OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: serviceproviders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serviceproviders (
    serviceproviderid integer NOT NULL,
    name character varying(100),
    phone character varying(15),
    email character varying(255),
    servicetype character varying(100),
    description character varying(255),
    skills character varying(100),
    rating double precision,
    experience character varying(100),
    image_url character varying(255),
    city character varying(50)
);


ALTER TABLE public.serviceproviders OWNER TO postgres;

--
-- Name: serviceproviders_serviceproviderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serviceproviders_serviceproviderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serviceproviders_serviceproviderid_seq OWNER TO postgres;

--
-- Name: serviceproviders_serviceproviderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serviceproviders_serviceproviderid_seq OWNED BY public.serviceproviders.serviceproviderid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    joined timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: eventorganizers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventorganizers ALTER COLUMN id SET DEFAULT nextval('public.eventorganizers_id_seq'::regclass);


--
-- Name: events eventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN eventid SET DEFAULT nextval('public.events_eventid_seq'::regclass);


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: serviceproviders serviceproviderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serviceproviders ALTER COLUMN serviceproviderid SET DEFAULT nextval('public.serviceproviders_serviceproviderid_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: event_user_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_user_provider (eventid, userid, photographer_id, photographer_name, decorator_id, decorator_name, caterer_id, caterer_name, florist_id, florist_name, baker_id, baker_name) FROM stdin;
20	8	1	John Smith	2	Jane Doe	4	Emily Brown	5	David Lee	8	Rachel Adams
21	8	1	John Smith	2	Jane Doe	4	Emily Brown	5	David Lee	8	Rachel Adams
22	13	1	John Smith	2	Jane Doe	4	Emily Brown	5	David Lee	8	Rachel Adams
\.


--
-- Data for Name: eventorganizers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventorganizers (id, name, email, phone, website, city, description, image_url) FROM stdin;
10	Organizer 10	organizer10@example.com	777-888-9999	www.organizer10.com	City10	Description of Organizer 10	https://picsum.photos/id/2/200/300
11	Organizer 11	organizer11@example.com	888-999-0000	www.organizer11.com	City11	Description of Organizer 11	https://picsum.photos/id/3/200/300
2	Organizer 2	organizer2@example.com	987-654-3210	www.organizer2.com	City2	Description of Organizer 2	https://picsum.photos/id/4/200/300
3	Organizer 3	organizer3@example.com	456-789-0123	www.organizer3.com	City3	Description of Organizer 3	https://picsum.photos/id/5/200/300
4	Organizer 4	organizer4@example.com	111-222-3333	www.organizer4.com	City4	Description of Organizer 4	https://picsum.photos/id/6/200/300
5	Organizer 5	organizer5@example.com	222-333-4444	www.organizer5.com	City5	Description of Organizer 5	https://picsum.photos/id/7/200/300
6	Organizer 6	organizer6@example.com	333-444-5555	www.organizer6.com	City6	Description of Organizer 6	https://picsum.photos/id/8/200/300
7	Organizer 7	organizer7@example.com	444-555-6666	www.organizer7.com	City7	Description of Organizer 7	https://picsum.photos/id/9/200/300
8	Organizer 8	organizer8@example.com	555-666-7777	www.organizer8.com	City8	Description of Organizer 8	https://picsum.photos/id/10/200/300
9	Organizer 9	organizer9@example.com	666-777-8888	www.organizer9.com	City9	Description of Organizer 9	https://picsum.photos/id/11/200/300
12	Organizer 12	organizer12@example.com	999-000-1111	www.organizer12.com	City12	Description of Organizer 12	https://picsum.photos/id/12/200/300
1	Organizer 1	https://www.lipsum.com	123-456-7890	www.organizer1.com	City1	Description of Organizer 1	https://picsum.photos/id/1/200/300
13	Organizer 13	organizer13@example.com	000-111-2222	www.organizer13.com	City13	Description of Organizer 13	https://picsum.photos/id/13/200/300
19	abc	abc@email	222	example.com	vancouver	descriptiion	https://picsum.photos/id/1/200/300
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (eventid, userid, eventname, eventtype, eventdate, totalguests, location, cuisinepreferences, decorationtheme, entertainmentpreferences) FROM stdin;
20	8	h bday	bday	2024-04-04	100	Surrey	asian	mickymouse	clown
21	8	h bday	bday	2024-04-10	100	Surrey	asian	mickymouse	any
22	13	h bday	bday	2024-04-05	100	Surrey	asian	mickymouse	adf
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, hash, email) FROM stdin;
5	$2a$10$9BdCR3w60OSp2xFQQ/nejuvDEQrAYj0nAl/K7qSIprtVEaL4GR3kG	john@example.com
10	$2a$10$/4I9K4dDopL3xb.C4w.fM.ijjoMqqFOnAOOcdxulnUwIIN2J/HrUO	jashan@columbia.ca
\.


--
-- Data for Name: serviceproviders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serviceproviders (serviceproviderid, name, phone, email, servicetype, description, skills, rating, experience, image_url, city) FROM stdin;
3	Mike Johnson	555-123-4567	mike@example.com	Musician	Talented musician providing live music entertainment for events.	Music Performance, Live Events	4.8	8	https://picsum.photos/id/13/200/300	Burnaby
6	Sarah Wilson	999-888-7777	sarah@example.com	Event Planner	Experienced event planner coordinating all aspects of events.	Event Management, Planning	4.7	9	https://picsum.photos/id/16/200/300	Coquitlam
7	Alex Turner	777-888-9999	alex@example.com	DJ	Dynamic DJ providing music entertainment tailored to events.	DJ Services, Music Mixing	4.9	10	https://picsum.photos/id/17/200/300	Kelowna
9	Daniel Martinez	666-777-8888	daniel@example.com	Event Coordinator	Efficient event coordinator handling logistics for successful events.	Event Coordination, Logistics	4.6	8	https://picsum.photos/id/19/200/300	Victoria
1	John Smith	123-456-7890	john@example.com	photographer	Experienced photographer specializing in event coverage.	Photography, Event Coverage	4.5	5	https://picsum.photos/id/11/200/300	Surrey
2	Jane Doe	987-654-3210	jane@example.com	decorator	Creative decorator with a passion for transforming spaces.	Decoration, Event Design	4.2	6	https://picsum.photos/id/12/200/300	Surrey
4	Emily Brown	222-333-4444	emily@example.com	caterer	Experienced caterer offering a variety of cuisine options for events.	Catering, Food Service	4.6	7	https://picsum.photos/id/14/200/300	Surrey
5	David Lee	111-222-3333	david@example.com	florist	Creative florist specializing in floral arrangements for events.	Flower Arrangement, Event Decor	4.4	5	https://picsum.photos/id/15/200/300	Surrey
8	Rachel Adams	444-555-6666	rachel@example.com	baker	Skilled baker creating delicious desserts for events.	Baking, Pastry	4.3	6	https://picsum.photos/id/18/200/300	Surrey
104	name 	phone	email	photographer	description	photographer	4.1	2	https://picsum.photos/id/1/200/300	surrey
105	jashan	6046714034	jashan@gmail.com	photographer 	edhk	photographer	4.1	2 	https://picsum.photos/id/1/200/300	Surrey
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, joined) FROM stdin;
8	john	john@example.com	2024-03-24 23:48:51.56
1	Johyyy	johaaaan@example.com	2024-03-24 16:50:03.637
13	jashan 	jashan@columbia.ca	2024-04-04 11:27:44.679
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 1040, true);


--
-- Name: event_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_sequence', 1000, false);


--
-- Name: event_idseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_idseq', 1510, true);


--
-- Name: eventorganizers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventorganizers_id_seq', 19, true);


--
-- Name: events_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_eventid_seq', 22, true);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 10, true);


--
-- Name: serviceproviders_serviceproviderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serviceproviders_serviceproviderid_seq', 105, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: event_user_provider event_user_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_user_provider
    ADD CONSTRAINT event_user_provider_pkey PRIMARY KEY (eventid, userid);


--
-- Name: eventorganizers eventorganizers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventorganizers
    ADD CONSTRAINT eventorganizers_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: serviceproviders serviceproviders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serviceproviders
    ADD CONSTRAINT serviceproviders_pkey PRIMARY KEY (serviceproviderid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: event_user_provider event_user_provider_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_user_provider
    ADD CONSTRAINT event_user_provider_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.events(eventid) ON DELETE CASCADE;


--
-- Name: event_user_provider event_user_provider_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_user_provider
    ADD CONSTRAINT event_user_provider_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: events fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

