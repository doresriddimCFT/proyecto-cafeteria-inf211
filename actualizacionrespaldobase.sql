--
-- PostgreSQL database dump
--

\restrict 13nl3E2vLzxCbeVbK4K2IO8eyc3qSbwhNmJcecofhe4r4b5NMbxMe38nQPAuCz1

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-11-23 12:02:27

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
-- TOC entry 220 (class 1259 OID 16445)
-- Name: demo_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_categorias (
    categoria_id integer NOT NULL,
    nombre character varying(80) NOT NULL
);


ALTER TABLE public.demo_categorias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16444)
-- Name: demo_categorias_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demo_categorias_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.demo_categorias_categoria_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 219
-- Name: demo_categorias_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demo_categorias_categoria_id_seq OWNED BY public.demo_categorias.categoria_id;


--
-- TOC entry 222 (class 1259 OID 16454)
-- Name: demo_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_productos (
    producto_id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.demo_productos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16453)
-- Name: demo_productos_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demo_productos_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.demo_productos_producto_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: demo_productos_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demo_productos_producto_id_seq OWNED BY public.demo_productos.producto_id;


--
-- TOC entry 4861 (class 2604 OID 16448)
-- Name: demo_categorias categoria_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_categorias ALTER COLUMN categoria_id SET DEFAULT nextval('public.demo_categorias_categoria_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 16457)
-- Name: demo_productos producto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_productos ALTER COLUMN producto_id SET DEFAULT nextval('public.demo_productos_producto_id_seq'::regclass);


--
-- TOC entry 5016 (class 0 OID 16445)
-- Dependencies: 220
-- Data for Name: demo_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demo_categorias (categoria_id, nombre) FROM stdin;
1	Cafetería
2	Pastelería
3	Bebidas
4	Sandwiches
\.


--
-- TOC entry 5018 (class 0 OID 16454)
-- Dependencies: 222
-- Data for Name: demo_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.demo_productos (producto_id, nombre, descripcion, precio, categoria_id) FROM stdin;
1	Café americano	Café preparado en máquina	1800.00	1
2	Café latte	Café con leche	2500.00	1
3	Capuccino	Café espresso con espuma	2800.00	1
4	Té negro	Té en taza	1500.00	3
5	Jugo de naranja	Jugo natural	2200.00	3
6	Brownie	Porción de brownie de chocolate	2300.00	2
7	Torta de chocolate	Porción de torta	3200.00	2
8	Galleta avena	Galleta artesanal	1200.00	2
9	Café Descafeinado	Café Descafeinado Nescafé	1500.00	1
10	El Informático	Sandwich Chacarero	1800.00	4
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 219
-- Name: demo_categorias_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.demo_categorias_categoria_id_seq', 3, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 221
-- Name: demo_productos_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.demo_productos_producto_id_seq', 9, true);


--
-- TOC entry 4864 (class 2606 OID 16452)
-- Name: demo_categorias demo_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_categorias
    ADD CONSTRAINT demo_categorias_pkey PRIMARY KEY (categoria_id);


--
-- TOC entry 4866 (class 2606 OID 16465)
-- Name: demo_productos demo_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_productos
    ADD CONSTRAINT demo_productos_pkey PRIMARY KEY (producto_id);


--
-- TOC entry 4867 (class 2606 OID 16466)
-- Name: demo_productos fk_demo_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_productos
    ADD CONSTRAINT fk_demo_categoria FOREIGN KEY (categoria_id) REFERENCES public.demo_categorias(categoria_id);


-- Completed on 2026-11-23 12:02:27

--
-- PostgreSQL database dump complete
--

\unrestrict 13nl3E2vLzxCbeVbK4K2IO8eyc3qSbwhNmJcecofhe4r4b5NMbxMe38nQPAuCz1

