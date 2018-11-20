--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: camposresultados_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE camposresultados_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: camposresultados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE camposresultados (
    code integer DEFAULT nextval('camposresultados_code_seq'::regclass) NOT NULL,
    rdf_type character varying(100) DEFAULT NULL::character varying,
    order_by character varying(100) NOT NULL,
    field_date character varying(100) DEFAULT NULL::character varying,
    prefijo_field_date character varying(200) DEFAULT NULL::character varying,
    field_name character varying(100) DEFAULT NULL::character varying,
    prefijo_field_name character varying(200) DEFAULT NULL::character varying,
    field_search character varying(100) DEFAULT NULL::character varying,
    prefijo_field_search character varying(200) DEFAULT NULL::character varying,
    active boolean DEFAULT true NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- Name: cargavistas_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargavistas_code_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargavistas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cargavistas (
    code integer DEFAULT nextval('cargavistas_code_seq'::regclass) NOT NULL,
    nombre character varying(200),
    criterio character varying(512),
    periodicidad character varying(15),
    fecha date,
    hora time without time zone,
    estado character varying(256),
    logs character varying(128),
    archivos character varying(20),
    active boolean DEFAULT true,
    created date DEFAULT now()
)
WITH (autovacuum_enabled='true');


--
-- Name: configuracionweb_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configuracionweb_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: configuracionweb; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE configuracionweb (
    code integer DEFAULT nextval('configuracionweb_code_seq'::regclass) NOT NULL,
    slug character varying(50) DEFAULT NULL::character varying,
    name character varying(100) DEFAULT NULL::character varying,
    configuracion text,
    active boolean DEFAULT true NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- Name: entidades_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entidades_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE entidades (
    code integer DEFAULT nextval('entidades_code_seq'::regclass) NOT NULL,
    slug character varying(100),
    name_es character varying(100),
    name_en character varying(100),
    comment_es character varying(200),
    comment_en character varying(200),
    rdf_type character varying(100),
    dc_type character varying(100),
    parent_code integer NOT NULL,
    active bit(1) NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- Name: facetas_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facetas_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facetas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE facetas (
    code integer DEFAULT nextval('facetas_code_seq'::regclass) NOT NULL,
    rdf_type character varying(100) DEFAULT NULL::character varying,
    dc_type character varying(100) DEFAULT NULL::character varying,
    faceta character varying(100) DEFAULT NULL::character varying,
    prefijo_faceta character varying(200) DEFAULT NULL::character varying,
    name_head character varying(50) DEFAULT NULL::character varying,
    condition character varying(100),
    orden integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- Name: lugares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lugares (
    code integer NOT NULL,
    slug character varying(50),
    name character varying(60),
    type character varying(1),
    comarca_code integer,
    provincia_code integer,
    created date DEFAULT now() NOT NULL
);


--
-- Name: lugares_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lugares_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfdconfiguracion_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rfdconfiguracion_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: temas_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE temas_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: temas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE temas (
    code integer DEFAULT nextval('temas_code_seq'::regclass) NOT NULL,
    slug character varying(50),
    name_es character varying(60),
    name_en character varying(60),
    comment_es character varying(200),
    comment_en character varying(200),
    parent_code integer NOT NULL,
    rdf_type character varying(100),
    active bit(1) NOT NULL,
    created date DEFAULT now() NOT NULL
);


--
-- Data for Name: camposresultados; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (1, 'http://opendata.aragon.es/def/ei2a#Document', 'ei2a:nameDocument', 'ei2a:registrationDate', '', 'ei2a:nameDocument', '', 'ei2a:nameDocument', '', true, '2018-05-22');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (2, 'http://www.w3.org/ns/org#Organization', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-05-22');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (3, 'http://www.w3.org/ns/person#Person', 'ei2a:fullName', '', '', 'ei2a:fullName', '', 'ei2a:fullName', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (10, 'http://opendata.aragon.es/def/ei2ia#Line', 'dc:identifier', '', '', 'dc:identifier', '', 'dc:identifier', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (6, 'http://vocab.gtfs.org/terms#Route', 'dc:title', '', '', 'dc:title', '', 'dc:title', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (7, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (8, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (9, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (4, 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'event:literal_factor', 'dc:date
', '', 'event:literal_factor', ' PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', 'event:literal_factor', ' PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (5, 'http://opendata.aragon.es/def/ei2a#EventHistory', 'event:literal_factor', 'dc:date', '', 'event:literal_factor', ' PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', 'event:literal_factor', ' PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', true, '2018-06-25');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (11, 'http://www.semanticwater.com/WISDOM#DischargeNode', 'dc:identifier', 'dc:date', '', 'rdfs:label', 'PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>', 'rdfs:label', 'PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>', true, '2018-11-05');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (12, 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'dc:identifier', 'dc:date', '', 'dc:identifier', '', 'dc:identifier', '', true, '2018-11-05');
INSERT INTO camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (13, 'http://www.semanticwater.com/WISDOM#Well', 'dc:identifier', 'dc:date', '', 'dc:identifier', '', 'dc:identifier', '', true, '2018-11-05');


--
-- Name: camposresultados_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('camposresultados_code_seq', 1, false);


--
-- Data for Name: cargavistas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (17, '39 Ordenanzas fiscales de Diputación', '', 'semanal', '2018-11-09', '11:43:00', 'Tipo (Actualización): Archivo (Vista_39.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion)', 'log_2018-11-09.txt', '20181109_114329', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (2, '6 Ordenanzas Generales Comarca', '', 'A demanda', '2018-11-05', '16:50:00', 'Tipo (Actualización): Archivo (Vista_6.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca)', 'log_2018-11-05.txt', '20181105_165012', true, '2018-10-18');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (0, '2 Símbolos', '', 'A demanda', '2018-10-18', '10:27:00', 'Tipo (Actualización): Archivo (Vista_2.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#simbolo)', 'log_2018-10-18.txt', '20181018_102755', true, '2018-10-11');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (4, '12 Agrupación Secretarial', '', 'A demanda', '2018-10-31', '12:40:00', 'Tipo (Actualización): Archivo (Vista_12.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#agrupacion_secretarial)', 'log_2018-10-31.txt', '20181031_124042', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (5, '51 Composicion del Pleno de Consorcios', '', 'A demanda', '2018-10-31', '13:06:00', 'Tipo (Actualización): Archivo (Vista_51.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_consorcio)', 'log_2018-10-31.txt', '20181031_130612', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (6, '52 Composicion del Pleno de Entidades Menores', '', 'A demanda', '2018-10-31', '13:08:00', 'Tipo (Actualización): Archivo (Vista_52.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_entidad_menor)', 'log_2018-10-31.txt', '20181031_130848', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (7, '53 Composicion del Pleno de Mancomunidades', '', 'A demanda', '2018-10-31', '13:11:00', 'Tipo (Actualización): Archivo (Vista_53.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_mancomunidad)', 'log_2018-10-31.txt', '20181031_131139', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (8, '140 CRA - Datos de itinerarios de las rutas', '', 'A demanda', '2018-10-31', '13:22:00', 'Tipo (Actualización): Archivo (Vista_140.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#itinerario_ruta)', 'log_2018-10-31.txt', '20181031_132212', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (9, '141 CRA - Paradas', '', 'A demanda', '2018-10-31', '15:54:00', 'Tipo (Actualización): Formulario Web Clase: dc_type (http://opendata.aragon.es/def/ei2a#cra_parada)', 'log_2018-10-31.txt', '20181031_155433', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (10, '4 Pleno Comarca', '', 'A demanda', '2018-10-31', '16:12:00', 'Tipo (Actualización): Archivo (Vista_4.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_comarcal)', 'log_2018-10-31.txt', '20181031_161205', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (11, '3 Pleno municipio', '', 'A demanda', '2018-10-31', '16:17:00', 'Tipo (Actualización): Archivo (Vista_3.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_municipal)', 'log_2018-10-31.txt', '20181031_161724', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (13, '5 Ordenanzas Generales Municipio', '', 'A demanda', '2018-10-31', '17:13:00', 'Tipo (Actualización): Archivo (Vista_5.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio)', 'log_2018-10-31.txt', '20181031_171324', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (16, '38 Ordenanzas fiscales de Consorcios', '', 'A demanda', '2018-11-09', '11:43:00', 'Tipo (Actualización): Archivo (Vista_38.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio)', 'log_2018-11-09.txt', '20181109_114314', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (15, '7 Ordenanzas Fiscales Municipio', '', 'A demanda', '2018-11-09', '11:11:00', 'Tipo (Actualización): Archivo (Vista_7.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio)', 'log_2018-11-09.txt', '20181109_111129', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (18, '40 Ordenanzas fiscales de Entidad Menor', '', 'A demanda', '2018-11-09', '11:43:00', 'Tipo (Actualización): Archivo (Vista_40.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor)', 'log_2018-11-09.txt', '20181109_114347', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (19, '41 Ordenanzas fiscales de Mancomunidades', '', 'A demanda', '2018-11-09', '11:43:00', 'Tipo (Actualización): Archivo (Vista_41.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad)', 'log_2018-11-09.txt', '20181109_114357', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (20, '42 Ordenanzas fiscales de Organismos Autónomos', '', 'A demanda', '2018-11-09', '11:44:00', 'Tipo (Actualización): Archivo (Vista_42.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo)', 'log_2018-11-09.txt', '20181109_114407', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (21, '43 Ordenanzas fiscales de Villas y Tierras', '', 'A demanda', '2018-11-09', '11:44:00', 'Tipo (Actualización): Archivo (Vista_43.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras)', 'log_2018-11-09.txt', '20181109_114419', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (12, '62 Registro de llamadas', '', 'A demanda', '2018-11-13', '11:32:00', 'Tipo (Actualización): Archivo (Vista_62.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#registro_llamada)', 'log_2018-11-13.txt', '20181113_113226', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (22, '44 Ordenanzas generales de Consorcios', '', 'A demanda', '2018-11-05', '16:55:00', 'Tipo (Actualización): Archivo (Vista_44.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio)', 'log_2018-11-05.txt', '20181105_165512', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (23, '45 Ordenanzas generales de Diputaciones', '', 'A demanda', '2018-11-05', '16:56:00', 'Tipo (Actualización): Archivo (Vista_45.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion)', 'log_2018-11-05.txt', '20181105_165607', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (24, '46 Ordenanzas generales de Entidades Menores', '', 'A demanda', '2018-11-05', '16:56:00', 'Tipo (Actualización): Archivo (Vista_46.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor)', 'log_2018-11-05.txt', '20181105_165631', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (25, '47 Ordenanzas generales de Mancomunidades', '', 'A demanda', '2018-11-05', '16:56:00', 'Tipo (Actualización): Archivo (Vista_47.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad)', 'log_2018-11-05.txt', '20181105_165647', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (26, '48 Ordenanzas generales de Núcleos', '', 'A demanda', '2018-11-05', '16:57:00', 'Tipo (Actualización): Archivo (Vista_48.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_nucleo)', 'log_2018-11-05.txt', '20181105_165704', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (27, '49 Ordenanzas generales de Organismos Autónomos', '', 'A demanda', '2018-11-05', '16:57:00', 'Tipo (Actualización): Archivo (Vista_49.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo)', 'log_2018-11-05.txt', '20181105_165720', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (28, '50 Ordenanzas generales de Villas y Tierras', '', 'A demanda', '2018-11-05', '16:57:00', 'Tipo (Actualización): Archivo (Vista_50.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras)', 'log_2018-11-05.txt', '20181105_165738', true, '2018-11-01');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (30, '9 Datos Elecciones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_9.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#eleccion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (29, '10 Datos Comarca', '', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_10.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#comarca)', 'log_2018-10-18.txt', '20181018_102755', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (14, '31 Datos de Plantillas', '', 'A demanda', '2018-10-31', '17:17:00', 'Tipo (Actualización): Archivo (Vista_31.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#plantilla)', 'log_2018-10-31.txt', '20181031_171722', true, '2018-10-31');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (31, '11 Datos Municipio', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_11.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#municipio)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (32, '13 Consorcios', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_13.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#consorcio)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (33, '15 Datos de cursos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_15.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#curso)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (34, '16 Datos de diputación', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_16.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#diputacion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (35, '17 Direcciones de interés', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_17.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#direccion_de_interes)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (36, '19 Datos de Entidad Menor', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_19.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#entidad_menor)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (37, '20 Datos de Entidades Singulares', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_20.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#entidad_singular)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (38, '22 Datos de Fundaciones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_22.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#fundacion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (39, '24 Datos de Mancomunidades', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_24.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#mancomunidad)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (40, '25 Datos de Noticias', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_25.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#noticia)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (41, '26 Datos de Núcleos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_26.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#nucleo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (42, '27 Datos de Organismo Autónomo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_27.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#organismo_autonomo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (43, '28 Datos de Organizaciones Complementarias', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_28.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#organizacion_complementaria)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (44, '30 Datos de Planeamiento', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_30.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#planeamiento)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (45, '31 Datos de Plantillas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_31.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#plantilla)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (46, '32 Datos de Postgrado', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_32.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#postgrado)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (47, '33 Datos de Presupuestos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_33.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#presupuesto)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (48, '34 Datos de Sociedad Mercantil', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_34.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#sociedad_mercantil)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (49, '35 Datos de Villas y Tierras', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_35.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#villas_y_tierras)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (50, '54 Composicion del Pleno de Organismos Autónomos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_54.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_organismo_autonomo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (51, '56 Composicion del Pleno de Villas y Tierras', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_56.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#miembro_pleno_villas_y_tierras)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (52, '57 Relaciones de Comarca', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_57.csv) Clase: dc_type ()', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (53, '58 Relaciones de Entidades Singulares', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_58.csv) Clase: dc_type ()', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (54, '59 Relaciones de Fundaciones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_59.csv) Clase: dc_type ()', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (55, '60 Relaciones de Mancomunidades', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_60.csv) Clase: dc_type ()', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (56, '61 Relaciones de Villas y Tierras', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_61.csv) Clase: dc_type ()', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (57, '63 Registro de Agencias de Viaje', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_63.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#agencia_viaje)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (58, '64 Registro de Albergues y Refugios', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_64.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#albergue_refugio)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (59, '65 Registro de Alojamientos hoteleros', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_65.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#alojamiento_hotelero)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (60, '66 Registro de Apartamentos turísticos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_66.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#apartamento_turistico)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (61, '67 Registro de Cafeterías y Restaurantes', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_67.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cafeteria_restaurante)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (62, '68 Registro de Campings Turísticos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_68.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#camping_turistico)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (63, '69 Registro de Guías de Turismo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_69.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#guia_turismo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (64, '70 Registro de Oficinas de Turismo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_70.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#oficina_turismo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (95, '116 Instituto Aragones del Agua. Deposito', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_116.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#deposito)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (65, '71 Registro de Puntos de Información Turística', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_71.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#punto_informacion_turistica)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (66, '73 Registro de Alojamientos de Turismo Rural', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_73.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#alojamiento_rural)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (67, '74 Modificaciones de Planeamiento de Desarrollo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_74.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_desarrollo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (68, '75 Modificaciones de Planeamiento General', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_75.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_general)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (69, '76 Planeamiento de Desarrollo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_76.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#planeamiento_desarrollo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (70, '77 Planeamiento General', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_77.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#planeamiento_general)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (71, '79 SGT Agricultura, Parcelas PAC, cultivos herbáceos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_79.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cultivo_herbaceo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (72, '80 SGT Agricultura, Parcelas PAC, cultivos lenosos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_80.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cultivo_lenoso)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (73, '81 SGT Agricultura, Códigos catastrales y SIGPAC, parcelas PAC', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_81.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#codigo_catastral)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (74, '83 SGT Agricultura, Códigos de variedades herbáceas PAC', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_83.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#codigo_variedad_herbacea)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (75, '84 SGT Agricultura, Códigos de cultivos lenosos PAC', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_84.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#woody)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (76, '85 SGT Agricultura, Códigos de variedades lenosas PAC', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_85.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#codigo_variedad_lenosas)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (77, '88 SGT Agricultura, Comarcas agrarias', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_88.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#comarca_agraria)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (78, '89 SGT Agricultura, Oficinas comarcales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_89.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#oficinas_comarcales)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (79, '90 DG Relaciones Institucionales, Procesos Electorales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_90.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#proceso_electoral)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (80, '100 DG Viviendia y Rehabilitación, Fianzas Datos Anuales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_100.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#fianzas_datos_anuales_vivienda_y_rehabilitacion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (81, '102 Turismo de Aragon, Senderos Rutas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_102.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#sendero)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (82, '103 DG Cultura y Patrimonio, Colecciones de Museos de Aragon', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_103.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#colecciones_museos_aragon)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (83, '104 IAF polígonos industriales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_104.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#iaf_poligono_industrial)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (84, '105 Instituto Aragones del Agua. Sumidero', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_105.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#sumidero)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (85, '106 Instituto Aragones del Agua. Ramales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_106.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ramal)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (86, '107 Instituto Aragones del Agua. Pozo', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_107.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#pozo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (87, '108 Instituto Aragones del Agua. Potabilizadora', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_108.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#potabilizadora)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (88, '109 Instituto Aragones del Agua. Llave', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_109.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#llave_de_corte)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (89, '110 Instituto Aragones del Agua. Hidrante', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_110.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#hidrante)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (90, '111 Instituto Aragones del Agua. Emisario', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_111.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#emisario)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (91, '112 Instituto Aragones del Agua. Edar en construccion', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_112.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#edar_en_construccion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (92, '113 Instituto Aragones del Agua_ Edar', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_113.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#edar)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (93, '114 Instituto Aragones del Agua. Distribución', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_114.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#distribucion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (94, '115 Instituto Aragones del Agua. Depuradora', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_115.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#depuradora)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (96, '117 Instituto Aragones del Agua. Conducción', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_117.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#conduccion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (97, '118 Instituto Aragones del Agua. Colector', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_118.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#colector)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (98, '119 Instituto Aragones del Agua. Captación', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_119.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#captacion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (99, '120 Instituto Aragones del Agua. Camara limpia', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_120.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#camara-limpia)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (100, '121 Instituto Aragones del Agua. Boca de riego', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_121.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#boca-de-riego)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (101, '132 ARABUS - Concesiones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_132.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#arabus_concesion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (102, '133 Expediciones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_133.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#expedicion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (103, '134 Expediciones, Paradas y Horarios', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_134.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#expedicion_parada_y_horario)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (104, '135 ARABUS - Operadores', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_135.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#operador)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (105, '136 Paradas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_136.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#arabus_parada)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (106, '137 Rutas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_137.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ruta)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (107, '138 Servicios', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_138.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#servicio)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (108, '139 ARABUS - Transportistas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_139.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transportista)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (109, '142 CRA - Localidades', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_142.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cra_localidad)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (110, '143 CRA - Centros', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_143.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cra_centro)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (111, '144 CRA - Datos de las rutas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_144.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cra_datos_ruta)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (112, '145 DARA - Archivos de Aragón', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_145.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#dara_archivos_aragon)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (113, '147 Transporte - Concesiones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_147.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transporte_concesion)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (114, '148 TRANSPORTE - Expediciones', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_148.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transporte_expedición)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (115, '149 TRANSPORTE - Expedicion Parada Horario', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_149.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transporte_expedicion_parada_horario)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (116, '150 TRANSPORTE - Paradas s', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_150.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transporte_parada)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (117, '151 TRANSPORTE - Rutas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_151.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#transporte_ruta)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (118, '152 IAA - Contratos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_152.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#iaa_contrato)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (119, '153 IAA - Contratos gastos anuales', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_153.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#iaa_contratos_gastos_anuales)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (120, '154 IAA - Contratos depuradoras incluidas', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_154.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#iaa_contrato_depuradora)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (121, '158 Periodo de legislatura', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_158.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#periodo_legislatura)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (122, '159 Entidades', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_159.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#entidad)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (123, '160 Cargos', ' ', 'A demanda', '2018-11-07', '12:00:00', 'Tipo (Actualización): Archivo (Vista_160.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#cargo)', 'log_2018-10-31.txt', '20181031_171320', true, '2018-11-07');
INSERT INTO cargavistas (code, nombre, criterio, periodicidad, fecha, hora, estado, logs, archivos, active, created) VALUES (3, '8 Ordenanzas Fiscales Comarca', '', 'A demanda', '2018-11-09', '11:42:00', 'Tipo (Actualización): Archivo (Vista_8.csv) Clase: dc_type (http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca)', 'log_2018-11-09.txt', '20181109_114258', true, '2018-10-18');


--
-- Name: cargavistas_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cargavistas_code_seq', 28, true);


--
-- Data for Name: configuracionweb; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (130, 'iaacontrato', 'http://opendata.aragon.es/def/ei2a#iaa_contrato', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?tipo substr(str(?location),46) as ?idmunicipio ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo.}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: Tipo
          Valor: tipo
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo3: 
          Nombre:  Empresa
          Valor: EMPRESA
        Campo5: 
          Nombre: Direccion
          Valor:  DIRECCION
        Campo6: 
          Nombre: Código postal
          Valor: CODIGO_POSTAL
        Campo1:
          Nombre: Fecha inicio
          Valor: FECHA_INICIO
        Campo2: 
          Nombre: Fecha fin
          Valor: FECHA_FIN
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select CONCAT(''<a href="detalles?url=municipio-'',?identifier,''">Ver informaci&oacute;n de '', ?nombreMunicipio,''</a>'') as ?enlace where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. ?municipio ei2a:organizationName ?nombreMunicipio. filter (?s = <%s>)}
    Campo: uri
    Html: %s', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (111, 'planeamientoDesarrollo', 'http://opendata.aragon.es/def/ei2a#planeamiento_desarrollo', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select substr(str(?location),46) as ?idmunicipio ?sitio ?nombre ?observacion ?municipio ?tipo where{<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre . optional{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. } optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} optional{ <%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.}  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Tipo        
          Valor: tipo
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo5:
          Nombre: Observaciones
          Valor: observacion
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (126, 'OrdenanzaGeneralOrganismoAutonomo', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?organismo ?municipio ?fechreg ?tipo substr(str(?location),46) as ?idmunicipio substr(str(?loc),55) as ?idorganismo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechreg .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc. ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?organismo. filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Fecha de registro
          Valor: fechreg
        Campo3:
          Nombre: Organismo Autónomo
          Valor: organismo
          Url: /pool/detalles?url=organismo-autonomo-%s
          CampoUrl: idorganismo
        Campo4:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_organismo_autonomo%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_organismo_autonomo%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                      ', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (132, 'OrdenanzaFiscalEntidadMenor', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio ?entidad substr(str(?location),46) as ?idmunicipio substr(str(?loc),50) as ?identidad ?fechareg ?fechaini ?tipo where {optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc. ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?entidad.  filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo4:
          Nombre: Entidad Menor
          Valor: entidad
          Url: /pool/detalles?url=entidad-mayor-%s
          CampoUrl: identidad
        Campo5:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio          
        Campo2:
          Nombre: Fecha de inicio
          Valor: fechaini
        Campo3: 
          Nombre: Fecha de registro
          Valor: fechareg
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_entidad_menor%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
     ', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (133, 'OrdenanzaGeneralNucleo', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_nucleo', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),43) as ?idnucleo ?nucleo ?fechreg ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechreg .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?nucleo. filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo3:
          Nombre: Núcleo
          Valor: nucleo
          Url: /pool/detalles?url=nucleo-%s
          CampoUrl: idnucleo
        Campo2:
          Nombre: Fecha de registro
          Valor: fechreg
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_nucleo> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_nucleo%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (158, 'TransporteParada', 'http://opendata.aragon.es/def/ei2a#transporte_parada', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/title
  Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  ?secuence where { ?route <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?route  <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long.  optional {?route <http://purl.org/dc/elements/1.1/title> ?title.} filter(?route = <%s>) .}
          Campo: uri 
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio .}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-08');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (94, 'noticia', 'http://opendata.aragon.es/def/ei2a#noticia', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?enlace ?sitioweb ?tipo ?descripcion where{bind(''Accede al sitio web'' as ?enlace) <%s> <http://opendata.aragon.es/def/ei2a#observations> ?descripcion. <%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. <%s> <http://opendata.aragon.es/def/ei2a#URIDocument> ?sitioweb.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Descripción
          Valor: descripcion       
        Campo2:
          Nombre: Tipo 
          Valor: tipo
        Campo3:
          Nombre: Sitio web
          Valor: enlace
          Url: %s
          CampoUrl: sitioweb        ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (103, 'OrdenanzaGeneralConsorcio', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?consorcio substr(str(?localidad),46) as ?idconsorcio ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?consorcio filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Consorcio
          Valor: consorcio
          Url: /pool/detalles?url=consorcio-%s
          CampoUrl: idconsorcio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_consorcio%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?diputacion. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_consorcio%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                      ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (161, 'IAAContratoDepuradora', 'http://opendata.aragon.es/def/ei2a#iaa_contrato_depuradora', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?tipo substr(str(?location),46) as ?idmunicipio ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo.}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: Tipo
          Valor: tipo
     
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select CONCAT(''<a href="detalles?url=municipio-'',?identifier,''">Ver informaci&oacute;n de '', ?nombreMunicipio,''</a>'') as ?enlace where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. ?municipio ei2a:organizationName ?nombreMunicipio. filter (?s = <%s>)}
    Campo: uri
    Html: %s', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (119, 'OrdenanzaFiscalComarca', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),44) as ?idcomarca ?comarca ?fechaPubli ?fechaApro ?tipo ?ampliacion where {<%s> dc:identifier ?identificador . <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?comarca . optional {<%s> ei2a:registrationDate ?fechaPubli .} optional {<%s> ei2a:startDate ?fechaApro .} optional {<%s> ei2a:documentType ?tipo .} optional {<%s> ei2a:observations ?ampliacion .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Comarca 
          Valor: comarca
          Url: /pool/detalles?url=comarca-%s
          CampoUrl: idcomarca
        Campo2:
          Nombre: Fecha de publicación
          Valor: fechaPubli
        Campo3:
          Nombre: Fecha de aprobación
          Valor: fechaApro
        Campo4:
          Nombre: Tipo
          Valor: tipo       
        Campo5:
          Nombre: Ampliación
          Valor: ampliacion	
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto : Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de acuerdo de aprobación definitiva 
          Valor: F_ACUERDO_APRO_DEF
        Campo2:
          Nombre: Fecha de publicación de aprobación definitiva 
          Valor: F_PUBLICACION_APRO_DEF
        Campo3:
          Nombre: Año
          Valor: ANO
        Campo4:
          Nombre: Fecha de acuerdo de aprobación inicial de la modificación
          Valor: F_ACUERDO_APRO_INI_MOD
        Campo4:
          Nombre: Fecha de publicación de apobación inicial de la modificación
          Valor: F_PUBLICACION_APRO_INI_MOD
        Campo5:
          Nombre: Fecha de acuerdo de apobación definitiva de la modificación
          Valor: F_ACUERDO_APRO_DEF_MOD
        Campo6:
          Nombre: Fecha de publicación de apobación definitiva de la modificación
          Valor: F_PUBLICACION_APRO_DEF_MOD
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=%s&mun=&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_comarca%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=%s&mun=&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_comarca%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (135, 'coleccionMuseo', 'http://opendata.aragon.es/def/ei2a#colecciones_museos_aragon', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#documentType
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: Listado de museos
      Query: select distinct ?museo where{ <%s> <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?mus. ?mus <http://opendata.aragon.es/def/ei2a#organizationName> ?museo. }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Nombre de los museos
          Valor: museo  
    Tabla2:
      Tipo: Virtuoso       
      Descripcion: Listado de obras de arte y descripción
      Query: select distinct ?obra where{ <%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?obra. }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Nombre de las obras de arte
          Valor: obra
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (665, 'MiembroPleno', 'http://opendata.aragon.es/def/ei2a#miembro_pleno', 'BodyClass: fichaComunidad fichaPersona
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#fullName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX org:<http://www.w3.org/ns/org#> PREFIX person:<http://www.w3.org/ns/person#> select ?partido where { <%s> <http://www.w3.org/ns/person#memberOf> ?member. ?member <http://opendata.aragon.es/def/ei2a#organizationName> ?partido. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Partido
          Valor: partido
  Tablas:
    Tabla1:
      Titulo: Cargo
      Tipo: Virtuoso
      Query: select ?lugar substr(str(?org),36) as ?idlugar ?cargo where{<%s> <http://www.w3.org/ns/org#hasMembership> ?member. ?member <http://www.w3.org/ns/org#organization> ?org. ?org <http://opendata.aragon.es/def/ei2a#organizationName> ?lugar. ?member <http://www.w3.org/ns/org#role> ?rol. ?rol <http://opendata.aragon.es/def/ei2a#roleName> ?cargo.}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Lugar
          Valor: lugar
          Url: /pool/detalles?url=%s
          CampoUrl: idlugar
        Columna2:
          Nombre: Cargo en el lugar
          Valor: cargo
          ', true, '2018-10-02');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (104, 'OrdenanzaGeneralEntidadMenor', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?entidad ?municipio substr(str(?localidad),46) as ?idmunicipio substr(str(?loc),50) as ?identidad ?fechreg ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechreg .} ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc .?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?entidad. ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Fecha de registro
          Valor: fechreg
        Campo3:
         Nombre: Entidad menor
         Valor: entidad
         Url: /pool/detalles?url=entidad-mayor-%s
         CampoUrl: identidad
        Campo4:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_entidad_menor%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     

                        ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (120, 'viviendaYRehabilitacion', 'http://opendata.aragon.es/def/ei2a#fianzas_datos_anuales_vivienda_y_rehabilitacion', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?provincia ?tipo substr(str(?localidad),46) as ?idmunicipio ?municipio ?observacion where{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. <%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion. <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?int . ?int <http://www.w3.org/2000/01/rdf-schema#label> ?provincia.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Tipo
          Valor: tipo
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo3:
          Nombre: Provincia
          Valor: provincia
        Campo4:
          Nombre: Observaciones
          Valor: observacion          
    CampoValor2:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo2:
          Nombre: Año
          Valor: ANYO
        Campo3:
          Nombre: Año de devolución
          Valor: ANYO_DEVOLUCION
        Campo4:
          Nombre: Total rentas
          Valor: TOTAL_RENTAS
        Campo5:
          Nombre: Total importes
          Valor: TOTAL_IMPORTES
        Campo6:
          Nombre: Total devolución
          Valor: TOTAL_DEVOLUCION
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (159, 'TransporteExpedicion', 'http://opendata.aragon.es/def/ei2a#transporte_expedición', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?descripcion where{<%s> <http://purl.org/dc/elements/1.1/description> ?descripcion}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Descripción
          Valor: descripcion      
  Tablas:
    Tabla1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?mun ?nombrut substr(str(?loca),46) as ?idmunicipio  where {optional{<%s> <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://purl.org/dc/elements/1.1/title> ?nombrut. }optional{<%s> <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?mun.}}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Municipio
          Valor: mun
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Columna2:
          Nombre: Ruta
          Valor: nombrut
    
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca  dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (121, 'OrdenanzaFiscalVillasYTierras', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?localidad),53) as ?idvilla ?fechaini ?villa ?tipo where{ optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini . ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?villa}  filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Fecha de inicio
          Valor: fechaini
        Campo3:
          Nombre: Villas y tierras
          Valor: villa
          Url: /pool/detalles?url=villas-y-tierras-%s
          CampoUrl: idvilla
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de  %s 
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_villas_y_tierras%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_villas_y_tierras%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (139, 'arabusExpedicion', 'http://opendata.aragon.es/def/ei2a#expedicion', 'BodyClass: fichaComunidad fichaHotel
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  ?secuence where { ?route <http://vocab.gtfs.org/terms#originStop> ?ori. ?ori <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?route <http://vocab.gtfs.org/terms#originStop> ?ori. ?ori <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long.  optional {?route <http://purl.org/dc/elements/1.1/title> ?title.} filter(?route = <%s>) .}
          Campo: uri 
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#>  select ?ruta ?descripcion substr(str(?rut),41) as ?idruta where{<%s> <http://purl.org/dc/elements/1.1/description> ?descripcion. <%s> <http://vocab.gtfs.org/terms#route> ?rut. ?rut <http://purl.org/dc/elements/1.1/title> ?ruta. }
      Campo: uri
      Campos:
        Campo2:
          Nombre: Ruta
          Valor: ruta
          Url: /pool/detalles?url=ruta-%s
          CampoUrl: idruta
        Campo1:
          Nombre: Descripcion
          Valor: descripcion                 
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Sentido
          Valor: SENTIDO
  Tablas:
    Tabla1:
      Titulo: Paradas y horarios
      Tipo: Virtuoso
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?nparada  ?parada substr(str(?idp),50) as ?idparada ?horalleg  where{?expParada <http://vocab.gtfs.org/terms#Trip> <%s>. ?expParada <http://vocab.gtfs.org/terms#Stop> ?idp . ?expParada <http://vocab.gtfs.org/terms#stopSequence> ?nparada. ?expParada <http://vocab.gtfs.org/terms#Stop> ?stop. ?stop <http://purl.org/dc/elements/1.1/title> ?parada . ?expParada <http://vocab.gtfs.org/terms#arrivalTime> ?horalleg.} order by ?nparada
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Número de parada
          Valor: nparada
        Columna2:
          Nombre: Parada
          Valor: parada
          Url: /pool/detalles?url=arabus-parada-%s
          CampoUrl: idparada
        Columna3:
          Nombre: Hora de llegada
          Valor: horalleg
        
        ', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (115, 'OrdenanzaGeneralVillasYTierras', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio ?villa ?tipo substr(str(?location),46) as ?idmunicipio substr(str(?loc),53) as ?idvilla where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location .?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc . ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?villa filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Villas y tierras
          Valor: villa
          Url: /pool/detalles?url=villas-y-tierras-%s
          CampoUrl: idvilla
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de  %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_villas_y_tierras%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_villas_y_tierras%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                         ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (122, 'depuradora', 'http://opendata.aragon.es/def/ei2a#depuradora', 'BodyClass: fichaComunidad fichaHotel
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio .}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ANOENC
        Campo2: 
          Nombre: Departamento de observación
          Valor: OBSDEP', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (129, 'arabusConcesiones', 'http://opendata.aragon.es/def/ei2a#arabus_concesion', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?operador substr(str(?location),45) as ?idoperador ?tipo ?sitio where{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. optional{ <%s> <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?interes. ?interes <http://xmlns.com/foaf/0.1/homepage> ?sitio.} <%s> <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?location .?location <http://opendata.aragon.es/def/ei2a#organizationName> ?operador.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Tipo
          Valor: tipo    
        Campo2:
          Nombre: Sitio web de la empresa
          Valor: sitio
          Url: http://%s
          CampoUrl: sitio
        Campo3:
          Nombre: Operador
          Valor: operador
          Url: /pool/detalles?url=operador-%s
          CampoUrl: idoperador

      ', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (142, 'direccionInteres', 'http://opendata.aragon.es/def/ei2a#direccion_de_interes', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?direccion where{ <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?site. ?site <http://www.w3.org/2006/vcard/ns#hasAddress> ?has. ?has <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Dirección
          Valor: direccion 
          Url: %s
          CampoUrl: direccion        
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Presidente
          Valor: PRESIDENTE
      ', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (5, 'Persona', 'http://www.w3.org/ns/person#Person', 'BodyClass: fichaComunidad fichaPersona
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#fullName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX person:<http://www.w3.org/ns/person#> select ?cargo ?partido where { <%s> ei2a:fullName ?nombre . optional {<%s> org:hasMembership ?membership . ?membership org:role ?role . ?role ei2a:roleName ?cargo} . optional {<%s> person:memberOf ?memberOf . ?memberOf ei2a:organizationName ?partido .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Cargo
          Valor: cargo
        Campo2:
          Nombre: Partido
          Valor: partido', true, '2018-07-05');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (107, 'modplaneamientoGeneral', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_general', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  substr(str(?location),46) as ?idmunicipio ?nombre ?observacion ?municipio ?tipo where{<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre . optional{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. } optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} optional{ <%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.} <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Tipo        
          Valor: tipo
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo5:
          Nombre: Observaciones
          Valor: observacion     
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (116, 'OrdenanzaFiscalMancomunidad', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?mancomunidad ?municipio substr(str(?location),46) as ?idmunicipio substr(str(?loc),49) as ?idmancomunidad ?tipo where {optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc. ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?mancomunidad. filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Mancomunidad
          Valor: mancomunidad
          Url: /pool/detalles?url=mancomunidad-%s
          CampoUrl: idmancomunidad
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_mancomunidad%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_mancomunidad%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (123, 'OrdenanzaFiscalConsorcio', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#observations
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?localidad),46) as ?idconsorcio ?consorcio ?fechaini ?tipo ?notas where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#observations> ?notas .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad . ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?consorcio filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo4:
          Nombre: Consorcio
          Valor: consorcio
          Url: /pool/detalles?url=consorcio-%s
          CampoUrl: idconsorcio
        Campo2:
          Nombre: Notas
          Valor: notas
        Campo3:
          Nombre: Fecha de inicio
          Valor: fechaini
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_diputacion%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_consorcio%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (143, 'direccionMancomunidad', 'http://opendata.aragon.es/def/ei2a#mancomunidad', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?telefono ?cif ?cp ?fax ?direccion ?email ?direccion where{ <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif . optional {<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.}  . optional{<%s> <http://xmlns.com/foaf/0.1/mbox> ?email.} optional {<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#Fax> ?fax.} optional{<%s> <http://xmlns.com/foaf/0.1/mbox> ?email.} optional {<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.}  optional {<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#postal-code> ?cp.} }
      Campo: uri
      Campos:
        Campo1:
          Nombre: CIF 
          Valor: cif
        Campo2: 
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo3:
          Nombre: Teléfono
          Valor: telefono
        Campo4:
          Nombre: Fax
          Valor: fax    
        Campo5:
          Nombre: Dirección
          Valor: direccion       
        Campo6:
          Nombre: CP
          Valor: cp          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:        
        Campo3:
          Nombre: Presidente
          Valor: PRESIDENTE
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (99, 'OrdenanzaGeneralMunicipio', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto:
    Tipo: HTML
    Query: select SUBSTR( str(?sameas), 64) as ?s where { ?s2 <http://www.w3.org/2002/07/owl#sameAs> ?sameas. filter (?s2 = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  substr(str(?localidad),46) as ?idmunicipio ?nombreMunicipio ?texto ?fechaPublicacion ?fechaAprobacion ?tipo ?apliacion where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#nameDocument> ?texto .} optional {?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad . ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechaPublicacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaAprobacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#observations> ?apliacion .} filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha acuerdo
          Valor: fechaAprobacion
        Campo3:
          Nombre: Fecha publicación
          Valor: fechaPublicacion
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto: Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de acuerdo de aprobación definitiva 
          Valor: F_ACUERDO_APRO_DEF
        Campo2:
          Nombre: Fecha de publicación de aprobación definitiva 
          Valor: F_PUBLICACION_APRO_DEF
        Campo3:
          Nombre: Año
          Valor: ANO
        Campo4:
          Nombre: Fecha de acuerdo de aprobación inicial de la modificación
          Valor: F_ACUERDO_APRO_INI_MOD
        Campo4:
          Nombre: Fecha de publicación de apobación inicial de la modificación
          Valor: F_PUBLICACION_APRO_INI_MOD
        Campo5:
          Nombre: Fecha de acuerdo de apobación definitiva de la modificación
          Valor: F_ACUERDO_APRO_DEF_MOD
        Campo6:
          Nombre: Fecha de publicación de apobación definitiva de la modificación
          Valor: F_PUBLICACION_APRO_DEF_MOD
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_municipio%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_municipio%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (117, 'OrdenanzaFiscalMunicipio', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?localidad),46) as ?idmunicipio ?nombreMunicipio ?texto ?fechaPublicacion ?fechaAprobacion ?tipo   where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#nameDocument> ?texto .} optional {?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad . ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechaPublicacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaAprobacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha de publicación
          Valor: fechaPublicacion
        Campo3:
          Nombre: Fecha de aprobación
          Valor: fechaAprobacion
        Campo4:
          Nombre: Subtipo
          Valor: tipo
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto : Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de acuerdo de aprobación definitiva 
          Valor: F_ACUERDO_APRO_DEF
        Campo2:
          Nombre: Fecha de publicación de aprobación definitiva 
          Valor: F_PUBLICACION_APRO_DEF
        Campo3:
          Nombre: Año
          Valor: ANO
        Campo4:
          Nombre: Fecha de acuerdo de aprobación inicial de la modificación
          Valor: F_ACUERDO_APRO_INI_MOD
        Campo4:
          Nombre: Fecha de publicación de apobación inicial de la modificación
          Valor: F_PUBLICACION_APRO_INI_MOD
        Campo5:
          Nombre: Fecha de acuerdo de apobación definitiva de la modificación
          Valor: F_ACUERDO_APRO_DEF_MOD
        Campo6:
          Nombre: Fecha de publicación de apobación definitiva de la modificación
          Valor: F_PUBLICACION_APRO_DEF_MOD
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas fiscales de %s
      CampoParseo: 
        Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
        Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_municipio%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio> .filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_municipio%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (290, 'datosElecciones', 'http://opendata.aragon.es/def/ei2a#eleccion', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#identifier
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?lugar ?ano where{ optional{<%s>  <http://purl.org/NET/c4dm/event.owl#literal_factor> ?lugar.} optional{<%s> <http://purl.org/dc/elements/1.1/date> ?ano.} }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Lugar 
          Valor: lugar
        Campo2:
          Nombre: Año
          Valor: ano
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Votantes
          Valor: VOTANTES
        Campo2:
          Nombre: Votos nulos
          Valor: VOTOSNULOS
        Campo3:
          Nombre: Votos en blanco
          Valor: VOTOSBLANCO
        Campo4:
          Nombre: Número de concejales
          Valor: NUMCONCEJALES          
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
 ', true, '2018-09-17');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (160, 'IAAContratosGastosAnuales', 'http://opendata.aragon.es/def/ei2a#iaa_contratos_gastos_anuales', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?tipo substr(str(?location),46) as ?idmunicipio ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo.}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: Tipo
          Valor: tipo
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select CONCAT(''<a href="detalles?url=municipio-'',?identifier,''">Ver informaci&oacute;n de '', ?nombreMunicipio,''</a>'') as ?enlace where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. ?municipio ei2a:organizationName ?nombreMunicipio. filter (?s = <%s>)}
    Campo: uri
    Html: %s', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (100, 'OrdenanzaGeneralComarca', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto:
    Tipo: HTML
    Query: select SUBSTR( str(?sameas), 64) as ?s where { ?s2 <http://www.w3.org/2002/07/owl#sameAs> ?sameas. filter (?s2 = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),44) as ?idcomarca ?comarca ?fechaPubli ?fechaApro ?tipo ?ampliacion where {<%s> dc:identifier ?identificador . <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?comarca . optional {<%s> ei2a:registrationDate ?fechaPubli .} optional {<%s> ei2a:startDate ?fechaApro .} optional {<%s> ei2a:documentType ?tipo .} optional {<%s> ei2a:observations ?ampliacion .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Comarca 
          Valor: comarca
          Url: /pool/detalles?url=comarca-%s
          CampoUrl: idcomarca
        Campo2:
          Nombre: Fecha de publicación
          Valor: fechaPubli
        Campo3:
          Nombre: Fecha de aprobación
          Valor: fechaApro
        Campo4:
          Nombre: Tipo
          Valor: tipo       
        Campo5:
          Nombre: Ampliación
          Valor: ampliacion
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto: Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de acuerdo de aprobación definitiva 
          Valor: F_ACUERDO_APRO_DEF
        Campo2:
          Nombre: Fecha de publicación de aprobación definitiva 
          Valor: F_PUBLICACION_APRO_DEF
        Campo3:
          Nombre: Año
          Valor: ANO
        Campo4:
          Nombre: Fecha de acuerdo de aprobación inicial de la modificación
          Valor: F_ACUERDO_APRO_INI_MOD
        Campo4:
          Nombre: Fecha de publicación de apobación inicial de la modificación
          Valor: F_PUBLICACION_APRO_INI_MOD
        Campo5:
          Nombre: Fecha de acuerdo de apobación definitiva de la modificación
          Valor: F_ACUERDO_APRO_DEF_MOD
        Campo6:
          Nombre: Fecha de publicación de apobación definitiva de la modificación
          Valor: F_PUBLICACION_APRO_DEF_MOD
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_comarca%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_comarca%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                       ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (109, 'OrdenanzaGeneralMancomunidad', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio ?mancomunidad substr(str(?localidad),46) as ?idmunicipio substr(str(?loc),49) as ?idmancomunidad ?fechreg ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional{?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechreg .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad .?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?loc . ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?mancomunidad .filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
        Campo2:
          Nombre: Fecha de registro
          Valor: fechreg
        Campo3:
          Nombre: Mancomunidad
          Valor: mancomunidad
          Url: /pool/detalles?url=mancomunidad-%s
          CampoUrl: idmancomunidad
        Campo4:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_mancomunidad%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_mancomunidad%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                      ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (118, 'OrdenanzaFiscalDiputacion', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?localidad),46) as ?idmunicipio  substr(str(?int),47) as ?iddiputacion ?diputacion ?municipio ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?int . ?int <http://opendata.aragon.es/def/ei2a#organizationName> ?diputacion.   filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
          
        Campo3:
          Nombre: Diputación
          Valor: diputacion
          Url: /pool/detalles?url=diputacion-%s
          CampoUrl: iddiputacion
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de  %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_diputacion%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_diputacion%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                                                           ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (125, 'Edar', 'http://opendata.aragon.es/def/ei2a#edar', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/title
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio  substr(str(?location),46) as ?idconsorcio ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idconsorcio
        Campo2:
          Nombre: Fecha
          Valor: fecha
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (101, 'OrdenanzaGeneralDiputacion', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s owl:sameAs ?sameAs. ?sameAs dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://servicios.aragon.es/portalAALL/document.do?clobId=%s">Descárgate la ordenanza</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?localidad),46) as ?idmunicipio  substr(str(?int),47) as ?iddiputacion ?diputacion ?municipio ?tipo where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} ?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad. ?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . ?ordenanza <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?int . ?int <http://opendata.aragon.es/def/ei2a#organizationName> ?diputacion.   filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Subtipo
          Valor: tipo
          
        Campo3:
          Nombre: Diputación
          Valor: diputacion
          Url: /pool/detalles?url=diputacion-%s
          CampoUrl: iddiputacion
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor3:
      Tipo: Api
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source .}
      Oculto: False
      Campo: uri
      Campos:
        Campo1:
          Nombre: TEXTO MODIFICACION
          Valor: TEXTOMODIFICACION
          Class: dato dato-texto info      
PanelLateral:
  ListaContextos:
    ListaContexto1:
      Titulo: Otras ordenanzas generales de  %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?ordenanzaOriginal <http://opendata.aragon.es/def/ei2a#isOfInterestTo> ?diputacion. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion> . filter(?ordenanzaOriginal = <%s>)} LIMIT 5      
      Campo: uri
      Tipo: gadget-iconos
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_diputacion%3E__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
    ListaContexto2:
      Titulo: Ordenanzas fiscales de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://opendata.aragon.es/def/ei2a#isOfInterestTo
      Query: select ?url ?name where  {?url <http://opendata.aragon.es/def/ei2a#nameDocument> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?ordenanzaOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?comarca. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion> filter(?ordenanzaOriginal = <%s>) } LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos
      #gadget-iconos gadget-enlaces gadget-masinfo      
      EnlaceVerMas:
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_diputacion%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location                                                           ', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (110, 'planeamiento', 'http://opendata.aragon.es/def/ei2a#planeamiento', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),46) as ?idmunicipio ?id ?fechaini ?fechareg ?tipo ?municipio where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} <%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. <%s> <http://purl.org/dc/elements/1.1/identifier> ?id.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Identificador
          Valor: id
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo3:
          Nombre: Fecha de inicio
          Valor: fechaini
        Campo4:
          Nombre: Fecha de registro
          Valor: fechareg
        Campo5:
          Nombre: Tipo de documento
          Valor: tipo       
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Tipo de plan
          Valor: TIPOPLAN
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-03');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (355, 'postgrado', 'http://opendata.aragon.es/def/ei2a#postgrado', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/NET/c4dm/event.owl#literal_factor
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  ?fecha where{<%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha
          Valor: fecha
          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha inicio
          Valor: F_INICIO
        Campo2: 
          Nombre: Fecha fin
          Valor: F_FIN
        ', true, '2018-09-18');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (450, 'relacionesInstitucionales', 'http://opendata.aragon.es/def/ei2a#proceso_electoral', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: 		http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?nombre where{<%s> <http://purl.org/NET/c4dm/event.owl#literal_factor> ?nombre. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha
          Valor: FECHA', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (514, 'cargos', 'http://opendata.aragon.es/def/ei2a#cargo', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://opendata.aragon.es/def/ei2a#fullName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?nombre where{<%s> <http://www.w3.org/ns/org#hasMembership> ?member . ?member <http://www.w3.org/ns/org#role> ?rol. ?rol <http://opendata.aragon.es/def/ei2a#roleName> ?nombre.}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Nombre del cargo
          Valor: nombre
       ', true, '2018-09-25');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (162, 'craItinerarioRuta', 'http://opendata.aragon.es/def/ei2a#itinerario_ruta', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?fecha ?formato where{<%s> <http://purl.org/dc/elements/1.1/date> ?fecha. <%s> <http://purl.org/dc/elements/1.1/format> ?formato.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha 
          Valor: fecha
        Campo2:
          Nombre: Formato
          Valor: formato
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha inicio
          Valor: GRT_FECHA_INICIO
        Campo2: 
          Nombre: Fecha fin
          Valor: GRT_FECHA_FIN
    CampoValor3:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?ruta ?municipio substr(str(?location),46) as ?idmunicipio  substr(str(?rou),51) as ?idruta ?fecha where{ <%s><http://vocab.gtfs.org/terms#route> ?rou. ?rou <http://purl.org/dc/elements/1.1/title> ?ruta. <%s> <http://vocab.gtfs.org/terms#route> ?rou. ?rou <http://purl.org/dc/elements/1.1/date> ?fecha. <%s> <http://vocab.gtfs.org/terms#route> ?rou. ?rou <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Ruta
          Valor: ruta
          Url: /pool/detalles?url=cra-datos-ruta-%s
          CampoUrl: idruta
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Año
          Valor: fecha', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (180, 'planeamientoGeneral', 'http://opendata.aragon.es/def/ei2a#planeamiento_general', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select substr(str(?location),46) as ?idmunicipio ?sitio ?nombre ?observacion ?municipio ?tipo where{<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre . optional{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. } optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} optional{ <%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.}  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Tipo        
          Valor: tipo
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo5:
          Nombre: Observaciones
          Valor: observacion
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
        
  ', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (194, 'organismoAutonomo', 'http://opendata.aragon.es/def/ei2a#organismo_autonomo', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),46) as ?idmunicipio  ?localidad ?municipio where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#locality> ?localidad. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio   
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fax
          Valor: FAX
        Campo2: 
          Nombre: Dirección
          Valor: DIRECCION
        Campo2:
          Nombre: CP
          Valor: CP         
        Campo3:
          Nombre: Presidente
          Valor: PRESIDENTE
        Campo4:
          Nombre: Finalidad
          Valor: FINALIDAD
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (26, 'Organization', 'http://www.w3.org/ns/org#Organization', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  Mapa:
    Tipo: open
    Zoom: 15
    Marcadores:
        Query: select ?long ?lat ?title where { ?location <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loc. ?loc <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?lat . ?loc <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?long . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?title filter(?location = <%s>) . }
        Campo: uri 
  Texto: 
    Tipo: HTML
    Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#organizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
    Campo: uri
    Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?cif ?telefono ?email ?fax ?direccion ?nombreComarca ?nombreAlcalde ?nombreDiputacion ?nombreProvincia where { <%s> ei2a:CIF ?cif . optional {<%s> ei2a:phone ?telefono .} optional {<%s> foaf:mbox ?email .} optional {<%s> org:hasSite ?site . ?site org:siteAddress ?siteAddress . ?siteAddress vcard:Fax ?fax . ?siteAddress vcard:hasAddress ?address . ?address vcard:street-address ?direccion . } optional {<%s> org:subOrganizationOf ?comarca . ?comarca ei2a:publicEntityType ei2a:Comarca . ?comarca ei2a:organizationName ?nombreComarca .} optional {?membership org:organization <%s> . ?membership org:member ?member. ?membership org:role ?role . ?member foaf:name ?nombreAlcalde . ?role <http://opendata.aragon.es/def/ei2ia#roleName> ''A'' .} optional {<%s> org:subOrganizationOf ?diputacion . ?diputacion ei2a:publicEntityType ei2a:DiputaciónProvincialForal . ?diputacion foaf:organizationName ?nombreDiputacion .} optional {<%s> org:subOrganizationOf ?provincia . ?provincia rdf:type <http://dbpedia.org/ontology/Province> . ?provincia <http://www.w3.org/2000/01/rdf-schema#label> ?nombreProvincia .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Dirección
          Valor: direccion
        Campo2:
          Nombre: CIF
          Valor: cif
        Campo3:
          Nombre: Comarca
          Valor: nombreComarca
        Campo4:
          Nombre: Telefono
          Valor: telefono
        Campo6:
          Nombre: Fax
          Valor: fax
        Campo7:
          Nombre: Email
          Valor: email
        Campo8:
          Nombre: Alcalde
          Valor: nombreAlcalde
        Campo10:
          Nombre: Provincia        
          Valor: nombreProvincia
        Campo11:
          Nombre: Diputacion        
          Valor: nombreDiputacion
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Habitantes        
          Valor: HABITANTES
        Campo2:
          Nombre: Superficie        
          Valor: SUPERFICIE
  Tablas:     
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: Habitantes según el padrón municipal, datos anuales 
      Query: select distinct substr(str(?year), 1, 4) as ?year ?population where{ ?obs <http://purl.org/linked-data/cube#dataSet> <http://opendata.aragon.es/recurso/DataSet/PadronMunicipal> . ?obs ?x ?y  . {?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?uriAragopedia . <%s> owl:sameAs ?uriAragopedia} UNION {<%s> owl:sameAs ?uriAragopedia. ?uriAragopedia <http://opendata.aragon.es/def/Aragopedia#hasObservation> ?obs} ?obs <http://opendata.aragon.es/def/Aragopedia#year> ?year. ?obs <http://opendata.aragon.es/def/Aragopedia#population> ?population.  } ORDER BY ?year
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: year
          ClassTitulo: w25     
          ClassValor:  mays
        Columna2:
          Nombre: Habitantes
          Valor: population
    Tabla2:
      Titulo: Pleno del municipio 
      Tipo: Virtuoso
      Query: select distinct ?nombrePersona ?cargo where  {?membership <http://www.w3.org/ns/org#organization> <%s> . ?membership <http://www.w3.org/ns/org#member> ?member. ?membership  <http://www.w3.org/ns/org#role> ?role . ?member <http://opendata.aragon.es/def/ei2a#fullName> ?nombrePersona . ?role <http://opendata.aragon.es/def/ei2a#roleName> ?roleName .?member <http://www.w3.org/ns/person#memberOf> ?partido .	?partido <http://opendata.aragon.es/def/ei2a#organizationName> ?nombrePartido. bind(concat(?roleName, '' '' , ?nombrePartido) as ?cargo)}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Persona
          Valor: nombrePersona
        Columna2:
          Nombre: Cargo
          Valor: cargo  
          ClassTitulo: w25     
          ClassValor:  mays
PanelLateral:
  ListaEnlaces:
    ListaEnlace1:
      Titulo: Más información
      Tipo: gadget-masinfo
      Enlaces:        
        Enlace1:
          Texto: ELDA
          url: %s?api_key=e103dc13eb276ad734e680f5855f20c6&_view=completa
          CampoUrl: http://www.w3.org/2002/07/owl#sameAs
        Enlace2:
          Texto: Presupuesto
          url: http://opendata.aragon.es/presupuesto/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace3:
          Texto: Datos en Aragón Open data
          url: http://opendata.aragon.es/opendata/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
    ListaEnlace2:
      Titulo: Enlaces de interes 
      #gadget-iconos gadget-enlaces gadget-masinfo
      Tipo: gadget-enlaces
      Enlaces:
        Enlace1:
          Texto: Ver ordenanzas fiscales municipales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: url:[entorno]/pool/filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Entidades&&&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_municipio>____Ordenanza+Fiscal+Municipio
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace2:
          Texto: Ver ordenanzas Generales municipales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: url:[entorno]/pool/filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Entidades&&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_municipio>____Ordenanza+General+Municipio
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace3:
          Texto: Ver información turística de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: url:[entorno]/pool/filtros?tem=4&stem=&pro=&com=&mun=%s&ent=&sent=&from=Temas
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace4:
          Texto: Ver información de agricultura de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: url:[entorno]/pool/filtros?tem=&stem=&pro=&com=&mun=%s&ent=93&sent=&from=Entidades
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace5:
          Texto: Ver datos del instituto aragoñés del agua de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: url:[entorno]/pool/filtros?tem=&stem=&pro=&com=&mun=%s&ent=104&sent=&from=Entidades
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace6:
          Texto: Ver rutas de autobús de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName   
          url: url:[entorno]/pool/filtros?tem=&stem=&pro=&com=&mun=%s&ent=121&sent=&from=Entidades
          CampoUrl: http://purl.org/dc/elements/1.1/identifier', true, '2018-07-25');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (18, 'Documento', 'http://opendata.aragon.es/def/ei2a#Document', 'BodyClass: fichaComunidad fichaDocuemnto
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX person:<http://www.w3.org/ns/person#> select ?fechaPubli ?fechaApro where { <%s> ei2a:nameDocument ?nombre . optional {<%s> ei2a:registrationDate ?fechaPubli .} optional {<%s> ei2a:startDate ?fechaApro .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de publicación
          Valor: fechaPubli
        Campo2:
          Nombre: Fecha de aprobación
          Valor: fechaApro', true, '2018-07-20');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (483, 'servicio', 'http://opendata.aragon.es/def/ei2a#servicio', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://xmlns.com/foaf/0.1/name
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?descripcion where{<%s> <http://purl.org/dc/elements/1.1/description> ?descripcion.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Descripción 
          Valor: descripcion    
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre de la ruta
          Valor: DENO_CONCESION
        Campo2:
          Nombre: Dirección
          Valor: DENO_DIRECCION
     ', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (163, 'arabusruta', 'http://opendata.aragon.es/def/ei2a#ruta', 'BodyClass: fichaComunidad fichaHotel
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/title
  Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  ?secuence where { ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long. { ?stopTime <http://vocab.gtfs.org/terms#stop> ?stop. ?stopTime <http://vocab.gtfs.org/terms#trip> ?trip. ?trip <http://vocab.gtfs.org/terms#route> ?route. } union { ?route <http://vocab.gtfs.org/terms#destinationStop> ?stop. } union { ?route <http://vocab.gtfs.org/terms#originStop> ?stop. } optional {?stop <http://purl.org/dc/elements/1.1/title> ?title.} filter(?route = <%s>) .}
          Campo: uri       
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio substr(str(?location),46) as ?idmunicipio  where{ <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio .}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Origen
          Valor: ORIGEN
        Campo2: 
          Nombre: Destino
          Valor: DESTINO
  Tablas:
    Tabla1:
      Titulo: Expediciones
      Tipo: Virtuoso
      Query: select distinct ?expedicion substr(str(?s),47) as ?idexpedicion where {?s <http://vocab.gtfs.org/terms#route> ?o. ?s <http://purl.org/dc/elements/1.1/identifier> ?expedicion. filter (?o = <%s>)}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Expediciones
          Valor: expedicion
          Url: /pool/detalles?url=expedicion-%s
          CampoUrl: idexpedicion
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (426, 'sendero', 'http://opendata.aragon.es/def/ei2a#sendero', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?nombre ?descripcion where{<%s> <http://purl.org/dc/elements/1.1/title> ?nombre. <%s> <http://purl.org/dc/elements/1.1/description> ?descripcion.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Descripción
          Valor: descripcion', true, '2018-09-20');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (181, 'poligono', 'http://opendata.aragon.es/def/ei2a#iaf_poligono_industrial', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName	
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?telefono substr(str(?local),46) as ?idmunicipio ?fax ?localidad ?direccion ?pag where{<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono. optional{<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddres. ?siteaddres <http://www.w3.org/2006/vcard/ns#Fax> ?fax.} <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddres. ?siteaddres <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasadd. ?hasadd <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?local. ?local <http://opendata.aragon.es/def/ei2a#organizationName> ?localidad. optional{<%s> <http://xmlns.com/foaf/0.1/homepage> ?pag.} }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Teléfono 
          Valor: telefono
        Cxmpo4:
          Nombre: Fax
          Valor: fax
        Campo2:
          Nombre: Direccion
          Valor: direccion
        Campo5:
          Nombre: Provincia
          Valor: localidad
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo3:
          Nombre: Pagina web
          Valor: pag      
          Url: %s
          CampoUrl: pag          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Presidente
          Valor: PRESIDENTE
        Campo2: 
          Nombre: Decreto
          Valor: DECRETO
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (164, 'transporteRuta', 'http://opendata.aragon.es/def/ei2a#transporte_ruta', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/title
  Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  ?secuence where { ?route <http://vocab.gtfs.org/terms#originStop> ?ori. ?ori <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?route <http://vocab.gtfs.org/terms#originStop> ?ori. ?ori <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long.  optional {?route <http://purl.org/dc/elements/1.1/title> ?title.} filter(?route = <%s>) .}
          Campo: uri 
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio substr(str(?ori),54) as ?idparada ?parada ?municipio where{  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://vocab.gtfs.org/terms#originStop> ?ori. ?ori <http://purl.org/dc/elements/1.1/title> ?parada.}
      Campo: uri
      Campos:
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo1:
          Nombre: Parada Origen
          Valor: parada
          Url: /pool/detalles?url=transporte-parada-%s
          CampoUrl: idparada
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (182, 'sumidero', 'http://opendata.aragon.es/def/ei2a#sumidero', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://www.w3.org/2000/01/rdf-schema#label
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio substr(str(?location),46) as ?idmunicipio ?diametro where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://www.semanticwater.com/WISDOM#hasNominalDiameter> ?diametro. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Diametro
          Valor: diametro
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (475, 'operador', 'http://opendata.aragon.es/def/ei2a#operador', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
    ', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (195, 'transporteExpedicionParada', 'http://opendata.aragon.es/def/ei2a#transporte_expedicion_parada_horario', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
      Titulo: http://purl.org/dc/elements/1.1/identifier
      Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  ?secuence where { ?route  <http://vocab.gtfs.org/terms#stop> ?stop. ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long.  optional {?route <http://vocab.gtfs.org/terms#stop> ?stop .?stop <http://purl.org/dc/elements/1.1/title> ?title.} filter(?route = <%s>) .}
          Campo: uri
      CampoValores: 
        CampoValor1: 
          Tipo: Virtuoso
          Oculto: False
          Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?mun ?parada substr(str(?loca),46) as ?idmunicipio substr(str(?stop),54) as ?idparada where{<%s> <http://vocab.gtfs.org/terms#stop> ?stop. ?stop <http://purl.org/dc/elements/1.1/title> ?parada. <%s> <http://vocab.gtfs.org/terms#stop> ?stop. ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca . ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?mun }
          Campo: uri
          Campos: 
            Campo1: 
              Nombre: Parada
              Valor: parada
              Url: /pool/detalles?url=transporte-parada-%s
              CampoUrl: idparada
            Campo2: 
              Nombre: Municipio
              Valor: mun    
              Url: /pool/detalles?url=municipio-%s
              CampoUrl: idmunicipio
      Tablas: 
        Tabla1: 
          Tipo: Virtuoso
          Oculto: False
          Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?mun ?nombrut  substr(str(?loca),46) as ?idmunicipio where {optional{<%s> <http://vocab.gtfs.org/terms#trip> ?trip. ?trip <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://purl.org/dc/elements/1.1/title> ?nombrut. }optional{<%s> <http://vocab.gtfs.org/terms#trip> ?trip. ?trip <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?mun.}}
          Campo: uri
          Columnas: 
            Columna1: 
              Nombre: Municipio
              Valor: mun
              Url: /pool/detalles?url=municipio-%s
              CampoUrl: idmunicipio
            Columna2: 
              Nombre: Ruta
              Valor: nombrut
PanelLateral: 
      Texto: 
        Tipo: HTML
        Query: select ?identifier  where { ?s <http://vocab.gtfs.org/terms#trip> ?trip . ?trip <http://vocab.gtfs.org/terms#route> ?ruta . ?ruta <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca  dc:identifier ?identifier. filter (?s = <%s>)}
        Campo: uri
        Html: <a href=\detalles?url=municipio-%s\>Ver información del municipio Ruta</a>
      
    
  
', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (165, 'agrupacionSecretarial', 'http://opendata.aragon.es/def/ei2a#agrupacion_secretarial', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),46) as ?idmunicipio ?municipio ?id where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/identifier> ?id. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio 
          Valor: municipio  
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio          
        Campo2:
          Nombre: ID
          Valor: id
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (183, 'pozo', 'http://opendata.aragon.es/def/ei2a#pozo', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  substr(str(?loca),46) as ?idmunicipio ?municipio where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca . ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (196, 'sociedadMercantil', 'http://opendata.aragon.es/def/ei2a#sociedad_mercantil', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  substr(str(?local),46) as ?idmunicipio ?localidad ?direccion ?municipio where{ <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion. <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?local. ?local <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Dirección
          Valor: direccion
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Finalidad
          Valor: FINALIDAD
        Campo2:
          Nombre: Tipo de participación
          Valor: TIPOPARTICIPACION
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-10');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (306, 'curso', 'http://opendata.aragon.es/def/ei2a#curso', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/NET/c4dm/event.owl#literal_factor
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?ano ?tipo where{<%s> <http://purl.org/dc/elements/1.1/date> ?ano. <%s> <http://purl.org/dc/elements/1.1/format> ?tipo.} 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano       
        Campo2:
          Nombre: Tipo de curso
          Valor: tipo
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Denominacion
          Valor: DENOMINACION
        ', true, '2018-09-17');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (318, 'entidadSingular', 'http://opendata.aragon.es/def/ei2a#entidad_singular', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Poblacion
          Valor: POBLACION
        Campo2: 
          Nombre: Varones
          Valor: VARONES
        Campo3:
          Nombre: Mujeres
          Valor: MUJERES         
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-09-17');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (201, 'AlberguesYRefugios', 'http://opendata.aragon.es/def/ei2a#albergue_refugio', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select substr(str(?loc),46) as ?idmunicipio  ?cif ?direccion ?cp  ?telefono  ?nombreMunicipio ?email ?sitioWeb   where{ optional{?s <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legal. ?legal <http://protege.stanford.edu/rdf/HTOv4002#identifierValue>  ?cif.} ?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?street . ?street <http://protege.stanford.edu/rdf/HTOv4002#streetName> ?direccion. ?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loc. ?loc <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio. ?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms. ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?tele. ?tele <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono. optional{?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms. ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx. ?fax <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax. } optional{?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms. ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email.} optional{?s <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms. ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url. ?url <http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb.} filter(?s = <%s>)} 	 
      Campo: uri
      Campos:
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio       
        Campo8:
          Nombre: Telefono
          Valor: telefono
        Campo9:
          Nombre: Fax
          Valor: fax
          Campo10:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb
          Url: http://%s
          CampoUrl: %s
          
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros albergues de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#albergue_refugio> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23albergue_refugio>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Hoteles de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (263, 'EmpresaTurismo', 'http://opendata.aragon.es/def/ei2a#empresa_turismo_activo', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?cp ?nombreComarca ?telefono ?email ?nombreMunicipio ?sitioWeb  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?streetadress . ?streetadress <http://protege.stanford.edu/rdf/HTOv4002#streetName>	?direccion .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address . ?address <http://protege.stanford.edu/rdf/HTOv4002#city> ?city . ?city <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lan . ?lan <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreMunicipio .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lane. ?lane <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?tele. ?tele <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lang . ?lang<http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx . ?faxx <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
        Campo7:
          Nombre: Telefono
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
        Campo9:
          Nombre: Email
          Valor: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb  
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Servicios
          Valor: SERVICIOS
        Campo2:
          Nombre: Fecha inicio temporada alta
          Valor: FECHA_DESDE_TEMP_ALTA
        Campo3:
          Nombre: Fecha final temporada alta
          Valor: FECHA_HASTA_TEMP_ALTA        
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otras empresas turísticas de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#empresa_turismo_activo> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23empresa_turismo_activo>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto2:
      Titulo: Alojamientos hoteleros de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location 
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-09-14');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (391, 'SGTAgriculturaCódigoscatastralesySIGPACparcelasPAC', 'http://opendata.aragon.es/def/ei2a#codigo_catastral', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?ano ?secirr ?parcela where{<%s> <http://purl.org/dc/elements/1.1/date> ?ano. optional{<%s> <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ?secirr. } <%s> <http://opendata.aragon.es/def/ei2a#parcel> ?parcela.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano
        Campo6:
          Nombre: Seco o irrigado
          Valor: secirr
        Campo3:
          Nombre: Parcela
          Valor: parcela
        ', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (166, 'datosDiputacion', 'http://opendata.aragon.es/def/ei2a#diputacion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?telefono substr(str(?muni),46) as ?idmunicipio ?cif ?fax ?direccion ?municipio where{ <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif . optional {<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.}  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.  }
      Campo: uri
      Campos:
        Campo1:
          Nombre: CIF 
          Valor: cif
        Campo2:
          Nombre: Teléfono
          Valor: telefono
        Campo4:
          Nombre: Fax
          Valor: fax
        Campo3:
          Nombre: Municipio
          Valor: municipio   
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fax
          Valor: FAX
        Campo2: 
          Nombre: Dirección
          Valor: DIRECCION
        Campo4:
          Nombre: CP
          Valor: CP         
        Campo3:
          Nombre: Presidente
          Valor: PRESIDENTE
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (184, 'potabilizadora', 'http://opendata.aragon.es/def/ei2a#potabilizadora', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  substr(str(?loca),46) as ?idmunicipio ?municipio where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca . ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
  CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año encendido
          Valor: ANOENC
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (198, 'simbolo', 'http://opendata.aragon.es/def/ei2a#simbolo', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?nombre ?observacion ?fechareg ?fechaini ?tipo where{<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre . <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio . optional{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. } optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} optional{<%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Tipo        
          Valor: tipo
        Campo3:
          Nombre: Fecha registro
          Valor: fechareg
        Campo4:
          Nombre: Fecha inicio
          Valor: fechaini
        Campo5:
          Nombre: Observaciones
          Valor: observacion
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select CONCAT(''<a href="detalles?url=municipio-'',?identifier,''">Ver informaci&oacute;n de '', ?nombreMunicipio,''</a>'') as ?enlace where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. ?municipio ei2a:organizationName ?nombreMunicipio. filter (?s = <%s>)}
    Campo: uri
    Html: %s', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (664, 'expedicionesHorariosParadas', 'http://opendata.aragon.es/def/ei2a#expedicion_parada_y_horario', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Horario
          Valor: HORARIO
        Campo2: 
          Nombre: Desde
          Valor: DESDE
  Tablas:     
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: Horario paradas
      Query: select distinct ?o where {?s <http://vocab.gtfs.org/terms#arrivalTime> ?o. filter (?s = <%s>)}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Horas de llegada a la parada 
          Valor: o
          ', true, '2018-09-28');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (202, 'alojamientoHotelero', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?cp ?nombreComarca ?telefono ?email ?nombreMunicipio ?sitioWeb substr(str(?muni),46) as ?idmunicipio  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?streetadress . ?streetadress <http://protege.stanford.edu/rdf/HTOv4002#streetName>	?direccion .} optional {<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lane. ?lane <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?locatione. ?locatione <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecomse. ?telecomse <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?telee. ?telee <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono . } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lang . ?lang<http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx . ?faxx <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .}optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
          
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo7:
          Nombre: Teléfono        
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
        Campo9:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb  
          Url: http://%s
          CampoUrl: sitioWeb
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros alojamientos hoteleros de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Apartamentos turísticos de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#apartamento_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23apartamento_turistico>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (167, 'entidadMenor', 'http://opendata.aragon.es/def/ei2a#entidad_menor', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  substr(str(?location),46) as ?idmunicipio ?telefono ?cif ?cp ?fax ?direccion ?municipio where{ <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif . optional {<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.}  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . optional{ <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddres. ?siteaddres <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasadd . ?hasadd <http://www.w3.org/2006/vcard/ns#postal-code> ?cp.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: CIF 
          Valor: cif
        Campo2:
          Nombre: Teléfono
          Valor: telefono
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: CP
          Valor: cp
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Presidente
          Valor: PRESIDENTE
        Campo2: 
          Nombre: Decreto
          Valor: DECRETO
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (185, 'hidrante', 'http://opendata.aragon.es/def/ei2a#hidrante', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s>  <http://purl.org/dc/elements/1.1/date> ?fecha. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (386, 'SGTAgriculturaParcelasPACcultivosherbáceos', 'http://opendata.aragon.es/def/ei2a#cultivo_herbaceo', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?ano ?municipio ?parcela ?superficie ?uso where{ <%s> <http://purl.org/dc/elements/1.1/date> ?ano. <%s> <http://opendata.aragon.es/def/ei2a#origin> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://opendata.aragon.es/def/ei2a#parcel> ?parcela. <%s> <http://opendata.aragon.es/def/ei2a#surface> ?superficie. <%s> <http://opendata.aragon.es/def/ei2a#surface> ?superficie. <%s> <http://opendata.aragon.es/def/ei2a#use> ?uso.} 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano
        Campo2:
          Nombre: Municipio
          Valor: municipio
        Campo3:
          Nombre: Parcela
          Valor: parcela
        Campo4: 
          Nombre: Superficie
          Valor: superficie
        Campo5:
          Nombre: Uso
          Valor: uso                 
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://opendata.aragon.es/def/ei2a#origin>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (199, 'cafeteriaRestaurante', 'http://opendata.aragon.es/def/ei2a#cafeteria_restaurante', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?cp ?nombreComarca substr(str(?muni),46) as ?idmunicipio ?telefono ?fax  ?nombreMunicipio ?nombreEmpresa ?sitioWeb   ?location  ?address ?street ?city ?lentext ?letextreg ?region  ?telecoms ?teleph where{ 	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . 	optional {<%s> ei2a:CIF ?cif .} 	<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address . ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp . 	}	optional {<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio . }	optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location . ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address .	?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?letextreg . ?letextreg <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca . }	optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location .	?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . 	?telecoms  <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?teleph .	?teleph <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono .}	optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location .	?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?fax2 . 	?fax2 <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .} 	optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location .	?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms .?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?ltexturl .	?ltexturl <http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} 	}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo7:
          Nombre: Número de provincia        
          Valor: numeroProvincia
        Campo8:
          Nombre: Telefono
          Valor: telefono
        Campo9:
          Nombre: Fax
          Valor: fax
        Campo11:
          Nombre: Sitio Web
          Valor: sitioWeb  
          Url: http://%s
          CampoUrl: sitioWeb
        Campo12:
          Nombre: Nombre de la empresa
          Valor: nombreEmpresa
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Hoteles de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (155, 'AgenciaViaje', 'http://opendata.aragon.es/def/ei2a#agencia_viaje', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?municipio substr(str(?location),46) as ?idmunicipio ?direccion ?cp ?telefono  where{ optional{<%s> <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreEstablecimiento} . optional{<%s> <http://www.w3.org/ns/org#hasSite> ?site. ?site <http://www.w3.org/ns/org#siteAddress> ?vcard. ?vcard <http://www.w3.org/2006/vcard/ns#hasAddress> ?card. ?card  <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.}  optional{<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.}optional{<%s> <http://www.w3.org/ns/org#hasSite> ?site. ?site <http://www.w3.org/ns/org#siteAddress> ?vcard. ?vcard <http://www.w3.org/2006/vcard/ns#hasAddress> ?card. ?card <http://www.w3.org/2006/vcard/ns#postal-code> ?cp.} <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location . ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento         
        Campo2:
          Nombre: Dirección
          Valor: direccion
        Campo3:
          Nombre: Código Postal
          Valor: cp
        Campo7:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: Telefono
          Valor: telefono
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de alta 
          Valor: FECHA_ALTA
        Campo2:
          Nombre: Fecha de baja
          Valor: FECHA_BAJA
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otras agencias de viajes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#agencia_viaje> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=$s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23agencia_viaje>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Hoteles en %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=50297&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>____Alojamientos+hoteleros
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Albergues y refugios en %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#albergue_refugio> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=50297&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23albergue_refugio>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
          
          ', true, '2018-10-05');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (203, 'AlojamientoRural', 'http://opendata.aragon.es/def/ei2a#alojamiento_rural', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif substr(str(?loca),46) as ?idmunicipio ?direccion ?cp ?nombreComarca ?telefono ?email ?nombreMunicipio ?sitioWeb  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?streetadress . ?streetadress <http://protege.stanford.edu/rdf/HTOv4002#streetName>	?direccion .} <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio  optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lane. ?lane <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?tele. ?tele <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lang . ?lang<http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx . ?faxx <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo7:
          Nombre: Telefono
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
        Campo9:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb  
          Url: http://%s
          CampoUrl: email
        Campo11:
          Nombre: Nombre de la empresa
          Valor: nombreEmpresa
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros alojamientos de turísmo rural de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_rural> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_rural>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Apartamentos turísticos de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#apartamento_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23apartamento_turistico>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (168, 'datosFundaciones', 'http://opendata.aragon.es/def/ei2a#fundacion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?cif substr(str(?muni),46) as ?idmunicipio ?municipio where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.  <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif.}
      Campo: uri
      Campos:
        Campo2:
          Nombre: CIF
          Valor: cif
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fax
          Valor: FAX
        Campo2: 
          Nombre: Dirección
          Valor: DIRECCION
        Campo2:
          Nombre: CP
          Valor: CP         
        Campo3:
          Nombre: Presidente
          Valor: PRESIDENTE
        Campo4:
          Nombre: Finalidad
          Valor: FINALIDAD
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (186, 'emisario', 'http://opendata.aragon.es/def/ei2a#emisario', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?longitud ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha.  optional{ <%s> <http://www.semanticwater.com/WISDOM#hasLength> ?longitud. }}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
        Campo3:
          Nombre: Longitud
          Valor: longitud
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (204, 'ApartamentoTuristico', 'http://opendata.aragon.es/def/ei2a#apartamento_turistico', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select substr(str(?loca),46) as ?idmunicipio ?nombreEstablecimiento ?cif ?direccion ?cp ?nombreComarca ?telefono ?email ?municipio ?sitioWeb  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?streetadress . ?streetadress <http://protege.stanford.edu/rdf/HTOv4002#streetName>	?direccion .} <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lane. ?lane <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?tele. ?tele <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lang . ?lang<http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx . ?faxx <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo6:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo7:
          Nombre: Telefono
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
        Campo9:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb  
          Url: http://%s
          CampoUrl: sitioWeb
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros apartamentos turisticos de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#apartamento_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Hoteles de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#apartamento_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (206, 'OficinaTurismo', 'http://opendata.aragon.es/def/ei2a#oficina_turismo', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?cp ?nombreComarca ?telefono  ?nombreMunicipio   where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://xmlns.com/foaf/0.1/phone> ?telefono .} optional{<%s> <http://www.w3.org/ns/org#hasSite> ?site. ?site <http://www.w3.org/ns/org#siteAddress> ?siteAddress. ?siteAddress<http://www.w3.org/2006/vcard/ns#hasAddress> ?hasAddress. ?hasAddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo7:
          Nombre: Telefono
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otras oficinas de turísmo de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#oficina_turismo> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23oficina_turismo>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Alojamientos hoteleros de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (169, 'nucleo', 'http://opendata.aragon.es/def/ei2a#nucleo', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),46) as ?idmunicipio ?municipio where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.  }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Población
          Valor: POBLACION
        Campo2: 
          Nombre: Varones
          Valor: VARONES
        Campo3:
          Nombre: Mujeres
          Valor: MUJERES
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (332, 'consorcio', 'http://opendata.aragon.es/def/ei2a#consorcio', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?direccion ?cif ?fax ?telefono where{ <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif. optional{<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.} optional{<%s> <http://www.w3.org/ns/org#hasSites> ?hassites. ?hassites <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#Fax> ?fax.} <%s> <http://www.w3.org/ns/org#hasSites> ?hassites. ?hassites <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.}
      Campo: uri
      Campos:     
        Campo2:
          Nombre: CIF
          Valor: cif
        Campo4:
          Nombre: Teléfono
          Valor: telefono
        Campo3:
          Nombre: Fax
          Valor: fax
        Campo5:
          Nombre: Dirección
          Valor: direccion     
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo2:
          Nombre: Email
          Valor: EMAIL
        Campo4:
          Nombre: Presidente
          Valor: PRESIDENTE
        Campo5:
          Nombre: Finalidad
          Valor: FINALIDAD', true, '2018-09-18');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (187, 'distribucion', 'http://opendata.aragon.es/def/ei2a#distribucion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 		http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?material ?diametro ?longitud where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://www.semanticwater.com/WISDOM#hasNominalDiameter> ?diametro. <%s> <http://www.semanticwater.com/WISDOM#hasLength> ?longitud. optional{<%s> <http://www.semanticwater.com/WISDOM#hasMaterial> ?hasmaterial. ?hasmaterial <http://www.w3.org/2000/01/rdf-schema#label> ?material.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Diametro
          Valor: diametro
        Campo3:
          Nombre: Longitud
          Valor: longitud
        Campo4:
          Nombre: Material
          Valor: material
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (394, 'SGTAgriculturaCódigosdecultivoslenososPAC', 'http://opendata.aragon.es/def/ei2a#woody', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?ano ?descripcion where{<%s> <http://purl.org/dc/elements/1.1/date> ?ano. <%s> <http://opendata.aragon.es/def/ei2a#description> ?descripcion.} 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano
        Campo2:
          Nombre: Descripción
          Valor: descripcion
        
       ', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (205, 'campingTuristico', 'http://opendata.aragon.es/def/ei2a#camping_turistico', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?cp substr(str(?loca),46) as ?idmunicipio ?nombreComarca ?telefono ?email ?nombreMunicipio ?sitioWeb  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .} optional{?legali <http://protege.stanford.edu/rdf/HTOv4002#identifierValue> ?cif .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#postCode> ?cp. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#streetAddress> ?streetadress . ?streetadress <http://protege.stanford.edu/rdf/HTOv4002#streetName>	?direccion .} optional {<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?loca. ?loca <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#address> ?address. ?address <http://protege.stanford.edu/rdf/HTOv4002#region> ?region . ?region <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lane. ?lane <http://protege.stanford.edu/rdf/HTOv4002#text> ?nombreComarca. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#email> ?email. } optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#telephone> ?tele. ?tele <http://protege.stanford.edu/rdf/HTOv4002#number> ?telefono .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#url> ?url . ?url <http://protege.stanford.edu/rdf/HTOv4002#languageText> ?lang . ?lang<http://protege.stanford.edu/rdf/HTOv4002#text> ?sitioWeb .} optional {<%s> <http://protege.stanford.edu/rdf/HTOv4002#location> ?location. ?location <http://protege.stanford.edu/rdf/HTOv4002#telecoms> ?telecoms . ?telecoms <http://protege.stanford.edu/rdf/HTOv4002#fax> ?faxx . ?faxx <http://protege.stanford.edu/rdf/HTOv4002#number> ?fax .}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Código Postal
          Valor: cp
        Campo5:
          Nombre: Comarca
          Valor: nombreComarca
        Campo6:
          Nombre: Municipio        
          Valor: nombreMunicipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
          
        Campo7:
          Nombre: Telefono
          Valor: telefono
        Campo8:
          Nombre: Fax
          Valor: fax
        Campo9:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo10:
          Nombre: Sitio Web
          Valor: sitioWeb  
          Url: http://%s
          CampoUrl: sitioWeb
        Campo11:
          Nombre: Nombre de la empresa
          Valor: nombreEmpresa
  Tablas:
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: 
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?fieldName ?num  where {	optional{<%s> ei2a:organizationName ?nombreEstablecimiento . } optional{<%s> <http://protege.stanford.edu/rdf/HTOv4002#profile> ?profile . ?profile <http://protege.stanford.edu/rdf/HTOv4002#profileField> ?sitio . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldValue> ?num . ?sitio <http://protege.stanford.edu/rdf/HTOv4002#fieldName> ?fieldName}  }
      Campo: uri
      Columnas:
        Columna1:
          Nombre: 
          Valor: fieldName
        Columna2:
          Nombre: Número
          Valor: num
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros campings turisticos de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#camping_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23camping_turistico>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Apartamento turístico de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#apartamento_turistico> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23apartamento_turistico>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location  
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (504, 'transporteConcesiones', 'http://opendata.aragon.es/def/ei2a#transporte_concesion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?observacion where {<%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Observaciones 
          Valor: observacion    
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Empresa
          Valor: EMPRESA
        Campo2: 
          Nombre: Organismo
          Valor: ORGANISMO
', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (390, 'SGTAgriculturaParcelasPACcultivoslenosos', 'http://opendata.aragon.es/def/ei2a#cultivo_lenoso', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?ano ?titulo ?municipio ?origen ?poligono ?parcela ?porpas ?superficie  where{ <%s> <http://purl.org/dc/elements/1.1/date> ?ano. <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio . <%s> <http://opendata.aragon.es/def/ei2a#parcel> ?parcela. <%s> <http://opendata.aragon.es/def/ei2a#surface> ?superficie.  optional{<%s> <http://opendata.aragon.es/def/ei2a#pasturePercentage> ?porpas.} optional{<%s> <http://purl.org/dc/elements/1.1/title> ?titulo.} optional{<%s> <http://opendata.aragon.es/def/ei2a#polygon> ?pol. ?pol <http://opendata.aragon.es/def/ei2a#organizationName> ?poligono.} optional{<%s> <http://opendata.aragon.es/def/ei2a#origin> ?origen.}} 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano
        Campo2:
          Nombre: Municipio
          Valor: municipio
        Campo8:
          Nombre: Titulo
          Valor: titulo
        Campo6:
          Nombre: Origen
          Valor: origen
        Campo3:
          Nombre: Parcela
          Valor: parcela
        Campo4: 
          Nombre: Superficie
          Valor: superficie         
        Campo7: 
          Nombre: Porcentaje de pasto
          Valor: porpas
        Campo9:
          Nombre: Poligono
          Valor: poligono
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (395, 'SGTAgriculturaCódigosdevariedadesherbáceasPAC', 'http://opendata.aragon.es/def/ei2a#codigo_variedad_herbacea', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?ano ?descripcion ?varcul where{<%s> <http://purl.org/dc/elements/1.1/date> ?ano. <%s> <http://opendata.aragon.es/def/ei2a#description> ?descripcion. <%s> <http://opendata.aragon.es/def/ei2a#cropVarietyIdentifier> ?varcul.} 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ano
        Campo2:
          Nombre: Descripción
          Valor: descripcion
        Campo3:
          Nombre: Variedad de cultivo
          Valor: varcul
      
        ', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (397, 'SGTAgriculturaComarcasagrarias', 'http://opendata.aragon.es/def/ei2a#comarca_agraria', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  ?comarca where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?comarca. } 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Comarca
          Valor: comarca
       
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=comarca-%s">Ver información de la comarca</a>', true, '2018-09-19');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (170, 'organizacionComplementaria', 'http://opendata.aragon.es/def/ei2a#organizacion_complementaria', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),46) as ?idmunicipio ?municipio where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.  }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: NOMBRE
        Campo2: 
          Nombre: Entidad
          Valor: ENTIDAD
        Campo3:
          Nombre: Tipo de organización
          Valor: TIPOORG
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (171, 'presupuesto', 'http://opendata.aragon.es/def/ei2a#presupuesto', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#documentType   
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),55) as ?idsociedad  ?municipio ?sociedad where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress. ?hasaddress <http://www.w3.org/2006/vcard/ns#locality> ?municipio.  <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?sociedad.   }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
        Campo2:
          Nombre: Sociedad  mercantil
          Valor: sociedad   
          Url: /pool/detalles?url=sociedad-mercantil-%s
          CampoUrl: idsociedad
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Año
          Valor: ANO
      ', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (495, 'craLocalidad', 'http://opendata.aragon.es/def/ei2a#cra_localidad', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/title
 ', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (498, 'craCentros', 'http://opendata.aragon.es/def/ei2a#cra_centro', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName	
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?direccion ?cp where{<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress. ?hassaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress. ?hassaddress <http://www.w3.org/2006/vcard/ns#postal-code> ?cp.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Dirección
          Valor: direccion
        Campo2:
          Nombre: Codigo postal
          Valor: cp
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del titular
          Valor: NOMBTITULAR
       ', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (433, 'ramal', 'http://opendata.aragon.es/def/ei2a#ramal', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://www.w3.org/2000/01/rdf-schema#label
  CampoValores:
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha
          Valor: FECHA
       ', true, '2018-09-20');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (519, 'edarEnConstruccion', 'http://opendata.aragon.es/def/ei2a#edar_en_construccion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?descripcion where { optional{ <%s> <http://purl.org/dc/elements/1.1/description> ?descripcion.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Descripción
          Valor: descripcion
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Parcela
          Valor: PARCELA', true, '2018-09-25');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (437, 'llave', 'http://opendata.aragon.es/def/ei2a#llave_de_corte', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio ?diametro where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-09-20');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (526, 'transportista', 'http://opendata.aragon.es/def/ei2a#transportista', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?cif ?nombre ?direccion ?localidad ?region ?cp where{<%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress . ?hassaddress <http://www.w3.org/2006/vcard/ns#locality> ?localidad.<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress . ?hassaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion .<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress . ?hassaddress <http://www.w3.org/2006/vcard/ns#postal-code> ?cp. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress . ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hassaddress . ?hassaddress <http://www.w3.org/2006/vcard/ns#region> ?region. <%s> <http://opendata.aragon.es/def/ei2a#organizationName> ?nombre.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: CIF 
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Localidad
          Valor: localidad
        Campo5:
          Nombre: Región
          Valor: region
        Campo6:
          Nombre: CP
          Valor: cp', true, '2018-09-26');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (172, 'villasYTierras', 'http://opendata.aragon.es/def/ei2a#villas_y_tierras', 'BodyClass: fichaComunidad fichaOrdenazaFiscalMunicipio
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?telefono ?email ?cif ?fax ?direccion ?cp where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio .  <%s> <http://opendata.aragon.es/def/ei2a#CIF> ?cif. <%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono . <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#Fax> ?fax. <%s> <http://xmlns.com/foaf/0.1/mbox> ?email. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress . ?hasaddress <http://www.w3.org/2006/vcard/ns#street-address> ?direccion. <%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?siteaddress. ?siteaddress <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddress . ?hasaddress <http://www.w3.org/2006/vcard/ns#postal-code> ?cp.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: CIF
          Valor: cif
        Campo3:
          Nombre: Teléfono
          Valor: telefono
        Campo4:
          Nombre: Fax
          Valor: fax
        Campo5:
          Nombre: Dirección
          Valor: direccion
        Campo7:
          Nombre: CP
          Valor: cp
        Campo6: 
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto : Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Finalidad
          Valor: Finalidad
        Campo2:
          Nombre: Presidente
          Valor: Presidente
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (188, 'deposito', 'http://opendata.aragon.es/def/ei2a#deposito', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 		http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Departamento de observación
          Valor: OBSDEP
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (500, 'craDatosRutas', 'http://opendata.aragon.es/def/ei2a#cra_datos_ruta', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/title
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?fecha where{<%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha 
          Valor: fecha
        ', true, '2018-09-24');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (513, 'entidad', 'http://opendata.aragon.es/def/ei2a#entidad', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
 
       ', true, '2018-09-25');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (173, 'registroLlamada', 'http://opendata.aragon.es/def/ei2a#registro_llamada', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
 #titulo del panel
  Titulo:	http://purl.org/NET/c4dm/event.owl#literal_factor
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?municipio substr(str(?location),46) as ?idmunicipio ?fecha  where {<%s> <http://purl.org/dc/elements/1.1/date> ?fecha. <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha
          Valor: fecha
        Campo2:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (189, 'conduccion', 'http://opendata.aragon.es/def/ei2a#conduccion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?location),46) as ?idmunicipio ?municipio ?fecha ?longitud where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. optional{<%s> <http://purl.org/dc/elements/1.1/date> ?fecha.}  optional{<%s> <http://www.semanticwater.com/WISDOM#hasLength> ?longitud.} }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
        Campo3:
          Nombre: Longitud
          Valor: longitud
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (150, 'GuiaTurismo', 'http://opendata.aragon.es/def/ei2a#guia_turismo', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#fullName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombrecompleto ?nombre ?apellidos ?telefono ?email ?sitioWeb where{<%s> <http://opendata.aragon.es/def/ei2a#fullName> ?nombrecompleto. <%s> <http://xmlns.com/foaf/0.1/firstName> ?nombre. <%s> <http://xmlns.com/foaf/0.1/familyName> ?apellidos. optional{<%s> <http://xmlns.com/foaf/0.1/phone> ?telefono. <%s> <http://xmlns.com/foaf/0.1/mbox> ?email. <%s> <http://xmlns.com/foaf/0.1/homepage> ?sitioWeb.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre 
          Valor: nombre
        Campo2:
          Nombre: Apellidos
          Valor: apellidos
        Campo3:
          Nombre: Teléfono
          Valor: telefono
        Campo4:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
        Campo5:
          Nombre: Sitio Web
          Valor: sitioWeb
          Url: http://%s
          CampoUrl: sitioWeb          
          
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Español
          Valor: ESPANOL
        Campo2:
          Nombre: Inglés
          Valor: INGLES
        Campo3:
          Nombre: Francés
          Valor: FRANCES
        Campo4:
          Nombre: Alemán
          Valor: ALEMAN
        Campo4:
          Nombre: Italiano
          Valor: ITALIANO
        Campo5:
          Nombre: Otros idiomas
          Valor: OTROS_IDIOMAS
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (190, 'colector', 'http://opendata.aragon.es/def/ei2a#colector', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo:	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?local),46) as ?idmunicipio ?longitud ?fecha ?municipio ?diametro where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://www.semanticwater.com/WISDOM#hasNominalDiameter> ?diametro. <%s> <http://www.semanticwater.com/WISDOM#hasLength> ?longitud. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo4:
          Nombre: Fecha
          Valor: fecha
        Campo2:
          Nombre: Diametro
          Valor: diametro
        Campo3:
          Nombre: Longitud
          Valor: longitud
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (532, 'periodoLegislatura', 'http://opendata.aragon.es/def/ei2a#periodo_legislatura', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/NET/c4dm/event.owl#literal_factor
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select distinct ?s  group_concat(?dateEND,''|'') as ?fin   group_concat(?dateBEGIN,''|'') as ?inicio where {?s <http://purl.org/NET/c4dm/event.owl#time> ?time. OPTIONAL{ ?time <http://www.w3.org/2006/time#hasEnd> ?o. ?o <http://www.w3.org/2006/time#inXSDDate> ?dateEND} OPTIONAL{ ?time <http://www.w3.org/2006/time#hasBeginning> ?o. ?o <http://www.w3.org/2006/time#inXSDDate> ?dateBEGIN} filter(?s = <%s>)} order by ?s
      Campo: uri
      Campos:
        Campo1:
          Nombre: Comienzo de la legislatura
          Valor: inicio
        Campo2:
          Nombre: Final de la legislatura
          Valor: fin
    
        ', true, '2018-09-26');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (208, 'DARAArchivosAragon', 'http://opendata.aragon.es/def/ei2a#dara_archivos_aragon', '﻿BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  Texto:
    Tipo: HTML
    Query: select SUBSTR( str(?s), 52) where { ?s rdf:type ?type. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="http://dara.aragon.es/opac/app/item?i=%s">Acceder al documento</a>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?telefono ?tipo where{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Tipo 
          Valor: tipo   
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Título
          Valor: TITLE', true, '2018-10-30');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (257, 'PuntosInformacion', 'http://opendata.aragon.es/def/ei2a#punto_informacion_turistica', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?nombreEstablecimiento ?cif ?direccion ?telefono  where{ <%s> ei2a:organizationName ?nombreEstablecimiento. optional{ <%s> <http://protege.stanford.edu/rdf/HTOv4002#legalIdentifier> ?legali .}optional{<%s> <http://www.w3.org/ns/org#hasSite> ?hassite. ?hassite <http://www.w3.org/ns/org#siteAddress> ?site. ?site <http://www.w3.org/2006/vcard/ns#hasAddress> ?hasaddres. ?hasaddres <http://www.w3.org/2006/vcard/ns#street-address> ?direccion.} optional{<%s> <http://opendata.aragon.es/def/ei2a#phone> ?telefono.}}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre del establecimiento
          Valor: nombreEstablecimiento
        Campo2:
          Nombre: CIF de la empresa
          Valor: cif
        Campo3:
          Nombre: Dirección
          Valor: direccion
        Campo4:
          Nombre: Telefono
          Valor: telefono
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>
  ListaContextos:
    ListaContexto1:
      Titulo: Otros puntos de información turistica de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#punto_informacion_turistica> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23punto_informacion_turistica>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto2:
      Titulo: Alojamientos hoteleros de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#alojamiento_hotelero> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23alojamiento_hotelero>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     
    ListaContexto3:
      Titulo: Restaurantes de %s
      CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://opendata.aragon.es/def/ei2a#organizationName> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location
      Query: select ?url ?name where {?url <http://opendata.aragon.es/def/ei2a#organizationName> ?name . ?url <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?restauranteOriginal <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?municipio. ?url <http://purl.org/dc/elements/1.1/type> <http://opendata.aragon.es/def/ei2a#cafeteria_restaurante> . filter(?restauranteOriginal = <%s>)} LIMIT 5     
      Campo: uri
      Tipo: gadget-iconos-hoteles
      EnlaceVerMas: 
        Texto: Ver más.
        url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=1&sent=&from=Entidades&filt=Tipos__dc%3Atype__<http%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23cafeteria_restaurante>__
        CampoParseo: 
          Query: select ?parseo where { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location     ', true, '2018-09-14');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (210, 'datosMunicipio', 'http://opendata.aragon.es/def/ei2a#municipio', 'BodyClass: fichaComunidad fichaOrganizacion
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  Mapa:
    Tipo: idearagon
    Valor: http://idearagon.aragon.es/visor/index.html?HERRAMIENTAS=NO&ACTIVELAYER=Localidad&QUERY=c_muni_ine=%s
    Campo: http://purl.org/dc/elements/1.1/identifier
  Texto: 
    Tipo: HTML
    Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#organizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
    Campo: uri
    Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select ?cif ?telefono ?email ?fax ?direccion ?nombreComarca ?idComarca ?nombreAlcalde ?nombreDiputacion ?nombreProvincia where { <%s> ei2a:CIF ?cif . optional {<%s> ei2a:phone ?telefono .} optional {<%s> foaf:mbox ?email .} optional {<%s> org:hasSite ?site . ?site org:siteAddress ?siteAddress . ?siteAddress vcard:Fax ?fax . ?siteAddress vcard:hasAddress ?address . ?address vcard:street-address ?direccion . } optional {<%s> org:subOrganizationOf ?comarca . ?comarca ei2a:publicEntityType ei2a:Comarca . ?comarca ei2a:organizationName ?nombreComarca . ?comarca <http://purl.org/dc/elements/1.1/identifier> ?idComarca} optional {?membership org:organization <%s> . ?membership org:member ?member. ?membership org:role ?role . ?member foaf:name ?nombreAlcalde . ?role <http://opendata.aragon.es/def/ei2ia#roleName> ''A'' .} optional {<%s> org:subOrganizationOf ?diputacion . ?diputacion ei2a:publicEntityType ei2a:DiputaciónProvincialForal . ?diputacion foaf:organizationName ?nombreDiputacion .} } 
      Campo: uri
      Campos:
        Campo1:
          Nombre: Dirección
          Valor: direccion
        Campo2:
          Nombre: CIF
          Valor: cif
        Campo3:
          Nombre: Comarca
          Valor: nombreComarca
          Url: /pool/detalles?url=comarca-%s
          CampoUrl: idComarca
        Campo4:
          Nombre: Telefono
          Valor: telefono
        Campo6:
          Nombre: Fax
          Valor: fax
        Campo7:
          Nombre: Email
          Url: mailto:%s
          Valor: email
          CampoUrl: email
        Campo8:
          Nombre: Alcalde
          Valor: nombreAlcalde
        Campo11:
          Nombre: Diputacion        
          Valor: nombreDiputacion
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Habitantes        
          Valor: HABITANTES
        Campo2:
          Nombre: Superficie        
          Valor: SUPERFICIE
  Tablas:     
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: Habitantes según el padrón municipal, datos anuales 
      Query: select distinct substr(str(?year), 1, 4) as ?year ?population where{ ?obs <http://purl.org/linked-data/cube#dataSet> <http://opendata.aragon.es/recurso/DataSet/PadronMunicipal> . ?obs ?x ?y  . {?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?uriAragopedia . <%s> owl:sameAs ?uriAragopedia} UNION {<%s> owl:sameAs ?uriAragopedia. ?uriAragopedia <http://opendata.aragon.es/def/Aragopedia#hasObservation> ?obs} ?obs <http://opendata.aragon.es/def/Aragopedia#year> ?year. ?obs <http://opendata.aragon.es/def/Aragopedia#population> ?population.  } ORDER BY ?year
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: year
          ClassTitulo: w25     
          ClassValor:  mays
        Columna2:
          Nombre: Habitantes
          Valor: population
    Tabla2:
      Titulo: Pleno del municipio 
      Tipo: Virtuoso
      Query: select distinct ?nombrePersona ?cargo where  {?membership <http://www.w3.org/ns/org#organization> <%s> . ?membership <http://www.w3.org/ns/org#member> ?member. ?membership  <http://www.w3.org/ns/org#role> ?role . ?member <http://opendata.aragon.es/def/ei2a#fullName> ?nombrePersona . ?role <http://opendata.aragon.es/def/ei2a#roleName> ?roleName .?member <http://www.w3.org/ns/person#memberOf> ?partido .	?partido <http://opendata.aragon.es/def/ei2a#organizationName> ?nombrePartido. bind(concat(?roleName, '' '' , ?nombrePartido) as ?cargo)}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Persona
          Valor: nombrePersona
        Columna2:
          Nombre: Cargo
          Valor: cargo  
          ClassTitulo: w25     
          ClassValor:  mays
    Tabla3:
      Titulo: EVOLUCIÓN HISTÓRICA DE LA POBLACIÓN, SERIE 1900-2011 (por décadas) 
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?poblacion   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/03-030002TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea. <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#poblacion> ?poblacion  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Población
          Valor: poblacion  
          ClassTitulo: w25     
          ClassValor:  mays
    Tabla4:
      Titulo: CIFRAS OFICIALES DE POBLACIÓN ANUALES DESDE 1996
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?poblacion   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/03-030001TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea.  <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#poblacion> ?poblacion  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Población
          Valor: poblacion  
          ClassTitulo: w25     
          ClassValor:  mays
    Tabla5:
      Titulo: SUPERFICIES CATASTRALES
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?rustico_superficie  ?porcentaje_rustica  ?urbano_superficie  ?porcentaje_urbana   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/01-010019TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea. <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#rustico-superficie> ?rustico_superficie  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#porcentaje-rustica> ?porcentaje_rustica  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#urbano-superficie> ?urbano_superficie  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#porcentaje-urbana> ?porcentaje_urbana  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Superficie rústica
          Valor: rustico_superficie  
          ClassValor:  mays
        Columna3:
          Nombre: Porcentaje de superficie rústica
          Valor: porcentaje_rustica  
          ClassValor: mays
        Columna4:
          Nombre: Superficie urbana
          Valor: urbano_superficie  
          ClassValor:  mays
        Columna5:
          Nombre: Porcentaje de superficie urbana
          Valor: porcentaje_urbana      
          ClassValor:  mays
    Tabla6:
      Titulo: PAC. Superficie media de las parcelas de secano y regadío
      Tipo: Virtuoso
      Query: SELECT ?fecha ROUND(1000*AVG(?superficiesecano))/1000 as ?superficiesecano ROUND(1000*AVG(?superficieregadio))/1000 as ?superficieregadio FROM <http://opendata.aragon.es/def/ei2a/pac> { ?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ?patata OPTIONAL{?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ''Secano''. ?s <http://opendata.aragon.es/def/ei2a#surface> ?superficiesecano. } OPTIONAL{?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ''Regadío''. ?s <http://opendata.aragon.es/def/ei2a#surface> ?superficieregadio. } ?s <http://purl.org/dc/elements/1.1/date> ?fecha. ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?o . filter(?o = <%s>) }order by asc(?fecha)
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: fecha
        Columna2:
          Nombre: Secano
          Valor: superficiesecano  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Regadío
          Valor: superficieregadio  
          ClassTitulo: w25    
          ClassValor:  mays
    Tabla7:
      Titulo: PAC. Superficie total de las parcelas de secano y regadío
      Tipo: Virtuoso
      Query: SELECT ?fecha SUM(?superficiesecano) as ?superficiesecano SUM(?superficieregadio) as ?superficieregadio FROM <http://opendata.aragon.es/def/ei2a/pac> { ?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ?patata OPTIONAL{?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ''Secano''. ?s <http://opendata.aragon.es/def/ei2a#surface> ?superficiesecano. } OPTIONAL{?s <http://opendata.aragon.es/def/ei2a#dryOrIrrigated> ''Regadío''. ?s <http://opendata.aragon.es/def/ei2a#surface> ?superficieregadio. } ?s <http://purl.org/dc/elements/1.1/date> ?fecha. ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?o . filter(?o = <%s>) }order by asc(?fecha)
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: fecha
        Columna2:
          Nombre: Secano
          Valor: superficiesecano  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Regadío
          Valor: superficieregadio  
          ClassTitulo: w25    
          ClassValor:  mays
    Tabla8:
      Titulo: RECICLAJE DE RESIDUOS. VIDRIO
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?contenedores_de_vidrio  ?kg_vidrio_domestico   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/04-040014TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea.  <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#contenedores-de-vidrio> ?contenedores_de_vidrio  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#kg-vidrio-domestico> ?kg_vidrio_domestico  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Contenedores de vidrio
          Valor: contenedores_de_vidrio  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Kg. de vidrio doméstico
          Valor: kg_vidrio_domestico  
          ClassTitulo: w25    
          ClassValor:  mays
    Tabla9:
      Titulo: RECICLAJE DE RESIDUOS. PAPEL-CARTÓN
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?contenedores_de_papel_y_carton  ?kg_recogidos_papel_y_carton   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/04-040015TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea. <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#contenedores-de-papel-y-carton> ?contenedores_de_papel_y_carton  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#kg-recogidos-papel-y-carton> ?kg_recogidos_papel_y_carton  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Contenedores de papel y cartón
          Valor: contenedores_de_papel_y_carton  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Kg. recogidos de papel y cartón
          Valor: kg_recogidos_papel_y_carton  
          ClassTitulo: w25    
          ClassValor:  mays
    Tabla10:
      Titulo: RECICLAJE DE RESIDUOS. ENVASES LIGEROS
      Tipo: Virtuoso
      Query: select distinct (strafter(str(?refPeriod), "http://reference.data.gov.uk/id/year/") AS ?nameRefPeriod) ?contenedores_de_envases  ?kg_recogidos_envases   where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/04-040021TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea. <%s> owl:sameAs ?refArea. OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#contenedores-de-envases> ?contenedores_de_envases  } . OPTIONAL {  ?obs <http://opendata.aragon.es/def/iaest/medida#kg-recogidos-envases> ?kg_recogidos_envases  } .} ORDER BY ASC(?nameRefPeriod) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Año
          Valor: nameRefPeriod
        Columna2:
          Nombre: Contenedores de envases
          Valor: contenedores_de_envases  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Kg. recogidos de envases
          Valor: kg_recogidos_envases  
          ClassTitulo: w25    
          ClassValor:  mays
    Tabla11:
      Titulo: ANTIGÜEDAD DE LOS EDIFICIOS 
      Tipo: Virtuoso
      Query: select distinct (replace(replace(replace(strafter(str(?propiedadDecada), "http://opendata.aragon.es/def/iaest/medida#"), "sin-definir", "  Sin definir"), "antes-de-1950", " Antes de 1950"), "2010-y-posterior", "2010 y posterior") AS ?nameDecada) ?decada (replace(?fuente_y_fecha, "-", " ") as ?nameFuente_y_fecha)  where { ?obs qb:dataSet <http://opendata.aragon.es/recurso/iaest/dataset/01-010022TM>. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refPeriod> ?refPeriod. ?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?refArea. <%s> owl:sameAs ?refArea. OPTIONAL { ?obs <http://opendata.aragon.es/def/iaest/dimension#fuente-y-fecha> ?foo0. ?foo0 skos:prefLabel ?fuente_y_fecha  } . OPTIONAL {  ?obs ?propiedadDecada ?decada. filter (?propiedadDecada in( <http://opendata.aragon.es/def/iaest/medida#1980-1989>, <http://opendata.aragon.es/def/iaest/medida#2010-y-posterior>, <http://opendata.aragon.es/def/iaest/medida#2000-2009>, <http://opendata.aragon.es/def/iaest/medida#1990-1999>, <http://opendata.aragon.es/def/iaest/medida#1960-1969>, <http://opendata.aragon.es/def/iaest/medida#1970-1979>, <http://opendata.aragon.es/def/iaest/medida#1950-1959>, <http://opendata.aragon.es/def/iaest/medida#sin-definir>, <http://opendata.aragon.es/def/iaest/medida#antes-de-1950>))} .} ORDER BY ASC(?refPeriod) ASC(?nameDecada) LIMIT 300
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Período
          Valor: nameDecada 
          ClassValor:  mays
        Columna2:
          Nombre: Número de edificios
          Valor: decada  
          ClassTitulo: w25     
          ClassValor:  mays
        Columna3:
          Nombre: Fuente
          Valor: nameFuente_y_fecha      
          ClassValor:  mays
PanelLateral:
  ListaEnlaces:
    ListaEnlace1:
      Titulo: Más información
      Tipo: gadget-masinfo
      Enlaces:        
        Enlace1:
          Texto: ELDA
          url: %s?api_key=e103dc13eb276ad734e680f5855f20c6&_view=completa
          CampoUrl: http://www.w3.org/2002/07/owl#sameAs
        Enlace2:
          Texto: Presupuesto
          url: https://presupuesto.aragon.es/municipios/%s
          CampoUrl: http://opendata.aragon.es/def/ei2a#organizationName
          SinAcentosUrl: True
        Enlace3:
          Texto: Datos en Aragón Open data
          url: https://opendata.aragon.es/datos/catalogo/dataset/datos-municipio-%s
          CampoUrl: http://opendata.aragon.es/def/ei2a#organizationName
          SinAcentosUrl: True
    ListaEnlace2:
      Titulo: Enlaces de interes 
      #gadget-iconos gadget-enlaces gadget-masinfo
      Tipo: gadget-enlaces
      Enlaces:
        Enlace1:
          Texto: Ver ordenanzas fiscales municipales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Entidades&&&filt=Tipos__dc%%3Atype__<http%%3A%%2F%%2Fopendata.aragon.es%%2Fdef%%2Fei2a%%23ordenanza_fiscal_municipio>____Ordenanza+Fiscal+Municipio
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace2:
          Texto: Ver ordenanzas Generales municipales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Entidades&&filt=Tipos__dc%%3Atype__<http%%3A%%2F%%2Fopendata.aragon.es%%2Fdef%%2Fei2a%%23ordenanza_general_municipio>____Ordenanza+General+Municipio
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace3:
          Texto: Ver información turística de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=4&stem=&pro=&com=&mun=%s&ent=&sent=&from=Temas
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace5:
          Texto: Ver datos del Instituto Aragonés del Agua de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=104&sent=&from=Entidades
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace6:
          Texto: Ver rutas de autobús de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName   
          url: filtros?tem=&stem=&pro=&com=&mun=%s&ent=121&sent=&from=Entidades
          CampoUrl: http://purl.org/dc/elements/1.1/identifier', true, '2018-11-08');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (191, 'captacion', 'http://opendata.aragon.es/def/ei2a#captacion', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?local),46) as ?idmunicipio ?municipio ?tiene ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha. <%s> <http://www.semanticwater.com/WISDOM#hasMeterProperty> ?tiene. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
        Campo3: 
          Nombre:  ¿Tiene medida?
          Valor: tiene
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (192, 'camaraLimpia', 'http://opendata.aragon.es/def/ei2a#camara-limpia', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio substr(str(?location),46) as ?idmunicipio ?fecha where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://purl.org/dc/elements/1.1/date> ?fecha. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio-%s
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Fecha
          Valor: fecha
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (615, 'craParada', 'http://opendata.aragon.es/def/ei2a#cra_parada', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Tipo de parada
          Valor: GRT_ID_TIPO_PARADA
        Campo2: 
          Nombre: Acción de la parada
          Valor: GRT_ID_ACCION_PARADA
        Campo3:
          Nombre: Número de alumnos
          Valor: NUM_ALUMNOS
    CampoValor2:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?id  ?fecha ?formato where {<%s> <http://vocab.gtfs.org/terms#trip> ?iti. ?iti <http://purl.org/dc/elements/1.1/identifier> ?id. <%s> <http://vocab.gtfs.org/terms#trip> ?iti. ?iti<http://purl.org/dc/elements/1.1/format> ?formato. <%s> <http://vocab.gtfs.org/terms#trip> ?iti. ?iti<http://purl.org/dc/elements/1.1/date> ?fecha.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Itinerario ID
          Valor: id
        Campo2:
          Nombre: Formato
          Valor: formato
        Campo3:
          Nombre: Fecha
          Valor: fecha
    
', true, '2018-09-27');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (134, 'plantilla', 'http://opendata.aragon.es/def/ei2a#plantilla', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  #titulo del panel
  Titulo: http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select substr(str(?muni),53) as ?idvilla ?villa where{   <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?muni. ?muni <http://opendata.aragon.es/def/ei2a#organizationName> ?villa.  }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Lugar
          Valor: villa
          Url: /pool/detalles?url=villas-y-tierras-%s
          CampoUrl: idvilla
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo2: 
          Nombre: Año
          Valor: ANO
        Campo3:
          Nombre: Fecha de aprobación
          Valor: F_APROBACION_INI         
        Campo4:
          Nombre: Fecha de publicación
          Valor: F_PUBLICACION_INI
  Tablas:     
    Tabla1:
      Tipo: Virtuoso       
      Descripcion: Plantillas y años
      Query:  select ?nombre where {	<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre.}
      Campo: uri
      Columnas:
        Columna1:
          Nombre: Plantilla
          Valor: nombre
          
', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (137, 'arabusParada', 'http://opendata.aragon.es/def/ei2a#arabus_parada', 'BodyClass: fichaComunidad fichaHotel
PanelCentral:
  #titulo del panel
  Titulo: 	http://purl.org/dc/elements/1.1/title
  Mapa: 
        Tipo: open
        Marker: markerParda.png
        Zoom: 7
        Marcadores: 
          Query: select distinct ?lat ?long ?title  where { ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat. ?stop <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long.  optional {?stop <http://purl.org/dc/elements/1.1/title> ?title.} filter(?stop = <%s>) .}
          Campo: uri  
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select ?municipio substr(str(?location),46) as ?idmunicipio  where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio        
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (193, 'bocaDeRiego', 'http://opendata.aragon.es/def/ei2a#boca-de-riego', 'BodyClass: fichaComunidad fichaOrdenazaGeneralComarca
PanelCentral:
  #titulo del panel
  Titulo: 		http://purl.org/dc/elements/1.1/identifier
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> select  substr(str(?location),46) as ?idmunicipio ?municipio ?diametro where{<%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio. <%s> <http://www.semanticwater.com/WISDOM#hasNominalDiameter> ?diametro. }
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo2:
          Nombre: Diametro
          Valor: diametro
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (141, 'datosComarca', 'http://opendata.aragon.es/def/ei2a#comarca', 'BodyClass: fichaComunidad fichaLugar
BodyClass: fichaComunidad fichaLugar
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  Mapa:
    Tipo: idearagon 
    Valor: http://idearagon.aragon.es/visor/index.html?HERRAMIENTAS=NO&ACTIVELAYER=Comarca&QUERY=objectid=%s
    Campo: http://purl.org/dc/elements/1.1/identifier
    Campo: uri
  Texto: 
    Tipo: HTML
    Query: select lcase(?campo)  where where {?s ?p ?o. ?s <http://www.w3.org/ns/org#hasSite> ?o2. ?o2 <http://www.w3.org/ns/org#siteAddress> ?o3. ?o3 <http://www.w3.org/2006/vcard/ns#hasAddress> ?o4. ?o4 <http://www.w3.org/2006/vcard/ns#locality> ?nombre. ?om <http://purl.org/dc/elements/1.1/type>	<http://opendata.aragon.es/def/ei2a#municipio>. ?om <http://opendata.aragon.es/def/ei2a#organizationName> ?nombre. ?om <http://purl.org/dc/elements/1.1/identifier> ?id.filter (?s = <%s>) bind(concat(?nombre, ''-id'', ?id) as ?campo)}
    Campo: uri
    Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: select ?cif ?nombreComarca ?telefono ?email ?capital where{ ?s <http://opendata.aragon.es/def/ei2a#CIF> ?cif. ?s <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreComarca. ?s <http://opendata.aragon.es/def/ei2a#phone> ?telefono. ?s <http://xmlns.com/foaf/0.1/mbox> ?email.  filter(?s= <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: CIF
          Valor: cif
        Campo2:
          Nombre: Comarca
          Valor: nombreComarca
        Campo3:
          Nombre: Telefono
          Valor: telefono      
        Campo5:
          Nombre: Email
          Valor: email
          Url: mailto:%s
          CampoUrl: email
    CampoValor2:
      Tipo: Api
      Oculto: False
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Presidente        
          Valor: PRESIDENTE
        Campo2:
          Nombre: Dirección        
          Valor: DIRECCION
PanelLateral:
  ListaEnlaces:
    ListaEnlace1:
      Titulo: Más información
      Tipo: gadget-masinfo
      Enlaces:        
        Enlace1:
          Texto: ELDA
          url: %s?api_key=e103dc13eb276ad734e680f5855f20c6&_view=completa
          CampoUrl: http://www.w3.org/2002/07/owl#sameAs
        Enlace2:
          Texto: Presupuesto
          url: https://presupuesto.aragon.es/comarcas/%s
          CampoUrl: http://opendata.aragon.es/def/ei2a#organizationName
          SinAcentosUrl: True
        Enlace3:
          Texto: Datos en Aragón Open data
          url: https://opendata.aragon.es/datos/catalogo/dataset/datos-comarca-%s
          CampoUrl: http://opendata.aragon.es/def/ei2a#organizationName
          SinAcentosUrl: True
    ListaEnlace2:
      Titulo: Enlaces de interes 
      #gadget-iconos gadget-enlaces gadget-masinfo
      Tipo: gadget-enlaces
      Enlaces:
        Enlace1:
          Texto: Ver ordenanzas fiscales comarcales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=&stem=&pro=&com=%s&mun=&ent=46&sent=&from=Entidades&&&filt=Tipos__dc%%3Atype__<http%%3A%%2F%%2Fopendata.aragon.es%%2Fdef%%2Fei2a%%23ordenanza_fiscal_comarca>____Ordenanza+Fiscal+Comarca
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace2:
          Texto: Ver ordenanzas Generales comarcales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: filtros?tem=&stem=&pro=&com=%s&mun=&ent=46&sent=&from=Entidades&&filt=Tipos__dc%%3Atype__<http%%3A%%2F%%2Fopendata.aragon.es%%2Fdef%%2Fei2a%%23ordenanza_general_comarca>____Ordenanza+General+Comarca
          CampoUrl: http://purl.org/dc/elements/1.1/identifier', true, '2018-10-04');
INSERT INTO configuracionweb (code, slug, name, configuracion, active, created) VALUES (178, 'modPlaneamientoDesarrollo', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_desarrollo', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
 #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument
  #Texto: 
  #Tipo: HTML
  #Query: select lcase(?campo)  where { ?s <http://opendata.aragon.es/def/ei2a#OrganizationName> ?name. ?s <http://purl.org/dc/elements/1.1/identifier> ?identifier. filter (?s = <%s>) bind(concat(?name, ''-id'', ?identifier) as ?campo)}
  #  Campo: uri
  #  Html: <iframe width="620px" height="200px" src="http://www.aemet.es/es/eltiempo/prediccion/municipios/mostrarwidget/%s"></iframe>
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: PREFIX ei2a:<http://opendata.aragon.es/def/ei2a#> PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>  PREFIX org:<http://www.w3.org/ns/org#> PREFIX foaf:<http://xmlns.com/foaf/0.1/> PREFIX vcard:<http://www.w3.org/2006/vcard/ns#> select  substr(str(?location),46) as ?idmunicipio ?enlace ?sitio ?nombre ?observacion ?municipio ?tipo where{ bind( ''Acceder al sitio web'' as ?enlace )<%s> <http://opendata.aragon.es/def/ei2a#nameDocument> ?nombre . optional{<%s> <http://opendata.aragon.es/def/ei2a#documentType> ?tipo. } optional{<%s> <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechareg. } optional{<%s> <http://opendata.aragon.es/def/ei2a#startDate> ?fechaini.} optional{ <%s> <http://opendata.aragon.es/def/ei2a#observations> ?observacion.} optional{<%s> <http://opendata.aragon.es/def/ei2a#URIDocument> ?sitio.} <%s> <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?location. ?location <http://opendata.aragon.es/def/ei2a#organizationName> ?municipio.}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Nombre
          Valor: nombre
        Campo2:
          Nombre: Tipo        
          Valor: tipo
        Campo3:
          Nombre: Municipio
          Valor: municipio
          Url: /pool/detalles?url=municipio-%s
          CampoUrl: idmunicipio
        Campo5:
          Nombre: Observaciones
          Valor: observacion
        Campo6: 
          Nombre: Sitio Web
          Valor: enlace  
          Url: %s
          CampoUrl: sitio      
          
PanelLateral:
  Texto: 
    Tipo: HTML
    Query: select ?identifier  where { ?s <http://www.w3.org/2003/01/geo/wgs84_pos#location>  ?municipio. ?municipio dc:identifier ?identifier. filter (?s = <%s>)}
    Campo: uri
    Html: <a href="detalles?url=municipio-%s">Ver información del municipio</a>', true, '2018-10-09');


--
-- Name: configuracionweb_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('configuracionweb_code_seq', 210, true);


--
-- Data for Name: entidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (36, 'bloque-persona', 'Personas', 'Person', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#person', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (145, 'point', 'Point', 'Point', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#point', 0, B'0', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (141, 'turismo', 'Turismo', 'Turismo', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#turismo', 140, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (142, 'sendero', 'Sendero', 'Sendero', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#sendero', 141, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (143, 'transporte', 'Transporte', 'Transporte', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#transporte', 140, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (146, 'transporte', 'Transporte', 'Transporte', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#transporte', 145, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (103, 'superficies_agrarias_cultivadas_por_municipios_cultivatedsurface', 'Superficies agrarias cultivadas por municipios (CultivatedSurface)', 'Superficies agrarias cultivadas por municipios (CultivatedSurface)', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#superficies_agrarias_cultivadas_por_municipios_cultivatedsurface', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (46, 'bloque-documento', 'Documentos', 'Document', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#document', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (132, 'transporte', 'Transporte', 'Transporte', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#transporte', 121, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (102, 'clases_de_cultivos', 'Clases de cultivos', 'Clases de cultivos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#clase_cultivo', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (86, 'bloque-evento', 'Eventos', 'Evento', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#evento', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (91, 'relaciones_institucionales,_procesos_electorales', 'Relaciones Institucionales, Procesos Electorales', 'Relaciones Institucionales, Procesos Electorales', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#relaciones_institucionales,_procesos_electorales', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (129, 'cra_datos_de_itinerarios_de_las_rutas_trip', 'CRA - Datos de itinerarios de las rutas (Trip)', 'CRA - Datos de itinerarios de las rutas (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#itinerario_ruta', 128, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (135, 'expedicion_parada_horario_stoptime', 'Expedicion Parada Horario (StopTime)', 'Expedicion Parada Horario (StopTime)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expedicion_parada_y_horario', 132, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (121, 'bloque-transporte', 'Transportes', 'Transporte', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#transporte', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (122, 'arabus', 'Arabus', 'Arabus', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#arabus', 121, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (124, 'expediciones_paradas_horarios_stoptime', 'Expediciones, Paradas y Horarios (StopTime)', 'Expediciones, Paradas y Horarios (StopTime)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expediciones_paradas_horarios_stoptime', 122, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (111, 'emisario', 'Emisario', 'Emisario', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#emisario', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (106, 'ramal', 'Ramal', 'Ramal', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#ramal', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (107, 'pozo', 'Pozo', 'Pozo', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#pozo', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (108, 'potabilizadora', 'Potabilizadora', 'Potabilizadora', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#potabilizadora', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (120, 'boca_de_riego', 'Boca de riego', 'Boca de riego', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#boca_de_riego', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (110, 'hidrante', 'Hidrante', 'Hidrante', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#hidrante', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (112, 'edar', 'Edar', 'Edar', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#edar', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (114, 'depuradora', 'Depuradora', 'Depuradora', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#depuradora', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (117, 'colector', 'Colector', 'Colector', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#colector', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (119, 'cámara_limpia', 'Cámara limpia', 'Cámara limpia', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#camara_limpia', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (94, 'solicitud_pac', 'Solicitud PAC', 'Solicitud PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#solicitud', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (113, 'distribución', 'Distribución', 'Distribución', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#distribucion', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (115, 'depósito', 'Depósito', 'Depósito', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#deposito', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (116, 'conducción', 'Conducción', 'Conducción', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#conduccion', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (118, 'captación', 'Captación', 'Captación', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#captacion', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (105, 'sumidero', 'Sumidero', 'Sumidero', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#sumidero', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (109, 'llave_corte', 'Llave corte', 'Llave corte', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#llave_de_corte', 104, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (98, 'códigos_de_cultivos_herbáceos_pac', 'Códigos de cultivos herbáceos PAC', 'Códigos de cultivos herbáceos PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#arable', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (100, 'códigos_de_cultivos_lenosos_pac', 'Códigos de cultivos lenosos PAC', 'Códigos de cultivos lenosos PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#woody', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (101, 'códigos_de_variedades_lenosas_pac', 'Códigos de variedades lenosas PAC', 'Códigos de variedades lenosas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigo_variedad_lenosas', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (128, 'cra', 'CRA', 'CRA', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#cra', 121, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (131, 'cra_datos_de_las_rutas_route', 'CRA Rutas', 'CRA Rutas', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#cra_datos_ruta', 128, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (125, 'paradas_stop', 'Paradas (Stop)', 'Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#paradas_stop', 122, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (144, 'arabus_rutas', 'ARABUS - Rutas', 'ARABUS - Rutas', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#arabus_rutas', 143, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (48, 'ordenanza_general', 'Ordenanza General', 'Ordenanza General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (30, 'oficinas_comarcales', 'Oficinas comarcales', 'Oficinas comarcales', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#oficinas_comarcales', 28, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (31, 'transporte', 'Transporte', 'Transporte', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#transporte', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (58, 'ordenanza_fiscal', 'Ordenanza Fiscal', 'Ordenanza Fiscal', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (4, 'agrupación_secretarial', 'Agrupación secretarial', 'Agrupación secretarial', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agrupacion_secretarial', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (137, 'location', 'Location', 'Location', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#location', 0, B'0', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (69, 'modificaciones_de_planeamiento_de_desarrollo', 'Modificaciones de Planeamiento de Desarrollo', 'Modificaciones de Planeamiento de Desarrollo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_desarrollo', 67, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (70, 'modificaciones_de_planeamiento_general', 'Modificaciones de Planeamiento General', 'Modificaciones de Planeamiento General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_general', 67, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (71, 'planeamiento_de_desarrollo', 'Planeamiento de Desarrollo', 'Planeamiento de Desarrollo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento_desarrollo', 67, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (72, 'planeamiento_general', 'Planeamiento General', 'Planeamiento General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento_general', 67, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (81, 'iaa', 'IAA', 'IAA', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (83, 'iaa_contratos_gastos_anuales', 'IAA – Contratos gastos anuales', 'IAA – Contratos gastos anuales', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contratos_gastos_anuales', 81, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (17, 'turismo', 'Turismo', 'Turismo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#turismo', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (1, 'bloque-organizacion', 'Organizaciones', 'Organization', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organization', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (140, 'line', 'Line', 'Line', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#line', 0, B'0', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (11, 'mancomunidad', 'Mancomunidad', 'Mancomunidad', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#mancomunidad', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (28, 'agricultura', 'Agricultura', 'Agricultura', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agricultura', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (19, 'albergues_refugios', 'Albergues y refugios', 'Albergues y refugios', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#albergue_refugio', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (22, 'cafeterías_restaurantes', 'Cafeterías y Restaurantes', 'Cafeterías y Restaurantes', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#cafeteria_restaurante', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (23, 'campings_turísticos', 'Campings Turísticos', 'Campings Turísticos', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#camping_turistico', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (27, 'alojamientos_de_turismo_rural', 'Alojamientos de Turismo Rural', 'Alojamientos de Turismo Rural', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#alojamiento_rural', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (85, 'dara_archivos_de_aragón', 'DARA – Archivos de Aragón', 'DARA – Archivos de Aragón', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#dara_archivos_aragon', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (18, 'agencias_de_viaje', 'Agencias de viaje', 'Agencias de viaje', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agencia_viaje', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (21, 'apartamentos_turísticos', 'Apartamentos turísticos', 'Apartamentos turísticos', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#apartamento_turistico', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (79, 'arabus_concesiones', 'ARABUS - Concesiones', 'ARABUS - Concesiones', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#arabus_concesion', 78, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (32, 'arabus_operadores', 'ARABUS - Operadores', 'ARABUS - Operadores', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#operador', 31, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (147, 'arabus_paradas', 'ARABUS - Paradas', 'ARABUS - Paradas', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#arabus_parada', 146, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (33, 'arabus_transportistas', 'ARABUS – Transportistas', 'ARABUS – Transportistas', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#transportista', 31, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (45, 'cargos', 'Cargos', 'Cargos', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#cargo', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (77, 'colecciones_de_museos_de_aragon', 'Colecciones de Museos de Aragon', 'Colecciones de Museos de Aragon', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#colecciones_museos_aragon', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (2, 'comarca', 'Comarca', 'Comarca', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#comarca', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (29, 'comarcas_agrarias', 'Comarcas agrarias', 'Comarcas agrarias', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#comarca_agraria', 28, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (5, 'consorcio', 'Consorcio', 'Consorcio', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#consorcio', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (97, 'códigos_catastrales_sigpac_parcelas_pac', 'Códigos catastrales y SIGPAC, parcelas PAC', 'Códigos catastrales y SIGPAC, parcelas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigo_catastral', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (99, 'códigos_de_variedades_herbáceas_pac', 'Códigos de variedades herbáceas PAC', 'Códigos de variedades herbáceas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_variedades_herbaceas', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (78, 'transporte', 'Transporte', 'Transporte', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte', 46, B'0', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (34, 'cra_centros', 'CRA – Centros', 'CRA – Centros', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#cra_centro', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (6, 'diputación', 'Diputación', 'Diputación', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#diputacion', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (7, 'dirección_de_interés', 'Dirección de interés', 'Dirección de interés', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#direccion_de_interes', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (26, 'empresas_de_turismo_activo', 'Empresas de Turismo Activo', 'Empresas de Turismo Activo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#empresa_turismo_activo', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (8, 'entidad_menor', 'Entidad menor', 'Entidad menor', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_menor', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (9, 'entidad_singular', 'Entidad singular', 'Entidad singular', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_singular', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (35, 'entidades', 'Entidades', 'Entidades', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (10, 'fundación', 'Fundación', 'Fundación', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#fundacion', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (44, 'guías_de_turismo', 'Guías de Turismo', 'Guías de Turismo', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#guia_turismo', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (82, 'iaa_contratos', 'IAA - Contratos', 'IAA - Contratos', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contrato', 81, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (84, 'iaa_contratos_depuradoras_incluidas', 'IAA – Contratos depuradoras incluidas', 'IAA – Contratos depuradoras incluidas', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contrato_depuradora', 81, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (38, 'miembro_de_pleno_comarcal', 'Miembro de Pleno Comarcal', 'Miembro de Pleno Comarcal', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_comarcal', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (39, 'miembro_de_pleno_consorcio', 'Miembro de Pleno Consorcio', 'Miembro de Pleno Consorcio', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_consorcio', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (40, 'miembro_de_pleno_entidad_menor', 'Miembro de Pleno Entidad menor', 'Miembro de Pleno Entidad menor', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_entidad_menor', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (41, 'miembro_de_pleno_mancomunidad', 'Miembro de Pleno Mancomunidad', 'Miembro de Pleno Mancomunidad', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_mancomunidad', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (37, 'miembro_de_pleno_municipal', 'Miembro de Pleno Municipal', 'Miembro de Pleno Municipal', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_municipal', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (42, 'miembro_de_pleno_organismo_autónomo', 'Miembro de Pleno Organismo autónomo', 'Miembro de Pleno Organismo autónomo', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_organismo_autonomo', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (43, 'miembro_de_pleno_villas_tierras', 'Miembro de Pleno Villas y tierras', 'Miembro de Pleno Villas y tierras', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_villas_y_tierras', 36, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (3, 'municipio', 'Municipio', 'Municipio', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (73, 'noticia', 'Noticia', 'Noticia', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#noticia', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (12, 'núcleo', 'Núcleo', 'Núcleo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#nucleo', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (24, 'oficinas_de_turismo', 'Oficinas de Turismo', 'Oficinas de Turismo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#oficina_turismo', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (60, 'ordenanza_fiscal_comarca', 'Ordenanza Fiscal Comarca', 'Ordenanza Fiscal Comarca', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (61, 'ordenanza_fiscal_de_consorcio', 'Ordenanza fiscal de consorcio', 'Ordenanza fiscal de consorcio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (62, 'ordenanza_fiscal_de_diputación', 'Ordenanza fiscal de diputación', 'Ordenanza fiscal de diputación', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (63, 'ordenanza_fiscal_de_entidad_menor', 'Ordenanza fiscal de entidad menor', 'Ordenanza fiscal de entidad menor', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (64, 'ordenanza_fiscal_de_mancomunidad', 'Ordenanza fiscal de mancomunidad', 'Ordenanza fiscal de mancomunidad', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (59, 'ordenanza_fiscal_municipio', 'Ordenanza Fiscal Municipio', 'Ordenanza Fiscal Municipio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (134, 'expediciones_trip', 'Expediciones (Trip)', 'Expediciones (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expedicion', 132, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (130, 'cra_paradas_stop', 'CRA - Paradas (Stop)', 'CRA - Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#cra_parada', 128, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (139, 'cra_localidades', 'CRA - Localidades', 'CRA - Localidades', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#cra_localidad', 137, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (138, 'iaf_polígonos_industriales', 'IAF polígonos industriales', 'IAF polígonos industriales', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#iaf_poligono_industrial', 137, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (87, 'dato_elección', 'Dato Elección', 'Dato Elección', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#eleccion', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (88, 'curso', 'Curso', 'Curso', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#curso', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (123, 'expediciones_trip', 'Expediciones (Trip)', 'Expediciones (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#transporte_expedicion', 122, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (65, 'ordenanza_fiscal_de_organismo_autónomo', 'Ordenanza fiscal de organismo autónomo', 'Ordenanza fiscal de organismo autónomo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (66, 'ordenanza_fiscal_de_villas_tierras', 'Ordenanza fiscal de villas y tierras', 'Ordenanza fiscal de villas y tierras', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras', 58, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (50, 'ordenanza_general_comarca', 'Ordenanza General Comarca', 'Ordenanza General Comarca', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (51, 'ordenanza_general_de_consorcio', 'Ordenanza General de consorcio', 'Ordenanza General de consorcio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (52, 'ordenanza_general_de_diputación', 'Ordenanza General de diputación', 'Ordenanza General de diputación', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (53, 'ordenanza_general_de_entidad_menor', 'Ordenanza General de entidad menor', 'Ordenanza General de entidad menor', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (54, 'ordenanza_general_de_mancomunidad', 'Ordenanza General de mancomunidad', 'Ordenanza General de mancomunidad', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (49, 'ordenanza_general_municipio', 'Ordenanza General Municipio', 'Ordenanza General Municipio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (55, 'ordenanza_general_de_núcleo', 'Ordenanza General de núcleo', 'Ordenanza General de núcleo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_nucleo', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (56, 'ordenanza_general_de_organismo_autónomo', 'Ordenanza General de organismo autónomo', 'Ordenanza General de organismo autónomo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (57, 'ordenanza_general_de_villas_tierras', 'Ordenanza General de villas y tierras', 'Ordenanza General de villas y tierras', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras', 48, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (13, 'organismo_autónomo', 'Organismo autónomo', 'Organismo autónomo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organismo_autonomo', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (14, 'organización_complementaria', 'Organización complementaria', 'Organización complementaria', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organizacion_complementaria', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (67, 'planeamiento', 'Planeamiento', 'Planeamiento', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (68, 'planeamiento', 'Planeamiento', 'Planeamiento', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento', 67, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (74, 'plantilla', 'Plantilla', 'Plantilla', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#plantilla', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (75, 'presupuesto', 'Presupuesto', 'Presupuesto', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#presupuesto', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (25, 'puntos_de_información_turística', 'Puntos de Información Turística', 'Puntos de Información Turística', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#punto_informacion_turistica', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (47, 'símbolo', 'Símbolo', 'Símbolo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#simbolo', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (15, 'sociedad_mercantil', 'Sociedad mercantil', 'Sociedad mercantil', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#sociedad_mercantil', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (80, 'transporte_concesiones', 'Transporte - Concesiones', 'Transporte - Concesiones', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte_concesion', 78, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (16, 'villas_tierras', 'Villas y tierras', 'Villas y tierras', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#villas_y_tierras', 1, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (76, 'vivienda_rehabilitación_fianzas_datos_anuales', 'Vivienda y rehabilitación, Fianzas Datos Anuales', 'Vivienda y rehabilitación, Fianzas Datos Anuales', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#fianzas_datos_anuales_vivienda_y_rehabilitacion', 46, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (136, 'paradas_stop', 'Paradas (Stop)', 'Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#parada', 132, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (89, 'postgrado', 'Postgrado', 'Postgrado', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#postgrado', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (90, 'registro_de_llamadas', 'Registro de llamadas', 'Registro de llamadas', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#registro_llamada', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (92, 'periodo_de_legislatura', 'Periodo de legislatura', 'Periodo de legislatura', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#periodo_legislatura', 86, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (127, 'servicios_service', 'Servicios (Service)', 'Servicios (Service)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#servicio', 122, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (104, 'bloque-agua', 'Agua', 'Agua', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#agua', 0, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (20, 'alojamientos_hoteleros', 'Alojamientos hoteleros', 'Alojamientos hoteleros', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 17, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (95, 'parcelas_pac_cultivos_herbáceos', 'Parcelas PAC, cultivos herbáceos', 'Parcelas PAC, cultivos herbáceos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#cultivo_herbaceo', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (96, 'parcelas_pac_cultivos_lenosos', 'Parcelas PAC, cultivos lenosos', 'Parcelas PAC, cultivos lenosos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#cultivo_lenoso', 93, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (149, 'edar_en_construccion', 'Edar en construcción', 'Edar en construcción', '', '', 'http://purl.oclc.org/NET/ssnx/ssn#FeatureOfInterest', 'http://opendata.aragon.es/def/ei2a#edar_en_construccion', 104, B'1', '2018-09-25');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (150, 'proceso_electoral', 'Proceso Electoral', 'Proceso Electoral', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#proceso_electoral', 86, B'1', '2018-09-25');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (133, 'rutas_route', 'Transporte Rutas', 'Transporte Rutas', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#transporte_ruta', 132, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (152, 'transporte_expedicion_parada_horario', 'Transporte -Expedicion - Parada - Horario', 'Transporte -Expedicion - Parada - Horario', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte_expedicion_parada_horario', 78, B'1', '2018-09-25');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (151, 'transporte_expedición', 'Transporte - Expedición', 'Transporte - Expedición', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte_expedición', 78, B'1', '2018-09-25');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (154, 'miembro_de_pleno', 'Miembro de Pleno', 'Miembro de Pleno', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno', 36, B'1', '2018-10-02');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (155, 'organizacion_auxiliar', 'Organizacion auxiliar', 'Organizacion auxiliar', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organizacion_auxiliar', 1, B'1', '2018-10-03');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (126, 'rutas_route', 'Arabus Rutas', 'Arabus Rutas', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#ruta', 122, B'1', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (148, 'transporte_paradas', 'Transporte Paradas', 'Transporte Paradas', '', '', 'http://www.w3.org/2003/01/geo/wgs84_pos#Point', 'http://opendata.aragon.es/def/ei2a#transporte_parada', 78, B'0', '2018-05-15');
INSERT INTO entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (93, 'bloque-pac', 'PAC', 'PAC', '', '', 'PAC ', 'http://opendata.aragon.es/def/ei2a#pac', 0, B'0', '2018-05-15');


--
-- Name: entidades_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('entidades_code_seq', 1, false);


--
-- Data for Name: facetas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (4, 'Default', '', 'dc:type', '', 'Tipos', '', 2, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (6, 'http://opendata.aragon.es/def/ei2a#Document', '', 'dc:type', '', 'Tipos', '', 2, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (14, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:AdministraciónLocal', '', 'Nivel administrativo', '', 3, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (3, 'Default', '', 'dc:type@rdf:type', '', 'Temas', '', 1, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (5, 'http://opendata.aragon.es/def/ei2a#Document', '', 'dc:type@rdf:type', '', 'Temas', '', 1, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (16, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@ei2a:organizationName', '', 'Comarcas', 'org:subOrganizationOf@ei2a:publicEntityType=ei2a:Comarca', 5, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (17, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@rdfs:label', '', 'Provincias', 'org:subOrganizationOf@rdf:type=<http://dbpedia.org/ontology/Province>', 6, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (13, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:organizationType@rdfs:label', '', 'Tipo de organización', '', 2, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (18, 'http://www.w3.org/ns/person#Person', '', 'person:memberOf@ei2a:organizationName', 'PREFIX person:<http://www.w3.org/ns/person#>', 'Partido', '', 1, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (32, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'harmonise:accommodationType@harmonise:refencedValue@harmonise:domainValue', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Categoria', '', 1, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (33, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', '', 'harmonise:schedule@harmonise:season', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Periodo abierto', '', 2, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (30, 'http://vocab.gtfs.org/terms#Route', '', 'gtfs:originStop@wgs84_location@dc:identifier', 'PREFIX gtfs:<http://vocab.gtfs.org/terms#>', 'Origen', '', 1, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (31, 'http://vocab.gtfs.org/terms#Route', '', 'gtfs:destinationStop@wgs84_location@dc:identifier', 'PREFIX gtfs:<http://vocab.gtfs.org/terms#>', 'Destino', '', 2, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (12, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:publicEntityType@rdfs:label', '', 'Tipo de entidad pública', '', 1, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (19, 'http://www.w3.org/ns/person#Person', '', 'org:hasMembership@org:role@ei2a:roleName', '', 'Cargo', '', 2, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (22, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 5, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (23, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Etidad menor', '', 6, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (24, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 7, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (25, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 8, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (26, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 9, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (42, 'http://opendata.aragon.es/def/ei2a#Line', 'http://opendata.aragon.es/def/ei2a#sendero', 'dc:format', '', 'Tipo', '', 11, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (44, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@rdfs:label', '', 'Provincia', '', 5, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (47, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#fundacion', 'wgs84_pos:location@dc:identifier', '', 'Lugar', '', 8, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (48, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organizacion_complementaria', 'ei2a:subOrganizationOf@dc:identifier', '', 'Lugar', '', 9, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (49, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 6, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (50, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 7, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (51, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion', 'wgs84_pos:location@dc:identifier', '', 'Diputacion', '', 8, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (52, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion', 'wgs84_pos:location@dc:identifier', '', 'Diputacion', '', 9, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (2, 'Default', '', 'wgs84_pos:location@org:subOrganizationOf@ei2a:organizationName', '', 'Comarcas', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 4, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (10, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 4, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (28, 'http://opendata.aragon.es/def/ei2a#EventAgenda', '', 'wgs84_pos:location@wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 2, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (35, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'wgs84_pos:location@dc:identifier', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 4, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (36, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', '', 'wgs84_pos:location@dc:identifier', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 5, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (1, 'Default', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 3, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (46, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_singular', 'wgs84_pos:location@dc:identifier', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 7, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (8, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 4, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (15, 'http://www.w3.org/ns/org#Organization', '', 'wgs84_pos:location@ei2a:organizationName', 'PREFIX vcard:<http://www.w3.org/2006/vcard/ns#>
', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 4, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (7, 'http://opendata.aragon.es/def/ei2a#Document', '', 'ei2a:documentType', '', 'Tipo de documento', '', 3, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (37, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', '', 'wgs84_pos:location@dc:identifier', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 6, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (9, 'http://opendata.aragon.es/def/ei2a#Document', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 5, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (20, 'http://www.w3.org/ns/person#Person', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 3, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (53, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Enitdad menor', '', 10, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (54, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Enitdad menor', '', 11, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (55, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 12, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (56, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 13, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (57, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 14, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (58, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 15, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (59, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 16, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (60, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 17, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (61, 'http://www.w3.org/ns/org#Organization', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarca', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 10, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (34, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'harmonise:schedule@harmonise:season', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Periodo abierto', '', 3, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (38, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Estrellas', '', 7, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (39, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', 'http://opendata.aragon.es/def/ei2a#cafeteria_restaurante', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Tenedores', '', 8, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (40, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'http://opendata.aragon.es/def/ei2a#camping_turistico', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Categoria', '', 9, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (21, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_comarcal', 'wgs84_pos:location@dc:identifier', '', 'Comarca', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 4, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (43, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@ei2a:organizationName', '', 'Comarca', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 4, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (11, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', 'wgs84_pos:location@wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 5, true, '2018-05-22');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (45, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agrupacion_secretarial', 'wgs84_pos:location@dc:identifier', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 6, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (62, 'http://vocab.gtfs.org/terms#Route', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 1, true, '2018-10-11');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (63, 'http://vocab.gtfs.org/terms#Route', '', 'dc:type', '', 'Tipo', '', 2, true, '2018-10-11');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (27, 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#eleccion', 'event:place@dc:identifier', 'PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 1, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (29, 'http://opendata.aragon.es/def/ei2a#EventHistory', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 3, true, '2018-06-25');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (64, 'http://opendata.aragon.es/def/ei2a#EventAgenda', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 1, true, '2018-11-05');
INSERT INTO facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (65, 'http://opendata.aragon.es/def/ei2a#EventHistory', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 1, true, '2018-11-05');


--
-- Name: facetas_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('facetas_code_seq', 1, false);


--
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50035, 'artieda', 'Artieda', 'M', 1, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7823, 'zaragora', 'Zaragoza', 'P', 0, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50168, 'mianos', 'Mianos', 'M', 1, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50232, 'salvatierradeesca', 'Salvatierra de Esca', 'M', 1, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50245, 'sigues', 'Sigüés', 'M', 1, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50250, 'talamantes', 'Talamantes', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50031, 'arandademoncayo', 'Aranda de Moncayo', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50057, 'breadearagon', 'Brea de Aragón', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50069, 'calcena', 'Calcena', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50121, 'gotor', 'Gotor', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50126, 'illueca', 'Illueca', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50130, 'jarque', 'Jarque', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50166, 'mesonesdeisuela', 'Mesones de Isuela', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50198, 'oseja', 'Oseja', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50214, 'pomer', 'Pomer', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50221, 'purujosa', 'Purujosa', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50243, 'sestrica', 'Sestrica', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50254, 'tierga', 'Tierga', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50266, 'trasobares', 'Trasobares', 'M', 14, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (1, 'lajacetania', 'La Jacetania', 'C', 1, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (10, 'losmonegros', 'Los Monegros', 'C', 10, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (12, 'tarazonayelmoncayo', 'Tarazona y el Moncayo', 'C', 12, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (13, 'campodeborja', 'Campo de Borja', 'C', 13, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (14, 'aranda', 'Aranda', 'C', 14, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (15, 'riberaaltadelebro', 'Ribera Alta del Ebro', 'C', 15, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (16, 'valdejalon', 'Valdejalón', 'C', 16, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (18, 'riberabajadelebro', 'Ribera Baja del Ebro', 'C', 18, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (2, 'altogallego', 'Alto Gállego', 'C', 2, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (20, 'comunidaddecalatayud', 'Comunidad de Calatayud', 'C', 20, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (21, 'campodecarinena', 'Campo de Cariñena', 'C', 21, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22, 'campodebelchite', 'Campo de Belchite', 'C', 22, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (23, 'bajomartin', 'Bajo Martín', 'C', 23, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (24, 'campodedaroca', 'Campo de Daroca', 'C', 24, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (25, 'jiloca', 'Jiloca', 'C', 25, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (26, 'cuencasmineras', 'Cuencas Mineras', 'C', 26, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (28, 'bajoaragon', 'Bajo Aragón', 'C', 28, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (29, 'comunidaddeteruel', 'Comunidad de Teruel', 'C', 29, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (3, 'sobrarbe', 'Sobrarbe', 'C', 3, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (30, 'maestrazgo', 'Maestrazgo', 'C', 30, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (31, 'sierradealbarracin', 'Sierra de Albarracín', 'C', 31, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (4, 'laribagorza', 'La Ribagorza', 'C', 4, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (5, 'cincovillas', 'Cinco Villas', 'C', 5, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7, 'somontanodebarbastro', 'Somontano de Barbastro', 'C', 7, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (8, 'cincamedio', 'Cinca Medio', 'C', 8, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50008, 'alagon', 'Alagón', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50013, 'alcaladeebro', 'Alcalá de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50043, 'barboles', 'Bárboles', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50053, 'boquineni', 'Boquiñeni', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50064, 'cabanasdeebro', 'Cabañas de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50107, 'figueruelas', 'Figueruelas', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50118, 'gallur', 'Gallur', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50123, 'grisen', 'Grisén', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50132, 'joyosala', 'Joyosa (La)', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50147, 'luceni', 'Luceni', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50204, 'pedrola', 'Pedrola', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50209, 'pinseque', 'Pinseque', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50212, 'pleitas', 'Pleitas', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50217, 'pradilladeebro', 'Pradilla de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50223, 'remolinos', 'Remolinos', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50247, 'sobradiel', 'Sobradiel', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50262, 'torresdeberrellen', 'Torres de Berrellén', 'M', 15, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50024, 'almonaciddelasierra', 'Almonacid de la Sierra', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50025, 'almuniadedonagodinala', 'Almunia de Doña Godina (La)', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50026, 'alpartir', 'Alpartir', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50044, 'bardallur', 'Bardallur', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50068, 'calatorao', 'Calatorao', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50093, 'chodes', 'Chodes', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50099, 'epila', 'Épila', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50146, 'lucenadejalon', 'Lucena de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50150, 'lumpiaque', 'Lumpiaque', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50175, 'moratadejalon', 'Morata de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50182, 'muelala', 'Muela (La)', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50211, 'plasenciadejalon', 'Plasencia de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50225, 'ricla', 'Ricla', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50228, 'ruedadejalon', 'Rueda de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7824, 'huesca', 'Huesca', 'P', 0, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7825, 'teruel', 'Teruel', 'P', 0, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22006, 'aisa', 'Aísa', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22028, 'anso', 'Ansó', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22032, 'araguesdelpuerto', 'Aragüés del Puerto', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22044, 'bailo', 'Bailo', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22068, 'borau', 'Borau', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22076, 'canaldeberdun', 'Canal de Berdún', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22078, 'canfranc', 'Canfranc', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22086, 'castiellodejaca', 'Castiello de Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22106, 'fago', 'Fago', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22130, 'jaca', 'Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22131, 'jasa', 'Jasa', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22902, 'puentelareinadejaca', 'Puente la Reina de Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22208, 'santacilia', 'Santa Cilia', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22209, 'santacruzdelaseros', 'Santa Cruz de la Serós', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22901, 'valledehecho', 'Valle de Hecho', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22250, 'villanua', 'Villanúa', 'M', 1, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22059, 'biescas', 'Biescas', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22057, 'bielsa', 'Bielsa', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50231, 'salillasdejalon', 'Salillas de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (17, 'dczaragoza', 'D.C. Zaragoza', 'C', 17, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (6, 'hoyadehuescaplanadeuesca', 'Hoya de Huesca / Plana de Uesca', 'C', 6, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (9, 'laliteralallitera', 'La Litera / La Llitera', 'C', 9, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (19, 'bajoaragoncaspebaixaragocasp', 'Bajo Aragón-Caspe / Baix Aragó-Casp', 'C', 19, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (27, 'andorrasierradearcos', 'Andorra-Sierra de Arcos', 'C', 27, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (32, 'gudarjavalambre', 'Gúdar-Javalambre', 'C', 32, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (11, 'bajocincabaixcinca', 'Bajo Cinca / Baix Cinca', 'C', 11, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (33, 'matarranamatarranya', 'Matarraña / Matarranya', 'C', 33, 0, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44107, 'fozcalanda', 'Foz-Calanda', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22141, 'lascellasponzano', 'Lascellas-Ponzano', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50033, 'ardisa', 'Ardisa', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50036, 'asin', 'Asín', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50041, 'bagues', 'Bagüés', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50901, 'biel', 'Biel', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50051, 'biota', 'Biota', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50077, 'castejondevaldejasa', 'Castejón de Valdejasa', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50078, 'castiliscar', 'Castiliscar', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50095, 'ejeadeloscaballeros', 'Ejea de los Caballeros', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50100, 'erla', 'Erla', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50109, 'fragoel', 'Frago (El)', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50128, 'isuerre', 'Isuerre', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50135, 'layana', 'Layana', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50142, 'loberadeonsella', 'Lobera de Onsella', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50144, 'longas', 'Longás', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50148, 'luesia', 'Luesia', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50151, 'luna', 'Luna', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50902, 'marracos', 'Marracos', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50186, 'navardun', 'Navardún', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50197, 'ores', 'Orés', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50205, 'pedrosaslas', 'Pedrosas (Las)', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50207, 'piedratajada', 'Piedratajada', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50210, 'pintanoslos', 'Pintanos (Los)', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50220, 'puendeluna', 'Puendeluna', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50230, 'sadaba', 'Sádaba', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50244, 'sierradeluna', 'Sierra de Luna', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50248, 'sosdelreycatolico', 'Sos del Rey Católico', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50252, 'tauste', 'Tauste', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50267, 'uncastillo', 'Uncastillo', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50268, 'unduesdelerda', 'Undués de Lerda', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50270, 'urries', 'Urriés', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50276, 'valpalmas', 'Valpalmas', 'M', 5, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50185, 'murillodegallego', 'Murillo de Gállego', 'M', 6, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50238, 'santaeulaliadegallego', 'Santa Eulalia de Gállego', 'M', 6, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50236, 'santacruzdegrio', 'Santa Cruz de Grío', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50269, 'urreadejalon', 'Urrea de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50017, 'alfajarin', 'Alfajarín', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50056, 'botorrita', 'Botorrita', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50062, 'burgodeebroel', 'Burgo de Ebro (El)', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50066, 'cadrete', 'Cadrete', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50089, 'cuartedehuerva', 'Cuarte de Huerva', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50115, 'fuentesdeebro', 'Fuentes de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50131, 'jaulin', 'Jaulín', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50163, 'mariadehuerva', 'María de Huerva', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50164, 'medianadearagon', 'Mediana de Aragón', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50180, 'mozota', 'Mozota', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50193, 'nuezdeebro', 'Nuez de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50199, 'oseradeebro', 'Osera de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50203, 'pastriz', 'Pastriz', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50219, 'puebladealfindenla', 'Puebla de Alfindén (La)', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50235, 'sanmateodegallego', 'San Mateo de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50272, 'utebo', 'Utebo', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50285, 'villafrancadeebro', 'Villafranca de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50903, 'villamayordegallego', 'Villamayor de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50288, 'villanuevadegallego', 'Villanueva de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50297, 'zaragoza', 'Zaragoza', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50298, 'zuera', 'Zuera', 'M', 17, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50012, 'alborge', 'Alborge', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50019, 'alforque', 'Alforque', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50083, 'cincoolivas', 'Cinco Olivas', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50101, 'escatron', 'Escatrón', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50119, 'gelsa', 'Gelsa', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50208, 'pinadeebro', 'Pina de Ebro', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50222, 'quinto', 'Quinto', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50240, 'sastago', 'Sástago', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50278, 'velilladeebro', 'Velilla de Ebro', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50296, 'zaidala', 'Zaida (La)', 'M', 18, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50074, 'caspe', 'Caspe', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50092, 'chiprana', 'Chiprana', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50102, 'fabara', 'Fabara', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50105, 'fayon', 'Fayón', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50152, 'maella', 'Maella', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50189, 'nonaspe', 'Nonaspe', 'M', 19, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50001, 'abanto', 'Abanto', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50009, 'alarba', 'Alarba', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50015, 'alconcheldeariza', 'Alconchel de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50020, 'alhamadearagon', 'Alhama de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50029, 'aninon', 'Aniñón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50032, 'arandiga', 'Arándiga', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50034, 'ariza', 'Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50038, 'ateca', 'Ateca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22074, 'campo', 'Campo', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50022, 'almoldala', 'Almolda (La)', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50059, 'bujaraloz', 'Bujaraloz', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50104, 'farlete', 'Farlete', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50137, 'lecinena', 'Leciñena', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50170, 'monegrillo', 'Monegrillo', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50206, 'perdiguera', 'Perdiguera', 'M', 10, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50165, 'mequinenza', 'Mequinenza', 'M', 11, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50014, 'alcalademoncayo', 'Alcalá de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50030, 'anondemoncayo', 'Añón de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50063, 'busteel', 'Buste (El)', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50106, 'fayoslos', 'Fayos (Los)', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50122, 'grisel', 'Grisel', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50140, 'litago', 'Litago', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50141, 'lituenigo', 'Lituénigo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50157, 'malon', 'Malón', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50190, 'novallas', 'Novallas', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50234, 'sanmartindelavirgendemoncayo', 'San Martín de la Virgen de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50237, 'santacruzdemoncayo', 'Santa Cruz de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50251, 'tarazona', 'Tarazona', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50261, 'torrellas', 'Torrellas', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50265, 'trasmoz', 'Trasmoz', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50280, 'verademoncayo', 'Vera de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50281, 'vierlas', 'Vierlas', 'M', 12, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50003, 'agon', 'Agón', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50006, 'ainzon', 'Ainzón', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50010, 'alberitedesanjuan', 'Alberite de San Juan', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50011, 'albeta', 'Albeta', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50027, 'ambel', 'Ambel', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50052, 'bisimbre', 'Bisimbre', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50055, 'borja', 'Borja', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50060, 'bulbuente', 'Bulbuente', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50061, 'bureta', 'Bureta', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50111, 'frescano', 'Fréscano', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50113, 'fuendejalon', 'Fuendejalón', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50153, 'magallon', 'Magallón', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50156, 'malejan', 'Maleján', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50160, 'mallen', 'Mallén', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50191, 'novillas', 'Novillas', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50216, 'pozuelodearagon', 'Pozuelo de Aragón', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50249, 'tabuenca', 'Tabuenca', 'M', 13, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50046, 'belmontedegracian', 'Belmonte de Gracián', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50047, 'berdejo', 'Berdejo', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50050, 'bijuesca', 'Bijuesca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50054, 'bordalba', 'Bordalba', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50058, 'bubierca', 'Bubierca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50065, 'cabolafuente', 'Cabolafuente', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50067, 'calatayud', 'Calatayud', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50070, 'calmarza', 'Calmarza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50071, 'campillodearagon', 'Campillo de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50072, 'carenas', 'Carenas', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50075, 'castejondealarba', 'Castejón de Alarba', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50076, 'castejondelasarmas', 'Castejón de las Armas', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50079, 'cerveradelacanada', 'Cervera de la Cañada', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50081, 'cetina', 'Cetina', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50082, 'cimballa', 'Cimballa', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50084, 'claresderibota', 'Clarés de Ribota', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50086, 'codos', 'Codos', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50087, 'contamina', 'Contamina', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50096, 'embiddeariza', 'Embid de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50110, 'frasnoel', 'Frasno (El)', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50176, 'moratadejiloca', 'Morata de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50177, 'mores', 'Morés', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50178, 'moros', 'Moros', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50183, 'munebrega', 'Munébrega', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50187, 'niguella', 'Nigüella', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50192, 'nuevalos', 'Nuévalos', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50194, 'olves', 'Olvés', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50196, 'orera', 'Orera', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50201, 'paracuellosdejiloca', 'Paracuellos de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50202, 'paracuellosdelaribera', 'Paracuellos de la Ribera', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50215, 'pozueldeariza', 'Pozuel de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50229, 'ruesca', 'Ruesca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50241, 'savinan', 'Saviñán', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50242, 'sediles', 'Sediles', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50116, 'fuentesdejiloca', 'Fuentes de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50120, 'godojos', 'Godojos', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50125, 'ibdes', 'Ibdes', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50129, 'jaraba', 'Jaraba', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50155, 'malanquilla', 'Malanquilla', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50159, 'maluenda', 'Maluenda', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50162, 'mara', 'Mara', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50169, 'miedesdearagon', 'Miedes de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50172, 'monrealdeariza', 'Monreal de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50173, 'monterde', 'Monterde', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50174, 'monton', 'Montón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50246, 'sisamon', 'Sisamón', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50253, 'terrer', 'Terrer', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50255, 'tobed', 'Tobed', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50257, 'torralbaderibota', 'Torralba de Ribota', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50259, 'torrehermosa', 'Torrehermosa', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50260, 'torrelapaja', 'Torrelapaja', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50263, 'torrijodelacanada', 'Torrijo de la Cañada', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50277, 'valtorres', 'Valtorres', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50279, 'velilladejiloca', 'Velilla de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50284, 'villafeliche', 'Villafeliche', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50286, 'villalbadeperejil', 'Villalba de Perejil', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50287, 'villalengua', 'Villalengua', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50293, 'villarroyadelasierra', 'Villarroya de la Sierra', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50282, 'viluenala', 'Vilueña (La)', 'M', 20, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50004, 'aguaron', 'Aguarón', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50005, 'aguilon', 'Aguilón', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50007, 'aladren', 'Aladrén', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50018, 'alfamen', 'Alfamén', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50073, 'carinena', 'Cariñena', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50088, 'cosuenda', 'Cosuenda', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50098, 'encinacorba', 'Encinacorba', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50143, 'longares', 'Longares', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50167, 'mezalocha', 'Mezalocha', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50181, 'muel', 'Muel', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50200, 'paniza', 'Paniza', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50264, 'tosos', 'Tosos', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50290, 'villanuevadehuerva', 'Villanueva de Huerva', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50295, 'vistabella', 'Vistabella', 'M', 21, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50021, 'almochuel', 'Almochuel', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50023, 'almonaciddelacuba', 'Almonacid de la Cuba', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50039, 'azuara', 'Azuara', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50045, 'belchite', 'Belchite', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50085, 'codo', 'Codo', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50114, 'fuendetodos', 'Fuendetodos', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50133, 'lagata', 'Lagata', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50136, 'lecera', 'Lécera', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50139, 'letux', 'Letux', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50171, 'moneva', 'Moneva', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50179, 'moyuela', 'Moyuela', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50213, 'plenas', 'Plenas', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50218, 'puebladealborton', 'Puebla de Albortón', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50233, 'samperdelsalz', 'Samper del Salz', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50275, 'valmadrid', 'Valmadrid', 'M', 22, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50002, 'acered', 'Acered', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50016, 'aldehueladeliestos', 'Aldehuela de Liestos', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50028, 'anento', 'Anento', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50037, 'atea', 'Atea', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50040, 'badules', 'Badules', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50042, 'balconchan', 'Balconchán', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50048, 'berrueco', 'Berrueco', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50080, 'cerveruela', 'Cerveruela', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50090, 'cubel', 'Cubel', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50091, 'cuerlaslas', 'Cuerlas (Las)', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50094, 'daroca', 'Daroca', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50108, 'fombuena', 'Fombuena', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50117, 'gallocanta', 'Gallocanta', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50124, 'herreradelosnavarros', 'Herrera de los Navarros', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50134, 'langadelcastillo', 'Langa del Castillo', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50138, 'lechon', 'Lechón', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50149, 'luesma', 'Luesma', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50154, 'mainar', 'Mainar', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50161, 'manchones', 'Manchones', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50184, 'murero', 'Murero', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50188, 'nombrevilla', 'Nombrevilla', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50195, 'orcajo', 'Orcajo', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50224, 'retascon', 'Retascón', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50227, 'romanos', 'Romanos', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50239, 'santed', 'Santed', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50256, 'torralbadelosfrailes', 'Torralba de los Frailes', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50258, 'torralbilla', 'Torralbilla', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50271, 'used', 'Used', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50274, 'valdesanmartin', 'Val de San Martín', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50273, 'valdehorna', 'Valdehorna', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50283, 'villadoz', 'Villadoz', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50289, 'villanuevadejiloca', 'Villanueva de Jiloca', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50291, 'villardelosnavarros', 'Villar de los Navarros', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50292, 'villarrealdehuerva', 'Villarreal de Huerva', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50294, 'villarroyadelcampo', 'Villarroya del Campo', 'M', 24, 7823, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44076, 'cella', 'Cella', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22156, 'monfloritelascasas', 'Monflorite-Lascasas', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22036, 'argavieso', 'Argavieso', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22227, 'tellasin', 'Tella-Sin', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22907, 'ainsasobrarbe', 'Aínsa-Sobrarbe', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22905, 'lupinenortilla', 'Lupiñén-Ortilla', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22072, 'caldearenas', 'Caldearenas', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22122, 'hozdejaca', 'Hoz de Jaca', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22170, 'panticosa', 'Panticosa', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22199, 'sabinanigo', 'Sabiñánigo', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22204, 'sallentdegallego', 'Sallent de Gállego', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22252, 'yebradebasa', 'Yebra de Basa', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22253, 'yesero', 'Yésero', 'M', 2, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22002, 'abizanda', 'Abizanda', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22051, 'barcabo', 'Bárcabo', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22066, 'boltana', 'Boltaña', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22069, 'broto', 'Broto', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22107, 'fanlo', 'Fanlo', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22109, 'fiscal', 'Fiscal', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22113, 'fuevala', 'Fueva (La)', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22114, 'gistain', 'Gistaín', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22133, 'labuerda', 'Labuerda', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22144, 'laspuna', 'Laspuña', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22168, 'palo', 'Palo', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22182, 'plan', 'Plan', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22189, 'puertolas', 'Puértolas', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22190, 'pueyodearaguasel', 'Pueyo de Araguás (El)', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22207, 'sanjuandeplan', 'San Juan de Plan', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22035, 'aren', 'Arén', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22053, 'benabarre', 'Benabarre', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22054, 'benasque', 'Benasque', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22246, 'beranuy', 'Beranuy', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22062, 'bisaurri', 'Bisaurri', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22067, 'bonansa', 'Bonansa', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22080, 'capella', 'Capella', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22084, 'castejondesos', 'Castejón de Sos', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22087, 'castigaleu', 'Castigaleu', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22095, 'chia', 'Chía', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22105, 'estopinandelcastillo', 'Estopiñán del Castillo', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22111, 'foradadadeltoscar', 'Foradada del Toscar', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22117, 'graus', 'Graus', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22129, 'isabena', 'Isábena', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22142, 'lascuarre', 'Lascuarre', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22143, 'laspaules', 'Laspaúles', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22155, 'monesmaycajigar', 'Monesma y Cajigar', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22157, 'montanuy', 'Montanuy', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22177, 'perarrua', 'Perarrúa', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22187, 'puebladecastrola', 'Puebla de Castro (La)', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22188, 'puentedemontanana', 'Puente de Montañana', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22200, 'sahun', 'Sahún', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22212, 'santaliestraysanquilez', 'Santaliestra y San Quílez', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22214, 'secastilla', 'Secastilla', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22215, 'seira', 'Seira', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22221, 'sesue', 'Sesué', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22223, 'sopeira', 'Sopeira', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22229, 'tolva', 'Tolva', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22233, 'torrelaribera', 'Torre la Ribera', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22243, 'valledebardaji', 'Valle de Bardají', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22244, 'valledelierp', 'Valle de Lierp', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22247, 'viacampylitera', 'Viacamp y Litera', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22249, 'villanova', 'Villanova', 'M', 4, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22004, 'aguero', 'Agüero', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22011, 'alberoalto', 'Albero Alto', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22014, 'alcaladegurrea', 'Alcalá de Gurrea', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22015, 'alcaladelobispo', 'Alcalá del Obispo', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22019, 'alerre', 'Alerre', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22021, 'almudevar', 'Almudévar', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22027, 'angues', 'Angüés', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22029, 'antillon', 'Antillón', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22037, 'arguis', 'Arguis', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22039, 'ayerbe', 'Ayerbe', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22047, 'banastas', 'Banastás', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22063, 'biscarrues', 'Biscarrués', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22064, 'blecuaytorres', 'Blecua y Torres', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22081, 'casbasdehuesca', 'Casbas de Huesca', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22096, 'chimillas', 'Chimillas', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22119, 'gurreadegallego', 'Gurrea de Gállego', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22125, 'huesca', 'Huesca', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22126, 'ibieca', 'Ibieca', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22127, 'igries', 'Igriés', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22149, 'loarre', 'Loarre', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22150, 'loporzano', 'Loporzano', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22151, 'loscorrales', 'Loscorrales', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22162, 'novales', 'Novales', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22163, 'nueno', 'Nueno', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22173, 'penasderigloslas', 'Peñas de Riglos (Las)', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22178, 'pertusa', 'Pertusa', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22181, 'piraces', 'Piracés', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22195, 'quicena', 'Quicena', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22203, 'salillas', 'Salillas', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22220, 'sesa', 'Sesa', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22222, 'sietamo', 'Siétamo', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22904, 'sotonerala', 'Sotonera (La)', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22228, 'tierz', 'Tierz', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22239, 'tramaced', 'Tramaced', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22248, 'vicien', 'Vicién', 'M', 6, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22001, 'abiego', 'Abiego', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22003, 'adahuesca', 'Adahuesca', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22024, 'alquezar', 'Alquézar', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22041, 'azara', 'Azara', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22042, 'azlor', 'Azlor', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22048, 'barbastro', 'Barbastro', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22050, 'barbunales', 'Barbuñales', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22055, 'berbegal', 'Berbegal', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22058, 'bierge', 'Bierge', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22082, 'castejondelpuente', 'Castejón del Puente', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22088, 'castillazuelo', 'Castillazuelo', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22090, 'colungo', 'Colungo', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22102, 'estada', 'Estada', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22230, 'torlaordesa', 'Torla-Ordesa', 'M', 3, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22103, 'estadilla', 'Estadilla', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22115, 'gradoel', 'Grado (El)', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22908, 'hozycostean', 'Hoz y Costeán', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22128, 'ilche', 'Ilche', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22135, 'laluenga', 'Laluenga', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22139, 'laperdiguera', 'Laperdiguera', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22160, 'naval', 'Naval', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22164, 'olvena', 'Olvena', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22174, 'peraltadealcofea', 'Peralta de Alcofea', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22176, 'peraltilla', 'Peraltilla', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22186, 'pozandevero', 'Pozán de Vero', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22201, 'salasaltas', 'Salas Altas', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22202, 'salasbajas', 'Salas Bajas', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22906, 'santamariadedulcis', 'Santa María de Dulcis', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22235, 'torresdealcanadre', 'Torres de Alcanadre', 'M', 7, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22007, 'albalatedecinca', 'Albalate de Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22017, 'alcoleadecinca', 'Alcolea de Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22020, 'alfantega', 'Alfántega', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22022, 'almuniadesanjuan', 'Almunia de San Juan', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22060, 'binaced', 'Binaced', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22110, 'fonz', 'Fonz', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22158, 'monzon', 'Monzón', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22193, 'pueyodesantacruz', 'Pueyo de Santa Cruz', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22903, 'sanmigueldelcinca', 'San Miguel del Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22009, 'albelda', 'Albelda', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22016, 'alcampell', 'Alcampell', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22025, 'altorricon', 'Altorricón', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22043, 'baells', 'Baells', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22045, 'baldellou', 'Baldellou', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22061, 'binefar', 'Binéfar', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22075, 'camporrells', 'Camporrells', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22089, 'castillonroy', 'Castillonroy', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22099, 'esplus', 'Esplús', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22175, 'peraltadecalasanz', 'Peralta de Calasanz', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22205, 'sanestebandelitera', 'San Esteban de Litera', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22225, 'tamaritedelitera', 'Tamarite de Litera', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22909, 'vencillon', 'Vencillón', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22008, 'albalatillo', 'Albalatillo', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22012, 'alberobajo', 'Albero Bajo', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22013, 'alberueladetubo', 'Alberuela de Tubo', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22018, 'alcubierre', 'Alcubierre', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22023, 'almuniente', 'Almuniente', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22049, 'barbues', 'Barbués', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22079, 'capdesaso', 'Capdesaso', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22083, 'castejondemonegros', 'Castejón de Monegros', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22085, 'castelflorite', 'Castelflorite', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22116, 'granen', 'Grañén', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22124, 'huerto', 'Huerto', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22136, 'lalueza', 'Lalueza', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22137, 'lanaja', 'Lanaja', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22172, 'penalba', 'Peñalba', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22184, 'polenino', 'Poleñino', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22197, 'robres', 'Robres', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22206, 'sangarren', 'Sangarrén', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22213, 'sarinena', 'Sariñena', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22217, 'sena', 'Sena', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22218, 'senesdealcubierre', 'Senés de Alcubierre', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22226, 'tardienta', 'Tardienta', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22232, 'torralbadearagon', 'Torralba de Aragón', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22236, 'torresdebarbues', 'Torres de Barbués', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22242, 'valfarta', 'Valfarta', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22251, 'villanuevadesigena', 'Villanueva de Sigena', 'M', 10, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22046, 'ballobar', 'Ballobar', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22052, 'belverdecinca', 'Belver de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22077, 'candasnos', 'Candasnos', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22094, 'chalamera', 'Chalamera', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22112, 'fraga', 'Fraga', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22165, 'ontinena', 'Ontiñena', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22167, 'ossodecinca', 'Osso de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22234, 'torrentedecinca', 'Torrente de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22245, 'velilladecinca', 'Velilla de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22254, 'zaidin', 'Zaidín', 'M', 11, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44008, 'albalatedelarzobispo', 'Albalate del Arzobispo', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44031, 'azaila', 'Azaila', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44067, 'castelnou', 'Castelnou', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44122, 'hijar', 'Híjar', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44129, 'jatiel', 'Jatiel', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44191, 'puebladehijarla', 'Puebla de Híjar (La)', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44205, 'samperdecalanda', 'Samper de Calanda', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44237, 'urreadegaen', 'Urrea de Gaén', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44265, 'vinaceite', 'Vinaceite', 'M', 23, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44023, 'allueva', 'Allueva', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44032, 'badenas', 'Bádenas', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44033, 'baguena', 'Báguena', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44034, 'banon', 'Bañón', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44035, 'barrachina', 'Barrachina', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44036, 'bea', 'Bea', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44039, 'bello', 'Bello', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44042, 'blancas', 'Blancas', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44046, 'buena', 'Bueña', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44047, 'burbaguena', 'Burbáguena', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44050, 'calamocha', 'Calamocha', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44056, 'caminreal', 'Caminreal', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44065, 'castejondetornos', 'Castejón de Tornos', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44085, 'cosa', 'Cosa', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44090, 'cucalon', 'Cucalón', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44101, 'ferrerueladehuerva', 'Ferreruela de Huerva', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44102, 'fonfria', 'Fonfría', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44112, 'fuentesclaras', 'Fuentes Claras', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44132, 'lagueruela', 'Lagueruela', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44133, 'lanzuela', 'Lanzuela', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44138, 'loscos', 'Loscos', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44152, 'monfortedemoyuela', 'Monforte de Moyuela', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44153, 'monrealdelcampo', 'Monreal del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44164, 'nogueras', 'Nogueras', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44168, 'odon', 'Odón', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44169, 'ojosnegros', 'Ojos Negros', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44180, 'peracense', 'Peracense', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44190, 'pozueldelcampo', 'Pozuel del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44200, 'rubielosdelacerida', 'Rubielos de la Cérida', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22040, 'azanuyalins', 'Azanuy-Alins', 'M', 9, 7824, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44207, 'sanmartindelrio', 'San Martín del Río', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44208, 'santacruzdenogueras', 'Santa Cruz de Nogueras', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44213, 'singra', 'Singra', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44219, 'tornos', 'Tornos', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44220, 'torralbadelossisones', 'Torralba de los Sisones', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44227, 'torrelosnegros', 'Torre los Negros', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44222, 'torrecilladelrebollar', 'Torrecilla del Rebollar', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44232, 'torrijodelcampo', 'Torrijo del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44251, 'villafrancadelcampo', 'Villafranca del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44252, 'villahermosadelcampo', 'Villahermosa del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44258, 'villardelsalz', 'Villar del Salz', 'M', 25, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44011, 'alcaine', 'Alcaine', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44017, 'aliaga', 'Aliaga', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44024, 'anadon', 'Anadón', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44043, 'blesa', 'Blesa', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44063, 'canizardelolivar', 'Cañizar del Olivar', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44066, 'casteldecabra', 'Castel de Cabra', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44084, 'cortesdearagon', 'Cortes de Aragón', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44093, 'cuevasdealmuden', 'Cuevas de Almudén', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44099, 'escucha', 'Escucha', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44110, 'fuenferrada', 'Fuenferrada', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44123, 'hinojosadejarque', 'Hinojosa de Jarque', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44124, 'hozdelaviejala', 'Hoz de la Vieja (La)', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44125, 'huesadelcomun', 'Huesa del Común', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44128, 'jarquedelaval', 'Jarque de la Val', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44131, 'josa', 'Josa', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44142, 'maicas', 'Maicas', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44144, 'martindelrio', 'Martín del Río', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44148, 'mezquitadejarque', 'Mezquita de Jarque', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44155, 'montalban', 'Montalbán', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44161, 'muniesa', 'Muniesa', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44167, 'obon', 'Obón', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44176, 'palomardearroyos', 'Palomar de Arroyos', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44184, 'plou', 'Plou', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44203, 'salcedillo', 'Salcedillo', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44211, 'seguradelosbanos', 'Segura de los Baños', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44224, 'torredelasarcas', 'Torre de las Arcas', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44238, 'utrillas', 'Utrillas', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44256, 'villanuevadelrebollardelasierra', 'Villanueva del Rebollar de la Sierra', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44267, 'viveldelriomartin', 'Vivel del Río Martín', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44268, 'zomala', 'Zoma (La)', 'M', 26, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44006, 'alacon', 'Alacón', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44022, 'alloza', 'Alloza', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44025, 'andorra', 'Andorra', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44029, 'arino', 'Ariño', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44087, 'crivillen', 'Crivillén', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44096, 'ejulve', 'Ejulve', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44100, 'estercuel', 'Estercuel', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44116, 'gargallo', 'Gargallo', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44172, 'oliete', 'Oliete', 'M', 27, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44004, 'aguaviva', 'Aguaviva', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44013, 'alcaniz', 'Alcañiz', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44014, 'alcorisa', 'Alcorisa', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44038, 'belmontedesanjose', 'Belmonte de San José', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44040, 'berge', 'Berge', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44051, 'calanda', 'Calanda', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44061, 'canadadeverichla', 'Cañada de Verich (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44068, 'castelseras', 'Castelserás', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44077, 'cerollerala', 'Cerollera (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44080, 'codonerala', 'Codoñera (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44118, 'ginebrosala', 'Ginebrosa (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44145, 'masdelasmatas', 'Mas de las Matas', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44146, 'matadelosolmosla', 'Mata de los Olmos (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44173, 'olmoslos', 'Olmos (Los)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44178, 'parrasdecastellotelas', 'Parras de Castellote (Las)', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44212, 'seno', 'Seno', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44221, 'torrecilladealcaniz', 'Torrecilla de Alcañiz', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44230, 'torrevelilla', 'Torrevelilla', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44241, 'valdealgorfa', 'Valdealgorfa', 'M', 28, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44001, 'ababuj', 'Ababuj', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44003, 'aguaton', 'Aguatón', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44005, 'aguilardelalfambra', 'Aguilar del Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44007, 'alba', 'Alba', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44016, 'alfambra', 'Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44018, 'almohaja', 'Almohaja', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44019, 'alobras', 'Alobras', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44020, 'alpenes', 'Alpeñés', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44028, 'argente', 'Argente', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44053, 'camanas', 'Camañas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44055, 'camarillas', 'Camarillas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44062, 'canadavellida', 'Cañada Vellida', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44064, 'cascantedelrio', 'Cascante del Río', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44074, 'cedrillas', 'Cedrillas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44075, 'celadas', 'Celadas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44082, 'corbalan', 'Corbalán', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44089, 'cubla', 'Cubla', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44092, 'cuervoel', 'Cuervo (El)', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44094, 'cuevaslabradas', 'Cuevas Labradas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44097, 'escorihuela', 'Escorihuela', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44111, 'fuentescalientes', 'Fuentes Calientes', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44115, 'galve', 'Galve', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44130, 'jorcas', 'Jorcas', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44135, 'libros', 'Libros', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44136, 'lidon', 'Lidón', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44156, 'monteagudodelcastillo', 'Monteagudo del Castillo', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44175, 'orrios', 'Orrios', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44177, 'pancrudo', 'Pancrudo', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44181, 'peralejos', 'Peralejos', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44182, 'peralesdelalfambra', 'Perales del Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44185, 'poboel', 'Pobo (El)', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44195, 'rillo', 'Rillo', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44196, 'riodeva', 'Riodeva', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44209, 'santaeulalia', 'Santa Eulalia', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44216, 'teruel', 'Teruel', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44218, 'tormon', 'Tormón', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44226, 'torrelacarcel', 'Torrelacárcel', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44228, 'torremochadejiloca', 'Torremocha de Jiloca', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44234, 'tramacastiel', 'Tramacastiel', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44239, 'valacloche', 'Valacloche', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44250, 'veguillasdelasierra', 'Veguillas de la Sierra', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44261, 'villarquemado', 'Villarquemado', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44263, 'villastar', 'Villastar', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44264, 'villel', 'Villel', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44266, 'visiedo', 'Visiedo', 'M', 29, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44021, 'allepuz', 'Allepuz', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44044, 'bordon', 'Bordón', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44059, 'cantavieja', 'Cantavieja', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44060, 'canadadebenatanduz', 'Cañada de Benatanduz', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44071, 'castellote', 'Castellote', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44088, 'cubala', 'Cuba (La)', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44106, 'fortanete', 'Fortanete', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44126, 'iglesueladelcidla', 'Iglesuela del Cid (La)', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44149, 'mirambel', 'Mirambel', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44150, 'miravetedelasierra', 'Miravete de la Sierra', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44151, 'molinos', 'Molinos', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44183, 'pitarque', 'Pitarque', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44236, 'tronchon', 'Tronchón', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44260, 'villarluengo', 'Villarluengo', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44262, 'villarroyadelospinares', 'Villarroya de los Pinares', 'M', 30, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44009, 'albarracin', 'Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44041, 'bezas', 'Bezas', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44045, 'bronchales', 'Bronchales', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44052, 'calomarde', 'Calomarde', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44109, 'friasdealbarracin', 'Frías de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44117, 'geadealbarracin', 'Gea de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44119, 'griegos', 'Griegos', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44120, 'guadalaviar', 'Guadalaviar', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44127, 'jabaloyas', 'Jabaloyas', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44157, 'monterdedealbarracin', 'Monterde de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44159, 'moscardon', 'Moscardón', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44163, 'nogueradealbarracin', 'Noguera de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44174, 'orihueladeltremedal', 'Orihuela del Tremedal', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44189, 'pozondon', 'Pozondón', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44197, 'rodenas', 'Ródenas', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44198, 'royuela', 'Royuela', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44199, 'rubiales', 'Rubiales', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44204, 'saldon', 'Saldón', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44215, 'terriente', 'Terriente', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44217, 'torilymasegoso', 'Toril y Masegoso', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44229, 'torresdealbarracin', 'Torres de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44235, 'tramacastilla', 'Tramacastilla', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44243, 'valdecuenca', 'Valdecuenca', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44249, 'vallecilloel', 'Vallecillo (El)', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44257, 'villardelcobo', 'Villar del Cobo', 'M', 31, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44002, 'abejuela', 'Abejuela', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44010, 'albentosa', 'Albentosa', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44012, 'alcaladelaselva', 'Alcalá de la Selva', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44026, 'arcosdelassalinas', 'Arcos de las Salinas', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44048, 'cabrademora', 'Cabra de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44054, 'camarenadelasierra', 'Camarena de la Sierra', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44070, 'castellarel', 'Castellar (El)', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44103, 'formichealto', 'Formiche Alto', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44113, 'fuentesderubielos', 'Fuentes de Rubielos', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44121, 'gudar', 'Gúdar', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44137, 'linaresdemora', 'Linares de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44143, 'manzanera', 'Manzanera', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44158, 'moraderubielos', 'Mora de Rubielos', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44160, 'mosqueruela', 'Mosqueruela', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44165, 'nogueruelas', 'Nogueruelas', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44171, 'olba', 'Olba', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44192, 'puebladevalverdela', 'Puebla de Valverde (La)', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44193, 'puertomingalvo', 'Puertomingalvo', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44201, 'rubielosdemora', 'Rubielos de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44206, 'sanagustin', 'San Agustín', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44210, 'sarrion', 'Sarrión', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44231, 'torrijas', 'Torrijas', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44240, 'valbona', 'Valbona', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44244, 'valdelinares', 'Valdelinares', 'M', 32, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44027, 'arensdelledo', 'Arens de Lledó', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44037, 'beceite', 'Beceite', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44049, 'calaceite', 'Calaceite', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44086, 'cretas', 'Cretas', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44105, 'fornoles', 'Fórnoles', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44108, 'fresnedala', 'Fresneda (La)', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44114, 'fuentespalda', 'Fuentespalda', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44141, 'lledo', 'Lledó', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44147, 'mazaleon', 'Mazaleón', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44154, 'monroyo', 'Monroyo', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44179, 'penarroyadetastavins', 'Peñarroya de Tastavins', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44187, 'portelladala', 'Portellada (La)', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44194, 'rafales', 'Ráfales', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44223, 'torredearcas', 'Torre de Arcas', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44225, 'torredelcompte', 'Torre del Compte', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44245, 'valdeltormo', 'Valdeltormo', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44246, 'valderrobres', 'Valderrobres', 'M', 33, 7825, '2018-04-15');
INSERT INTO lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44247, 'valjunquera', 'Valjunquera', 'M', 33, 7825, '2018-04-15');


--
-- Name: lugares_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lugares_code_seq', 1, false);


--
-- Name: rfdconfiguracion_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('rfdconfiguracion_code_seq', 23, true);


--
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (3, 'GeneralCategorization', 'Categorización general', 'General categorization', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#GeneralCategorization', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (4, 'bloque-cultura', 'Cultura, ocio y turismo', 'Culture leisure and tourism', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#CultureLeisureAndTourism', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (5, 'bloque-derechos', 'Derechos y servicios del ciudadano', 'Citizen rights and services', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#CitizenRightsAndServices', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (6, 'Unknown', 'Desconocida', 'Unknown', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Unknown', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (7, 'bloque-educacion', 'Educación, investigación y desarrollo', 'Education research and development', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#EducationResearchAndDevelopment', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (9, 'bloque-empresa', 'Empresa, comercio y asociaciones', 'Business trade and associations', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#BusinessTradeAndAssociations', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (10, 'bloque-infraestructuras', 'Infraestructuras, transportes y carreteras', 'Infrastructure transport and roads', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#InfrastructureTransportAndRoads', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (13, 'bloque-salud', 'Salud', 'Health', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Health', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (14, 'bloque-vivienda', 'Vivienda', 'Housing', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Housing', B'1', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (17, 'AssociationsFoundationsAndProfessionalColleges', 'Asociaciones, fundaciones y colegios profesionales', 'Associations, foundations and professional associations', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#AssociationsFoundationsAndProfessionalColleges', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (18, 'Business', 'Empresa', 'Business', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#Business', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (25, 'ConsumerInformation', 'Información al consumidor', 'Consumer Information', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#ConsumerInformation', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (26, 'Culture', 'Cultura', 'Culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#Culture', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (15, 'Agriculture', 'Agricultura', 'Agriculture', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Agriculture', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (50, 'HousingAidsAndSubsidies', 'Ayudas y subvenciones en viviendas', 'Housing aids and subsidies', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#HousingAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (54, 'LawAndJustice', 'Derecho y justicia', 'Law and justice', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#LawAndJustice', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (71, 'SystemsAndEducationalCenters', 'Sistemas y centros educativos', 'Systems and educational centers', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#SystemsAndEducationalCenters', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (73, 'TerritoryAndTransport', 'Territorio y transportes', 'Territory and transport', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (74, 'TouristCompanies', 'Empresas turísticas', 'Tourist companies', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#TouristCompanies', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (75, 'TouristServices', 'Servicios turísticos', 'Tourist services', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#TouristServices', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (79, 'WaterAndHealth', 'Agua y salud', 'Water and health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', B'1', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (1, 'bloque-actividades', 'Actividades industriales y energía', 'Industrial and energy activities', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#IndustrialAndEnergyActivities', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (2, 'bloque-atencion', 'Atención social y dependencia', 'Social care and dependency', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#SocialCareAndDependency', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (8, 'bloque-empleo', 'Empleo y trabajo', 'Employment and work', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentAndWork', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (11, 'bloque-medioambiente', 'Medio ambiente', 'Environment', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Environment', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (12, 'bloque-medio', 'Medio rural, agricultura y ganadería', 'Rural environment agriculture and livestock', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#RuralEnvironmentAgricultureAndLivestock', B'0', '2018-04-12');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (16, 'AssociationsAndOrganizations', 'Asociaciones y organizaciones', 'Associations and Organizations', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#AssociationsAndOrganizations', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (19, 'BusinessAidsAndSubsidies', 'Ayudas y subvenciones a empresas', 'Aids and subsidies to companies', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#BusinessAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (20, 'CarnetsAndCertificates', 'Carnets y certificados', 'Carnets and certificates', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#CarnetsAndCertificates', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (21, 'ChildhoodAndYouth', 'Infancia y juventud', 'Children and youth', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#ChildhoodAndYouth', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (22, 'CitizenSecurityAndSafety', 'Protección y seguridad ciudadana', 'Citizen security and safety', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#CitizenSecurityAndSafety', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (23, 'CollectiveInRuralAreas', 'Colectivos en el medio rural', 'Collective in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#CollectiveInRuralAreas', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (24, 'CollectiveWork', 'Colectivos de trabajo', 'Collective work', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#CollectiveWork', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (27, 'CultureAidsAndSubsidies', 'Ayudas y subvenciones en cultura', 'Aids and subsidies in culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#CultureAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (28, 'CultureEmploymentAndTraining', 'Empleo y formación en cultura', 'Employment and training in culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#CultureEmploymentAndTraining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (29, 'DefenseAndConservation', 'Defensa y conservación', 'Defense and conservation', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#DefenseAndConservation', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (30, 'Dependency', 'Dependencia', 'Dependency', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#Dependency', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (31, 'DisabilityAndEmployment', 'Discapacidad y empleo', 'Disability and employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#DisabilityAndEmployment', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (32, 'EducationAidsAndSubsidies', 'Ayudas y subvenciones en educación', 'Aids and subsidies in education', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#EducationAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (33, 'EducationEmploymentAndTraining', 'Empleo y formación en educación', 'Employment and training in education', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#EducationEmploymentAndTraining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (34, 'ElderlyPeople', 'Personas mayores', 'Elder people', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#ElderlyPeople', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (35, 'Employment', 'Empleo', 'Employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#Employment', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (36, 'EmploymentAidsAndSubsidies', 'Ayudas y subvenciones para emplearse', 'Aids and subsidies for employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (37, 'EmploymentCoursesAndTraining', 'Cursos y formación para emplearse', 'Courses and training for employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentCoursesAndTraining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (38, 'Energy', 'Energía', 'Energy', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#Energy', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (39, 'EnergyAidsAndSubsidies', 'Ayudas y subvenciones en energía', 'Energy subsidies and subsidies', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#EnergyAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (40, 'EnergyWasteManagement', 'Gestión de residuos energéticos', 'Energy waste management', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#EnergyWasteManagement', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (41, 'EnvironmentAidsAndSubsidies', 'Ayudas y subvenciones en medio ambiente', 'Aids and subsidies in the environment', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#EnvironmentAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (42, 'EnvironmentAndItsActivity', 'Medio ambiente y su actividad', 'Environment and its activity', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#EnvironmentAndItsActivity', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (43, 'Feeding', 'Alimentación', 'Feeding', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Feeding', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (44, 'FoodSafety', 'Seguridad alimentaria', 'Food safety', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#FoodSafety', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (45, 'GamesAndShows', 'Juegos y espectáculos', 'Games and shows', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#GamesAndShows', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (46, 'GamingBusiness', 'Empresas del juego', 'Game companies', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#GamingBusiness', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (47, 'HealthAidsAndSubsidies', 'Ayudas y subvenciones en salud', 'Health aids and subsidies', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (48, 'HealthEmploymentAndTraining', 'Empleo y formación en salud', 'Employment and training in health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthEmploymentAndTraining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (49, 'HealthSafetyAndQuality', 'Seguridad sanitaria y calidad', 'Health safety and quality', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthSafetyAndQuality', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (51, 'HousingAndBuilding', 'Vivienda y edificación', 'Housing and building', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#HousingAndBuilding', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (52, 'IndustrialActivities', 'Actividades industriales y energía', 'Industrial activities and energy', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#IndustrialActivities', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (53, 'InfrastructureAidsAndSubsidies', 'Ayudas y subvenciones en infraestructuras', 'Aids and subsidies in infrastructure<', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#InfrastructureAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (55, 'Livestock', 'Ganadería', 'Cattle raising', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Livestock', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (56, 'Mining', 'Minería', 'Mining', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#Mining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (57, 'OthersHealth', 'Otros salud', 'Other health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#OthersHealth', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (58, 'OthersRuralAreas', 'Otros medio rural', 'Others rural environment', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#OthersRuralAreas', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (59, 'PesticidesAndInvasiveSpecies', 'Plaguicidas y especies invasoras', 'Pesticides and invasive species', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#PesticidesAndInvasiveSpecies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (60, 'PrivateDomain', 'Dominio privado', 'Private domain', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#PrivateDomain', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (61, 'ResearchDevelopmentAndInnovation', 'Investigación, desarrollo e innovación', 'Research, development and innovation', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#ResearchDevelopmentAndInnovation', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (62, 'RightsAndPayments', 'Derechos y pagos', 'Rights and payments', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RightsAndPayments', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (63, 'Roads', 'Carreteras', 'Roads', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#Roads', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (64, 'RuralAreasAidsAndSubsidies', 'Ayudas y subvenciones en el medio rural', 'Aids and subsidies in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralAreasAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (65, 'RuralAreasEmploymentAndTraining', 'Empleo y formación en medio rural', 'Employment and training in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralAreasEmploymentAndTraining', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (66, 'RuralDevelopmentAndBiodiversity', 'Rural environment, agriculture and livestock', 'Rural development and biodiversity', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralDevelopmentAndBiodiversity', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (67, 'SecurityTransportAndTrade', 'Seguridad, transporte y comercio', 'Security, transport and trade', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#SecurityTransportAndTrade', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (68, 'SocialAidsAndSubsidies', 'Ayudas y subvenciones sociales', 'Social aids and subsidies', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#SocialAidsAndSubsidies', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (69, 'SocialCenters', 'Centros sociales', 'Social centers', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#SocialCenters', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (70, 'Sports', 'Deportes', 'Sports', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#Sports', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (72, 'TaxesPaymentsAndFees', 'Impuestos, pagos y tasas', 'Taxes, payments and fees', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#TaxesPaymentsAndFees', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (76, 'TownPlanning', 'Urbanismo', 'Town planning', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#TownPlanning', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (77, 'TradeFairsAndCrafts', 'Comercio, ferias y artesanía', 'Trade, fairs and crafts', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#TradeFairsAndCrafts', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (78, 'WasteManagement', 'Gestión de residuos', 'Waste management', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#WasteManagement', B'0', '2018-04-13');
INSERT INTO temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (80, 'WorkInPublicOrganisms', 'Trabajo en organismos públicos', 'Work in public organisms', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#WorkInPublicOrganisms', B'0', '2018-04-13');


--
-- Name: temas_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('temas_code_seq', 1, false);


--
-- Name: camposresultados camposresultados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY camposresultados
    ADD CONSTRAINT camposresultados_pkey PRIMARY KEY (code);


--
-- Name: cargavistas cargarvistas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargavistas
    ADD CONSTRAINT cargarvistas_pkey PRIMARY KEY (code);


--
-- Name: configuracionweb configuracionweb_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuracionweb
    ADD CONSTRAINT configuracionweb_pkey PRIMARY KEY (code);


--
-- Name: entidades entidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entidades
    ADD CONSTRAINT entidades_pkey PRIMARY KEY (code);


--
-- Name: facetas facetas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facetas
    ADD CONSTRAINT facetas_pkey PRIMARY KEY (code);


--
-- Name: lugares lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (code);


--
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (code);

ALTER SEQUENCE cargavistas_code_seq RESTART WITH 124;
	
--
-- PostgreSQL database dump complete
--

