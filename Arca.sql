--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: control_calidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_calidad (
    control_calidad_id integer NOT NULL,
    produccion_id integer,
    fecha_revision date,
    resultado character varying(20),
    CONSTRAINT control_calidad_resultado_check CHECK (((resultado)::text = ANY ((ARRAY['Aprobado'::character varying, 'Rechazado'::character varying])::text[])))
);


ALTER TABLE public.control_calidad OWNER TO postgres;

--
-- Name: control_calidad_control_calidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_calidad_control_calidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.control_calidad_control_calidad_id_seq OWNER TO postgres;

--
-- Name: control_calidad_control_calidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_calidad_control_calidad_id_seq OWNED BY public.control_calidad.control_calidad_id;


--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal (
    personal_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    rol character varying(50) NOT NULL
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_personal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_personal_id_seq OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_personal_id_seq OWNED BY public.personal.personal_id;


--
-- Name: produccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produccion (
    produccion_id integer NOT NULL,
    fecha date NOT NULL,
    lote integer NOT NULL
);


ALTER TABLE public.produccion OWNER TO postgres;

--
-- Name: produccion_produccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produccion_produccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produccion_produccion_id_seq OWNER TO postgres;

--
-- Name: produccion_produccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produccion_produccion_id_seq OWNED BY public.produccion.produccion_id;


--
-- Name: tarea_produccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea_produccion (
    tarea_id integer NOT NULL,
    produccion_id integer,
    personal_id integer,
    descripcion character varying(200),
    tiempo_estimado interval,
    estado character varying(20),
    CONSTRAINT tarea_produccion_estado_check CHECK (((estado)::text = ANY ((ARRAY['Pendiente'::character varying, 'En progreso'::character varying, 'Completo'::character varying])::text[])))
);


ALTER TABLE public.tarea_produccion OWNER TO postgres;

--
-- Name: tarea_produccion_tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarea_produccion_tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarea_produccion_tarea_id_seq OWNER TO postgres;

--
-- Name: tarea_produccion_tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarea_produccion_tarea_id_seq OWNED BY public.tarea_produccion.tarea_id;


--
-- Name: control_calidad control_calidad_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_calidad ALTER COLUMN control_calidad_id SET DEFAULT nextval('public.control_calidad_control_calidad_id_seq'::regclass);


--
-- Name: personal personal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal ALTER COLUMN personal_id SET DEFAULT nextval('public.personal_personal_id_seq'::regclass);


--
-- Name: produccion produccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion ALTER COLUMN produccion_id SET DEFAULT nextval('public.produccion_produccion_id_seq'::regclass);


--
-- Name: tarea_produccion tarea_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_produccion ALTER COLUMN tarea_id SET DEFAULT nextval('public.tarea_produccion_tarea_id_seq'::regclass);


--
-- Data for Name: control_calidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.control_calidad (control_calidad_id, produccion_id, fecha_revision, resultado) FROM stdin;
\.


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (personal_id, nombre, apellido, rol) FROM stdin;
\.


--
-- Data for Name: produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produccion (produccion_id, fecha, lote) FROM stdin;
\.


--
-- Data for Name: tarea_produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea_produccion (tarea_id, produccion_id, personal_id, descripcion, tiempo_estimado, estado) FROM stdin;
\.


--
-- Name: control_calidad_control_calidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.control_calidad_control_calidad_id_seq', 1, false);


--
-- Name: personal_personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_personal_id_seq', 1, false);


--
-- Name: produccion_produccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produccion_produccion_id_seq', 1, false);


--
-- Name: tarea_produccion_tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_produccion_tarea_id_seq', 1, false);


--
-- Name: control_calidad control_calidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_calidad
    ADD CONSTRAINT control_calidad_pkey PRIMARY KEY (control_calidad_id);


--
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (personal_id);


--
-- Name: produccion produccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT produccion_pkey PRIMARY KEY (produccion_id);


--
-- Name: tarea_produccion tarea_produccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_produccion
    ADD CONSTRAINT tarea_produccion_pkey PRIMARY KEY (tarea_id);


--
-- Name: control_calidad control_calidad_produccion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_calidad
    ADD CONSTRAINT control_calidad_produccion_id_fkey FOREIGN KEY (produccion_id) REFERENCES public.produccion(produccion_id);


--
-- Name: tarea_produccion tarea_produccion_personal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_produccion
    ADD CONSTRAINT tarea_produccion_personal_id_fkey FOREIGN KEY (personal_id) REFERENCES public.personal(personal_id);


--
-- Name: tarea_produccion tarea_produccion_produccion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea_produccion
    ADD CONSTRAINT tarea_produccion_produccion_id_fkey FOREIGN KEY (produccion_id) REFERENCES public.produccion(produccion_id);


--
-- PostgreSQL database dump complete
--

