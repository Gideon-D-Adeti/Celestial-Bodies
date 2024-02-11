--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(100) NOT NULL,
    size_in_light_years integer NOT NULL,
    has_spiral boolean NOT NULL,
    age integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    type character varying(50) NOT NULL,
    distance_from_parent_planet_in_km integer NOT NULL,
    is_in_orbit boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50) NOT NULL,
    radius_in_km numeric NOT NULL,
    is_habitable boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50) NOT NULL,
    mass_in_solar_masses numeric NOT NULL,
    is_visible_from_earth boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_system_id_seq OWNED BY public.star_system.star_system_id;


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

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 60000, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 132000, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 76900, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'Terrestrial', 384400, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Irregular', 9377, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Irregular', 23460, true);
INSERT INTO public.moon VALUES (4, 'Titan', 6, 'Regular', 1221870, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 'Regular', 1070412, true);
INSERT INTO public.moon VALUES (6, 'Enceladus', 6, 'Regular', 238037, true);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 'Regular', 671034, true);
INSERT INTO public.moon VALUES (8, 'Triton', 8, 'Irregular', 354759, true);
INSERT INTO public.moon VALUES (22, 'Callisto', 5, 'Regular', 1882709, true);
INSERT INTO public.moon VALUES (23, 'Io', 5, 'Regular', 421700, true);
INSERT INTO public.moon VALUES (24, 'Dione', 6, 'Regular', 377400, true);
INSERT INTO public.moon VALUES (25, 'Rhea', 6, 'Regular', 527100, true);
INSERT INTO public.moon VALUES (26, 'Tethys', 6, 'Regular', 294670, true);
INSERT INTO public.moon VALUES (27, 'Miranda', 8, 'Regular', 129390, true);
INSERT INTO public.moon VALUES (28, 'Ariel', 8, 'Regular', 190900, true);
INSERT INTO public.moon VALUES (29, 'Umbriel', 8, 'Regular', 266300, true);
INSERT INTO public.moon VALUES (30, 'Phoebe', 7, 'Irregular', 12952000, true);
INSERT INTO public.moon VALUES (31, 'Charon (Pluto)', 9, 'Regular', 19591, true);
INSERT INTO public.moon VALUES (32, 'Nereid (Neptune)', 9, 'Irregular', 5513810, true);
INSERT INTO public.moon VALUES (35, 'Oberon II', 8, 'Regular', 583520, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 2439.7, false, 'Mercury is the smallest planet in our solar system and the closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 6051.8, false, 'Venus is the second planet from the Sun and is often called Earth''s "sister planet" due to their similar size, mass, and proximity to the Sun.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 6371, true, 'Earth is the third planet from the Sun and the only known astronomical object to harbor life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 3389.5, false, 'Mars is the fourth planet from the Sun and is often referred to as the "Red Planet" due to its reddish appearance.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 69911, false, 'Jupiter is the largest planet in our solar system and is known for its massive size and distinctive bands of clouds.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 58232, false, 'Saturn is the sixth planet from the Sun and is famous for its stunning rings, which are made up of ice particles, rocks, and dust.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 25362, false, 'Uranus is the seventh planet from the Sun and is unique among the planets because it rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 24622, false, 'Neptune is the eighth and farthest planet from the Sun in our solar system. It is known for its beautiful blue color.');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf Planet', 1188.3, false, 'Pluto is a dwarf planet in our solar system, located in the Kuiper belt beyond Neptune.');
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, 'Terrestrial', 20121, true, 'Kepler-186f is an exoplanet orbiting the red dwarf star Kepler-186, located about 500 light-years from Earth.');
INSERT INTO public.planet VALUES (11, 'HD 40307g', 3, 'Super-Earth', 20000, true, 'HD 40307g is an exoplanet located in the habitable zone of the star HD 40307, approximately 42 light-years away from Earth.');
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 4, 'Terrestrial', 8000, true, 'Proxima Centauri b is an exoplanet orbiting the red dwarf star Proxima Centauri, the closest known exoplanet to the Solar System.');
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 5, 'Terrestrial', 9500, true, 'TRAPPIST-1e is one of the seven Earth-sized exoplanets orbiting the ultracool dwarf star TRAPPIST-1, located approximately 39 light-years away from Earth.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A-type', 2.1, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 3, 'G-type', 1.1, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 'M-type', 20, true);
INSERT INTO public.star VALUES (5, 'Vega', 5, 'A-type', 2.2, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 3, 'M-type', 0.12, true);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Solar System', 1, 'Our home system, containing the Sun, eight planets, dwarf planets, moons, asteroids, and comets.');
INSERT INTO public.star_system VALUES (2, 'Alpha Centauri system', 1, 'The closest star system to our own, containing three stars: Alpha Centauri A, B, and Proxima Centauri b.');
INSERT INTO public.star_system VALUES (3, 'Orion Nebula', 1, 'A giant star-forming region containing thousands of young stars, including the Trapezium Cluster.');
INSERT INTO public.star_system VALUES (4, 'Halton Arp 148', 2, 'A dwarf irregular galaxy orbiting Andromeda, known for its active star formation and blue compact dwarf nature.');
INSERT INTO public.star_system VALUES (5, 'Andromeda globular cluster system', 2, 'Hundreds of globular clusters containing millions of old stars orbit Andromeda.');
INSERT INTO public.star_system VALUES (6, 'Barred Owl Nebula', 2, 'A planetary nebula ejected from a dying star within Andromeda.');
INSERT INTO public.star_system VALUES (7, 'NGC 604', 3, 'A giant H II region within Triangulum, actively forming new stars.');
INSERT INTO public.star_system VALUES (8, 'Sharpless 2', 3, 'Another large H II region in Triangulum, known for its filamentary structure.');
INSERT INTO public.star_system VALUES (9, 'Triangulum globular cluster system', 3, 'Similar to Andromeda, Triangulum has a collection of orbiting globular clusters.');
INSERT INTO public.star_system VALUES (10, 'IC 1459', 4, 'A dwarf elliptical galaxy orbiting Centaurus A, known for its unusual box-shaped structure.');
INSERT INTO public.star_system VALUES (11, 'Centaurus A globular cluster system', 4, 'Hundreds of globular clusters orbit Centaurus A, offering clues about its formation history.');
INSERT INTO public.star_system VALUES (12, 'Radio lobes', 4, 'The galaxy''s central black hole powers vast radio jets extending millions of light-years.');
INSERT INTO public.star_system VALUES (13, 'Virgo A cluster', 5, 'M87 resides in the Virgo A galaxy cluster, containing thousands of galaxies.');
INSERT INTO public.star_system VALUES (14, 'M87 jet', 5, 'The supermassive black hole at M87''s center launches a powerful jet of material extending thousands of light-years.');
INSERT INTO public.star_system VALUES (15, 'Nearby dwarf galaxies', 5, 'Several dwarf galaxies orbit M87, potentially contributing to its growth.');
INSERT INTO public.star_system VALUES (16, 'NGC 5195', 6, 'This face-on spiral galaxy interacts with M51, triggering star formation in both galaxies.');
INSERT INTO public.star_system VALUES (17, 'M51-spiral arms', 6, 'The prominent spiral arms of both galaxies contain numerous star-forming regions and young stellar clusters.');
INSERT INTO public.star_system VALUES (18, 'Polar ring', 6, 'M51 possesses a unique ring of gas and dust perpendicular to its main disk.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_system_id_seq', 18, true);


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
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


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
-- Name: star_system star_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

