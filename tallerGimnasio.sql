--
-- PostgreSQL database dump
--

\restrict FBhrthWdvwWlvakog9X1Mnta7nRMEpOiIRUTSW2XIvpW5oHErA2gRgP6vBZkA0s

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 19:55:33

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
-- TOC entry 226 (class 1259 OID 16713)
-- Name: clases_grupales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases_grupales (
    id_clase integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dia character varying(20) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    id_entrenador integer,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clases_grupales_cupo_check CHECK ((cupo > 0))
);


ALTER TABLE public.clases_grupales OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16712)
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_grupales_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 225
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNED BY public.clases_grupales.id_clase;


--
-- TOC entry 223 (class 1259 OID 16689)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100),
    correo character varying(100)
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16688)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 222
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 224 (class 1259 OID 16699)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    documento_socio character varying(20) NOT NULL,
    peso numeric(5,2),
    estatura numeric(4,2),
    lesiones text
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16753)
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion (
    documento_socio character varying(20) NOT NULL,
    id_clase integer NOT NULL,
    fecha_inscripcion date NOT NULL
);


ALTER TABLE public.inscripcion OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16732)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    documento_socio character varying(20) NOT NULL,
    id_plan integer NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresias_fechas_check CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresias_valor_pagado_check CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16731)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 221 (class 1259 OID 16676)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_check CHECK ((duracion > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16675)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 220
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 219 (class 1259 OID 16666)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    correo character varying(100),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 4886 (class 2604 OID 16716)
-- Name: clases_grupales id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_grupales_id_clase_seq'::regclass);


--
-- TOC entry 4885 (class 2604 OID 16692)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4888 (class 2604 OID 16735)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 16679)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 5075 (class 0 OID 16713)
-- Dependencies: 226
-- Data for Name: clases_grupales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases_grupales (id_clase, nombre, dia, hora, cupo, id_entrenador, estado) FROM stdin;
2	Yoga	Martes	10:00:00	4	2	suspendida
1	Spinning	Lunes	08:00:00	4	1	activa
3	Funcional	Miercoles	18:00:00	4	1	activa
4	Pilates	Jueves	09:00:00	3	2	activa
\.


--
-- TOC entry 5072 (class 0 OID 16689)
-- Dependencies: 223
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Pedro Ramirez	Spinning	pedro@gmail.com
2	Natalia Rojas	Yoga	natalia@gmail.com
3	Diego Mora	Crossfit	diego@gmail.com
\.


--
-- TOC entry 5073 (class 0 OID 16699)
-- Dependencies: 224
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (documento_socio, peso, estatura, lesiones) FROM stdin;
1001	75.00	1.78	Ninguna
1002	60.00	1.65	Lesion de rodilla
1003	83.00	1.82	Dolor lumbar
1004	58.00	1.60	Ninguna
\.


--
-- TOC entry 5078 (class 0 OID 16753)
-- Dependencies: 229
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion (documento_socio, id_clase, fecha_inscripcion) FROM stdin;
1001	1	2026-01-05
1002	1	2026-01-06
1003	1	2026-01-07
1001	2	2026-01-08
1002	2	2026-01-09
1003	2	2026-01-10
1004	2	2026-01-11
1005	3	2026-01-12
1001	4	2026-01-13
1004	4	2026-01-14
1006	1	2026-11-19
1001	3	2026-11-19
1006	4	2026-11-19
1004	3	2026-11-19
\.


--
-- TOC entry 5077 (class 0 OID 16732)
-- Dependencies: 228
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, fecha_inicio, fecha_fin, documento_socio, id_plan, valor_pagado) FROM stdin;
1	2026-01-01	2026-02-01	1001	1	80000.00
2	2026-02-02	2027-02-02	1001	3	750000.00
3	2026-04-01	2026-07-01	1002	2	220000.00
4	2025-01-01	2025-02-01	1003	1	80000.00
5	2026-03-01	2027-03-01	1004	3	750000.00
6	2026-05-01	2026-06-01	1005	1	70000.00
8	2026-08-01	2026-11-01	1006	2	220000.00
\.


--
-- TOC entry 5070 (class 0 OID 16676)
-- Dependencies: 221
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion, precio) FROM stdin;
1	Mensual	1	80000.00
2	Trimestral	3	220000.00
3	Anual	12	750000.00
\.


--
-- TOC entry 5068 (class 0 OID 16666)
-- Dependencies: 219
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
1003	Carlos Ruiz	3003333333	carlos@gmail.com	f
1004	Laura Diaz	3004444444	\N	f
1006	Sofia Castro	3006666666	sofia@gmail.com	f
1001	Juan Perez	3119999999	juan@gmail.com	t
1002	Maria Gomez	3002222222	maria@gmail.com	t
1005	Andres Torres	3005555555	andres@gmail.com	t
\.


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 225
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_grupales_id_clase_seq', 5, true);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 222
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 3, true);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 13, true);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 220
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 3, true);


--
-- TOC entry 4908 (class 2606 OID 24662)
-- Name: clases_grupales clases_grupales_entrenador_dia_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_entrenador_dia_hora_key UNIQUE (id_entrenador, dia, hora);


--
-- TOC entry 4910 (class 2606 OID 16725)
-- Name: clases_grupales clases_grupales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4902 (class 2606 OID 16698)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4904 (class 2606 OID 16696)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4906 (class 2606 OID 16706)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (documento_socio);


--
-- TOC entry 4914 (class 2606 OID 16760)
-- Name: inscripcion inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_pkey PRIMARY KEY (documento_socio, id_clase);


--
-- TOC entry 4912 (class 2606 OID 16742)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4900 (class 2606 OID 16687)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4896 (class 2606 OID 16674)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4898 (class 2606 OID 16672)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (documento);


--
-- TOC entry 4916 (class 2606 OID 24668)
-- Name: clases_grupales clases_grupales_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador) ON DELETE SET NULL;


--
-- TOC entry 4915 (class 2606 OID 24663)
-- Name: fichas_medicas fichas_medicas_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento) ON DELETE CASCADE;


--
-- TOC entry 4919 (class 2606 OID 16761)
-- Name: inscripcion inscripcion_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento);


--
-- TOC entry 4920 (class 2606 OID 16766)
-- Name: inscripcion inscripcion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases_grupales(id_clase);


--
-- TOC entry 4917 (class 2606 OID 16743)
-- Name: membresias membresias_documento_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_documento_socio_fkey FOREIGN KEY (documento_socio) REFERENCES public.socios(documento);


--
-- TOC entry 4918 (class 2606 OID 16748)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


-- Completed on 2026-11-19 19:55:33

--
-- PostgreSQL database dump complete
--

\unrestrict FBhrthWdvwWlvakog9X1Mnta7nRMEpOiIRUTSW2XIvpW5oHErA2gRgP6vBZkA0s

