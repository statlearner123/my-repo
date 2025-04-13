--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
    name character varying(30),
    size integer,
    distance_from_earth numeric(38,10),
    age integer,
    description text,
    has_life boolean,
    code integer NOT NULL
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
    name character varying(30),
    size integer,
    distance_from_earth numeric(38,10),
    age integer,
    description text,
    has_life boolean,
    code integer NOT NULL,
    planet_id integer,
    moon_id integer NOT NULL
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
    name character varying(30),
    size integer,
    distance_from_earth numeric(38,10),
    age integer,
    description text,
    has_life boolean,
    code integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer
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
    name character varying(30),
    size integer,
    distance_from_earth numeric(38,10),
    age integer,
    description text,
    has_life boolean,
    code integer NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_planet_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer,
    name character varying(30),
    star_planet_pair character varying(100) NOT NULL,
    id2 integer
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


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
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0.0000000000, 13600, 'Our home galaxy, a barred spiral galaxy containing our Solar System', true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2.5370000000, 10000, 'Nearest major galaxy to the Milky Way, also known as M31', false, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 2.7300000000, 10000, 'Third-largest member of the Local Group, also known as M33', false, 3);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 14000, 0.1630000000, 1100, 'Satellite galaxy of the Milky Way and fourth-largest in the Local Group', false, 4);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7000, 0.1970000000, 6500, 'Dwarf galaxy near the Milky Way', false, 5);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 50000, 29.3500000000, 13250, 'Distinctive galaxy with a bright nucleus and large central bulge, also known as M104', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 3474, 0.0025700000, 4500, 'Earth''s only natural satellite', false, 1, 3, 1);
INSERT INTO public.moon VALUES ('Phobos', 22, 0.0079400000, 4500, 'Larger and inner of Mars'' two moons', false, 2, 4, 2);
INSERT INTO public.moon VALUES ('Deimos', 12, 0.0079400000, 4500, 'Smaller and outer of Mars'' two moons', false, 3, 4, 3);
INSERT INTO public.moon VALUES ('Io', 3643, 4.2000000000, 4500, 'Most volcanically active body in the Solar System', false, 4, 5, 4);
INSERT INTO public.moon VALUES ('Europa', 3122, 4.2000000000, 4500, 'Smooth surface and possible subsurface ocean', true, 5, 5, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5268, 4.2000000000, 4500, 'Largest moon in the Solar System', false, 6, 5, 6);
INSERT INTO public.moon VALUES ('Callisto', 4821, 4.2000000000, 4500, 'Second largest of Jupiter''s moons', false, 7, 5, 7);
INSERT INTO public.moon VALUES ('Titan', 5150, 8.2000000000, 4500, 'Second-largest moon in the Solar System with thick atmosphere', false, 8, 6, 8);
INSERT INTO public.moon VALUES ('Enceladus', 504, 8.2000000000, 4500, 'Has subsurface ocean and geysers', true, 9, 6, 9);
INSERT INTO public.moon VALUES ('Mimas', 396, 8.2000000000, 4500, 'Has large impact crater resembling Death Star', false, 10, 6, 10);
INSERT INTO public.moon VALUES ('Tethys', 1062, 8.2000000000, 4500, 'Mid-sized moon of Saturn with large impact crater', false, 11, 6, 11);
INSERT INTO public.moon VALUES ('Dione', 1123, 8.2000000000, 4500, 'Dense, mid-sized moon of Saturn with bright ice cliffs', false, 12, 6, 12);
INSERT INTO public.moon VALUES ('Titania', 1578, 19.2000000000, 4500, 'Largest moon of Uranus', false, 13, 7, 13);
INSERT INTO public.moon VALUES ('Oberon', 1522, 19.2000000000, 4500, 'Second largest moon of Uranus', false, 14, 7, 14);
INSERT INTO public.moon VALUES ('Miranda', 472, 19.2000000000, 4500, 'Has varied and unique surface features', false, 15, 7, 15);
INSERT INTO public.moon VALUES ('Triton', 2707, 30.1000000000, 4500, 'Largest moon of Neptune with retrograde orbit', false, 16, 8, 16);
INSERT INTO public.moon VALUES ('Nereid', 340, 30.1000000000, 4500, 'Third-largest moon of Neptune', false, 17, 8, 17);
INSERT INTO public.moon VALUES ('Proxima b I', 1200, 4.2000000000, 4800, 'Rocky moon orbiting Proxima Centauri b', false, 18, 9, 18);
INSERT INTO public.moon VALUES ('Andromeda Prime Ia', 2500, 2537000.0000000000, 6000, 'Large moon with thin atmosphere', false, 19, 11, 19);
INSERT INTO public.moon VALUES ('Triangulum Major I', 1800, 2730000.0000000000, 5000, 'Icy moon with subsurface ocean', true, 20, 12, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 4879, 0.3900000000, 4500, 'Smallest and innermost planet in the Solar System', false, 1, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 12104, 0.7200000000, 4500, 'Second planet from the Sun with thick atmosphere and extreme greenhouse effect', false, 2, 2, 1);
INSERT INTO public.planet VALUES ('Earth', 12756, 0.0000000000, 4500, 'Our home planet, the only known celestial body to harbor life', true, 3, 3, 1);
INSERT INTO public.planet VALUES ('Mars', 6792, 1.5200000000, 4500, 'Fourth planet from the Sun, known as the Red Planet', false, 4, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', 142984, 5.2000000000, 4500, 'Largest planet in the Solar System, a gas giant', false, 5, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 120536, 9.5000000000, 4500, 'Second-largest planet known for its prominent ring system', false, 6, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 51118, 19.8000000000, 4500, 'Seventh planet from the Sun, an ice giant with tilted rotation axis', false, 7, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 49528, 30.1000000000, 4500, 'Eighth and farthest known Solar planet, an ice giant', false, 8, 8, 1);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 12000, 4.2000000000, 4850, 'Potentially habitable exoplanet orbiting Proxima Centauri', false, 9, 9, 2);
INSERT INTO public.planet VALUES ('Sirius b', 17000, 8.6000000000, 230, 'White dwarf companion to Sirius A', false, 10, 10, 3);
INSERT INTO public.planet VALUES ('Andromeda Prime I', 15000, 2537000.0000000000, 6000, 'Habitable planet in the Andromeda Galaxy', true, 11, 11, 5);
INSERT INTO public.planet VALUES ('Triangulum Major', 18000, 2730000.0000000000, 5000, 'Gas giant in the Triangulum Galaxy with complex ring system', false, 12, 12, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1392700, 0.0000158000, 4600, 'The star at the center of our Solar System', true, 1, 1, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 200000, 4.2465000000, 4850, 'Closest known star to the Sun, part of the Alpha Centauri system', false, 2, 2, 1);
INSERT INTO public.star VALUES ('Sirius', 2400000, 8.6000000000, 230, 'Brightest star in Earth''s night sky, also known as the Dog Star', false, 3, 3, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 1234000000, 642.5000000000, 8, 'Red supergiant star in the constellation Orion, nearing the end of its life', false, 4, 4, 1);
INSERT INTO public.star VALUES ('Andromeda Prime', 1500000, 2537000.0000000000, 6500, 'Bright main sequence star in the Andromeda Galaxy', false, 5, 5, 2);
INSERT INTO public.star VALUES ('Triangulum Alpha', 1800000, 2730000.0000000000, 5200, 'Prominent star in the Triangulum Galaxy', false, 6, 6, 3);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (4, 1, 2, NULL, '1-2', 301);
INSERT INTO public.star_planet VALUES (5, 1, 3, NULL, '1-3', 302);
INSERT INTO public.star_planet VALUES (6, 2, 3, NULL, '2-3', 303);


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
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_star_planet_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_code_key UNIQUE (code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_id2_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_id2_key UNIQUE (id2);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


--
-- Name: moon unique_moon_code; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_code UNIQUE (code);


--
-- Name: planet unique_planet_code; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_code UNIQUE (code);


--
-- Name: star unique_star_code; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_code UNIQUE (code);


--
-- Name: star_planet unique_star_planet_pair; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT unique_star_planet_pair UNIQUE (star_id, planet_id);


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
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

