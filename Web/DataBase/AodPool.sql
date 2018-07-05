

DROP TABLE public.camposresultados;
DROP SEQUENCE public.camposresultados_code_seq;
CREATE SEQUENCE public.camposresultados_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.camposresultados (
    code integer DEFAULT nextval('public.camposresultados_code_seq'::regclass) NOT NULL,
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



DROP TABLE public.configuracionweb;
DROP SEQUENCE public.configuracionweb_code_seq;
CREATE SEQUENCE public.configuracionweb_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.configuracionweb (
    code integer DEFAULT nextval('public.configuracionweb_code_seq'::regclass) NOT NULL,
    slug character varying(50) DEFAULT NULL::character varying,
    name character varying(100) DEFAULT NULL::character varying,
    configuracion text,
    active boolean DEFAULT true NOT NULL,
    created date DEFAULT now() NOT NULL
);




DROP TABLE public.entidades;
DROP SEQUENCE public.entidades_code_seq;
CREATE SEQUENCE public.entidades_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.entidades (
    code integer DEFAULT nextval('public.entidades_code_seq'::regclass) NOT NULL,
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






DROP TABLE public.facetas;
DROP SEQUENCE public.facetas_code_seq;
CREATE SEQUENCE public.facetas_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.facetas (
    code integer DEFAULT nextval('public.facetas_code_seq'::regclass) NOT NULL,
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



DROP TABLE public.lugares;
CREATE TABLE public.lugares (
    code integer NOT NULL,
    slug character varying(50),
    name character varying(60),
    type character varying(1),
    comarca_code integer,
    provincia_code integer,
    created date DEFAULT now() NOT NULL
);




DROP TABLE public.temas;
DROP SEQUENCE public.temas_code_seq;
CREATE SEQUENCE public.temas_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.temas (
    code integer DEFAULT nextval('public.temas_code_seq'::regclass) NOT NULL,
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
-- TOC entry 2272 (class 0 OID 25368)
-- Dependencies: 186
-- Data for Name: camposresultados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (1, 'http://opendata.aragon.es/def/ei2a#Document', 'ei2a:nameDocument', 'ei2a:registrationDate', '', 'ei2a:nameDocument', '', 'ei2a:nameDocument', '', true, '2018-05-22');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (2, 'http://www.w3.org/ns/org#Organization', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-05-22');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (3, 'http://www.w3.org/ns/person#Person', 'ei2a:fullName', '', '', 'ei2a:fullName', '', 'ei2a:fullName', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (4, 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'event:literal_factor', 'dc:date
', '', 'event:literal_factor', '', 'event:literal_factor', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (5, 'http://opendata.aragon.es/def/ei2a#EventHistory', 'event:literal_factor', 'dc:date', '', 'event:literal_factor', '', 'event:literal_factor', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (10, 'http://opendata.aragon.es/def/ei2ia#Line', 'dc:identifier', '', '', 'dc:identifier', '', 'dc:identifier', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (6, 'http://vocab.gtfs.org/terms#Route', 'dc:title', '', '', 'dc:title', '', 'dc:title', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (7, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (8, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');
INSERT INTO public.camposresultados (code, rdf_type, order_by, field_date, prefijo_field_date, field_name, prefijo_field_name, field_search, prefijo_field_search, active, created) VALUES (9, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', 'ei2a:organizationName', '', '', 'ei2a:organizationName', '', 'ei2a:organizationName', '', true, '2018-06-25');


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 187
-- Name: camposresultados_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camposresultados_code_seq', 1, false);


--
-- TOC entry 2274 (class 0 OID 25385)
-- Dependencies: 188
-- Data for Name: configuracionweb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuracionweb (code, slug, name, configuracion, active, created) VALUES (2, 'OrdenanzaGeneralMunicipio', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 'BodyClass: fichaComunidad fichaOrdenanza
PanelCentral:
  Titulo: http://opendata.aragon.es/def/ei2a#nameDocument    
  CampoValores:
    CampoValor1:
      Tipo: Virtuoso
      Oculto: False
      Query: select  ?nombreMunicipio ?texto ?fechaPublicacion ?fechaAprobacion ?tipo ?apliacion where { optional {?ordenanza <http://opendata.aragon.es/def/ei2a#nameDocument> ?texto .} optional {?ordenanza <http://www.w3.org/2003/01/geo/wgs84_pos#location> ?localidad . 	?localidad <http://opendata.aragon.es/def/ei2a#organizationName> ?nombreMunicipio .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#registrationDate> ?fechaPublicacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#startDate> ?fechaAprobacion .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#documentType> ?tipo .} optional {?ordenanza <http://opendata.aragon.es/def/ei2a#observations> ?apliacion .} filter(?ordenanza = <%s>)}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Municipio
          Valor: nombreMunicipio
        Campo2:
          Nombre: Fecha acuerdo
          Valor: fechaAprobacion
        Campo3:
          Nombre: Fecha publicación
          Valor: fechaPublicacion
    CampoValor2:
      Tipo: Api
      Oculto: True
      OcultoTexto : Ver resto de fechas de la ordenanza
      Query: select ?source where  {<%s> <http://purl.org/dc/elements/1.1/source> ?source}
      Campo: uri
      Campos:
        Campo1:
          Nombre: Fecha de acuerdo de aporbación definitiva 
          Valor: F_ACUERDO_APRO_DEF
        Campo2:
          Nombre: Fecha de publicación de aporbación definitiva 
          Valor: F_PUBLICACION_APRO_DEF
        Campo3:
          Nombre: Año
          Valor: ANO
        Campo4:
          Nombre: Fecha de acuerdo de apobación inicial de la modificación
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
        Texto: Ver más.
        url: /filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_general_municipio%3E__
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
        Texto: Ver más.
        url: /filtros?tem=&stem=&pro=&com=&mun=%s&ent=46&sent=&from=Lugares&filt=Tipos__dc%3Atype__%3Chttp%3A%2F%2Fopendata.aragon.es%2Fdef%2Fei2a%23ordenanza_fiscal_municipio%3E__
        CampoParseo: 
          Query: select ?parseo where  { <%s>  <http://purl.org/dc/elements/1.1/identifier> ?parseo .}
          Campo: http://www.w3.org/2003/01/geo/wgs84_pos#location', true, '2018-06-18');
INSERT INTO public.configuracionweb (code, slug, name, configuracion, active, created) VALUES (3, 'Ruta', 'http://opendata.aragon.es/def/ei2a#ruta', 'BodyClass: fichaComunidad fichaLugar
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
PanelLateral:
    Texto:
        Tipo: HTML
        Query: none
        Campo: none
        Html: <h3>Texto Libre</h2><br/><p class=''dato''><strong>Dirección</strong><span>Camino de la estación, 27</span></p><p class=''dato''><strong>CIF</strong><span>P-2200100-B</span></p>', true, '2018-07-04');
INSERT INTO public.configuracionweb (code, slug, name, configuracion, active, created) VALUES (1, 'Organization', 'http://www.w3.org/ns/org#Organization', 'BodyClass: fichaComunidad fichaLugar
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  Mapa:
    Tipo: idearagon
    Valor: http://idearagon.aragon.es/visor/index.html?ACTIVELAYER=Localidad&amp;QUERY=c_muni_ine=%s&amp;HERRAMIENTAS=NO
    Campo: http://purl.org/dc/elements/1.1/identifier
  Texto: 
    Tipo: Virtuoso
    Query:  select ?nombrePersona where  {?membership <http://www.w3.org/ns/org#organization> <http://opendata.aragon.es/def/ei2a#municipio-22001> . ?membership <http://www.w3.org/ns/org#member> ?member. ?membership  <http://www.w3.org/ns/org#role> ?role . ?member <http://opendata.aragon.es/def/ei2a#fullName> ?nombrePersona . ?role <http://opendata.aragon.es/def/ei2a#roleName> ?roleName .?member <http://www.w3.org/ns/person#memberOf> ?partido .	?partido <http://opendata.aragon.es/def/ei2a#organizationName> ?nombrePartido. ?member <http://opendata.aragon.es/def/ei2a#fullName> "ADOLFO PUENTE OLIVEROS (IND)" .}
    Campo:  uri
    Html: <h1>Hola Mundo </h1>
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
      Titulo: Padrón 
      Descripcion: Habitantes según el padrón municipal, datos anuales 
      Query: select SUBSTR(?year,0,4) as ?year ?population where{ ?obs <http://purl.org/linked-data/cube#dataSet> <http://opendata.aragon.es/recurso/DataSet/PadronMunicipal> . ?obs ?x ?y  . {?obs <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?uriAragopedia . <%s> owl:sameAs ?uriAragopedia} UNION {<%s> owl:sameAs ?uriAragopedia. ?uriAragopedia <http://opendata.aragon.es/def/Aragopedia#hasObservation> ?obs} ?obs <http://opendata.aragon.es/def/Aragopedia#year> ?year. ?obs <http://opendata.aragon.es/def/Aragopedia#population> ?population.  } ORDER BY ?year
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
      Query: select ?nombrePersona ?cargo where  {?membership <http://www.w3.org/ns/org#organization> <%s> . ?membership <http://www.w3.org/ns/org#member> ?member. ?membership  <http://www.w3.org/ns/org#role> ?role . ?member <http://opendata.aragon.es/def/ei2a#fullName> ?nombrePersona . ?role <http://opendata.aragon.es/def/ei2a#roleName> ?roleName .?member <http://www.w3.org/ns/person#memberOf> ?partido .	?partido <http://opendata.aragon.es/def/ei2a#organizationName> ?nombrePartido. bind(concat(?roleName, '' '' , ?nombrePartido) as ?cargo)}
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
          Texto: Aragopedia
          url: http://opendata.aragon.es/aragopedia/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace2:
          Texto: ELDA
          url: http://opendata.aragon.es/elda/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace3:
          Texto: Presupuesto
          url: http://opendata.aragon.es/presupuesto/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace4:
          Texto: Datos en Aragón Open data
          url: http://opendata.aragon.es/opendata/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
    ListaEnlace2:
      Titulo: Enlaces de interes 
      #gadget-iconos gadget-enlaces gadget-masinfo
      Tipo: gadget-enlaces
      Enlaces:
        Enlace1:
          Texto: Ver ordenanzas municipales de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: http://opendata.aragon.es/ordenanzas/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace2:
          Texto: Ver información turística de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: http://opendata.aragon.es/turismo/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace3:
          Texto: Ver información de agricultura de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: http://opendata.aragon.es/agricultura/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace4:
          Texto: Ver datos del instituto aragoñés del agua de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName
          url: http://opendata.aragon.es/instituto-agua/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier
        Enlace5:
          Texto: Ver rutas de autobús de %s
          CampoTexto: http://opendata.aragon.es/def/ei2a#organizationName   
          url: http://opendata.aragon.es/rutas-autobus/municipio/%s
          CampoUrl: http://purl.org/dc/elements/1.1/identifier', true, '2018-06-18');
INSERT INTO public.configuracionweb (code, slug, name, configuracion, active, created) VALUES (4, 'AlojamientoHotelero', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 'BodyClass: fichaComunidad fichaHotel
PanelCentral:
  #titulo del panel
  Titulo: http://opendata.aragon.es/def/ei2a#organizationName
  Votos:
        Query: select ?body where {?s <http://protege.stanford.edu/rdf/HTOv4002#award> ?award. ?award <http://protege.stanford.edu/rdf/HTOv4002#awardingBody> ?body. filter(?s = <%s>)}
        Campo: uri
  Texto:
        Tipo: HTML
        Query: none
        Campo: none
        Html: <h3>Texto Libre</h2><br/><p class=''dato''><strong>Dirección</strong><span>Camino de la estación, 27</span></p><p class=''dato''><strong>CIF</strong><span>P-2200100-B</span></p>
PanelLateral:
  Texto:
        Tipo: HTML
        Query: none
        Campo: none
        Html: <h3>Texto Libre</h2><br/><p class=''dato''><strong>Dirección</strong><span>Camino de la estación, 27</span></p><p class=''dato''><strong>CIF</strong><span>P-2200100-B</span></p>', true, '2018-06-28');





--
-- TOC entry 2276 (class 0 OID 25397)
-- Dependencies: 190
-- Data for Name: entidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (36, 'bloque-persona', 'Personas', 'Person', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#person', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (145, 'point', 'Point', 'Point', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#point', 0, B'0', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (141, 'turismo', 'Turismo', 'Turismo', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#turismo', 140, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (142, 'sendero', 'Sendero', 'Sendero', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#sendero', 141, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (143, 'transporte', 'Transporte', 'Transporte', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#transporte', 140, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (146, 'transporte', 'Transporte', 'Transporte', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#transporte', 145, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (103, 'superficies_agrarias_cultivadas_por_municipios_cultivatedsurface', 'Superficies agrarias cultivadas por municipios (CultivatedSurface)', 'Superficies agrarias cultivadas por municipios (CultivatedSurface)', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#superficies_agrarias_cultivadas_por_municipios_cultivatedsurface', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (104, 'bloque-agua', 'Agua', 'Agua', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#agua', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (105, 'sumidero', 'Sumidero', 'Sumidero', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#sumidero', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (106, 'ramal', 'Ramal', 'Ramal', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#ramal', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (107, 'pozo', 'Pozo', 'Pozo', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#pozo', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (108, 'potabilizadora', 'Potabilizadora', 'Potabilizadora', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#potabilizadora', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (109, 'llave_corte', 'Llave corte', 'Llave corte', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#llave_corte', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (110, 'hidrante', 'Hidrante', 'Hidrante', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#hidrante', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (111, 'emisario', 'Emisario', 'Emisario', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#emisario', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (112, 'edar', 'Edar', 'Edar', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#edar', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (94, 'solicitud_pac', 'Solicitud PAC', 'Solicitud PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#solicitud_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (114, 'depuradora', 'Depuradora', 'Depuradora', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#depuradora', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (117, 'colector', 'Colector', 'Colector', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#colector', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (119, 'cámara_limpia', 'Cámara limpia', 'Cámara limpia', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#camara_limpia', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (120, 'boca_de_riego', 'Boca de riego', 'Boca de riego', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#boca_riego', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (46, 'bloque-documento', 'Documentos', 'Document', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#document', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (98, 'códigos_de_cultivos_herbáceos_pac', 'Códigos de cultivos herbáceos PAC', 'Códigos de cultivos herbáceos PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_cultivos_herbaceos_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (132, 'transporte', 'Transporte', 'Transporte', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#transporte', 121, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (102, 'clases_de_cultivos', 'Clases de cultivos', 'Clases de cultivos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#clase_cultivo', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (86, 'bloque-evento', 'Eventos', 'Evento', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#evento', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (91, 'relaciones_institucionales,_procesos_electorales', 'Relaciones Institucionales, Procesos Electorales', 'Relaciones Institucionales, Procesos Electorales', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#relaciones_institucionales,_procesos_electorales', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (93, 'bloque-pac', 'PAC', 'PAC', '', '', 'PAC ', 'http://opendata.aragon.es/def/ei2a#pac', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (129, 'cra_datos_de_itinerarios_de_las_rutas_trip', 'CRA - Datos de itinerarios de las rutas (Trip)', 'CRA - Datos de itinerarios de las rutas (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#itinerario_ruta', 128, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (135, 'expedicion_parada_horario_stoptime', 'Expedicion Parada Horario (StopTime)', 'Expedicion Parada Horario (StopTime)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expedicion_parada_y_horario', 132, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (121, 'bloque-transporte', 'Transportes', 'Transporte', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#transporte', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (122, 'arabus', 'Arabus', 'Arabus', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#arabus', 121, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (128, 'cra', 'CRA', 'CRA', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#cra', 121, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (131, 'cra_datos_de_las_rutas_route', 'CRA – Datos de las rutas (Route)', 'CRA – Datos de las rutas (Route)', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#cra_datos_ruta', 128, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (113, 'distribución', 'Distribución', 'Distribución', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#distribucion', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (115, 'depósito', 'Depósito', 'Depósito', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#deposito', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (100, 'códigos_de_cultivos_lenosos_pac', 'Códigos de cultivos lenosos PAC', 'Códigos de cultivos lenosos PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_cultivos_lenosos_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (101, 'códigos_de_variedades_lenosas_pac', 'Códigos de variedades lenosas PAC', 'Códigos de variedades lenosas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_variedades_lenosas_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (116, 'conducción', 'Conducción', 'Conducción', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#conduccion', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (118, 'captación', 'Captación', 'Captación', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', 'http://opendata.aragon.es/def/ei2a#captacion', 104, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (124, 'expediciones_paradas_horarios_stoptime', 'Expediciones, Paradas y Horarios (StopTime)', 'Expediciones, Paradas y Horarios (StopTime)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expediciones_paradas_horarios_stoptime', 122, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (125, 'paradas_stop', 'Paradas (Stop)', 'Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#paradas_stop', 122, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (126, 'rutas_route', 'Rutas (Route)', 'Rutas (Route)', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#rutas_route', 122, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (144, 'arabus_rutas', 'ARABUS - Rutas', 'ARABUS - Rutas', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#arabus_rutas', 143, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (48, 'ordenanza_general', 'Ordenanza General', 'Ordenanza General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (30, 'oficinas_comarcales', 'Oficinas comarcales', 'Oficinas comarcales', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#oficinas_comarcales', 28, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (31, 'transporte', 'Transporte', 'Transporte', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#transporte', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (58, 'ordenanza_fiscal', 'Ordenanza Fiscal', 'Ordenanza Fiscal', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (4, 'agrupación_secretarial', 'Agrupación secretarial', 'Agrupación secretarial', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agrupacion_secretarial', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (137, 'location', 'Location', 'Location', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#location', 0, B'0', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (97, 'códigos_catastrales_sigpac_parcelas_pac', 'Códigos catastrales y SIGPAC, parcelas PAC', 'Códigos catastrales y SIGPAC, parcelas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_catastrales_sigpac_parcelas_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (69, 'modificaciones_de_planeamiento_de_desarrollo', 'Modificaciones de Planeamiento de Desarrollo', 'Modificaciones de Planeamiento de Desarrollo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_desarrollo', 67, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (70, 'modificaciones_de_planeamiento_general', 'Modificaciones de Planeamiento General', 'Modificaciones de Planeamiento General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#modificaciones_planeamiento_general', 67, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (71, 'planeamiento_de_desarrollo', 'Planeamiento de Desarrollo', 'Planeamiento de Desarrollo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento_desarrollo', 67, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (72, 'planeamiento_general', 'Planeamiento General', 'Planeamiento General', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento_general', 67, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (78, 'transporte', 'Transporte', 'Transporte', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (81, 'iaa', 'IAA', 'IAA', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (83, 'iaa_contratos_gastos_anuales', 'IAA – Contratos gastos anuales', 'IAA – Contratos gastos anuales', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contratos_gastos_anuales', 81, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (17, 'turismo', 'Turismo', 'Turismo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#turismo', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (1, 'bloque-organizacion', 'Organizaciones', 'Organization', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organization', 0, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (140, 'line', 'Line', 'Line', '', '', 'Line', 'http://opendata.aragon.es/def/ei2a#line', 0, B'0', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (11, 'mancomunidad', 'Mancomunidad', 'Mancomunidad', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#mancomunidad', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (20, 'alojamientos_hoteleros', 'Alojamientos hoteleros', 'Alojamientos hoteleros', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (28, 'agricultura', 'Agricultura', 'Agricultura', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agricultura', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (19, 'albergues_refugios', 'Albergues y refugios', 'Albergues y refugios', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#albergue_refugio', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (22, 'cafeterías_restaurantes', 'Cafeterías y Restaurantes', 'Cafeterías y Restaurantes', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#cafeteria_restaurante', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (23, 'campings_turísticos', 'Campings Turísticos', 'Campings Turísticos', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#camping_turistico', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (27, 'alojamientos_de_turismo_rural', 'Alojamientos de Turismo Rural', 'Alojamientos de Turismo Rural', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#alojamiento_rural', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (85, 'dara_archivos_de_aragón', 'DARA – Archivos de Aragón', 'DARA – Archivos de Aragón', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#dara_archivos_aragon', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (99, 'códigos_de_variedades_herbáceas_pac', 'Códigos de variedades herbáceas PAC', 'Códigos de variedades herbáceas PAC', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#codigos_variedades_herbaceas_pac', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (18, 'agencias_de_viaje', 'Agencias de viaje', 'Agencias de viaje', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agencia_viaje', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (21, 'apartamentos_turísticos', 'Apartamentos turísticos', 'Apartamentos turísticos', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#apartamento_turistico', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (79, 'arabus_concesiones', 'ARABUS - Concesiones', 'ARABUS - Concesiones', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#arabus_concesion', 78, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (32, 'arabus_operadores', 'ARABUS - Operadores', 'ARABUS - Operadores', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#operador', 31, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (147, 'arabus_paradas', 'ARABUS - Paradas', 'ARABUS - Paradas', '', '', 'Point', 'http://opendata.aragon.es/def/ei2a#arabus_parada', 146, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (33, 'arabus_transportistas', 'ARABUS – Transportistas', 'ARABUS – Transportistas', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#transportista', 31, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (45, 'cargos', 'Cargos', 'Cargos', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#cargo', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (77, 'colecciones_de_museos_de_aragon', 'Colecciones de Museos de Aragon', 'Colecciones de Museos de Aragon', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#colecciones_museos_aragon', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (2, 'comarca', 'Comarca', 'Comarca', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#comarca', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (29, 'comarcas_agrarias', 'Comarcas agrarias', 'Comarcas agrarias', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#comarca_agraria', 28, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (5, 'consorcio', 'Consorcio', 'Consorcio', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#consorcio', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (34, 'cra_centros', 'CRA – Centros', 'CRA – Centros', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#cra_centro', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (6, 'diputación', 'Diputación', 'Diputación', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#diputacion', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (7, 'dirección_de_interés', 'Dirección de interés', 'Dirección de interés', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#direccion_de_interes', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (26, 'empresas_de_turismo_activo', 'Empresas de Turismo Activo', 'Empresas de Turismo Activo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#empresa_turismo_activo', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (8, 'entidad_menor', 'Entidad menor', 'Entidad menor', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_menor', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (9, 'entidad_singular', 'Entidad singular', 'Entidad singular', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_singular', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (35, 'entidades', 'Entidades', 'Entidades', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (10, 'fundación', 'Fundación', 'Fundación', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#fundacion', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (44, 'guías_de_turismo', 'Guías de Turismo', 'Guías de Turismo', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#guia_turismo', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (82, 'iaa_contratos', 'IAA - Contratos', 'IAA - Contratos', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contrato', 81, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (84, 'iaa_contratos_depuradoras_incluidas', 'IAA – Contratos depuradoras incluidas', 'IAA – Contratos depuradoras incluidas', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#iaa_contrato_depuradora', 81, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (38, 'miembro_de_pleno_comarcal', 'Miembro de Pleno Comarcal', 'Miembro de Pleno Comarcal', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_comarcal', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (39, 'miembro_de_pleno_consorcio', 'Miembro de Pleno Consorcio', 'Miembro de Pleno Consorcio', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_consorcio', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (40, 'miembro_de_pleno_entidad_menor', 'Miembro de Pleno Entidad menor', 'Miembro de Pleno Entidad menor', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_entidad_menor', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (41, 'miembro_de_pleno_mancomunidad', 'Miembro de Pleno Mancomunidad', 'Miembro de Pleno Mancomunidad', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_mancomunidad', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (37, 'miembro_de_pleno_municipal', 'Miembro de Pleno Municipal', 'Miembro de Pleno Municipal', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_municipal', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (42, 'miembro_de_pleno_organismo_autónomo', 'Miembro de Pleno Organismo autónomo', 'Miembro de Pleno Organismo autónomo', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_organismo_autonomo', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (43, 'miembro_de_pleno_villas_tierras', 'Miembro de Pleno Villas y tierras', 'Miembro de Pleno Villas y tierras', '', '', 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_villas_y_tierras', 36, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (3, 'municipio', 'Municipio', 'Municipio', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (73, 'noticia', 'Noticia', 'Noticia', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#noticia', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (12, 'núcleo', 'Núcleo', 'Núcleo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#nucleo', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (24, 'oficinas_de_turismo', 'Oficinas de Turismo', 'Oficinas de Turismo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#oficina_turismo', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (60, 'ordenanza_fiscal_comarca', 'Ordenanza Fiscal Comarca', 'Ordenanza Fiscal Comarca', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (61, 'ordenanza_fiscal_de_consorcio', 'Ordenanza fiscal de consorcio', 'Ordenanza fiscal de consorcio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (62, 'ordenanza_fiscal_de_diputación', 'Ordenanza fiscal de diputación', 'Ordenanza fiscal de diputación', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (63, 'ordenanza_fiscal_de_entidad_menor', 'Ordenanza fiscal de entidad menor', 'Ordenanza fiscal de entidad menor', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (64, 'ordenanza_fiscal_de_mancomunidad', 'Ordenanza fiscal de mancomunidad', 'Ordenanza fiscal de mancomunidad', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (59, 'ordenanza_fiscal_municipio', 'Ordenanza Fiscal Municipio', 'Ordenanza Fiscal Municipio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (134, 'expediciones_trip', 'Expediciones (Trip)', 'Expediciones (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#expedicion', 132, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (130, 'cra_paradas_stop', 'CRA - Paradas (Stop)', 'CRA - Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#cra_parada', 128, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (139, 'cra_localidades', 'CRA - Localidades', 'CRA - Localidades', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#cra_localidad', 137, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (138, 'iaf_polígonos_industriales', 'IAF polígonos industriales', 'IAF polígonos industriales', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#iaf_poligono_industrial', 137, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (87, 'dato_elección', 'Dato Elección', 'Dato Elección', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#eleccion', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (88, 'curso', 'Curso', 'Curso', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#curso', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (123, 'expediciones_trip', 'Expediciones (Trip)', 'Expediciones (Trip)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#transporte_expedicion', 122, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (65, 'ordenanza_fiscal_de_organismo_autónomo', 'Ordenanza fiscal de organismo autónomo', 'Ordenanza fiscal de organismo autónomo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (66, 'ordenanza_fiscal_de_villas_tierras', 'Ordenanza fiscal de villas y tierras', 'Ordenanza fiscal de villas y tierras', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras', 58, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (50, 'ordenanza_general_comarca', 'Ordenanza General Comarca', 'Ordenanza General Comarca', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (51, 'ordenanza_general_de_consorcio', 'Ordenanza General de consorcio', 'Ordenanza General de consorcio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (52, 'ordenanza_general_de_diputación', 'Ordenanza General de diputación', 'Ordenanza General de diputación', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (53, 'ordenanza_general_de_entidad_menor', 'Ordenanza General de entidad menor', 'Ordenanza General de entidad menor', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (54, 'ordenanza_general_de_mancomunidad', 'Ordenanza General de mancomunidad', 'Ordenanza General de mancomunidad', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (49, 'ordenanza_general_municipio', 'Ordenanza General Municipio', 'Ordenanza General Municipio', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (55, 'ordenanza_general_de_núcleo', 'Ordenanza General de núcleo', 'Ordenanza General de núcleo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_nucleo', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (56, 'ordenanza_general_de_organismo_autónomo', 'Ordenanza General de organismo autónomo', 'Ordenanza General de organismo autónomo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (57, 'ordenanza_general_de_villas_tierras', 'Ordenanza General de villas y tierras', 'Ordenanza General de villas y tierras', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras', 48, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (13, 'organismo_autónomo', 'Organismo autónomo', 'Organismo autónomo', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organismo_autonomo', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (14, 'organización_complementaria', 'Organización complementaria', 'Organización complementaria', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organizacion_complementaria', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (95, 'parcelas_pac_cultivos_herbáceos', 'Parcelas PAC, cultivos herbáceos', 'Parcelas PAC, cultivos herbáceos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#parcela_pac_cultivo_herbace', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (96, 'parcelas_pac_cultivos_lenosos', 'Parcelas PAC, cultivos lenosos', 'Parcelas PAC, cultivos lenosos', '', '', 'PAC', 'http://opendata.aragon.es/def/ei2a#parcela_pac_cultivos_lenosos', 93, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (67, 'planeamiento', 'Planeamiento', 'Planeamiento', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (68, 'planeamiento', 'Planeamiento', 'Planeamiento', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#planeamiento', 67, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (74, 'plantilla', 'Plantilla', 'Plantilla', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#plantilla', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (75, 'presupuesto', 'Presupuesto', 'Presupuesto', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#presupuesto', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (25, 'puntos_de_información_turística', 'Puntos de Información Turística', 'Puntos de Información Turística', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#punto_informacion_turistica', 17, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (47, 'símbolo', 'Símbolo', 'Símbolo', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#simbolo', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (15, 'sociedad_mercantil', 'Sociedad mercantil', 'Sociedad mercantil', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#sociedad_mercantil', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (80, 'transporte_concesiones', 'Transporte - Concesiones', 'Transporte - Concesiones', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#transporte_concesion', 78, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (148, 'transporte_paradas', 'TRANSPORTE - Paradas', 'TRANSPORTE - Paradas', '', '', 'Point', 'http://opendata.aragon.es/def/ei2ia#transporte_parada', 146, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (16, 'villas_tierras', 'Villas y tierras', 'Villas y tierras', '', '', 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#villas_y_tierras', 1, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (76, 'vivienda_rehabilitación_fianzas_datos_anuales', 'Vivienda y rehabilitación, Fianzas Datos Anuales', 'Vivienda y rehabilitación, Fianzas Datos Anuales', '', '', 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#fianzas_datos_anuales_vivienda_y_rehabilitacion', 46, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (136, 'paradas_stop', 'Paradas (Stop)', 'Paradas (Stop)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#parada', 132, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (133, 'rutas_route', 'Rutas (Route)', 'Rutas (Route)', '', '', 'http://vocab.gtfs.org/terms#Route', 'http://opendata.aragon.es/def/ei2a#ruta', 132, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (89, 'postgrado', 'Postgrado', 'Postgrado', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#postgrado', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (90, 'registro_de_llamadas', 'Registro de llamadas', 'Registro de llamadas', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#registro_llamada', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (92, 'periodo_de_legislatura', 'Periodo de legislatura', 'Periodo de legislatura', '', '', 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#periodo_legislatura', 86, B'1', '2018-05-15');
INSERT INTO public.entidades (code, slug, name_es, name_en, comment_es, comment_en, rdf_type, dc_type, parent_code, active, created) VALUES (127, 'servicios_service', 'Servicios (Service)', 'Servicios (Service)', '', '', 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', 'http://opendata.aragon.es/def/ei2a#servicio', 122, B'1', '2018-05-15');



--
-- TOC entry 2278 (class 0 OID 25406)
-- Dependencies: 192
-- Data for Name: facetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (4, 'Default', '', 'dc:type', '', 'Tipos', '', 2, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (6, 'http://opendata.aragon.es/def/ei2a#Document', '', 'dc:type', '', 'Tipos', '', 2, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (14, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:AdministraciónLocal', '', 'Nivel administrativo', '', 3, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (7, 'http://opendata.aragon.es/def/ei2a#Document', '', 'ei2a:documentType', '', 'Document Type', '', 3, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (1, 'Default', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', '', 3, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (2, 'Default', '', 'wgs84_pos:location@org:subOrganizationOf@ei2a:organizationName', '', 'Comarcas', '', 4, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (3, 'Default', '', 'dc:type@rdf:type', '', 'Temas', '', 1, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (5, 'http://opendata.aragon.es/def/ei2a#Document', '', 'dc:type@rdf:type', '', 'Temas', '', 1, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (27, 'http://opendata.aragon.es/def/ei2a#EventAgenda', 'http://opendata.aragon.es/def/ei2a#eleccion', 'event:place@dc:identifier', 'PREFIX event:<http://purl.org/NET/c4dm/event.owl#>', 'Municipio', '', 1, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (15, 'http://www.w3.org/ns/org#Organization', '', 'wgs84_pos:location@ei2a:organizationName', 'PREFIX vcard:<http://www.w3.org/2006/vcard/ns#>
', 'Municipio', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Ayuntamiento', 4, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (8, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_municipio', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', '', 4, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (9, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_municipio', 'wgs84_pos:location@ei2a:organizationName', '', 'Municipios', '', 5, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (10, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_comarca', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', '', 4, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (11, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_comarca', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarcas', '', 5, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (16, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@ei2a:organizationName', '', 'Comarcas', 'org:subOrganizationOf@ei2a:publicEntityType=ei2a:Comarca', 5, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (17, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@rdfs:label', '', 'Provincias', 'org:subOrganizationOf@rdf:type=<http://dbpedia.org/ontology/Province>', 6, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (13, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:organizationType@rdfs:label', '', 'Tipo de organización', '', 2, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (18, 'http://www.w3.org/ns/person#Person', '', 'person:memberOf@ei2a:organizationName', 'PREFIX person:<http://www.w3.org/ns/person#>', 'Partido', '', 1, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (32, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'harmonise:accommodationType@harmonise:refencedValue@harmonise:domainValue', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Categoria', '', 1, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (33, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', '', 'harmonise:schedule@harmonise:season', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Periodo abierto', '', 2, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (30, 'http://vocab.gtfs.org/terms#Route', '', 'gtfs:originStop@wgs84_location@dc:identifier', 'PREFIX gtfs:<http://vocab.gtfs.org/terms#>', 'Origen', '', 1, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (31, 'http://vocab.gtfs.org/terms#Route', '', 'gtfs:destinationStop@wgs84_location@dc:identifier', 'PREFIX gtfs:<http://vocab.gtfs.org/terms#>', 'Destino', '', 2, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (12, 'http://www.w3.org/ns/org#Organization', '', 'ei2a:publicEntityType@rdfs:label', '', 'Tipo de entidad pública', '', 1, true, '2018-05-22');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (19, 'http://www.w3.org/ns/person#Person', '', 'org:hasMembership@org:role@ei2a:roleName', '', 'Cargo', '', 2, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (20, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_municipal', 'wgs84_pos:location@dc:identifier', '', 'Municipio', '', 3, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (21, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_comarcal', 'wgs84_pos:location@dc:identifier', '', 'Comarca', '', 4, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (22, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 5, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (23, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Etidad menor', '', 6, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (24, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 7, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (25, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 8, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (26, 'http://www.w3.org/ns/person#Person', 'http://opendata.aragon.es/def/ei2a#miembro_pleno_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 9, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (28, 'http://opendata.aragon.es/def/ei2a#EventAgenda', '', 'dc:date', '', 'Año', '', 2, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (29, 'http://opendata.aragon.es/def/ei2a#EventHistory', '', 'dc:date', '', 'Año', '', 3, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (35, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'wgs84_pos:location@dc:identifier', '', 'Municipio', '', 4, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (36, 'http://protege.stanford.edu/rdf/HTOv4002#Attraction', '', 'wgs84_pos:location@dc:identifier', '', 'Municipio', '', 5, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (37, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', '', 'wgs84_pos:location@dc:identifier', '', 'Municipio', '', 6, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (42, 'http://opendata.aragon.es/def/ei2a#Line', 'http://opendata.aragon.es/def/ei2a#sendero', 'dc:format', '', 'Tipo', '', 11, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (43, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@ei2a:organizationName', '', 'Comarca', '', 4, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (44, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#municipio', 'org:subOrganizationOf@rdfs:label', '', 'Provincia', '', 5, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (45, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#agrupacion_secretarial', 'wgs84_pos:location@dc:identifier', '', 'Municipios', '', 6, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (46, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#entidad_singular', 'wgs84_pos:location@dc:identifier', '', 'Municipios', '', 7, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (47, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#fundacion', 'wgs84_pos:location@dc:identifier', '', 'Lugar', '', 8, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (48, 'http://www.w3.org/ns/org#Organization', 'http://opendata.aragon.es/def/ei2a#organizacion_complementaria', 'ei2a:subOrganizationOf@dc:identifier', '', 'Lugar', '', 9, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (49, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 6, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (50, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_consorcio', 'wgs84_pos:location@dc:identifier', '', 'Consorcio', '', 7, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (51, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_diputacion', 'wgs84_pos:location@dc:identifier', '', 'Diputacion', '', 8, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (52, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_diputacion', 'wgs84_pos:location@dc:identifier', '', 'Diputacion', '', 9, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (53, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Enitdad menor', '', 10, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (54, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_entidad_menor', 'wgs84_pos:location@dc:identifier', '', 'Enitdad menor', '', 11, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (55, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 12, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (56, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_mancomunidad', 'wgs84_pos:location@dc:identifier', '', 'Mancomidad', '', 13, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (57, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 14, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (58, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_organismo_autonomo', 'wgs84_pos:location@dc:identifier', '', 'Organismo autonomo', '', 15, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (59, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_fiscal_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 16, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (60, 'http://opendata.aragon.es/def/ei2a#Document', 'http://opendata.aragon.es/def/ei2a#ordenanza_general_villas_y_tierras', 'wgs84_pos:location@dc:identifier', '', 'Villas y tierras', '', 17, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (61, 'http://www.w3.org/ns/org#Organization', '', 'wgs84_pos:location@ei2a:organizationName', '', 'Comarca', 'wgs84_pos:location@ei2a:publicEntityType=ei2a:Comarca', 10, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (34, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', '', 'harmonise:schedule@harmonise:season', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Periodo abierto', '', 3, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (38, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'http://opendata.aragon.es/def/ei2a#alojamiento_hotelero', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Estrellas', '', 7, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (39, 'http://protege.stanford.edu/rdf/HTOv4002#Gastro', 'http://opendata.aragon.es/def/ei2a#cafeteria_restaurante', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Tenedores', '', 8, true, '2018-06-25');
INSERT INTO public.facetas (code, rdf_type, dc_type, faceta, prefijo_faceta, name_head, condition, orden, active, created) VALUES (40, 'http://protege.stanford.edu/rdf/HTOv4002#Accommodation', 'http://opendata.aragon.es/def/ei2a#camping_turistico', 'harmonise:award@harmonise:awardingBody', 'PREFIX harmonise:<http://protege.stanford.edu/rdf/HTOv4002#>', 'Categoria', '', 9, true, '2018-06-25');




--
-- TOC entry 2280 (class 0 OID 25421)
-- Dependencies: 194
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50035, 'artieda', 'Artieda', 'M', 1, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7823, 'zaragora', 'Zaragoza', 'P', 0, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50168, 'mianos', 'Mianos', 'M', 1, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50232, 'salvatierradeesca', 'Salvatierra de Esca', 'M', 1, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50245, 'sigues', 'Sigüés', 'M', 1, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50250, 'talamantes', 'Talamantes', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50031, 'arandademoncayo', 'Aranda de Moncayo', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50057, 'breadearagon', 'Brea de Aragón', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50069, 'calcena', 'Calcena', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50121, 'gotor', 'Gotor', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50126, 'illueca', 'Illueca', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50130, 'jarque', 'Jarque', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50166, 'mesonesdeisuela', 'Mesones de Isuela', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50198, 'oseja', 'Oseja', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50214, 'pomer', 'Pomer', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50221, 'purujosa', 'Purujosa', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50243, 'sestrica', 'Sestrica', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50254, 'tierga', 'Tierga', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50266, 'trasobares', 'Trasobares', 'M', 14, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (1, 'lajacetania', 'La Jacetania', 'C', 1, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (10, 'losmonegros', 'Los Monegros', 'C', 10, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (12, 'tarazonayelmoncayo', 'Tarazona y el Moncayo', 'C', 12, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (13, 'campodeborja', 'Campo de Borja', 'C', 13, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (14, 'aranda', 'Aranda', 'C', 14, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (15, 'riberaaltadelebro', 'Ribera Alta del Ebro', 'C', 15, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (16, 'valdejalon', 'Valdejalón', 'C', 16, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (18, 'riberabajadelebro', 'Ribera Baja del Ebro', 'C', 18, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (2, 'altogallego', 'Alto Gállego', 'C', 2, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (20, 'comunidaddecalatayud', 'Comunidad de Calatayud', 'C', 20, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (21, 'campodecarinena', 'Campo de Cariñena', 'C', 21, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22, 'campodebelchite', 'Campo de Belchite', 'C', 22, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (23, 'bajomartin', 'Bajo Martín', 'C', 23, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (24, 'campodedaroca', 'Campo de Daroca', 'C', 24, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (25, 'jiloca', 'Jiloca', 'C', 25, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (26, 'cuencasmineras', 'Cuencas Mineras', 'C', 26, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (28, 'bajoaragon', 'Bajo Aragón', 'C', 28, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (29, 'comunidaddeteruel', 'Comunidad de Teruel', 'C', 29, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (3, 'sobrarbe', 'Sobrarbe', 'C', 3, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (30, 'maestrazgo', 'Maestrazgo', 'C', 30, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (31, 'sierradealbarracin', 'Sierra de Albarracín', 'C', 31, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (4, 'laribagorza', 'La Ribagorza', 'C', 4, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (5, 'cincovillas', 'Cinco Villas', 'C', 5, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7, 'somontanodebarbastro', 'Somontano de Barbastro', 'C', 7, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (8, 'cincamedio', 'Cinca Medio', 'C', 8, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50008, 'alagon', 'Alagón', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50013, 'alcaladeebro', 'Alcalá de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50043, 'barboles', 'Bárboles', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50053, 'boquineni', 'Boquiñeni', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50064, 'cabanasdeebro', 'Cabañas de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50107, 'figueruelas', 'Figueruelas', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50118, 'gallur', 'Gallur', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50123, 'grisen', 'Grisén', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50132, 'joyosala', 'Joyosa (La)', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50147, 'luceni', 'Luceni', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50204, 'pedrola', 'Pedrola', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50209, 'pinseque', 'Pinseque', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50212, 'pleitas', 'Pleitas', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50217, 'pradilladeebro', 'Pradilla de Ebro', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50223, 'remolinos', 'Remolinos', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50247, 'sobradiel', 'Sobradiel', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50262, 'torresdeberrellen', 'Torres de Berrellén', 'M', 15, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50024, 'almonaciddelasierra', 'Almonacid de la Sierra', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50025, 'almuniadedonagodinala', 'Almunia de Doña Godina (La)', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50026, 'alpartir', 'Alpartir', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50044, 'bardallur', 'Bardallur', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50068, 'calatorao', 'Calatorao', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50093, 'chodes', 'Chodes', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50099, 'epila', 'Épila', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50146, 'lucenadejalon', 'Lucena de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50150, 'lumpiaque', 'Lumpiaque', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50175, 'moratadejalon', 'Morata de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50182, 'muelala', 'Muela (La)', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50211, 'plasenciadejalon', 'Plasencia de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50225, 'ricla', 'Ricla', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50228, 'ruedadejalon', 'Rueda de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7824, 'huesca', 'Huesca', 'P', 0, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (7825, 'teruel', 'Teruel', 'P', 0, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22006, 'aisa', 'Aísa', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22028, 'anso', 'Ansó', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22032, 'araguesdelpuerto', 'Aragüés del Puerto', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22044, 'bailo', 'Bailo', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22068, 'borau', 'Borau', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22076, 'canaldeberdun', 'Canal de Berdún', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22078, 'canfranc', 'Canfranc', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22086, 'castiellodejaca', 'Castiello de Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22106, 'fago', 'Fago', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22130, 'jaca', 'Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22131, 'jasa', 'Jasa', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22902, 'puentelareinadejaca', 'Puente la Reina de Jaca', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22208, 'santacilia', 'Santa Cilia', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22209, 'santacruzdelaseros', 'Santa Cruz de la Serós', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22901, 'valledehecho', 'Valle de Hecho', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22250, 'villanua', 'Villanúa', 'M', 1, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22059, 'biescas', 'Biescas', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22057, 'bielsa', 'Bielsa', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50231, 'salillasdejalon', 'Salillas de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (17, 'dczaragoza', 'D.C. Zaragoza', 'C', 17, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (6, 'hoyadehuescaplanadeuesca', 'Hoya de Huesca / Plana de Uesca', 'C', 6, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (9, 'laliteralallitera', 'La Litera / La Llitera', 'C', 9, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (19, 'bajoaragoncaspebaixaragocasp', 'Bajo Aragón-Caspe / Baix Aragó-Casp', 'C', 19, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (27, 'andorrasierradearcos', 'Andorra-Sierra de Arcos', 'C', 27, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (32, 'gudarjavalambre', 'Gúdar-Javalambre', 'C', 32, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (11, 'bajocincabaixcinca', 'Bajo Cinca / Baix Cinca', 'C', 11, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (33, 'matarranamatarranya', 'Matarraña / Matarranya', 'C', 33, 0, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44107, 'fozcalanda', 'Foz-Calanda', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22141, 'lascellasponzano', 'Lascellas-Ponzano', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50033, 'ardisa', 'Ardisa', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50036, 'asin', 'Asín', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50041, 'bagues', 'Bagüés', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50901, 'biel', 'Biel', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50051, 'biota', 'Biota', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50077, 'castejondevaldejasa', 'Castejón de Valdejasa', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50078, 'castiliscar', 'Castiliscar', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50095, 'ejeadeloscaballeros', 'Ejea de los Caballeros', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50100, 'erla', 'Erla', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50109, 'fragoel', 'Frago (El)', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50128, 'isuerre', 'Isuerre', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50135, 'layana', 'Layana', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50142, 'loberadeonsella', 'Lobera de Onsella', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50144, 'longas', 'Longás', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50148, 'luesia', 'Luesia', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50151, 'luna', 'Luna', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50902, 'marracos', 'Marracos', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50186, 'navardun', 'Navardún', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50197, 'ores', 'Orés', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50205, 'pedrosaslas', 'Pedrosas (Las)', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50207, 'piedratajada', 'Piedratajada', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50210, 'pintanoslos', 'Pintanos (Los)', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50220, 'puendeluna', 'Puendeluna', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50230, 'sadaba', 'Sádaba', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50244, 'sierradeluna', 'Sierra de Luna', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50248, 'sosdelreycatolico', 'Sos del Rey Católico', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50252, 'tauste', 'Tauste', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50267, 'uncastillo', 'Uncastillo', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50268, 'unduesdelerda', 'Undués de Lerda', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50270, 'urries', 'Urriés', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50276, 'valpalmas', 'Valpalmas', 'M', 5, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50185, 'murillodegallego', 'Murillo de Gállego', 'M', 6, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50238, 'santaeulaliadegallego', 'Santa Eulalia de Gállego', 'M', 6, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50236, 'santacruzdegrio', 'Santa Cruz de Grío', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50269, 'urreadejalon', 'Urrea de Jalón', 'M', 16, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50017, 'alfajarin', 'Alfajarín', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50056, 'botorrita', 'Botorrita', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50062, 'burgodeebroel', 'Burgo de Ebro (El)', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50066, 'cadrete', 'Cadrete', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50089, 'cuartedehuerva', 'Cuarte de Huerva', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50115, 'fuentesdeebro', 'Fuentes de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50131, 'jaulin', 'Jaulín', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50163, 'mariadehuerva', 'María de Huerva', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50164, 'medianadearagon', 'Mediana de Aragón', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50180, 'mozota', 'Mozota', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50193, 'nuezdeebro', 'Nuez de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50199, 'oseradeebro', 'Osera de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50203, 'pastriz', 'Pastriz', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50219, 'puebladealfindenla', 'Puebla de Alfindén (La)', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50235, 'sanmateodegallego', 'San Mateo de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50272, 'utebo', 'Utebo', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50285, 'villafrancadeebro', 'Villafranca de Ebro', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50903, 'villamayordegallego', 'Villamayor de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50288, 'villanuevadegallego', 'Villanueva de Gállego', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50297, 'zaragoza', 'Zaragoza', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50298, 'zuera', 'Zuera', 'M', 17, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50012, 'alborge', 'Alborge', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50019, 'alforque', 'Alforque', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50083, 'cincoolivas', 'Cinco Olivas', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50101, 'escatron', 'Escatrón', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50119, 'gelsa', 'Gelsa', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50208, 'pinadeebro', 'Pina de Ebro', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50222, 'quinto', 'Quinto', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50240, 'sastago', 'Sástago', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50278, 'velilladeebro', 'Velilla de Ebro', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50296, 'zaidala', 'Zaida (La)', 'M', 18, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50074, 'caspe', 'Caspe', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50092, 'chiprana', 'Chiprana', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50102, 'fabara', 'Fabara', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50105, 'fayon', 'Fayón', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50152, 'maella', 'Maella', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50189, 'nonaspe', 'Nonaspe', 'M', 19, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50001, 'abanto', 'Abanto', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50009, 'alarba', 'Alarba', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50015, 'alconcheldeariza', 'Alconchel de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50020, 'alhamadearagon', 'Alhama de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50029, 'aninon', 'Aniñón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50032, 'arandiga', 'Arándiga', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50034, 'ariza', 'Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50038, 'ateca', 'Ateca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22074, 'campo', 'Campo', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50022, 'almoldala', 'Almolda (La)', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50059, 'bujaraloz', 'Bujaraloz', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50104, 'farlete', 'Farlete', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50137, 'lecinena', 'Leciñena', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50170, 'monegrillo', 'Monegrillo', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50206, 'perdiguera', 'Perdiguera', 'M', 10, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50165, 'mequinenza', 'Mequinenza', 'M', 11, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50014, 'alcalademoncayo', 'Alcalá de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50030, 'anondemoncayo', 'Añón de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50063, 'busteel', 'Buste (El)', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50106, 'fayoslos', 'Fayos (Los)', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50122, 'grisel', 'Grisel', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50140, 'litago', 'Litago', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50141, 'lituenigo', 'Lituénigo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50157, 'malon', 'Malón', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50190, 'novallas', 'Novallas', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50234, 'sanmartindelavirgendemoncayo', 'San Martín de la Virgen de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50237, 'santacruzdemoncayo', 'Santa Cruz de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50251, 'tarazona', 'Tarazona', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50261, 'torrellas', 'Torrellas', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50265, 'trasmoz', 'Trasmoz', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50280, 'verademoncayo', 'Vera de Moncayo', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50281, 'vierlas', 'Vierlas', 'M', 12, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50003, 'agon', 'Agón', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50006, 'ainzon', 'Ainzón', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50010, 'alberitedesanjuan', 'Alberite de San Juan', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50011, 'albeta', 'Albeta', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50027, 'ambel', 'Ambel', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50052, 'bisimbre', 'Bisimbre', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50055, 'borja', 'Borja', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50060, 'bulbuente', 'Bulbuente', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50061, 'bureta', 'Bureta', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50111, 'frescano', 'Fréscano', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50113, 'fuendejalon', 'Fuendejalón', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50153, 'magallon', 'Magallón', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50156, 'malejan', 'Maleján', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50160, 'mallen', 'Mallén', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50191, 'novillas', 'Novillas', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50216, 'pozuelodearagon', 'Pozuelo de Aragón', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50249, 'tabuenca', 'Tabuenca', 'M', 13, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50046, 'belmontedegracian', 'Belmonte de Gracián', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50047, 'berdejo', 'Berdejo', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50050, 'bijuesca', 'Bijuesca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50054, 'bordalba', 'Bordalba', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50058, 'bubierca', 'Bubierca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50065, 'cabolafuente', 'Cabolafuente', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50067, 'calatayud', 'Calatayud', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50070, 'calmarza', 'Calmarza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50071, 'campillodearagon', 'Campillo de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50072, 'carenas', 'Carenas', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50075, 'castejondealarba', 'Castejón de Alarba', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50076, 'castejondelasarmas', 'Castejón de las Armas', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50079, 'cerveradelacanada', 'Cervera de la Cañada', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50081, 'cetina', 'Cetina', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50082, 'cimballa', 'Cimballa', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50084, 'claresderibota', 'Clarés de Ribota', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50086, 'codos', 'Codos', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50087, 'contamina', 'Contamina', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50096, 'embiddeariza', 'Embid de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50110, 'frasnoel', 'Frasno (El)', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50176, 'moratadejiloca', 'Morata de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50177, 'mores', 'Morés', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50178, 'moros', 'Moros', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50183, 'munebrega', 'Munébrega', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50187, 'niguella', 'Nigüella', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50192, 'nuevalos', 'Nuévalos', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50194, 'olves', 'Olvés', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50196, 'orera', 'Orera', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50201, 'paracuellosdejiloca', 'Paracuellos de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50202, 'paracuellosdelaribera', 'Paracuellos de la Ribera', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50215, 'pozueldeariza', 'Pozuel de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50229, 'ruesca', 'Ruesca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50241, 'savinan', 'Saviñán', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50242, 'sediles', 'Sediles', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50116, 'fuentesdejiloca', 'Fuentes de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50120, 'godojos', 'Godojos', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50125, 'ibdes', 'Ibdes', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50129, 'jaraba', 'Jaraba', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50155, 'malanquilla', 'Malanquilla', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50159, 'maluenda', 'Maluenda', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50162, 'mara', 'Mara', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50169, 'miedesdearagon', 'Miedes de Aragón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50172, 'monrealdeariza', 'Monreal de Ariza', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50173, 'monterde', 'Monterde', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50174, 'monton', 'Montón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50246, 'sisamon', 'Sisamón', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50253, 'terrer', 'Terrer', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50255, 'tobed', 'Tobed', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50257, 'torralbaderibota', 'Torralba de Ribota', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50259, 'torrehermosa', 'Torrehermosa', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50260, 'torrelapaja', 'Torrelapaja', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50263, 'torrijodelacanada', 'Torrijo de la Cañada', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50277, 'valtorres', 'Valtorres', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50279, 'velilladejiloca', 'Velilla de Jiloca', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50284, 'villafeliche', 'Villafeliche', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50286, 'villalbadeperejil', 'Villalba de Perejil', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50287, 'villalengua', 'Villalengua', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50293, 'villarroyadelasierra', 'Villarroya de la Sierra', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50282, 'viluenala', 'Vilueña (La)', 'M', 20, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50004, 'aguaron', 'Aguarón', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50005, 'aguilon', 'Aguilón', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50007, 'aladren', 'Aladrén', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50018, 'alfamen', 'Alfamén', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50073, 'carinena', 'Cariñena', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50088, 'cosuenda', 'Cosuenda', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50098, 'encinacorba', 'Encinacorba', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50143, 'longares', 'Longares', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50167, 'mezalocha', 'Mezalocha', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50181, 'muel', 'Muel', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50200, 'paniza', 'Paniza', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50264, 'tosos', 'Tosos', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50290, 'villanuevadehuerva', 'Villanueva de Huerva', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50295, 'vistabella', 'Vistabella', 'M', 21, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50021, 'almochuel', 'Almochuel', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50023, 'almonaciddelacuba', 'Almonacid de la Cuba', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50039, 'azuara', 'Azuara', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50045, 'belchite', 'Belchite', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50085, 'codo', 'Codo', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50114, 'fuendetodos', 'Fuendetodos', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50133, 'lagata', 'Lagata', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50136, 'lecera', 'Lécera', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50139, 'letux', 'Letux', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50171, 'moneva', 'Moneva', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50179, 'moyuela', 'Moyuela', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50213, 'plenas', 'Plenas', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50218, 'puebladealborton', 'Puebla de Albortón', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50233, 'samperdelsalz', 'Samper del Salz', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50275, 'valmadrid', 'Valmadrid', 'M', 22, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50002, 'acered', 'Acered', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50016, 'aldehueladeliestos', 'Aldehuela de Liestos', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50028, 'anento', 'Anento', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50037, 'atea', 'Atea', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50040, 'badules', 'Badules', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50042, 'balconchan', 'Balconchán', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50048, 'berrueco', 'Berrueco', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50080, 'cerveruela', 'Cerveruela', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50090, 'cubel', 'Cubel', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50091, 'cuerlaslas', 'Cuerlas (Las)', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50094, 'daroca', 'Daroca', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50108, 'fombuena', 'Fombuena', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50117, 'gallocanta', 'Gallocanta', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50124, 'herreradelosnavarros', 'Herrera de los Navarros', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50134, 'langadelcastillo', 'Langa del Castillo', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50138, 'lechon', 'Lechón', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50149, 'luesma', 'Luesma', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50154, 'mainar', 'Mainar', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50161, 'manchones', 'Manchones', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50184, 'murero', 'Murero', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50188, 'nombrevilla', 'Nombrevilla', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50195, 'orcajo', 'Orcajo', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50224, 'retascon', 'Retascón', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50227, 'romanos', 'Romanos', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50239, 'santed', 'Santed', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50256, 'torralbadelosfrailes', 'Torralba de los Frailes', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50258, 'torralbilla', 'Torralbilla', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50271, 'used', 'Used', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50274, 'valdesanmartin', 'Val de San Martín', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50273, 'valdehorna', 'Valdehorna', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50283, 'villadoz', 'Villadoz', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50289, 'villanuevadejiloca', 'Villanueva de Jiloca', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50291, 'villardelosnavarros', 'Villar de los Navarros', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50292, 'villarrealdehuerva', 'Villarreal de Huerva', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (50294, 'villarroyadelcampo', 'Villarroya del Campo', 'M', 24, 7823, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44076, 'cella', 'Cella', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22156, 'monfloritelascasas', 'Monflorite-Lascasas', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22036, 'argavieso', 'Argavieso', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22227, 'tellasin', 'Tella-Sin', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22907, 'ainsasobrarbe', 'Aínsa-Sobrarbe', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22905, 'lupinenortilla', 'Lupiñén-Ortilla', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22072, 'caldearenas', 'Caldearenas', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22122, 'hozdejaca', 'Hoz de Jaca', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22170, 'panticosa', 'Panticosa', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22199, 'sabinanigo', 'Sabiñánigo', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22204, 'sallentdegallego', 'Sallent de Gállego', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22252, 'yebradebasa', 'Yebra de Basa', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22253, 'yesero', 'Yésero', 'M', 2, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22002, 'abizanda', 'Abizanda', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22051, 'barcabo', 'Bárcabo', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22066, 'boltana', 'Boltaña', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22069, 'broto', 'Broto', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22107, 'fanlo', 'Fanlo', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22109, 'fiscal', 'Fiscal', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22113, 'fuevala', 'Fueva (La)', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22114, 'gistain', 'Gistaín', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22133, 'labuerda', 'Labuerda', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22144, 'laspuna', 'Laspuña', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22168, 'palo', 'Palo', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22182, 'plan', 'Plan', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22189, 'puertolas', 'Puértolas', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22190, 'pueyodearaguasel', 'Pueyo de Araguás (El)', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22207, 'sanjuandeplan', 'San Juan de Plan', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22035, 'aren', 'Arén', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22053, 'benabarre', 'Benabarre', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22054, 'benasque', 'Benasque', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22246, 'beranuy', 'Beranuy', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22062, 'bisaurri', 'Bisaurri', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22067, 'bonansa', 'Bonansa', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22080, 'capella', 'Capella', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22084, 'castejondesos', 'Castejón de Sos', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22087, 'castigaleu', 'Castigaleu', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22095, 'chia', 'Chía', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22105, 'estopinandelcastillo', 'Estopiñán del Castillo', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22111, 'foradadadeltoscar', 'Foradada del Toscar', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22117, 'graus', 'Graus', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22129, 'isabena', 'Isábena', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22142, 'lascuarre', 'Lascuarre', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22143, 'laspaules', 'Laspaúles', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22155, 'monesmaycajigar', 'Monesma y Cajigar', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22157, 'montanuy', 'Montanuy', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22177, 'perarrua', 'Perarrúa', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22187, 'puebladecastrola', 'Puebla de Castro (La)', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22188, 'puentedemontanana', 'Puente de Montañana', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22200, 'sahun', 'Sahún', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22212, 'santaliestraysanquilez', 'Santaliestra y San Quílez', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22214, 'secastilla', 'Secastilla', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22215, 'seira', 'Seira', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22221, 'sesue', 'Sesué', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22223, 'sopeira', 'Sopeira', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22229, 'tolva', 'Tolva', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22233, 'torrelaribera', 'Torre la Ribera', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22243, 'valledebardaji', 'Valle de Bardají', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22244, 'valledelierp', 'Valle de Lierp', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22247, 'viacampylitera', 'Viacamp y Litera', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22249, 'villanova', 'Villanova', 'M', 4, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22004, 'aguero', 'Agüero', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22011, 'alberoalto', 'Albero Alto', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22014, 'alcaladegurrea', 'Alcalá de Gurrea', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22015, 'alcaladelobispo', 'Alcalá del Obispo', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22019, 'alerre', 'Alerre', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22021, 'almudevar', 'Almudévar', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22027, 'angues', 'Angüés', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22029, 'antillon', 'Antillón', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22037, 'arguis', 'Arguis', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22039, 'ayerbe', 'Ayerbe', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22047, 'banastas', 'Banastás', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22063, 'biscarrues', 'Biscarrués', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22064, 'blecuaytorres', 'Blecua y Torres', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22081, 'casbasdehuesca', 'Casbas de Huesca', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22096, 'chimillas', 'Chimillas', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22119, 'gurreadegallego', 'Gurrea de Gállego', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22125, 'huesca', 'Huesca', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22126, 'ibieca', 'Ibieca', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22127, 'igries', 'Igriés', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22149, 'loarre', 'Loarre', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22150, 'loporzano', 'Loporzano', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22151, 'loscorrales', 'Loscorrales', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22162, 'novales', 'Novales', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22163, 'nueno', 'Nueno', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22173, 'penasderigloslas', 'Peñas de Riglos (Las)', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22178, 'pertusa', 'Pertusa', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22181, 'piraces', 'Piracés', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22195, 'quicena', 'Quicena', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22203, 'salillas', 'Salillas', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22220, 'sesa', 'Sesa', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22222, 'sietamo', 'Siétamo', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22904, 'sotonerala', 'Sotonera (La)', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22228, 'tierz', 'Tierz', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22239, 'tramaced', 'Tramaced', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22248, 'vicien', 'Vicién', 'M', 6, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22001, 'abiego', 'Abiego', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22003, 'adahuesca', 'Adahuesca', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22024, 'alquezar', 'Alquézar', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22041, 'azara', 'Azara', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22042, 'azlor', 'Azlor', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22048, 'barbastro', 'Barbastro', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22050, 'barbunales', 'Barbuñales', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22055, 'berbegal', 'Berbegal', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22058, 'bierge', 'Bierge', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22082, 'castejondelpuente', 'Castejón del Puente', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22088, 'castillazuelo', 'Castillazuelo', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22090, 'colungo', 'Colungo', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22102, 'estada', 'Estada', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22230, 'torlaordesa', 'Torla-Ordesa', 'M', 3, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22103, 'estadilla', 'Estadilla', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22115, 'gradoel', 'Grado (El)', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22908, 'hozycostean', 'Hoz y Costeán', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22128, 'ilche', 'Ilche', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22135, 'laluenga', 'Laluenga', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22139, 'laperdiguera', 'Laperdiguera', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22160, 'naval', 'Naval', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22164, 'olvena', 'Olvena', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22174, 'peraltadealcofea', 'Peralta de Alcofea', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22176, 'peraltilla', 'Peraltilla', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22186, 'pozandevero', 'Pozán de Vero', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22201, 'salasaltas', 'Salas Altas', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22202, 'salasbajas', 'Salas Bajas', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22906, 'santamariadedulcis', 'Santa María de Dulcis', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22235, 'torresdealcanadre', 'Torres de Alcanadre', 'M', 7, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22007, 'albalatedecinca', 'Albalate de Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22017, 'alcoleadecinca', 'Alcolea de Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22020, 'alfantega', 'Alfántega', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22022, 'almuniadesanjuan', 'Almunia de San Juan', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22060, 'binaced', 'Binaced', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22110, 'fonz', 'Fonz', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22158, 'monzon', 'Monzón', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22193, 'pueyodesantacruz', 'Pueyo de Santa Cruz', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22903, 'sanmigueldelcinca', 'San Miguel del Cinca', 'M', 8, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22009, 'albelda', 'Albelda', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22016, 'alcampell', 'Alcampell', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22025, 'altorricon', 'Altorricón', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22043, 'baells', 'Baells', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22045, 'baldellou', 'Baldellou', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22061, 'binefar', 'Binéfar', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22075, 'camporrells', 'Camporrells', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22089, 'castillonroy', 'Castillonroy', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22099, 'esplus', 'Esplús', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22175, 'peraltadecalasanz', 'Peralta de Calasanz', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22205, 'sanestebandelitera', 'San Esteban de Litera', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22225, 'tamaritedelitera', 'Tamarite de Litera', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22909, 'vencillon', 'Vencillón', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22008, 'albalatillo', 'Albalatillo', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22012, 'alberobajo', 'Albero Bajo', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22013, 'alberueladetubo', 'Alberuela de Tubo', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22018, 'alcubierre', 'Alcubierre', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22023, 'almuniente', 'Almuniente', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22049, 'barbues', 'Barbués', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22079, 'capdesaso', 'Capdesaso', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22083, 'castejondemonegros', 'Castejón de Monegros', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22085, 'castelflorite', 'Castelflorite', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22116, 'granen', 'Grañén', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22124, 'huerto', 'Huerto', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22136, 'lalueza', 'Lalueza', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22137, 'lanaja', 'Lanaja', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22172, 'penalba', 'Peñalba', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22184, 'polenino', 'Poleñino', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22197, 'robres', 'Robres', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22206, 'sangarren', 'Sangarrén', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22213, 'sarinena', 'Sariñena', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22217, 'sena', 'Sena', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22218, 'senesdealcubierre', 'Senés de Alcubierre', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22226, 'tardienta', 'Tardienta', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22232, 'torralbadearagon', 'Torralba de Aragón', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22236, 'torresdebarbues', 'Torres de Barbués', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22242, 'valfarta', 'Valfarta', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22251, 'villanuevadesigena', 'Villanueva de Sigena', 'M', 10, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22046, 'ballobar', 'Ballobar', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22052, 'belverdecinca', 'Belver de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22077, 'candasnos', 'Candasnos', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22094, 'chalamera', 'Chalamera', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22112, 'fraga', 'Fraga', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22165, 'ontinena', 'Ontiñena', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22167, 'ossodecinca', 'Osso de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22234, 'torrentedecinca', 'Torrente de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22245, 'velilladecinca', 'Velilla de Cinca', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22254, 'zaidin', 'Zaidín', 'M', 11, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44008, 'albalatedelarzobispo', 'Albalate del Arzobispo', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44031, 'azaila', 'Azaila', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44067, 'castelnou', 'Castelnou', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44122, 'hijar', 'Híjar', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44129, 'jatiel', 'Jatiel', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44191, 'puebladehijarla', 'Puebla de Híjar (La)', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44205, 'samperdecalanda', 'Samper de Calanda', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44237, 'urreadegaen', 'Urrea de Gaén', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44265, 'vinaceite', 'Vinaceite', 'M', 23, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44023, 'allueva', 'Allueva', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44032, 'badenas', 'Bádenas', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44033, 'baguena', 'Báguena', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44034, 'banon', 'Bañón', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44035, 'barrachina', 'Barrachina', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44036, 'bea', 'Bea', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44039, 'bello', 'Bello', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44042, 'blancas', 'Blancas', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44046, 'buena', 'Bueña', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44047, 'burbaguena', 'Burbáguena', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44050, 'calamocha', 'Calamocha', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44056, 'caminreal', 'Caminreal', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44065, 'castejondetornos', 'Castejón de Tornos', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44085, 'cosa', 'Cosa', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44090, 'cucalon', 'Cucalón', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44101, 'ferrerueladehuerva', 'Ferreruela de Huerva', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44102, 'fonfria', 'Fonfría', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44112, 'fuentesclaras', 'Fuentes Claras', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44132, 'lagueruela', 'Lagueruela', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44133, 'lanzuela', 'Lanzuela', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44138, 'loscos', 'Loscos', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44152, 'monfortedemoyuela', 'Monforte de Moyuela', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44153, 'monrealdelcampo', 'Monreal del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44164, 'nogueras', 'Nogueras', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44168, 'odon', 'Odón', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44169, 'ojosnegros', 'Ojos Negros', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44180, 'peracense', 'Peracense', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44190, 'pozueldelcampo', 'Pozuel del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44200, 'rubielosdelacerida', 'Rubielos de la Cérida', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (22040, 'azanuyalins', 'Azanuy-Alins', 'M', 9, 7824, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44207, 'sanmartindelrio', 'San Martín del Río', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44208, 'santacruzdenogueras', 'Santa Cruz de Nogueras', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44213, 'singra', 'Singra', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44219, 'tornos', 'Tornos', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44220, 'torralbadelossisones', 'Torralba de los Sisones', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44227, 'torrelosnegros', 'Torre los Negros', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44222, 'torrecilladelrebollar', 'Torrecilla del Rebollar', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44232, 'torrijodelcampo', 'Torrijo del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44251, 'villafrancadelcampo', 'Villafranca del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44252, 'villahermosadelcampo', 'Villahermosa del Campo', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44258, 'villardelsalz', 'Villar del Salz', 'M', 25, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44011, 'alcaine', 'Alcaine', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44017, 'aliaga', 'Aliaga', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44024, 'anadon', 'Anadón', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44043, 'blesa', 'Blesa', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44063, 'canizardelolivar', 'Cañizar del Olivar', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44066, 'casteldecabra', 'Castel de Cabra', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44084, 'cortesdearagon', 'Cortes de Aragón', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44093, 'cuevasdealmuden', 'Cuevas de Almudén', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44099, 'escucha', 'Escucha', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44110, 'fuenferrada', 'Fuenferrada', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44123, 'hinojosadejarque', 'Hinojosa de Jarque', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44124, 'hozdelaviejala', 'Hoz de la Vieja (La)', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44125, 'huesadelcomun', 'Huesa del Común', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44128, 'jarquedelaval', 'Jarque de la Val', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44131, 'josa', 'Josa', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44142, 'maicas', 'Maicas', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44144, 'martindelrio', 'Martín del Río', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44148, 'mezquitadejarque', 'Mezquita de Jarque', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44155, 'montalban', 'Montalbán', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44161, 'muniesa', 'Muniesa', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44167, 'obon', 'Obón', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44176, 'palomardearroyos', 'Palomar de Arroyos', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44184, 'plou', 'Plou', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44203, 'salcedillo', 'Salcedillo', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44211, 'seguradelosbanos', 'Segura de los Baños', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44224, 'torredelasarcas', 'Torre de las Arcas', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44238, 'utrillas', 'Utrillas', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44256, 'villanuevadelrebollardelasierra', 'Villanueva del Rebollar de la Sierra', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44267, 'viveldelriomartin', 'Vivel del Río Martín', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44268, 'zomala', 'Zoma (La)', 'M', 26, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44006, 'alacon', 'Alacón', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44022, 'alloza', 'Alloza', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44025, 'andorra', 'Andorra', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44029, 'arino', 'Ariño', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44087, 'crivillen', 'Crivillén', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44096, 'ejulve', 'Ejulve', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44100, 'estercuel', 'Estercuel', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44116, 'gargallo', 'Gargallo', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44172, 'oliete', 'Oliete', 'M', 27, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44004, 'aguaviva', 'Aguaviva', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44013, 'alcaniz', 'Alcañiz', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44014, 'alcorisa', 'Alcorisa', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44038, 'belmontedesanjose', 'Belmonte de San José', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44040, 'berge', 'Berge', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44051, 'calanda', 'Calanda', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44061, 'canadadeverichla', 'Cañada de Verich (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44068, 'castelseras', 'Castelserás', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44077, 'cerollerala', 'Cerollera (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44080, 'codonerala', 'Codoñera (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44118, 'ginebrosala', 'Ginebrosa (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44145, 'masdelasmatas', 'Mas de las Matas', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44146, 'matadelosolmosla', 'Mata de los Olmos (La)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44173, 'olmoslos', 'Olmos (Los)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44178, 'parrasdecastellotelas', 'Parras de Castellote (Las)', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44212, 'seno', 'Seno', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44221, 'torrecilladealcaniz', 'Torrecilla de Alcañiz', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44230, 'torrevelilla', 'Torrevelilla', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44241, 'valdealgorfa', 'Valdealgorfa', 'M', 28, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44001, 'ababuj', 'Ababuj', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44003, 'aguaton', 'Aguatón', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44005, 'aguilardelalfambra', 'Aguilar del Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44007, 'alba', 'Alba', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44016, 'alfambra', 'Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44018, 'almohaja', 'Almohaja', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44019, 'alobras', 'Alobras', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44020, 'alpenes', 'Alpeñés', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44028, 'argente', 'Argente', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44053, 'camanas', 'Camañas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44055, 'camarillas', 'Camarillas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44062, 'canadavellida', 'Cañada Vellida', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44064, 'cascantedelrio', 'Cascante del Río', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44074, 'cedrillas', 'Cedrillas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44075, 'celadas', 'Celadas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44082, 'corbalan', 'Corbalán', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44089, 'cubla', 'Cubla', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44092, 'cuervoel', 'Cuervo (El)', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44094, 'cuevaslabradas', 'Cuevas Labradas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44097, 'escorihuela', 'Escorihuela', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44111, 'fuentescalientes', 'Fuentes Calientes', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44115, 'galve', 'Galve', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44130, 'jorcas', 'Jorcas', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44135, 'libros', 'Libros', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44136, 'lidon', 'Lidón', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44156, 'monteagudodelcastillo', 'Monteagudo del Castillo', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44175, 'orrios', 'Orrios', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44177, 'pancrudo', 'Pancrudo', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44181, 'peralejos', 'Peralejos', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44182, 'peralesdelalfambra', 'Perales del Alfambra', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44185, 'poboel', 'Pobo (El)', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44195, 'rillo', 'Rillo', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44196, 'riodeva', 'Riodeva', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44209, 'santaeulalia', 'Santa Eulalia', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44216, 'teruel', 'Teruel', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44218, 'tormon', 'Tormón', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44226, 'torrelacarcel', 'Torrelacárcel', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44228, 'torremochadejiloca', 'Torremocha de Jiloca', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44234, 'tramacastiel', 'Tramacastiel', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44239, 'valacloche', 'Valacloche', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44250, 'veguillasdelasierra', 'Veguillas de la Sierra', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44261, 'villarquemado', 'Villarquemado', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44263, 'villastar', 'Villastar', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44264, 'villel', 'Villel', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44266, 'visiedo', 'Visiedo', 'M', 29, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44021, 'allepuz', 'Allepuz', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44044, 'bordon', 'Bordón', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44059, 'cantavieja', 'Cantavieja', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44060, 'canadadebenatanduz', 'Cañada de Benatanduz', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44071, 'castellote', 'Castellote', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44088, 'cubala', 'Cuba (La)', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44106, 'fortanete', 'Fortanete', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44126, 'iglesueladelcidla', 'Iglesuela del Cid (La)', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44149, 'mirambel', 'Mirambel', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44150, 'miravetedelasierra', 'Miravete de la Sierra', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44151, 'molinos', 'Molinos', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44183, 'pitarque', 'Pitarque', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44236, 'tronchon', 'Tronchón', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44260, 'villarluengo', 'Villarluengo', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44262, 'villarroyadelospinares', 'Villarroya de los Pinares', 'M', 30, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44009, 'albarracin', 'Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44041, 'bezas', 'Bezas', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44045, 'bronchales', 'Bronchales', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44052, 'calomarde', 'Calomarde', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44109, 'friasdealbarracin', 'Frías de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44117, 'geadealbarracin', 'Gea de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44119, 'griegos', 'Griegos', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44120, 'guadalaviar', 'Guadalaviar', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44127, 'jabaloyas', 'Jabaloyas', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44157, 'monterdedealbarracin', 'Monterde de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44159, 'moscardon', 'Moscardón', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44163, 'nogueradealbarracin', 'Noguera de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44174, 'orihueladeltremedal', 'Orihuela del Tremedal', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44189, 'pozondon', 'Pozondón', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44197, 'rodenas', 'Ródenas', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44198, 'royuela', 'Royuela', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44199, 'rubiales', 'Rubiales', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44204, 'saldon', 'Saldón', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44215, 'terriente', 'Terriente', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44217, 'torilymasegoso', 'Toril y Masegoso', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44229, 'torresdealbarracin', 'Torres de Albarracín', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44235, 'tramacastilla', 'Tramacastilla', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44243, 'valdecuenca', 'Valdecuenca', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44249, 'vallecilloel', 'Vallecillo (El)', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44257, 'villardelcobo', 'Villar del Cobo', 'M', 31, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44002, 'abejuela', 'Abejuela', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44010, 'albentosa', 'Albentosa', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44012, 'alcaladelaselva', 'Alcalá de la Selva', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44026, 'arcosdelassalinas', 'Arcos de las Salinas', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44048, 'cabrademora', 'Cabra de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44054, 'camarenadelasierra', 'Camarena de la Sierra', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44070, 'castellarel', 'Castellar (El)', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44103, 'formichealto', 'Formiche Alto', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44113, 'fuentesderubielos', 'Fuentes de Rubielos', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44121, 'gudar', 'Gúdar', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44137, 'linaresdemora', 'Linares de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44143, 'manzanera', 'Manzanera', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44158, 'moraderubielos', 'Mora de Rubielos', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44160, 'mosqueruela', 'Mosqueruela', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44165, 'nogueruelas', 'Nogueruelas', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44171, 'olba', 'Olba', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44192, 'puebladevalverdela', 'Puebla de Valverde (La)', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44193, 'puertomingalvo', 'Puertomingalvo', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44201, 'rubielosdemora', 'Rubielos de Mora', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44206, 'sanagustin', 'San Agustín', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44210, 'sarrion', 'Sarrión', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44231, 'torrijas', 'Torrijas', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44240, 'valbona', 'Valbona', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44244, 'valdelinares', 'Valdelinares', 'M', 32, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44027, 'arensdelledo', 'Arens de Lledó', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44037, 'beceite', 'Beceite', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44049, 'calaceite', 'Calaceite', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44086, 'cretas', 'Cretas', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44105, 'fornoles', 'Fórnoles', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44108, 'fresnedala', 'Fresneda (La)', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44114, 'fuentespalda', 'Fuentespalda', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44141, 'lledo', 'Lledó', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44147, 'mazaleon', 'Mazaleón', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44154, 'monroyo', 'Monroyo', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44179, 'penarroyadetastavins', 'Peñarroya de Tastavins', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44187, 'portelladala', 'Portellada (La)', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44194, 'rafales', 'Ráfales', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44223, 'torredearcas', 'Torre de Arcas', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44225, 'torredelcompte', 'Torre del Compte', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44245, 'valdeltormo', 'Valdeltormo', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44246, 'valderrobres', 'Valderrobres', 'M', 33, 7825, '2018-04-15');
INSERT INTO public.lugares (code, slug, name, type, comarca_code, provincia_code, created) VALUES (44247, 'valjunquera', 'Valjunquera', 'M', 33, 7825, '2018-04-15');


--
-- TOC entry 2281 (class 0 OID 25425)
-- Dependencies: 195
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (1, 'bloque-actividades', 'Actividades industriales y energía', 'Industrial and energy activities', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#IndustrialAndEnergyActivities', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (2, 'bloque-atencion', 'Atención social y dependencia', 'Social care and dependency', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#SocialCareAndDependency', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (3, 'GeneralCategorization', 'Categorización general', 'General categorization', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#GeneralCategorization', B'0', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (4, 'bloque-cultura', 'Cultura, ocio y turismo', 'Culture leisure and tourism', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#CultureLeisureAndTourism', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (5, 'bloque-derechos', 'Derechos y servicios del ciudadano', 'Citizen rights and services', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#CitizenRightsAndServices', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (6, 'Unknown', 'Desconocida', 'Unknown', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Unknown', B'0', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (7, 'bloque-educacion', 'Educación, investigación y desarrollo', 'Education research and development', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#EducationResearchAndDevelopment', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (8, 'bloque-empleo', 'Empleo y trabajo', 'Employment and work', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentAndWork', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (9, 'bloque-empresa', 'Empresa, comercio y asociaciones', 'Business trade and associations', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#BusinessTradeAndAssociations', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (10, 'bloque-infraestructuras', 'Infraestructuras, transportes y carreteras', 'Infrastructure transport and roads', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#InfrastructureTransportAndRoads', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (11, 'bloque-medioambiente', 'Medio ambiente', 'Environment', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Environment', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (12, 'bloque-medio', 'Medio rural, agricultura y ganadería', 'Rural environment agriculture and livestock', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#RuralEnvironmentAgricultureAndLivestock', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (13, 'bloque-salud', 'Salud', 'Health', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Health', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (14, 'bloque-vivienda', 'Vivienda', 'Housing', '_', '_', 0, 'http://opendata.aragon.es/def/ei2a/categorization#Housing', B'1', '2018-04-12');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (15, 'Agriculture', 'Agricultura', 'Agriculture', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Agriculture', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (16, 'AssociationsAndOrganizations', 'Asociaciones y organizaciones', 'Associations and Organizations', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#AssociationsAndOrganizations', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (17, 'AssociationsFoundationsAndProfessionalColleges', 'Asociaciones, fundaciones y colegios profesionales', 'Associations, foundations and professional associations', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#AssociationsFoundationsAndProfessionalColleges', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (18, 'Business', 'Empresa', 'Business', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#Business', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (19, 'BusinessAidsAndSubsidies', 'Ayudas y subvenciones a empresas', 'Aids and subsidies to companies', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#BusinessAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (20, 'CarnetsAndCertificates', 'Carnets y certificados', 'Carnets and certificates', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#CarnetsAndCertificates', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (21, 'ChildhoodAndYouth', 'Infancia y juventud', 'Children and youth', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#ChildhoodAndYouth', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (22, 'CitizenSecurityAndSafety', 'Protección y seguridad ciudadana', 'Citizen security and safety', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#CitizenSecurityAndSafety', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (23, 'CollectiveInRuralAreas', 'Colectivos en el medio rural', 'Collective in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#CollectiveInRuralAreas', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (24, 'CollectiveWork', 'Colectivos de trabajo', 'Collective work', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#CollectiveWork', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (25, 'ConsumerInformation', 'Información al consumidor', 'Consumer Information', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#ConsumerInformation', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (26, 'Culture', 'Cultura', 'Culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#Culture', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (27, 'CultureAidsAndSubsidies', 'Ayudas y subvenciones en cultura', 'Aids and subsidies in culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#CultureAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (28, 'CultureEmploymentAndTraining', 'Empleo y formación en cultura', 'Employment and training in culture', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#CultureEmploymentAndTraining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (29, 'DefenseAndConservation', 'Defensa y conservación', 'Defense and conservation', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#DefenseAndConservation', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (30, 'Dependency', 'Dependencia', 'Dependency', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#Dependency', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (31, 'DisabilityAndEmployment', 'Discapacidad y empleo', 'Disability and employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#DisabilityAndEmployment', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (32, 'EducationAidsAndSubsidies', 'Ayudas y subvenciones en educación', 'Aids and subsidies in education', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#EducationAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (33, 'EducationEmploymentAndTraining', 'Empleo y formación en educación', 'Employment and training in education', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#EducationEmploymentAndTraining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (34, 'ElderlyPeople', 'Personas mayores', 'Elder people', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#ElderlyPeople', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (35, 'Employment', 'Empleo', 'Employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#Employment', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (36, 'EmploymentAidsAndSubsidies', 'Ayudas y subvenciones para emplearse', 'Aids and subsidies for employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (37, 'EmploymentCoursesAndTraining', 'Cursos y formación para emplearse', 'Courses and training for employment', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#EmploymentCoursesAndTraining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (38, 'Energy', 'Energía', 'Energy', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#Energy', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (39, 'EnergyAidsAndSubsidies', 'Ayudas y subvenciones en energía', 'Energy subsidies and subsidies', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#EnergyAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (40, 'EnergyWasteManagement', 'Gestión de residuos energéticos', 'Energy waste management', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#EnergyWasteManagement', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (41, 'EnvironmentAidsAndSubsidies', 'Ayudas y subvenciones en medio ambiente', 'Aids and subsidies in the environment', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#EnvironmentAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (42, 'EnvironmentAndItsActivity', 'Medio ambiente y su actividad', 'Environment and its activity', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#EnvironmentAndItsActivity', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (43, 'Feeding', 'Alimentación', 'Feeding', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Feeding', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (44, 'FoodSafety', 'Seguridad alimentaria', 'Food safety', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#FoodSafety', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (45, 'GamesAndShows', 'Juegos y espectáculos', 'Games and shows', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#GamesAndShows', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (46, 'GamingBusiness', 'Empresas del juego', 'Game companies', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#GamingBusiness', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (47, 'HealthAidsAndSubsidies', 'Ayudas y subvenciones en salud', 'Health aids and subsidies', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (48, 'HealthEmploymentAndTraining', 'Empleo y formación en salud', 'Employment and training in health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthEmploymentAndTraining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (49, 'HealthSafetyAndQuality', 'Seguridad sanitaria y calidad', 'Health safety and quality', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#HealthSafetyAndQuality', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (50, 'HousingAidsAndSubsidies', 'Ayudas y subvenciones en viviendas', 'Housing aids and subsidies', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#HousingAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (51, 'HousingAndBuilding', 'Vivienda y edificación', 'Housing and building', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#HousingAndBuilding', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (52, 'IndustrialActivities', 'Actividades industriales y energía', 'Industrial activities and energy', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#IndustrialActivities', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (53, 'InfrastructureAidsAndSubsidies', 'Ayudas y subvenciones en infraestructuras', 'Aids and subsidies in infrastructure<', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#InfrastructureAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (54, 'LawAndJustice', 'Derecho y justicia', 'Law and justice', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#LawAndJustice', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (55, 'Livestock', 'Ganadería', 'Cattle raising', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#Livestock', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (56, 'Mining', 'Minería', 'Mining', '', '', 1, 'http://opendata.aragon.es/def/ei2a/categorization#Mining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (57, 'OthersHealth', 'Otros salud', 'Other health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#OthersHealth', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (58, 'OthersRuralAreas', 'Otros medio rural', 'Others rural environment', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#OthersRuralAreas', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (59, 'PesticidesAndInvasiveSpecies', 'Plaguicidas y especies invasoras', 'Pesticides and invasive species', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#PesticidesAndInvasiveSpecies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (60, 'PrivateDomain', 'Dominio privado', 'Private domain', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#PrivateDomain', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (61, 'ResearchDevelopmentAndInnovation', 'Investigación, desarrollo e innovación', 'Research, development and innovation', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#ResearchDevelopmentAndInnovation', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (62, 'RightsAndPayments', 'Derechos y pagos', 'Rights and payments', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RightsAndPayments', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (63, 'Roads', 'Carreteras', 'Roads', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#Roads', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (64, 'RuralAreasAidsAndSubsidies', 'Ayudas y subvenciones en el medio rural', 'Aids and subsidies in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralAreasAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (65, 'RuralAreasEmploymentAndTraining', 'Empleo y formación en medio rural', 'Employment and training in rural areas', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralAreasEmploymentAndTraining', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (66, 'RuralDevelopmentAndBiodiversity', 'Rural environment, agriculture and livestock', 'Rural development and biodiversity', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#RuralDevelopmentAndBiodiversity', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (67, 'SecurityTransportAndTrade', 'Seguridad, transporte y comercio', 'Security, transport and trade', '', '', 12, 'http://opendata.aragon.es/def/ei2a/categorization#SecurityTransportAndTrade', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (68, 'SocialAidsAndSubsidies', 'Ayudas y subvenciones sociales', 'Social aids and subsidies', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#SocialAidsAndSubsidies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (69, 'SocialCenters', 'Centros sociales', 'Social centers', '', '', 2, 'http://opendata.aragon.es/def/ei2a/categorization#SocialCenters', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (70, 'Sports', 'Deportes', 'Sports', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#Sports', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (71, 'SystemsAndEducationalCenters', 'Sistemas y centros educativos', 'Systems and educational centers', '', '', 7, 'http://opendata.aragon.es/def/ei2a/categorization#SystemsAndEducationalCenters', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (72, 'TaxesPaymentsAndFees', 'Impuestos, pagos y tasas', 'Taxes, payments and fees', '', '', 5, 'http://opendata.aragon.es/def/ei2a/categorization#TaxesPaymentsAndFees', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (73, 'TerritoryAndTransport', 'Territorio y transportes', 'Territory and transport', '', '', 10, 'http://opendata.aragon.es/def/ei2a/categorization#TerritoryAndTransport', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (74, 'TouristCompanies', 'Empresas turísticas', 'Tourist companies', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#TouristCompanies', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (75, 'TouristServices', 'Servicios turísticos', 'Tourist services', '', '', 4, 'http://opendata.aragon.es/def/ei2a/categorization#TouristServices', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (76, 'TownPlanning', 'Urbanismo', 'Town planning', '', '', 14, 'http://opendata.aragon.es/def/ei2a/categorization#TownPlanning', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (77, 'TradeFairsAndCrafts', 'Comercio, ferias y artesanía', 'Trade, fairs and crafts', '', '', 9, 'http://opendata.aragon.es/def/ei2a/categorization#TradeFairsAndCrafts', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (78, 'WasteManagement', 'Gestión de residuos', 'Waste management', '', '', 11, 'http://opendata.aragon.es/def/ei2a/categorization#WasteManagement', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (79, 'WaterAndHealth', 'Agua y salud', 'Water and health', '', '', 13, 'http://opendata.aragon.es/def/ei2a/categorization#WaterAndHealth', B'1', '2018-04-13');
INSERT INTO public.temas (code, slug, name_es, name_en, comment_es, comment_en, parent_code, rdf_type, active, created) VALUES (80, 'WorkInPublicOrganisms', 'Trabajo en organismos públicos', 'Work in public organisms', '', '', 8, 'http://opendata.aragon.es/def/ei2a/categorization#WorkInPublicOrganisms', B'1', '2018-04-13');

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 196
-- Name: temas_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_code_seq', 1, false);


--
-- TOC entry 2144 (class 2606 OID 25436)
-- Name: camposresultados camposresultados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camposresultados
    ADD CONSTRAINT camposresultados_pkey PRIMARY KEY (code);


--
-- TOC entry 2146 (class 2606 OID 25438)
-- Name: configuracionweb configuracionweb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracionweb
    ADD CONSTRAINT configuracionweb_pkey PRIMARY KEY (code);


--
-- TOC entry 2148 (class 2606 OID 25440)
-- Name: entidades entidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entidades
    ADD CONSTRAINT entidades_pkey PRIMARY KEY (code);


--
-- TOC entry 2150 (class 2606 OID 25442)
-- Name: facetas facetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facetas
    ADD CONSTRAINT facetas_pkey PRIMARY KEY (code);


--
-- TOC entry 2152 (class 2606 OID 25444)
-- Name: lugares lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (code);


--
-- TOC entry 2154 (class 2606 OID 25446)
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (code);


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-02 07:29:47 CEST

--
-- PostgreSQL database dump complete
--

