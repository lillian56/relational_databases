--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_types character varying(50),
    diameter_light_years numeric(20,2),
    mass_solar_mass numeric(30,2),
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100),
    diameter_km numeric(10,2),
    orbital_period_days numeric(10,2),
    discovered_year integer,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_types character varying(50),
    mass_earth numeric(10,2),
    radius_earth text,
    orbital_period_days numeric(10,2),
    distance_from_star_au numeric(10,3),
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_types character(2),
    mass_solar numeric(10,2),
    temperature_kelvin integer,
    luminosity_solar numeric(10,2),
    age_in_millions_of_years numeric(15,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    star_id integer NOT NULL,
    system_id integer NOT NULL,
    component_letter character(1),
    is_primary boolean DEFAULT false,
    name character varying(40) NOT NULL
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq OWNED BY public.star_system.star_system_id;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    system_type character varying(30) NOT NULL
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galaxy_types, diameter_light_years, mass_solar_mass, discovered_year) FROM stdin;
1	银河系	螺旋星系	100000.00	1000000000000.00	\N
2	仙女座星系	螺旋星系	220000.00	1200000000000.00	964
3	三角座星系	螺旋星系	60000.00	50000000000.00	1654
4	大麦哲伦云	不规则星系	14000.00	10000000000.00	1519
5	其它	其它星系	14000.00	10000000000.00	1519
6	未知	未知星系	14000.00	10000000000.00	1519
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, planet_id, name, diameter_km, orbital_period_days, discovered_year, has_life) FROM stdin;
1	3	月球	3474.80	27.32	\N	f
2	4	火卫一	22.20	0.32	1877	f
3	4	火卫二	12.40	1.26	1877	f
4	5	木卫一（伊娥）	3643.20	1.77	1610	f
5	5	木卫二（欧罗巴）	3121.60	3.55	1610	f
6	5	木卫三（盖尼米得）	5268.20	7.16	1610	f
7	5	木卫四（卡利斯托）	4820.60	16.69	1610	f
8	5	木卫五（阿马尔塞）	262.00	0.50	1892	f
9	5	木卫十四（底比）	116.00	0.67	1979	f
10	6	土卫六（泰坦）	5150.00	15.95	1655	f
11	6	土卫二（恩克拉多斯）	504.20	1.37	1789	f
12	6	土卫一（弥玛斯）	396.40	0.94	1789	f
13	6	土卫八（伊阿珀托斯）	1469.00	79.33	1671	f
14	6	土卫四（狄俄涅）	1123.40	2.74	1684	f
15	7	天卫一（阿里尔）	1157.80	2.52	1851	f
16	7	天卫二（乌姆柏里厄尔）	1169.40	4.14	1851	f
17	7	天卫三（泰坦尼亚）	1576.80	8.71	1787	f
18	7	天卫四（奥伯龙）	1522.80	13.46	1787	f
19	8	海卫一（特里同）	2706.80	5.88	1846	f
20	8	海卫二（内勒德）	340.00	360.14	1949	f
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, star_id, name, planet_types, mass_earth, radius_earth, orbital_period_days, distance_from_star_au, has_atmosphere) FROM stdin;
1	1	水星	类地行星	0.06	0.383	87.97	0.387	f
2	1	金星	类地行星	0.82	0.949	224.70	0.723	t
3	1	地球	类地行星	1.00	1.000	365.26	1.000	t
4	1	火星	类地行星	0.11	0.532	686.98	1.524	t
5	1	木星	气态巨行星	317.83	11.209	4332.59	5.204	t
6	1	天王星	冰巨行星	14.54	4.007	30688.50	19.201	t
7	1	海王星	冰巨行星	17.15	3.883	60182.00	30.047	t
8	1	冥王星	矮行星	0.00	0.188	90560.00	39.482	t
9	2	比邻星b	类地行星	1.17	1.10	11.19	0.049	t
10	2	比邻星c	超级地球	7.00	1.80	1928.00	1.489	f
11	8	半人马座αBb	类地行星	1.13	1.10	3.24	0.040	t
12	2	半人马座	类地行星	1.23	1.12	3.14	0.140	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, galaxy_id, name, spectral_types, mass_solar, temperature_kelvin, luminosity_solar, age_in_millions_of_years) FROM stdin;
1	1	太阳	G2	1.00	5778	1.00	4570.00
2	1	比邻星	M5	0.12	3042	0.00	4850.00
3	1	天狼星A	A1	2.02	9940	25.40	242.00
4	2	阿尔法仙女座A	A0	2.30	9600	31.60	6000.00
9	1	天狼星B	DA	0.98	25200	0.03	242.00
10	1	织女星	A0	2.14	9600	40.10	455.00
11	1	北极星	F7	5.40	7200	2000.00	7000.00
7	1	天狼星D	A1	2.02	9940	25.40	242.00
8	2	天狼星C	A0	2.30	9600	31.60	6000.00
\.


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star_system (star_system_id, star_id, system_id, component_letter, is_primary, name) FROM stdin;
8	3	1	A	t	系统1
9	7	1	B	f	系统2
10	8	2	A	t	系统3
11	9	2	B	f	系统4
12	2	2	C	f	系统5
\.


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.system (system_id, name, system_type) FROM stdin;
1	天狼星系统	双星
2	半人马座α系统	三合星
3	大陵五系统	双星
4	天鹅座β系统	双星
5	开阳系统	七合星
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq', 12, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 5, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_system star_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key UNIQUE (name);


--
-- Name: star_system star_system_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key1 UNIQUE (name);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


--
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_system star_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star_system star_system_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- PostgreSQL database dump complete
--

