--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-19 23:43:39 +06

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16416)
-- Name: country; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE public.country OWNER TO a111;

--
-- TOC entry 212 (class 1259 OID 16436)
-- Name: discover; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date
);


ALTER TABLE public.discover OWNER TO a111;

--
-- TOC entry 211 (class 1259 OID 16426)
-- Name: disease; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE public.disease OWNER TO a111;

--
-- TOC entry 209 (class 1259 OID 16411)
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE public.diseasetype OWNER TO a111;

--
-- TOC entry 215 (class 1259 OID 16481)
-- Name: doctor; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


ALTER TABLE public.doctor OWNER TO a111;

--
-- TOC entry 214 (class 1259 OID 16471)
-- Name: publicservant; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);


ALTER TABLE public.publicservant OWNER TO a111;

--
-- TOC entry 217 (class 1259 OID 16506)
-- Name: record; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_death integer,
    total_patients integer
);


ALTER TABLE public.record OWNER TO a111;

--
-- TOC entry 216 (class 1259 OID 16491)
-- Name: specialize; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);


ALTER TABLE public.specialize OWNER TO a111;

--
-- TOC entry 213 (class 1259 OID 16461)
-- Name: users; Type: TABLE; Schema: public; Owner: a111
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE public.users OWNER TO a111;

--
-- TOC entry 3633 (class 0 OID 16416)
-- Dependencies: 210
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.country (cname, population) FROM stdin;
italy	59550000
china	1402000000
belgium	11050000
japan	125800000
france	67390000
canada	38010000
russia	144100000
kazakhstan	18000000
usa	395500000
spain	47350000
germany	83240000
switzerland	8637000
\.


--
-- TOC entry 3635 (class 0 OID 16436)
-- Dependencies: 212
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.discover (cname, disease_code, first_enc_date) FROM stdin;
china	covid_19	2019-12-31
china	asthma	1792-01-01
japan	allergic rhinitis	1859-01-01
canada	arrhythmia	1906-01-01
usa	lyme	1975-01-01
germany	schizophrenia	1887-01-01
germany	dementia	1910-01-01
germany	chlamydia	1907-01-01
germany	depression	1867-01-01
switzerland	acne	1931-01-01
\.


--
-- TOC entry 3634 (class 0 OID 16426)
-- Dependencies: 211
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.disease (disease_code, pathogen, description, id) FROM stdin;
lyme	bacteria	Lyme disease is a bacterial infection you get from the bite of an infected tick.	7
chlamydia	bacteria	Chlamydia is a common sexually transmitted disease caused by bacteria Chlamydia trachomatis.	5
covid_19	virus	Coronavirus disease (COVID-19) is an infectious disease caused by the SARS-CoV-2 virus.	2
asthma	bacteria	Asthma is a condition in which your airways narrow and swell and may produce extra mucus.	6
allergic rhinitis	bacteria	Allergic rhinitis (AR) is a heterogeneous disorder that despite its high prevalence is often undiagnosed.	6
acne	bacteria	Acne is a skin condition that occurs when your hair follicles become plugged with oil and dead skin cells.	6
arrhythmia	bacteria	An arrhythmia is a problem with the rate or rhythm of a heartbeat.	4
dementia	virus	Dementia is a general term for loss of memory, language, problem-solving and other thinking abilities.	3
depression	bacteria	Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest.	3
schizophrenia	virus	Schizophrenia is a serious mental disorder in which people interpret reality abnormally.	3
\.


--
-- TOC entry 3632 (class 0 OID 16411)
-- Dependencies: 209
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.diseasetype (id, description) FROM stdin;
1	infectious
2	virology
3	psychological
4	cardiovascular
5	std
6	inflammotory
7	deficiency
8	heridatary
9	cancer
10	physiological
\.


--
-- TOC entry 3638 (class 0 OID 16481)
-- Dependencies: 215
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.doctor (email, degree) FROM stdin;
m.eriksen@gmail.com	degree1
doja.cat@gmail.com	degree2
alex@gmail.com	degree3
danny@gmail.com	degree3
cersei@gmail.com	degree3
ramsay@gmail.com	degree2
ellaria@gmail.com	degree2
daario@gmail.com	degree1
worm@gmail.com	degree2
john@gmail.com	degree1
\.


--
-- TOC entry 3637 (class 0 OID 16471)
-- Dependencies: 214
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.publicservant (email, department) FROM stdin;
sansa@gmail.com	dept1
aria@gmail.com	dept2
robert@gmail.com	dept2
jaime@gmail.com	dept3
davos@gmail.com	dept1
jeor@gmail.com	dept1
samwell@gmail.com	dept2
stannis@gmail.com	dept2
theon@gmail.com	dept3
viserys@gmail.com	dept2
\.


--
-- TOC entry 3640 (class 0 OID 16506)
-- Dependencies: 217
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.record (email, cname, disease_code, total_death, total_patients) FROM stdin;
sansa@gmail.com	china	asthma	800	100000
aria@gmail.com	japan	chlamydia	600	90000000
robert@gmail.com	germany	covid_19	90	604000
robert@gmail.com	china	covid_19	1200	1200000
robert@gmail.com	russia	covid_19	700	8000
jaime@gmail.com	kazakhstan	lyme	90	65000
jaime@gmail.com	russia	depression	75	140000
davos@gmail.com	france	covid_19	45	90000
davos@gmail.com	china	covid_19	85	100000
jeor@gmail.com	switzerland	covid_19	700	120000
jeor@gmail.com	spain	covid_19	30	70000
jeor@gmail.com	italy	covid_19	100	40000
samwell@gmail.com	usa	arrhythmia	55	90000
samwell@gmail.com	japan	acne	95	75000
stannis@gmail.com	canada	acne	80	90000
stannis@gmail.com	usa	covid_19	1000	10000000
theon@gmail.com	belgium	dementia	15	15000
theon@gmail.com	russia	asthma	50	105000
viserys@gmail.com	spain	acne	80	200000
\.


--
-- TOC entry 3639 (class 0 OID 16491)
-- Dependencies: 216
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.specialize (id, email) FROM stdin;
1	m.eriksen@gmail.com
2	m.eriksen@gmail.com
2	doja.cat@gmail.com
2	alex@gmail.com
3	danny@gmail.com
6	cersei@gmail.com
7	ramsay@gmail.com
4	ellaria@gmail.com
8	daario@gmail.com
1	worm@gmail.com
3	john@gmail.com
4	danny@gmail.com
8	ramsay@gmail.com
2	cersei@gmail.com
2	john@gmail.com
9	m.eriksen@gmail.com
5	danny@gmail.com
\.


--
-- TOC entry 3636 (class 0 OID 16461)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: a111
--

COPY public.users (email, name, surname, salary, phone, cname) FROM stdin;
m.eriksen@gmail.com	Marshall	Eriksen	341000	890234	usa
doja.cat@gmail.com	Doja	Cat	56000	384904	canada
alex@gmail.com	Alex	Turner	47000	7894650	usa
danny@gmail.com	Daenerys	Targaryen	45000	454020	germany
cersei@gmail.com	Cersei	Lannisterbek	28000	9247729	spain
ramsay@gmail.com	Ramsay	Bolton	89000	327130	italy
ellaria@gmail.com	Ellaria	Sand	77000	427494	spain
daario@gmail.com	Daario	Naharisbek	37000	38921389	russia
worm@gmail.com	Grey\n	Worm	87000	747289364\n	italy
john@gmail.com	John	Snow	67000	2596028	switzerland
sansa@gmail.com	Sansa	Stark	58000	237280	usa
aria@gmail.com	Aria	Starkbek	47200	853702	kazakhstan
robert@gmail.com	Robert	Barateonbek	67000	6895086	china
jaime@gmail.com	Jaime	Lannister	90000	2903085	china
davos@gmail.com	Davos	Seaworth	67000	8237289	france
jeor@gmail.com	Jeor	Mormont	29000	2389201	russia
samwell@gmail.com	Samwell\n	Tarly	85000	327489239\n	china
stannis@gmail.com	Stannis	Baratheon	67000	68392462\n	italy
theon@gmail.com	Theon\n	Greyjoy\n	45000	732489\n	japan
viserys@gmail.com	Viserys\n	Targaryen\n	99000	2473894	kazakhstan
\.


--
-- TOC entry 3467 (class 2606 OID 16420)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- TOC entry 3471 (class 2606 OID 16440)
-- Name: discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- TOC entry 3469 (class 2606 OID 16430)
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- TOC entry 3465 (class 2606 OID 16415)
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 16485)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- TOC entry 3475 (class 2606 OID 16475)
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- TOC entry 3481 (class 2606 OID 16510)
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- TOC entry 3479 (class 2606 OID 16495)
-- Name: specialize specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);


--
-- TOC entry 3473 (class 2606 OID 16465)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 3484 (class 2606 OID 16446)
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3483 (class 2606 OID 16441)
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3482 (class 2606 OID 16431)
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- TOC entry 3487 (class 2606 OID 16486)
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3486 (class 2606 OID 16476)
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3490 (class 2606 OID 16516)
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3492 (class 2606 OID 24583)
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3491 (class 2606 OID 24578)
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email);


--
-- TOC entry 3489 (class 2606 OID 16501)
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email);


--
-- TOC entry 3488 (class 2606 OID 16496)
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- TOC entry 3485 (class 2606 OID 16466)
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a111
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


-- Completed on 2021-11-19 23:43:40 +06

--
-- PostgreSQL database dump complete
--

