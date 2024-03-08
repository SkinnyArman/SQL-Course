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
    category character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    is_official boolean NOT NULL,
    radius integer,
    rating_on_scale_of_ten integer
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
-- Name: has_life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.has_life (
    has_life_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    population_estimate bigint NOT NULL
);


ALTER TABLE public.has_life OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.has_life_has_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_life_has_life_id_seq OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.has_life_has_life_id_seq OWNED BY public.has_life.has_life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_km numeric NOT NULL,
    mass_kg numeric NOT NULL,
    surface_temperature numeric
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
    name character varying(30) NOT NULL,
    star_id integer,
    diameter_km numeric,
    mass_kg numeric,
    distance_from_star_km numeric,
    surface_temperature numeric NOT NULL
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
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_cool boolean NOT NULL,
    description text,
    rating numeric(3,1),
    is_alive boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: has_life has_life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life ALTER COLUMN has_life_id SET DEFAULT nextval('public.has_life_has_life_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'elliptical', 'earth', true, 6378, 3);
INSERT INTO public.galaxy VALUES (2, 'spiral', 'venus', true, 6051, 9);
INSERT INTO public.galaxy VALUES (3, 'spiral', 'mars', true, 3389, 8);
INSERT INTO public.galaxy VALUES (4, 'elliptical', 'saturn', true, 58232, 1);
INSERT INTO public.galaxy VALUES (5, 'elliptical', 'pluto', false, 20282, 10);
INSERT INTO public.galaxy VALUES (6, 'elliptical', 'neptune', false, 30334, 1);


--
-- Data for Name: has_life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.has_life VALUES (1, 16, 'Alien World', 'A planet with diverse life forms.', 1000000000);
INSERT INTO public.has_life VALUES (2, 17, 'Paradise Planet', 'A lush green world with abundant flora and fauna.', 50000000);
INSERT INTO public.has_life VALUES (3, 18, 'Ice World', 'A frozen planet with extremophilic life forms.', 100000);
INSERT INTO public.has_life VALUES (4, 19, 'Ocean World', 'A planet covered entirely in vast oceans.', 2000000000);
INSERT INTO public.has_life VALUES (5, 20, 'Desert World', 'A dry, arid planet with adapted life forms.', 5000000);
INSERT INTO public.has_life VALUES (6, 21, 'Forest World', 'A planet dominated by dense forests.', 800000000);
INSERT INTO public.has_life VALUES (7, 22, 'Volcanic World', 'A planet with active volcanoes and unique life forms.', 1000000);
INSERT INTO public.has_life VALUES (8, 23, 'Gas Giant Moon', 'A moon orbiting a gas giant with exotic life forms.', 10000000);
INSERT INTO public.has_life VALUES (9, 24, 'Barren Rock', 'A rocky planet with scarce life forms.', 10000);
INSERT INTO public.has_life VALUES (10, 25, 'Mystical Planet', 'A planet shrouded in mystery with unknown life forms.', 100000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 16, 3476, 73500000000000000000000, -233);
INSERT INTO public.moon VALUES (2, 'Phobos', 17, 22.2, 10800000000000000, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 17, 12.4, 2000000000000000, -40);
INSERT INTO public.moon VALUES (4, 'Io', 18, 3643.2, 89400000000000000000000, -130);
INSERT INTO public.moon VALUES (5, 'Europa', 18, 3121.6, 48000000000000000000000, -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 18, 5262.4, 148000000000000000000000, -163);
INSERT INTO public.moon VALUES (7, 'Callisto', 18, 4800, 108000000000000000000000, -145);
INSERT INTO public.moon VALUES (8, 'Proxima Centauri b I', 19, 200, 1270000000000000, 234);
INSERT INTO public.moon VALUES (9, 'TRAPPIST-1e I', 20, 100, 6800000000000000, 251);
INSERT INTO public.moon VALUES (10, 'Gliese 581g I', 21, 300, 31000000000000000, 190);
INSERT INTO public.moon VALUES (11, 'HD 40307g I', 22, 150, 8200000000000000, 252);
INSERT INTO public.moon VALUES (12, 'Kepler-90i I', 23, 200, 2200000000000000, 670);
INSERT INTO public.moon VALUES (13, 'Kepler-16b I', 24, 400, 100000000000000000, 180);
INSERT INTO public.moon VALUES (14, 'Gliese 581c I', 25, 250, 5400000000000000, 31);
INSERT INTO public.moon VALUES (15, 'GJ 1214b I', 26, 500, 630000000000000, 200);
INSERT INTO public.moon VALUES (16, 'Kepler-438b I', 27, 250, 4300000000000000, 238);
INSERT INTO public.moon VALUES (17, 'Gliese 667 Cc I', 28, 400, 5500000000000000, 277);
INSERT INTO public.moon VALUES (18, 'Kepler-90i II', 23, 300, 2500000000000000, 670);
INSERT INTO public.moon VALUES (19, 'Kepler-16b II', 24, 500, 150000000000000000, 180);
INSERT INTO public.moon VALUES (20, 'Gliese 581c II', 25, 350, 6400000000000000, 31);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 'Mercury', 1, 4879, 330110000000000000000000, 57909227, 700);
INSERT INTO public.planet VALUES (17, 'Jupiter', 1, 139820, 1898200000000000000000000000, 778340821, -145);
INSERT INTO public.planet VALUES (18, 'Uranus', 2, 50724, 86810000000000000000000000, 2870658186, -216);
INSERT INTO public.planet VALUES (19, 'Kepler-22b', 3, 29554, 64000000000000000000000000, 200000000, 287);
INSERT INTO public.planet VALUES (20, 'Kepler-186f', 4, 16324, 3770000000000000000000000, 58550000, 189);
INSERT INTO public.planet VALUES (21, 'Proxima Centauri b', 5, 20000, 12700000000000000000000000, 46610000, 234);
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1e', 6, 9962, 6800000000000000000000000, 9740000, 251);
INSERT INTO public.planet VALUES (23, 'Gliese 581g', 1, 20000, 31000000000000000000000000, 37000000, 190);
INSERT INTO public.planet VALUES (24, 'HD 40307g', 2, 12200, 8200000000000000000000000, 21700000, 252);
INSERT INTO public.planet VALUES (25, 'Kepler-90i', 3, 16965, 2200000000000000000000000, 23700000, 670);
INSERT INTO public.planet VALUES (26, 'Kepler-16b', 4, 18974, 100000000000000000000000000, 10530000, 180);
INSERT INTO public.planet VALUES (27, 'Gliese 581c', 5, 13518, 5400000000000000000000000, 10410000, 31);
INSERT INTO public.planet VALUES (28, 'GJ 1214b', 6, 26100, 630000000000000000000000, 2038000, 200);
INSERT INTO public.planet VALUES (29, 'Kepler-438b', 1, 10360, 4300000000000000000000000, 15500000, 238);
INSERT INTO public.planet VALUES (30, 'Gliese 667 Cc', 2, 18968, 5500000000000000000000000, 23120000, 277);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', true, 'Sirius is the brightest star in the night sky and is known as the "Dog Star".', 4.5, true);
INSERT INTO public.star VALUES (3, 2, 'Betelgeuse', false, 'Betelgeuse is a red supergiant star located in the constellation of Orion.', 3.2, false);
INSERT INTO public.star VALUES (2, 3, 'Proxima Centauri', true, 'Proxima Centauri is the closest known star to the Sun, located in the Alpha Centauri star system.', 2.7, true);
INSERT INTO public.star VALUES (5, 4, 'Alpha Centauri A', false, 'Alpha Centauri A is the primary star in the Alpha Centauri system, a binary star system.', 4.8, false);
INSERT INTO public.star VALUES (4, 5, 'Vega', true, 'Vega is the brightest star in the constellation of Lyra and is one of the most studied stars outside the Solar System.', 3.9, true);
INSERT INTO public.star VALUES (6, 6, 'Polaris', false, 'Polaris, also known as the North Star or Pole Star, is famous for its nearly fixed position in the northern sky.', 2.1, true);
INSERT INTO public.star VALUES (3, 7, 'Canopus', true, 'Canopus is the second brightest star in the night sky.', 4.7, true);
INSERT INTO public.star VALUES (2, 8, 'Arcturus', false, 'Arcturus is the brightest star in the northern celestial hemisphere.', 3.8, true);
INSERT INTO public.star VALUES (1, 9, 'Aldebaran', true, 'Aldebaran is a red giant star located in the constellation of Taurus.', 3.5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.has_life_has_life_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: has_life has_life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_pkey PRIMARY KEY (has_life_id);


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
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: has_life unique_has_life_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT unique_has_life_id UNIQUE (has_life_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: has_life has_life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--