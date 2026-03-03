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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    blackhole_type character varying(40),
    distance_light_years bigint,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    distance_light_years bigint,
    diameter_light_years integer,
    has_supermassive_black_hole boolean,
    constellation character varying(30)
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
    name character varying(50) NOT NULL,
    moon_type character varying(40),
    radius_km numeric(8,2),
    has_atmosphere boolean,
    planet_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    planet_type character varying(40),
    has_life boolean,
    orbital_period_days numeric(10,4),
    description text,
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    star_type character varying(20),
    radius_solar double precision,
    surface_temperature_k integer,
    galaxy_id integer
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 'Supermassive', 26700, 1);
INSERT INTO public.blackhole VALUES (2, 'M31*', 'Supermassive', 2537000, 2);
INSERT INTO public.blackhole VALUES (3, 'M87*', 'Supermassive', 53000000, 6);
INSERT INTO public.blackhole VALUES (4, 'M33 X-7', 'Stellar-mass', 2730000, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 27000, 100000, true, 'None');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral galaxy', 2537000, 220000, true, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral galaxy', 2730000, 60000, true, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular galaxy', 163000, 14000, true, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular galaxy', 200000, 7000, true, 'Tucana');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical galaxy', 53000000, 240000, true, 'Virgo');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Regular moon', 1737.40, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular moon', 11.27, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Irregular moon', 6.20, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Regular moon', 1821.60, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Regular moon', 1560.80, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Regular moon', 2634.10, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Regular moon', 2410.30, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Regular moon', 2574.70, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Regular moon', 252.10, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Regular moon', 198.20, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Regular moon', 763.80, false, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Regular moon', 734.50, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Regular moon', 561.40, false, 6);
INSERT INTO public.moon VALUES (14, 'Thetys', 'Regular moon', 531.10, false, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Irregular moon', 135.00, false, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Regular moon', 235.80, false, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Regular moon', 578.90, false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Regular moon', 584.70, false, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 'Regular moon', 788.80, false, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Regular moon', 761.40, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial planet', true, 365.2564, 'Earth is the third planet from the Sun and the only known planet to support life, with abundant liquid water on its surface.', 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial planet', false, 87.9691, 'Mercury is the smallest planet in the Solar System and the closest to the Sun. It has an extremely thin atmosphere and experiences extreme temperature variations.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial planet', false, 224.7010, 'Venus is a rocky planet with a thick carbon dioxide atmosphere and a strong greenhouse effect, making it the hottest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial planet', false, 686.9800, 'Mars is a cold desert world known as the Red Planet. It shows evidence of past liquid water but no confirmed present-day life.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', false, 4332.5890, 'Jupiter is the largest planet in the Solar System, a gas giant known for its Great Red Spot and strong magnetic field.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', false, 10759.2200, 'Saturn is a gas giant famous for its prominent ring system and low average density.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 60182.0000, 'Neptune is the most distant known major planet in the Solar System and is known for its strong supersonic winds.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 30688.5000, 'Uranus is an ice giant that rotates on its side, likely due to a past collision. It has a cold atmosphere rich in hydrogen, helium, and methane.', 1);
INSERT INTO public.planet VALUES (9, 'Procima Centauri B', 'Rocky exoplanet', false, 11.1860, 'Proxima Centauri b is an Earth-mass exoplanet orbiting within the habitable zone of Proxima Centauri, though its actual habitability remains unknown.', 6);
INSERT INTO public.planet VALUES (10, 'Procima Centauri C', 'Super-Earth candidate', false, 1928.0000, 'Proxima Centauri c is a long-period exoplanet candidate orbiting Proxima Centauri, likely much colder than Earth.', 6);
INSERT INTO public.planet VALUES (11, 'Procima Centauri D', 'Sub-Earth exoplanet', false, 5.1220, 'Proxima Centauri d is a low-mass exoplanet very close to its star, completing an orbit in just over five days.', 6);
INSERT INTO public.planet VALUES (12, 'Barnards Star B', 'Super-Earth candidate', false, 232.8000, 'Barnards Star b is a cold super-Earth candidate orbiting Barnards Star at a distance beyond the star''s snow line.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf', 1, 5778, 1);
INSERT INTO public.star VALUES (2, 'M31-V1', 'Cepheid variable', 60, 5500, 2);
INSERT INTO public.star VALUES (3, 'V19', 'Variable star', 50, 6000, 3);
INSERT INTO public.star VALUES (4, 'S Doradus', 'Luminous blue', 380, 20000, 4);
INSERT INTO public.star VALUES (5, 'HV 2112', 'Red supergiant', 1500, 3450, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red dwarf', 0.154, 3042, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

