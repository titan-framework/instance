--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: cms; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cms;


--
-- Name: titan; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA titan;


--
-- Name: version; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA version;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


SET search_path = titan, pg_catalog;

--
-- Name: _no_accents(text); Type: FUNCTION; Schema: titan; Owner: -
--

CREATE FUNCTION _no_accents(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT translate($1,'ÀÁÂÃÄÅĀĂĄÈÉÊËĒĔĖĘĚÌÍÎÏĨĪĮİÒÓÔÕÖØŌŎŐÙÚÛÜŨŪŬŮŰŲàáâãäåāăąèéêëēĕėęěìíîïĩīĭįòóôõöøōŏőùúûüũūŭůųÇçÑñÝýÿĆćĈĉĊċČčĎďĐđĜĝĞğĠġĢģĤĥĦħ','AAAAAAAAAEEEEEEEEEIIIIIIIIOOOOOOOOOUUUUUUUUUUaaaaaaaaaeeeeeeeeeiiiiiiiiooooooooouuuuuuuuuCcNnYyyCcCcCcCcDdDdGgGgGgGgHhHh'); $_$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _alert; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _alert (
    _id integer NOT NULL,
    _template character varying(64) NOT NULL,
    _assign character varying(64) NOT NULL,
    _until timestamp without time zone,
    _parameters text,
    _user integer,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: _alert__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _alert__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _alert__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _alert__id_seq OWNED BY _alert._id;


--
-- Name: _alert_mail; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _alert_mail (
    _alert integer NOT NULL,
    _trigger timestamp without time zone NOT NULL,
    _send bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: _alert_user; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _alert_user (
    _alert integer NOT NULL,
    _user integer NOT NULL,
    _read bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _delete bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _mobile bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: _browser; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _browser (
    _id integer NOT NULL,
    _pk character(256) NOT NULL,
    _user integer NOT NULL,
    _validity integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _access timestamp with time zone DEFAULT now() NOT NULL,
    _counter BIGINT DEFAULT 1 NOT NULL
);


--
-- Name: _browser__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _browser__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _browser__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _browser__id_seq OWNED BY _browser._id;


--
-- Name: _city; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _city (
    _id smallint NOT NULL,
    _name character varying(64) NOT NULL,
    _state character(2) NOT NULL
);


--
-- Name: _ckeditor; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _ckeditor (
    _id bigint NOT NULL,
    _name character varying(256) NOT NULL,
    _mimetype character varying(256) NOT NULL,
    _size integer DEFAULT 0 NOT NULL,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _hash character(32) NOT NULL
);


--
-- Name: _ckeditor__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _ckeditor__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _ckeditor__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _ckeditor__id_seq OWNED BY _ckeditor._id;


--
-- Name: _cloud; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _cloud (
    _id bigint NOT NULL,
    _code character varying NOT NULL,
    _name character varying(256),
    _mimetype character varying(256),
    _size integer DEFAULT 0 NOT NULL,
    _counter bigint DEFAULT 0 NOT NULL,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _author integer,
    _devise timestamp with time zone,
    _change timestamp with time zone,
    _ready bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _deleted bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: _cloud__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _cloud__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cloud__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _cloud__id_seq OWNED BY _cloud._id;


--
-- Name: _contact; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _contact (
    _id integer NOT NULL,
    _send_date timestamp with time zone DEFAULT now() NOT NULL,
    _responser integer,
    _response_date timestamp without time zone,
    _responsed bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _response text,
    _actor_name character varying(256),
    _actor_email character varying(256),
    _actor_subject character varying(256),
    _actor_message text
);


--
-- Name: _contact__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _contact__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _contact__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _contact__id_seq OWNED BY _contact._id;


--
-- Name: _disambiguation; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _disambiguation
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _file; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _file (
    _id bigint NOT NULL,
    _name character varying(256),
    _mimetype character varying(256) NOT NULL,
    _size integer DEFAULT 0 NOT NULL,
    _description character varying(256),
    _create_date timestamp with time zone DEFAULT now() NOT NULL,
    _user integer NOT NULL,
    _counter bigint DEFAULT 0 NOT NULL,
    _public bit(1) DEFAULT B'1'::"bit" NOT NULL,
    _hash character(32)
);


--
-- Name: _file__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _file__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _file__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _file__id_seq OWNED BY _file._id;


--
-- Name: _group; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _group (
    _id integer NOT NULL,
    _name character varying(32) NOT NULL,
    _description character varying(256),
    _admin bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _chat bit(1) DEFAULT B'1'::"bit" NOT NULL
);


--
-- Name: _group__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _group__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _group__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _group__id_seq OWNED BY _group._id;


--
-- Name: _instance; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _instance (
    _unix character varying(128) NOT NULL,
    _name character varying(256) NOT NULL,
    _description character varying(1024),
    _logo bigint,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: _mail; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _mail (
    _name character varying(256) NOT NULL,
    _group integer NOT NULL
);


--
-- Name: _media; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _media (
    _id integer NOT NULL,
    _name character varying(256),
    _mimetype character varying(32) NOT NULL,
    _size integer DEFAULT 0 NOT NULL,
    _description character varying(256),
    _insert timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _user integer NOT NULL
);


--
-- Name: _media__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _media__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _media__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _media__id_seq OWNED BY _media._id;


--
-- Name: _mobile; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _mobile (
    _id integer NOT NULL,
    _pk character(16) NOT NULL,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _name character varying(128) NOT NULL,
    _access timestamp with time zone,
    _counter integer DEFAULT 0 NOT NULL,
    _gcm character varying(4096)
);


--
-- Name: _mobile__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _mobile__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _mobile__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _mobile__id_seq OWNED BY _mobile._id;


--
-- Name: _note; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _note (
    _id bigint NOT NULL,
    _code character varying NOT NULL,
    _title character varying(128),
    _note text,
    _longitude double precision,
    _latitude double precision,
    _altitude double precision,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _author integer,
    _change timestamp with time zone,
    _devise timestamp with time zone,
    _deleted bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: _note__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _note__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _note__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _note__id_seq OWNED BY _note._id;


--
-- Name: _note_media; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _note_media (
    _id bigint NOT NULL,
    _code character varying NOT NULL,
    _note bigint NOT NULL,
    _type character(5) NOT NULL,
    _user integer NOT NULL,
    _create timestamp with time zone DEFAULT now() NOT NULL,
    _update timestamp with time zone DEFAULT now() NOT NULL,
    _longitude double precision NOT NULL,
    _latitude double precision NOT NULL,
    _altitude double precision NOT NULL,
    _deleted bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _date timestamp with time zone NOT NULL,
    _file bigint NOT NULL
);


--
-- Name: _note_media__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _note_media__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _note_media__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _note_media__id_seq OWNED BY _note_media._id;


--
-- Name: _permission; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _permission (
    _name character varying(256) NOT NULL,
    _group integer NOT NULL
);


--
-- Name: _rss; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _rss (
    _id integer NOT NULL,
    _url character varying(512) NOT NULL,
    _column_index integer DEFAULT 1 NOT NULL,
    _height integer DEFAULT 0 NOT NULL,
    _number integer DEFAULT 5 NOT NULL,
    _minutes integer DEFAULT 30 NOT NULL,
    _user integer NOT NULL
);


--
-- Name: _rss__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _rss__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _rss__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _rss__id_seq OWNED BY _rss._id;


--
-- Name: _simple; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _simple (
    _id character varying(64) NOT NULL,
    _content text,
    _user integer NOT NULL,
    _update_date timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: _state; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _state (
    _uf character(2) NOT NULL,
    _name character varying(64) NOT NULL,
    _region character varying(32) NOT NULL
);


--
-- Name: _type_group; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _type_group (
    _type character varying(64) NOT NULL,
    _group integer NOT NULL
);


--
-- Name: _user; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _user (
    _id integer NOT NULL,
    _name character varying(256) NOT NULL,
    _login character varying(64) NOT NULL,
    _password character varying(40) NOT NULL,
    _active bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _email character varying(512) NOT NULL,
    _deleted bit(1) DEFAULT B'0'::"bit" NOT NULL,
    _type character varying(64) NOT NULL,
    _language character(5) DEFAULT 'pt_BR'::bpchar NOT NULL,
    _create_date timestamp with time zone DEFAULT now() NOT NULL,
    _update_date timestamp with time zone DEFAULT now() NOT NULL,
    _last_logon timestamp with time zone DEFAULT now() NOT NULL,
    _alert bit(1) DEFAULT B'1'::"bit" NOT NULL,
    _timezone character varying(32),
    _google character(21),
    _facebook character varying(50),
    street character varying(256),
    number integer,
    quarter character varying(256),
    cep character(8),
    city integer,
    state character(2),
    phone character varying(11),
    mobile character varying(11),
    complement character varying(512),
    msn character varying(256),
    skype character varying(256),
    photo bigint,
    url character varying(256),
    orkut character varying(256),
    cpf character varying(11),
    birth_date timestamp without time zone,
    gender character(3) DEFAULT '_M_'::bpchar NOT NULL,
    marriage character(7) DEFAULT '_OTHER_'::bpchar NOT NULL
);


--
-- Name: _user__id_seq; Type: SEQUENCE; Schema: titan; Owner: -
--

CREATE SEQUENCE _user__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _user__id_seq; Type: SEQUENCE OWNED BY; Schema: titan; Owner: -
--

ALTER SEQUENCE _user__id_seq OWNED BY _user._id;


--
-- Name: _user_group; Type: TABLE; Schema: titan; Owner: -; Tablespace: 
--

CREATE TABLE _user_group (
    _group integer NOT NULL,
    _user integer NOT NULL
);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _alert ALTER COLUMN _id SET DEFAULT nextval('_alert__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _browser ALTER COLUMN _id SET DEFAULT nextval('_browser__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _ckeditor ALTER COLUMN _id SET DEFAULT nextval('_ckeditor__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _cloud ALTER COLUMN _id SET DEFAULT nextval('_cloud__id_seq'::regclass);


--
-- Name: _code; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _cloud ALTER COLUMN _code SET DEFAULT (currval('_cloud__id_seq'::regclass))::character varying;


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _contact ALTER COLUMN _id SET DEFAULT nextval('_contact__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _file ALTER COLUMN _id SET DEFAULT nextval('_file__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _group ALTER COLUMN _id SET DEFAULT nextval('_group__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _media ALTER COLUMN _id SET DEFAULT nextval('_media__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _mobile ALTER COLUMN _id SET DEFAULT nextval('_mobile__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note ALTER COLUMN _id SET DEFAULT nextval('_note__id_seq'::regclass);


--
-- Name: _code; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note ALTER COLUMN _code SET DEFAULT (currval('_note__id_seq'::regclass))::character varying;


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note_media ALTER COLUMN _id SET DEFAULT nextval('_note_media__id_seq'::regclass);


--
-- Name: _code; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note_media ALTER COLUMN _code SET DEFAULT (currval('_note_media__id_seq'::regclass))::character varying;


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _rss ALTER COLUMN _id SET DEFAULT nextval('_rss__id_seq'::regclass);


--
-- Name: _id; Type: DEFAULT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user ALTER COLUMN _id SET DEFAULT nextval('_user__id_seq'::regclass);


--
-- Data for Name: _alert; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _alert (_id, _template, _assign, _until, _parameters, _user, _create, _update) FROM stdin;
\.


--
-- Name: _alert__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_alert__id_seq', 1, false);


--
-- Data for Name: _alert_mail; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _alert_mail (_alert, _trigger, _send) FROM stdin;
\.


--
-- Data for Name: _alert_user; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _alert_user (_alert, _user, _read, _delete, _mobile) FROM stdin;
\.


--
-- Data for Name: _browser; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _browser (_id, _pk, _user, _validity, _create, _update, _access, _counter) FROM stdin;
\.


--
-- Name: _browser__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_browser__id_seq', 1, false);


--
-- Data for Name: _city; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _city (_id, _name, _state) FROM stdin;
3251	Ourinhos	SP
5215	Coroados	SP
5587	Guapiara	SP
7700	Botelho	SP
13	Salto Grande	SP
16	Santa Clara D'oeste	SP
26	Santa Lucia	SP
69	Sao Jose das Laranjeiras	SP
77	Sao Miguel Arcanjo	SP
107	Taboao da Serra	SP
111	Tanabi	SP
112	Tapirai	SP
131	Tuiuti	SP
136	Turiuba	SP
151	Roseira	SP
163	Santa Cruz da Esperanca	SP
178	Santa Rita do Ribeira	SP
179	Santa Salete	SP
205	Sao Francisco	SP
226	Sao Lourenco da Serra	SP
240	Sao Simao	SP
242	Sapezal	SP
244	Sarapui	SP
257	Tabatinga	SP
259	Tambau	SP
266	Tatui	SP
276	Torrinha	SP
284	Tupi Paulista	SP
298	Sales Oliveira	SP
302	Santa Albertina	SP
312	Santana da Ponte Pensa	SP
344	Sao Lourenco do Turvo	SP
351	Sao Roque da Fartura	SP
365	Sertaozinho	SP
370	Socorro	SP
389	Tujuguaba	SP
398	Varpa	SP
403	Viradouro	SP
407	Votuporanga	SP
424	Sandovalina	SP
426	Santa Adelia	SP
438	Santa Maria da Serra	SP
441	Santa Rita do Passa 4	SP
451	Santo Anastacio	SP
454	Santo Antonio do Jardim	SP
456	Santo Expedito	SP
458	Santos	SP
459	Sao Benedito das Areias	SP
471	Sao Joaquim da Barra	SP
505	Silvania	SP
512	Taiuva	SP
533	Ubatuba	SP
541	Riversul	SP
545	Rubineia	SP
548	Salto de Pirapora	SP
555	Santa Cruz da Conceicao	SP
579	Sao Bernardo do Campo	SP
584	Sao Francisco da Praia	SP
632	Tabajara	SP
633	Tabapua	SP
638	Tapiratiba	SP
647	Terra Nova D'oeste	SP
650	Tibirica	SP
662	Uchoa	SP
664	Uniao Paulista	SP
665	Universo	SP
673	Rubiacea	SP
675	Sales	SP
680	Santa Cruz das Palmeiras	SP
720	Sao Joao do Marinheiro	SP
721	Sao Joao do Pau D'alho	SP
730	Sao Luis do Paraitinga	SP
735	Sao Paulo	SP
738	Sao Pedro do Turvo	SP
742	Sao Sebastiao da Serra	SP
750	Sebastianopolis do Sul	SP
759	Silveiras	SP
779	Tibirica do Paranapanema	SP
782	Trabiju	SP
791	Salesopolis	SP
794	Saltinho	SP
805	Santo Antonio da Estiva	SP
807	Santo Antonio do Aracangua	SP
808	Santo Antonio do Pinhal	SP
815	Sao Caetano do Sul	SP
831	Sao Jose da Bela Vista	SP
863	Serrana	SP
866	Severinia	SP
871	Sodrelia	SP
874	Sussui	SP
883	Tapinas	SP
888	Tejupa	SP
889	Tiete	SP
892	Timburi	SP
895	Torre de Pedra	SP
901	Ubirajara	SP
903	Urania	SP
931	Salmourao	SP
932	Salto	SP
937	Santa Cruz do Rio Pardo	SP
944	Santa Mercedes	SP
963	Santo Antonio do Paranapanema	SP
970	Sao Carlos	SP
976	Sao Francisco Xavier	SP
1001	Sao Sebastiao da Grama	SP
1013	Serra Azul	SP
1021	Simoes	SP
1027	Suinana	SP
1032	Talhado	SP
1038	Taruma	SP
1048	Ubarana	SP
1053	Rosana	SP
1054	Sagres	SP
1068	Santa Isabel do Marinheiro	SP
1072	Santa Maria do Gurupa	SP
1099	Sao Jose do Barreiro	SP
1139	Taciba	SP
1140	Taiacu	SP
1166	Valinhos	SP
1190	Sabino	SP
1206	Santa Rosa de Viterbo	SP
1219	Santopolis do Aguapei	SP
1221	Sao Bento do Sapucai	SP
1222	Sao Berto	SP
1233	Sao Joao Novo	SP
1255	Sao Pedro	SP
1265	Sao Vicente	SP
1282	Sorocaba	SP
1287	Suzano	SP
1293	Taquarivai	SP
1294	Termas de Ibira	SP
1305	Tremembe	SP
1308	Turvinia	SP
1317	Rubiao Junior	SP
1345	Santo Antonio da Alegria	SP
1360	Sao Joao da Boa Vista	SP
1374	Sao Manuel	SP
1406	Sumare	SP
1418	Taquaral	SP
1426	Tecainda	SP
1454	Rosalia	SP
1463	Santa Barbara D'oeste	SP
1464	Santa Branca	SP
1480	Santelmo	SP
1499	Sao Jose do Rio Preto	SP
1512	Sao Sebastiao	SP
1529	Simonsen	SP
1540	Taquaritinga	SP
1541	Taquarituba	SP
1542	Tarabai	SP
1556	Turmalina	SP
1584	Salto do Avanhandava	SP
1599	Sao Benedito da Cachoeirinha	SP
1621	Sao Jose dos Campos	SP
1656	Taubate	SP
1673	Turiba do Sul	SP
1683	Vargem Grande Paulista	SP
1710	Santa America	SP
1713	Santa Cruz da Estrela	SP
1714	Santa Ernestina	SP
1726	Santo Antonio de Posse	SP
1770	Serra Negra	SP
1783	Sud Mennucci	SP
1785	Suzanapolis	SP
1796	Tupi	SP
1803	Uru	SP
1827	Zacarias	SP
1839	Santa Cruz dos Lopes	SP
1840	Santa Fe do Sul	SP
1842	Santa Isabel	SP
1851	Santana de Parnaiba	SP
1876	Sao Joao de Iracema	SP
1888	Sao Luiz do Guaricanga	SP
1897	Sao Roque	SP
1907	Sarutaia	SP
1920	Taguai	SP
1925	Teodoro Sampaio	SP
1928	Terra Roxa	SP
1931	Toledo	SP
1938	Tupa	SP
1962	Vitoriana	SP
1964	Votorantim	SP
1968	Riolandia	SP
1969	Roberto	SP
1971	Ruilandia	SP
1982	Santa Eudoxia	SP
1983	Santa Gertrudes	SP
1988	Santa Rita D'oeste	SP
1993	Santo Andre	SP
2015	Sao Joao das 2 Pontes	SP
2016	Sao Joao de Itaguacu	SP
2026	Sao Jose do Rio Pardo	SP
2033	Sao Martinho D'oeste	SP
2104	Lencois Paulista	SP
2110	Lutecia	SP
2119	Maracai	SP
2142	Moncoes	SP
2145	Monte Alto	SP
2153	Murutinga do Sul	SP
2155	Natividade da Serra	SP
2171	Ocaucu	SP
2208	Pioneiros	SP
2210	Piracicaba	SP
2232	Presidente Alves	SP
2243	Rafard	SP
2246	Registro	SP
2269	Luis Antonio	SP
2274	Macucos	SP
2277	Manduri	SP
2293	Mineiros do Tiete	SP
2298	Mongagua	SP
2303	Monteiro Lobato	SP
2343	Onda Branca	SP
2367	Piacatu	SP
2374	Pindorama	SP
2379	Pirapozinho	SP
2382	Populina	SP
2385	Porto Feliz	SP
2389	Pradinia	SP
2390	Praia Grande	SP
2407	Ribeirao Corrente	SP
2427	Laranjal Paulista	SP
2430	Leme	SP
2431	Limeira	SP
2433	Louveira	SP
2436	Luiziania	SP
2449	Marapoama	SP
2464	Mogi Mirim	SP
2466	Montalvao	SP
2469	Monte Azul Paulista	SP
2490	Nova America	SP
2495	Novo Horizonte	SP
2500	Olimpia	SP
2503	Orlandia	SP
2505	Osasco	SP
2521	Pardinho	SP
2529	Pauliceia	SP
2542	Pirapora do Bom Jesus	SP
2548	Planalto	SP
2573	Lavrinhas	SP
2576	Lindoia	SP
2580	Lorena	SP
2616	Monte Mor	SP
2637	Nova Europa	SP
2638	Nova Guataporanga	SP
2640	Nova Luzitania	SP
2650	Nuporanga	SP
2677	Pedregulho	SP
2678	Pedrinhas Paulista	SP
2690	Piracaia	SP
2692	Pirajui	SP
2697	Pirassununga	SP
2716	Jurupema	SP
2726	Lourdes	SP
2732	Macaubal	SP
2740	Maraba Paulista	SP
2747	Marilia	SP
2750	Martinopolis	SP
2780	Nogueira	SP
2797	Osvaldo Cruz	SP
2804	Parapua	SP
2821	Pereira Barreto	SP
2826	Piedade	SP
2847	Pratania	SP
2851	Quadra	SP
2855	Queiroz	SP
2894	Lobo	SP
2917	Miracatu	SP
2922	Mococa	SP
2941	Nipoa	SP
2945	Nova Odessa	SP
2951	Oasis	SP
2964	Paraisolandia	SP
2975	Patrocinio Paulista	SP
2988	Pereiras	SP
2992	Piquerobi	SP
2995	Pitangueiras	SP
3020	Ribeirao Bonito	SP
3023	Ribeirao Grande	SP
3028	Rio Claro	SP
3030	Rio das Pedras	SP
3045	Laras	SP
3056	Lusitania	SP
3068	Martinho Prado Junior	SP
3078	Mogi das Cruzes	SP
3080	Monte Cabrao	SP
3090	Morro do Alto	SP
3100	Neves Paulista	SP
3118	Oscar Bressane	SP
3130	Palmeira D'oeste	SP
3148	Pedro Barros	SP
3170	Poa	SP
3177	Juquia	SP
3189	Lucianopolis	SP
3197	Mairipora	SP
3218	Mirandopolis	SP
3224	Morro Agudo	SP
3265	Paulinia	SP
3266	Pedra Branca de Itarare	SP
3283	Piraju	SP
3284	Piramboia	SP
3310	Restinga	SP
3326	Juritis	SP
3340	Lins	SP
3359	Matao	SP
3362	Maua	SP
3363	Mesopolis	SP
3370	Mogi Guacu	SP
3404	Ouro Verde	SP
3405	Pacaembu	SP
3415	Paraibuna	SP
3421	Paulopolis	SP
3434	Piquete	SP
3451	Potirendaba	SP
3453	Presidente Venceslau	SP
3455	Prudencio e Moraes	SP
3466	Ribeirao dos Indios	SP
3467	Rincao	SP
3474	Junqueiropolis	SP
3494	Major Prado	SP
3503	Maristela	SP
3511	Mendonca	SP
3514	Miguelopolis	SP
3523	Monte Alegre do Sul	SP
3527	Morungaba	SP
3528	Motuca	SP
3538	Nova Alianca	SP
3546	Novais	SP
3548	Novo Cravinhos	SP
3554	Orindiuva	SP
3564	Palestina	SP
3568	Panorama	SP
3611	Pontalinda	SP
3619	Jurupeba	SP
3621	Lacio	SP
3642	Magda	SP
3660	Martim Francisco	SP
3674	Mirante do Paranapanema	SP
3702	Nova Independencia	SP
3722	Oriente	SP
3738	Paranapanema	SP
3750	Pedreira	SP
3753	Pedro de Toledo	SP
3757	Penapolis	SP
3771	Pirangi	SP
3777	Poloni	SP
3786	Juquiratiba	SP
3789	Lagoa Azul	SP
3811	Lucelia	SP
3812	Lupercio	SP
3813	Mairinque	SP
3843	Mostardas	SP
3848	Narandiba	SP
3851	Nazare Paulista	SP
3854	Nossa Senhora do Remedio	SP
3855	Nova Alexandria	SP
3862	Nova Patria	SP
3876	Ouroeste	SP
3877	Palmares Paulista	SP
3882	Paraiso	SP
3901	Peruibe	SP
3905	Picinguaba	SP
3906	Pilar do Sul	SP
3911	Piratininga	SP
3918	Pontes Gestal	SP
3942	Ribeirao Pires	SP
3946	Juquitiba	SP
3950	Lagoa Branca	SP
3986	Mirassolandia	SP
3994	Monte Castelo	SP
4009	Nova Itapirema	SP
4020	Oleo	SP
4024	Onda Verde	SP
4036	Parisi	SP
4037	Parnaso	SP
4038	Paruru	SP
4042	Pedra Bela	SP
4056	Pinhalzinho	SP
4065	Planalto do Sul	SP
4066	Platina	SP
4069	Polvilho	SP
4087	Quintana	SP
4093	Reginopolis	SP
4109	Rio Grande da Serra	SP
4114	Juruce	SP
4135	Macatuba	SP
4136	Macedonia	SP
4141	Mailasqui	SP
4159	Mariapolis	SP
4171	Meridiano	SP
4176	Mirassol	SP
4181	Monte Aprazivel	SP
4189	Nantes	SP
4201	Nova Canaa Paulista	SP
4215	Padre Nobrega	SP
4225	Paranabi	SP
4229	Pariquera Acu	SP
4234	Pederneiras	SP
4257	Pompeia	SP
4259	Pontal	SP
4269	Junqueira	SP
4281	Lauro Penteado	SP
4282	Lavinia	SP
4295	Mangaratu	SP
4314	Mira Estrela	SP
4332	Mourao	SP
4340	Nova Castilho	SP
4383	Paulistania	SP
4385	Paulo de Faria	SP
4400	Pindamonhangaba	SP
4402	Pinheiros	SP
4425	Lagoinha	SP
4448	Marcondesia	SP
4449	Maresias	SP
4453	Marinopolis	SP
4463	Miraluz	SP
4466	Mombuca	SP
4469	Monte Verde Paulista	SP
4482	Nhandeara	SP
4488	Nova Campina	SP
4490	Nova Granada	SP
4500	Oliveira Barros	SP
4507	Palmital	SP
4510	Paraguacu Paulista	SP
4513	Paranapua	SP
4531	Pedranopolis	SP
4545	Pongai	SP
4549	Porangaba	SP
4552	Porto Ferreira	SP
4554	Potunduva	SP
4571	Ribeiro dos Santos	SP
4576	Cipo Guacu	SP
4609	Divinolandia	SP
4618	Embu Guacu	SP
4624	Esmeralda	SP
4626	Estrela do Norte	SP
4636	Florinea	SP
4668	Holambra II	SP
4669	Hortolandia	SP
4680	Ilhabela	SP
4696	Itaporanga	SP
4697	Itatiba	SP
4698	Itatinga	SP
4703	Itu	SP
4706	Iubatinga	SP
4713	Jandira	SP
4716	Jatoba	SP
4760	Dirce Reis	SP
4771	Dracena	SP
4786	Euclides da Cunha Paulista	SP
4796	Frutal do Campo	SP
4800	Gardenia	SP
4804	Getulina	SP
4810	Guaianas	SP
4812	Guara	SP
4814	Guaraciaba D'oeste	SP
4825	Ibirarema	SP
4831	Igacaba	SP
4832	Igaracu do Tiete	SP
4836	Ilha Diana	SP
4837	Inubia Paulista	SP
4844	Irapuru	SP
4851	Itaiuba	SP
4857	Itapolis	SP
4858	Itariri	SP
4863	Jacuba	SP
4869	Jeriquara	SP
4870	Joanopolis	SP
4880	Clarinia	SP
4889	Conchal	SP
4896	Coronel Macedo	SP
4901	Cosmorama	SP
4929	Espirito Santo do Pinhal	SP
4931	Estiva Gerbi	SP
4965	Guapiranga	SP
4971	Guaruja	SP
4981	Iepe	SP
4989	Indiana	SP
5019	Itobi	SP
5050	Colina	SP
5064	Corredeira	SP
5067	Costa Machado	SP
5075	Cunha	SP
5078	Curupa	SP
5088	Elias Fausto	SP
5089	Elisiario	SP
5108	Garca	SP
5148	Itapeva	SP
5149	Itapira	SP
5156	Jaboticabal	SP
5194	Vinhedo	SP
5202	Colombia	SP
5230	Descalvado	SP
5238	Duplo Ceu	SP
5239	Embu	SP
5266	Guamium	SP
5268	Guarizinho	SP
5277	Ibate	SP
5282	Igarapava	SP
5283	Igarata	SP
5287	Indaiatuba	SP
5291	Ipua	SP
5308	Itanhaem	SP
5331	Julio Mesquita	SP
5342	Vicentinopolis	SP
5347	Vista Alegre do Alto	SP
5362	Conceicao de Monte Alegre	SP
5379	Cruz das Posses	SP
5412	Ferraz de Vasconcelos	SP
5416	Floresta do Sul	SP
5421	Francisco Morato	SP
5442	Guzolandia	SP
5460	Itajobi	SP
5466	Itapui	SP
5477	Jafa	SP
5478	Jaguariuna	SP
5495	Varzea Paulista	SP
5496	Venda Branca	SP
5509	Vitoria Brasil	SP
5527	Cordeiropolis	SP
5530	Corrego Rico	SP
5532	Cosmopolis	SP
5547	Echapora	SP
5548	Eldorado	SP
5560	Fartura	SP
5570	Floreal	SP
5583	Gramadinho	SP
5601	Ibitinga	SP
5620	Irapua	SP
5627	Itapevi	SP
5630	Itirapina	SP
5639	Jambeiro	SP
5645	Jarinu	SP
5661	Valparaiso	SP
5663	Vargem Grande do Sul	SP
5667	Vera Cruz	SP
5726	Dolcinopolis	SP
5729	Domelia	SP
5736	Engenheiro Maia	SP
5743	Espirito Santo do Turvo	SP
5776	Guarei	SP
5781	Iacanga	SP
5786	Igarai	SP
5794	Ipeuna	SP
5813	Itapetininga	SP
5818	Itarare	SP
5827	Joao Ramalho	SP
5871	Duartina	SP
5882	Esperanca D'oeste	SP
5892	Fernando Prestes	SP
5895	Flora Rica	SP
5897	Florida Paulista	SP
5920	Guaraci	SP
5922	Guaranta	SP
5930	Iacri	SP
5936	Ilha Comprida	SP
5944	Iracemapolis	SP
5959	Itapura	SP
5960	Itaqueri da Serra	SP
5964	Itupeva	SP
5996	Corumbatai	SP
5997	Cotia	SP
5999	Cristais Paulista	SP
6001	Cruzalia	SP
6003	Cubatao	SP
6015	Dirceu	SP
6020	Dumont	SP
6023	Engenheiro Balduino	SP
6035	Fatima	SP
6036	Fazenda Velha	SP
6038	Fernandopolis	SP
6074	Ibiporanga	SP
6077	Ibitiruna	SP
6081	Iguape	SP
6107	Jaborandi	SP
6113	Jardinopolis	SP
6132	Clementina	SP
6133	Cocaes	SP
6159	Engenheiro Coelho	SP
6178	Gabriel Monteiro	SP
6179	Galia	SP
6185	Gastao Vidigal	SP
6198	Guararema	SP
6209	Ibitiuva	SP
6210	Ibiuna	SP
6242	Itirapua	SP
6244	Jacarei	SP
6251	Jau	SP
6257	Jundiai	SP
6265	Quata	SP
6278	Ribeirao Branco	SP
6281	Rinopolis	SP
6324	Eneida	SP
6326	Engenheiro Schmidt	SP
6329	Estrela D'oeste	SP
6350	Franca	SP
6367	Herculandia	SP
6381	Ingas	SP
6384	Ipero	SP
6385	Ipigua	SP
6387	Iporanga	SP
6391	Itabera	SP
6400	Itaoca	SP
6402	Itapirapua Paulista	SP
6412	Jacare	SP
6413	Jaci	SP
6414	Jacipora	SP
6432	Primavera	SP
6441	Rancharia	SP
6443	Rechan	SP
6447	Ribeira	SP
6450	Ribeiro do Vale	SP
6472	Coronel Goulart	SP
6541	Guapiacu	SP
6543	Guariba	SP
6544	Guariroba	SP
6551	Ibira	SP
6566	Irape	SP
6567	Itaboa	SP
6569	Itai	SP
6576	Itapecerica da Serra	SP
6582	Itororo do Paranapanema	SP
6587	Jamaica	SP
6598	Jumirim	SP
6604	Promissao	SP
6612	Redencao da Serra	SP
6633	Conchas	SP
6652	Cuiaba Paulista	SP
6668	Eleuterio	SP
6669	Embauba	SP
6699	Gaviao Peixoto	SP
6712	Guachos	SP
6713	Guaira	SP
6715	Guaracai	SP
6717	Guarapiranga	SP
6718	Guarapua	SP
6728	Iaras	SP
6737	Ibitu	SP
6743	Ilha Solteira	SP
6752	Ipaussu	SP
6772	Itaquaquecetuba	SP
6784	Jales	SP
6793	Jordanesia	SP
6799	Juliania	SP
6819	Cravinhos	SP
6828	Dalas	SP
6833	Dobrada	SP
6850	Fernao	SP
6867	Guaimbe	SP
6871	Guarani D'oeste	SP
6873	Guaratingueta	SP
6878	Holambra	SP
6886	Ida Iolanda	SP
6894	Indaia do Aguapei	SP
6908	Itaju	SP
6924	Ituverava	SP
6961	Regente Feijo	SP
6989	Cruzeiro	SP
7000	Diadema	SP
7006	Dourado	SP
7009	Emilianopolis	SP
7017	Espigao	SP
7021	Fatima Paulista	SP
7029	Franco da Rocha	SP
7037	General Salgado	SP
7038	Glicerio	SP
7045	Guaicara	SP
7047	Guararapes	SP
7049	Guarulhos	SP
7051	Guatapara	SP
7067	Icem	SP
7074	Indiapora	SP
7094	Itapeuna	SP
7105	Jacupiranga	SP
7117	Jose Bonifacio	SP
7119	3 Aliancas	SP
7124	Adamantina	SP
7137	Americo de Campos	SP
7138	Analandia	SP
7139	Anhembi	SP
7143	Aparecida de Monte Alto	SP
7144	Aparecida do Bonito	SP
7148	Aracatuba	SP
7167	Barbosa	SP
7174	Batatais	SP
7176	Bela Floresta	SP
7192	Borebi	SP
7203	Buritizal	SP
7209	Caconde	SP
7226	Candido Rodrigues	SP
7237	Cardoso	SP
7248	Charqueada	SP
7252	Pradopolis	SP
7255	Presidente Epitacio	SP
7266	Ribeirao Preto	SP
7286	Aguas da Prata	SP
7287	Aguas de Santa Barbara	SP
7296	Alto Alegre	SP
7301	Americana	SP
7302	Ana Dias	SP
7305	Anhumas	SP
7327	Avanhandava	SP
7333	Balbinos	SP
7339	Barra do Chapeu	SP
7362	Bonfim Paulista	SP
7369	Cachoeira de Emas	SP
7372	Caibura	SP
7379	Cambaquara	SP
7386	Campo Limpo Paulista	SP
7390	Candia	SP
7414	Potim	SP
7417	Presidente Bernardes	SP
7419	Presidente Prudente	SP
7425	Queluz	SP
7435	Rifaina	SP
7449	Ajapi	SP
7468	Andes	SP
7471	Aparecida D'oeste	SP
7473	Aracoiaba da Serra	SP
7482	Araras	SP
7489	Artemis	SP
7500	Barra Bonita	SP
7534	Brejo Alegre	SP
7536	Bueno de Andrada	SP
7546	Cajati	SP
7560	Capela do Alto	SP
7569	Caruara	SP
7585	Pracinha	SP
7599	Ribeirao do Sul	SP
7609	3 Fronteiras	SP
7612	Adolfo	SP
7621	Aguas de Lindoia	SP
7622	Aguas de Sao Pedro	SP
7634	Alvaro de Carvalho	SP
7648	Aparecida de Sao Manuel	SP
7664	Aspasia	SP
7670	Bandeirantes D'oeste	SP
7682	Barrinha	SP
7701	Botucatu	SP
7723	Campestrinho	SP
7734	Capivari	SP
7748	Catucaba	SP
7797	Araraquara	SP
7804	Ariri	SP
7808	Bady Bassitt	SP
7825	Bebedouro	SP
7847	Bom Retiro da Esperanca	SP
7855	Brotas	SP
7872	Caieiras	SP
7878	Campina de Fora	SP
7879	Campina do Monte Alegre	SP
7889	Canguera	SP
7926	Alambari	SP
7935	Alvares Machado	SP
7940	Amparo	SP
7941	Angatuba	SP
7944	Aparecida	SP
7956	Arealva	SP
7962	Artur Nogueira	SP
7969	Bacaetava	SP
7984	Batista Botelho	SP
7992	Bilac	SP
7994	Boa Esperanca do Sul	SP
8006	Brasitania	SP
8008	Brodowski	SP
8009	Buri	SP
8084	Aguai	SP
8086	Alberto Moreira	SP
8112	Aramina	SP
8114	Arandu	SP
8127	Avare	SP
8131	Balsamo	SP
8137	Barra do Turvo	SP
8152	Bertioga	SP
8162	Bora	SP
8207	Casa Branca	SP
8208	Cassia dos Coqueiros	SP
8209	Cerqueira Cesar	SP
8242	Apiai Mirim	SP
8249	Areias	SP
8250	Areiopolis	SP
8253	Assis	SP
8280	Boraceia	SP
8285	Braganca Paulista	SP
8300	Cafelandia	SP
8317	Campos Novos Paulista	SP
8334	Castilho	SP
8338	Catanduva	SP
8347	Valentim Gentil	SP
8372	Agua Vermelha	SP
8379	Alto Pora	SP
8380	Aluminio	SP
8407	Barrania	SP
8409	Barueri	SP
8419	Boituva	SP
8430	Borborema	SP
8433	Braco	SP
8454	Campos de Cunha	SP
8457	Canas	SP
8460	Candido Mota	SP
8475	Cedral	SP
8550	Arco Iris	SP
8563	Bacuriti	SP
8572	Bariri	SP
8579	Barra Dourada	SP
8589	Bernardino de Campos	SP
8595	Bocaina	SP
8620	Cafesopolis	SP
8622	Cajuru	SP
8640	Capao Bonito	SP
8642	Caporanga	SP
8645	Carapicuiba	SP
8665	2 Corregos	SP
8668	7 Barras	SP
8697	Americo Brasiliense	SP
8700	Anapolis	SP
8701	Andradina	SP
8719	Assistencia	SP
8722	Avencas	SP
8723	Baguacu	SP
8730	Barao de Antonina	SP
8747	Biritiba Mirim	SP
8752	Bom Fim do Bom Jesus	SP
8755	Botafogo	SP
8761	Buritama	SP
8768	Caiabu	SP
8783	Capivari da Mata	SP
8818	Alfredo Guedes	SP
8819	Alfredo Marcondes	SP
8823	Altinopolis	SP
8830	Amadeu Amaral	SP
8843	Aracacu	SP
8847	Araxas	SP
8855	Avai	SP
8866	Barretos	SP
8886	Bom Sucesso de Itarare	SP
8907	Cajobi	SP
8912	Campinal	SP
8918	Campos do Jordao	SP
8936	Catigua	SP
8952	Vale Formoso	SP
8953	Vargem	SP
8980	Agudos	SP
8991	Alvares Florence	SP
8992	Alvinlandia	SP
8995	Amandaba	SP
8998	Ameliopolis	SP
9013	Arapei	SP
9019	Aruja	SP
9021	Atibaia	SP
9030	Barao Ataliba Nogueira	SP
9070	Caiua	SP
9076	Campinas	SP
9082	Canitar	SP
9091	Cardeal	SP
9101	Cerquilho	SP
9104	Cesario Lange	SP
9120	Agulha	SP
9125	Altair	SP
9140	Aracaiba	SP
9142	Ariranha	SP
9147	Atlantida	SP
9166	Bastos	SP
9174	Birigui	SP
9178	Boa Vista dos Andradas	SP
9194	Cabreuva	SP
9197	Cachoeira Paulista	SP
9209	Cananeia	SP
9241	Chavantes	SP
9245	Urupes	SP
9246	Ururai	SP
9269	3 Vendas	SP
9279	Agisse	SP
9300	Apiai	SP
9302	Arabela	SP
9303	Aracariguama	SP
9314	Auriflama	SP
9322	Bananal	SP
9343	Biritiba Ussu	SP
9349	Bom Jesus dos Perdoes	SP
9357	Brauna	SP
9366	Cacapava	SP
9375	Cajamar	SP
9417	Vangloria	SP
9483	Bairro Alto	SP
9495	Batatuba	SP
9497	Bauru	SP
9502	Bento de Abreu	SP
9509	Bofete	SP
9516	Cabralia Paulista	SP
9529	Cambaratiba	SP
9551	Caraguatatuba	SP
46	Sao Bento do Tocantins	TO
52	Sao Felix do Tocantins	TO
80	Sao Miguel do Tocantins	TO
109	Taguatinga	TO
239	Sao Sebastiao do Tocantins	TO
263	Taquarussu do Tocantins	TO
305	Santa Fe do Araguaia	TO
508	Sitio Novo do Tocantins	TO
532	Tupirama	TO
550	Sampaio	TO
608	Sao Salvador do Tocantins	TO
640	Taquaralto	TO
656	Tupirata	TO
769	Tamboril	TO
1020	Silvanopolis	TO
1208	Santa Terezinha do Tocantins	TO
1303	Tocantinopolis	TO
1307	Tupiratins	TO
1412	Taipas do Tocantins	TO
1462	Sandolandia	TO
1476	Santa Tereza do Tocantins	TO
1515	Sao Valerio da Natividade	TO
1536	Talisma	TO
1664	Tocantinia	TO
1697	Wanderlandia	TO
1718	Santa Maria do Tocantins	TO
1720	Santa Rosa do Tocantins	TO
1846	Santa Rita do Tocantins	TO
1916	Sucupira	TO
1966	Xambioa	TO
2138	Miracema do Tocantins	TO
2194	Pau D'arco	TO
2196	Pe da Serra	TO
2198	Peixe	TO
2309	Muricilandia	TO
2400	Recursolandia	TO
2421	Lagoa da Confusao	TO
2432	Lizarda	TO
2484	Nazare	TO
2567	Lagoa do Tocantins	TO
2663	Palmeiropolis	TO
2667	Parana	TO
2707	Ponte Alta do Tocantins	TO
2768	Monte Santo do Tocantins	TO
2792	Novo Horizonte	TO
2843	Porto Alegre do Tocantins	TO
2882	Lajeado	TO
2913	Mateiros	TO
3066	Marianopolis do Tocantins	TO
3092	Mosquito	TO
3129	Palmas	TO
3152	Pequizeiro	TO
3174	Poraozinho	TO
3191	Luzinopolis	TO
3222	Monte Lindo	TO
3236	Nova Olinda	TO
3244	Oliveira de Fatima	TO
3547	Novo Alegre	TO
3567	Palmeirante	TO
3598	Pindorama do Tocantins	TO
3716	Novo Jardim	TO
3754	Pedro Ludovico	TO
3804	Lavandeira	TO
3835	Mirandopolis	TO
3917	Pontes	TO
3921	Porto Lemos	TO
3980	Maurilandia do Tocantins	TO
4064	Pium	TO
4078	Praia Norte	TO
4175	Miranorte	TO
4245	Piloes	TO
4251	Piraque	TO
4261	Ponte Alta do Bom Jesus	TO
4336	Natal	TO
4349	Nova Rosalandia	TO
4350	Novo Acordo	TO
4373	Paraiso do Tocantins	TO
4391	Pedro Afonso	TO
4467	Monte do Carmo	TO
4480	Natividade	TO
4581	Colinas do Tocantins	TO
4736	Combinado	TO
4815	Guarai	TO
4902	Craolandia	TO
5084	Divinopolis do Tocantins	TO
5132	Ilha Barreira Branca	TO
5137	Ipueiras	TO
5150	Itapora do Tocantins	TO
5166	Jau do Tocantins	TO
5220	Couto de Magalhaes	TO
5273	Gurupi	TO
5312	Itapiratins	TO
5518	Cocalinho	TO
5525	Conceicao do Tocantins	TO
5573	Fortaleza do Tabocao	TO
5703	Crixas	TO
5748	Fatima	TO
5766	Goianorte	TO
5855	Crixas do Tocantins	TO
5872	Duere	TO
5914	Goiatins	TO
6007	Darcinopolis	TO
6093	Itacaja	TO
6231	Itaguatins	TO
6263	Presidente Kennedy	TO
6275	Riachinho	TO
6292	Colmeia	TO
6316	Dianopolis	TO
6328	Esperantina	TO
6347	Formoso do Araguaia	TO
6427	Porto Nacional	TO
6436	Pugmil	TO
6647	Cristalandia	TO
6684	Filadelfia	TO
6803	Cocalandia	TO
6854	Figueiropolis	TO
6940	Juarina	TO
6983	Correinha	TO
7016	Escondido	TO
7123	Abreulandia	TO
7135	Alvorada	TO
7161	Aurora do Tocantins	TO
7197	Brasilandia	TO
7257	Principe	TO
7438	Rio da Conceicao	TO
7467	Ananas	TO
7469	Angico	TO
7474	Araguacu	TO
7476	Araguaina	TO
7477	Araguana	TO
7521	Bernardo Sayao	TO
7531	Brasilandia do Tocantins	TO
7557	Cana Brava	TO
7568	Cartucho	TO
7651	Aragominas	TO
7653	Arapoema	TO
7704	Brejinho de Nazare	TO
7728	Campos Lindos	TO
7814	Bandeirantes do Tocantins	TO
7966	Augustinopolis	TO
7983	Barrolandia	TO
8202	Cariri do Tocantins	TO
8211	Chapada da Natividade	TO
8229	Almas	TO
8444	Cachoeirinha	TO
8511	2 Irmaos do Tocantins	TO
8540	Aparecida do Rio Negro	TO
8545	Araguacema	TO
8561	Axixa do Tocantins	TO
8715	Arraias	TO
8764	Buriti do Tocantins	TO
8799	Caseara	TO
8845	Araguatins	TO
8862	Barra do Ouro	TO
8884	Bom Jesus do Tocantins	TO
8940	Centenario	TO
8959	Venus	TO
8985	Alianca do Tocantins	TO
9010	Aragacui	TO
9094	Carrasco Bonito	TO
9110	Rio Sono	TO
9130	Anajanopolis	TO
9139	Apinaje	TO
9158	Barra do Grota	TO
9240	Chapada da Areia	TO
9316	Babaculandia	TO
9450	Aguiarnopolis	TO
9555	Carmolandia	TO
9568	Rio dos Bois	TO
434	Santa Luzia do Itanhy	SE
535	Umbauba	SE
575	Santo Amaro das Brotas	SE
933	Samambaia	SE
972	Sao Domingos	SE
1088	Sao Francisco	SE
1239	Sao Jose	SE
1320	Salgado	SE
1427	Telha	SE
1479	Santana do Sao Francisco	SE
1506	Sao Mateus da Palestina	SE
1549	Tomar do Geru	SE
1663	Tobias Barreto	SE
1731	Sao Cristovao	SE
1751	Sao Miguel do Aleixo	SE
1775	Simao Dias	SE
1828	Rosario do Catete	SE
1848	Santa Rosa de Lima	SE
1914	Siriri	SE
2214	Poco Verde	SE
2316	Neopolis	SE
2405	Riachao do Dantas	SE
2418	Lagarto	SE
2455	Maruim	SE
2587	Malhada dos Bois	SE
2632	Nossa Senhora de Lourdes	SE
2723	Laranjeiras	SE
2764	Monte Alegre de Sergipe	SE
2980	Pedras	SE
3163	Pirambu	SE
3194	Macambira	SE
3387	Nossa Senhora das Dores	SE
3388	Nossa Senhora do Socorro	SE
3479	Lagoa Funda	SE
3561	Pacatuba	SE
3584	Pedra Mole	SE
3602	Pinhao	SE
3614	Porto da Folha	SE
3692	Muribeca	SE
3696	Nossa Senhora Aparecida	SE
3697	Nossa Senhora da Gloria	SE
3751	Pedrinhas	SE
3837	Moita Bonita	SE
3943	Ribeiropolis	SE
3967	Malhador	SE
4099	Riachuelo	SE
4331	Mosqueiro	SE
4411	Poco Redondo	SE
4464	Miranda	SE
4505	Palmares	SE
4562	Propria	SE
4625	Estancia	SE
4751	Cumbe	SE
4761	Divina Pastora	SE
4938	Feira Nova	SE
5002	Itabaiana	SE
5003	Itabaianinha	SE
5105	Frei Paulo	SE
5428	General Maynard	SE
5644	Japoata	SE
5702	Cristinapolis	SE
5790	Ilha das Flores	SE
6100	Itaporanga D'ajuda	SE
6380	Indiaroba	SE
6392	Itabi	SE
6533	Gararu	SE
6866	Graccho Cardoso	SE
6928	Japaratuba	SE
7191	Boquim	SE
7391	Canhoba	SE
7393	Capela	SE
7405	Carmopolis	SE
7555	Campo do Brito	SE
7639	Amparo de Sao Francisco	SE
8062	Cedro de Sao Joao	SE
8119	Areia Branca	SE
8138	Barra dos Coqueiros	SE
8196	Caninde de Sao Francisco	SE
8705	Aquidaba	SE
8712	Araua	SE
8757	Brejo Grande	SE
9127	Altos Verdes	SE
9474	Aracaju	SE
9491	Barracas	SE
9554	Carira	SE
201	Sao Bras	AL
294	Roteiro	AL
316	Santo Antonio	AL
385	Traipu	AL
415	Rocha Cavalcante	AL
492	Satuba	AL
594	Sao Jose da Tapera	AL
616	Sapucaia	AL
620	Senador Rui Palmeira	AL
635	Taboleiro do Pinto	AL
688	Santa Luzia do Norte	AL
725	Sao Jose da Laje	AL
777	Teotonio Vilela	AL
886	Tatuamunha	AL
957	Santana do Mundau	AL
1036	Tanque D'arca	AL
1082	Santana do Ipanema	AL
1260	Sao Sebastiao	AL
1275	Serra da Mandioca	AL
1292	Taquarana	AL
1376	Sao Miguel dos Campos	AL
1446	Uniao dos Palmares	AL
1626	Sao Miguel dos Milagres	AL
1681	Usina Camacari	AL
1768	Serra do Sao Jose	AL
1919	Taboquinha	AL
1981	Santa Efigenia	AL
2031	Sao Luis do Quitunde	AL
2135	Messias	AL
2172	Olho D'agua das Flores	AL
2177	Ouro Branco	AL
2191	Paripueira	AL
2251	Riacho Fundo de Cima	AL
2281	Maribondo	AL
2342	Olho D'agua do Casado	AL
2349	Palmeira de Fora	AL
2350	Pao de Acucar	AL
2371	Pilar	AL
2397	Quebrangulo	AL
2420	Lagoa da Areia	AL
2480	Munguba	AL
2604	Matriz de Camaragibe	AL
2674	Paulo Jacinto	AL
2703	Poco das Trincheiras	AL
2769	Moreira	AL
2828	Pindoba	AL
2835	Pocao	AL
2879	Lagoa do Exu	AL
2959	Palmeira dos Indios	AL
3036	Lagoa do Canto	AL
3038	Lagoa do Rancho	AL
3042	Lajes do Caldeirao	AL
3094	Murici	AL
3264	Pau D'arco	AL
3292	Porto de Pedras	AL
3324	Rio Largo	AL
3337	Limoeiro de Anadia	AL
3353	Maravilha	AL
3420	Pau Ferro	AL
3498	Mar Vermelho	AL
3552	Olho D'agua dos Dandanhas	AL
3563	Palestina	AL
3609	Poco da Pedra	AL
3624	Lagoa da Canoa	AL
3627	Lagoa do Caldeirao	AL
3633	Laranjal	AL
3639	Maceio	AL
3663	Mata Grande	AL
3682	Monteiropolis	AL
3717	Novo Lino	AL
3721	Olho D'agua de Cima	AL
3758	Penedo	AL
3790	Lagoa Dantas	AL
3814	Major Isidoro	AL
3824	Marechal Deodoro	AL
3909	Piranhas	AL
3923	Porto Real do Colegio	AL
3951	Lagoa da Pedra	AL
4075	Porto Calvo	AL
4113	Junqueiro	AL
4162	Massaranduba	AL
4243	Piacabucu	AL
4298	Maragogi	AL
4312	Minador do Negrao	AL
4354	Olho D Agua Grande	AL
4358	Olivenca	AL
4377	Pariconha	AL
4520	Passo de Camaragibe	AL
4555	Poxim	AL
4721	Joaquim Gomes	AL
4745	Coruripe	AL
4788	Feira Grande	AL
4862	Jacare dos Homens	AL
4914	Delmiro Gouveia	AL
4954	Girau do Ponciano	AL
5025	Jacuipe	AL
5030	Japaratinga	AL
5069	Craibas	AL
5375	Coruripe da Cal	AL
5448	Igreja Nova	AL
5501	Vicosa	AL
5680	Colonia Leopoldina	AL
5833	Jundia	AL
6117	Jenipapo	AL
6139	Coqueiro Seco	AL
6172	Flexeiras	AL
6213	Igaci	AL
6327	Entremontes	AL
6338	Feliz Deserto	AL
6446	Riacho do Sertao	AL
6535	Gaspar	AL
6748	Inhapi	AL
6787	Jaramataia	AL
6805	Coite do Noia	AL
6843	Estrela de Alagoas	AL
6882	Ibateguara	AL
7141	Anum Velho	AL
7160	Atalaia	AL
7165	Baixa do Capim	AL
7186	Boca da Mata	AL
7222	Canaa	AL
7275	2 Riachos	AL
7356	Bom Jardim	AL
7497	Bananeiras	AL
7524	Boa Sorte	AL
7548	Caldeiroes de Cima	AL
7550	Camadanta	AL
7721	Campestre	AL
7816	Barra de Santo Antonio	AL
7884	Canafistula	AL
8022	Cajueiro	AL
8108	Anum Novo	AL
8130	Baixa da Onca	AL
8189	Campo Grande	AL
8220	Agua Branca	AL
8416	Boa Vista	AL
8468	Carneiros	AL
8500	Vila Aparecida	AL
8582	Batingas	AL
8585	Belo Monte	AL
8641	Capela	AL
8767	Cacimbinhas	AL
8795	Carrasco	AL
8846	Arapiraca	AL
8861	Barra de Sao Miguel	AL
8888	Bonifacio	AL
8906	Cajarana	AL
8914	Campo Alegre	AL
8919	Canapi	AL
8982	Alazao	AL
9034	Barra do Bonifacio	AL
9162	Barra Grande	AL
9260	Vila Sao Francisco	AL
9321	Balsamo	AL
9333	Batalha	AL
9336	Belem	AL
9355	Branquinha	AL
9412	Cha Preta	AL
9451	Alecrim	AL
9461	Anadia	AL
9467	Anel	AL
9540	Canastra	AL
9542	Cangandu	AL
35	Santa Terezinha	PE
92	Saue	PE
110	Tamboata	PE
132	Tupanaci	PE
143	Upatininga	PE
174	Santa Maria do Cambuca	PE
221	Sao Jose do Egito	PE
230	Sao Pedro	PE
254	Sirinhaem	PE
264	Tara	PE
267	Tauapiranga	PE
319	Santo Antonio das Queimadas	PE
384	Toritama	PE
400	Venturosa	PE
422	Salgadinho	PE
523	Terezinha	PE
527	Timorante	PE
534	Umas	PE
553	Santa Cruz	PE
564	Santa Maria da Boa Vista	PE
574	Santo Agostinho	PE
588	Sao Joao	PE
625	Serrolandia	PE
630	Solidao	PE
684	Santa Filomena	PE
757	Serra Talhada	PE
766	Tacaimbo	PE
767	Tacaratu	PE
810	Santo Antonio dos Palmares	PE
864	Serrita	PE
869	Siriji	PE
900	Tupanatinga	PE
968	Sao Bento do Una	PE
1046	Tupaoca	PE
1095	Sao Joaquim do Monte	PE
1138	Tabira	PE
1155	Tracunhaem	PE
1172	Vertente do Lerio	PE
1277	Sertania	PE
1286	Surubim	PE
1291	Tapiraim	PE
1324	Sanharo	PE
1331	Santa Rita	PE
1341	Santana de Sao Joaquim	PE
1354	Sao Caetano do Navio	PE
1387	Sao Vicente Ferrer	PE
1413	Tamandare	PE
1421	Taquaritinga do Norte	PE
1433	Trindade	PE
1435	Triunfo	PE
1460	Saloa	PE
1461	Salobro	PE
1487	Sao Benedito do Sul	PE
1501	Sao Lourenco da Mata	PE
1518	Sapucarana	PE
1543	Tejucupapo	PE
1552	Trapia	PE
1557	Umburetama	PE
1566	Vasques	PE
1575	Viracao	PE
1576	Vitoria de Santo Antao	PE
1578	Xucuru	PE
1583	Salgueiro	PE
1616	Sao Jose	PE
1630	Sao Vicente	PE
1661	Timbauba	PE
1676	Urucu Mirim	PE
1689	Vertentes	PE
1706	Saire	PE
1769	Serra do Vento	PE
1777	Sitio dos Nunes	PE
1793	Terra Nova	PE
1802	Urimama	PE
1837	Santa Cruz da Baixa Verde	PE
1860	Sao Domingos	PE
1880	Sao Jose da Coroa Grande	PE
1909	Serra Branca	PE
1941	Tuparetama	PE
1980	Santa Cruz do Capibaribe	PE
2003	Sao Caitano	PE
2020	Sao Jose do Belmonte	PE
2029	Sao Lazaro	PE
2058	Sertaozinho de Baixo	PE
2069	Tabocas	PE
2097	Jurema	PE
2106	Limoeiro	PE
2118	Manicoba	PE
2156	Nazare da Mata	PE
2188	Paranatama	PE
2199	Pesqueira	PE
2220	Pontas de Pedra	PE
2292	Mimoso	PE
2310	Murupe	PE
2398	Rajada	PE
2425	Lajedo	PE
2483	Nascente	PE
2487	Nossa Senhora da Luz	PE
2499	Olho D'agua de Dentro	PE
2504	Oroco	PE
2528	Paudalho	PE
2552	Pombos	PE
2565	Lagoa do Barro	PE
2566	Lagoa do Carro	PE
2665	Pao de Acucar	PE
2673	Pau Ferro	PE
2704	Poco Fundo	PE
2738	Mandacaru	PE
2761	Miracica	PE
2786	Nova Cruz	PE
2805	Parnamirim	PE
2824	Petrolandia	PE
2863	Recife	PE
2873	Jupi	PE
2874	Jutai	PE
2878	Lagoa de Sao Jose	PE
2892	Livramento do Tiuma	PE
2896	Luanda	PE
2935	Moxoto	PE
3039	Lagoa do Souza	PE
3077	Mirandiba	PE
3087	Moreilandia	PE
3096	Mutuca	PE
3115	Oratorio	PE
3128	Palmares	PE
3133	Pao de Acucar do Pocao	PE
3181	Lagoa do Itaenga	PE
3229	Nossa Senhora do O	PE
3304	Quixaba	PE
3313	Riacho das Almas	PE
3344	Machados	PE
3375	Moreno	PE
3399	Ori	PE
3402	Ouricuri	PE
3414	Papagaio	PE
3419	Passira	PE
3459	Rainha Isabel	PE
3477	Lagoa do Ouro	PE
3572	Para	PE
3607	Pocao	PE
3608	Poco Comprido	PE
3629	Lajedo do Cedro	PE
3637	Macaparana	PE
3654	Maraial	PE
3690	Mulungu	PE
3728	Pajeu	PE
3747	Paulista	PE
3761	Petrolina	PE
3795	Lagoa dos Gatos	PE
3797	Lagoa Grande	PE
3853	Nossa Senhora do Carmo	PE
3879	Panelas	PE
3881	Paquevira	PE
3916	Ponte dos Carvalhos	PE
3965	Macuje	PE
4006	Negras	PE
4050	Perpetuo Socorro	PE
4089	Quipapa	PE
4091	Rancharia	PE
4101	Ribeirao	PE
4118	Lagoa	PE
4123	Laje Grande	PE
4146	Manari	PE
4156	Maravilha	PE
4235	Pedra	PE
4277	Laje de Sao Jose	PE
4327	Morais	PE
4359	Orobo	PE
4367	Palmeirina	PE
4380	Passagem do To	PE
4407	Pirituba	PE
4409	Pocao de Afranio	PE
4440	Mandacaia	PE
4499	Olinda	PE
4558	Primavera	PE
4569	Riacho Fechado	PE
4634	Feitoria	PE
4675	Igarassu	PE
4780	Espirito Santo	PE
4827	Ibiratinga	PE
4829	Ibo	PE
4871	Joao Alfredo	PE
4873	Joaquim Nabuco	PE
4941	Ferreiros	PE
4963	Grotao	PE
4983	Iguaraci	PE
4998	Ipubi	PE
5008	Itaiba	PE
5048	Cocau	PE
5055	Condado	PE
5100	Flores	PE
5131	Igarapeassu	PE
5138	Iratama	PE
5197	Volta do Moxoto	PE
5262	Gravata do Ibiapina	PE
5289	Ingazeira	PE
5306	Itamaraca	PE
5339	Verdejante	PE
5382	Cruzes	PE
5396	Entroncamento	PE
5423	Frei Miguelinho	PE
5474	Jaboatao dos Guararapes	PE
5482	Japecanga	PE
5513	Ze Gomes	PE
5566	Fernando de Noronha	PE
5600	Ibirajuba	PE
5604	Igarapeba	PE
5633	Jabitaca	PE
5651	Jose Mariano	PE
5692	Correntes	PE
5710	Cuiambuca	PE
5714	Cupira	PE
5750	Fazenda Nova	PE
5782	Iateca	PE
5800	Irajai	PE
5841	Conceicao das Crioulas	PE
5853	Couro D'antas	PE
5948	Itacuruba	PE
5951	Itambe	PE
5957	Itapetim	PE
5977	Jose da Costa	PE
5982	Cimbres	PE
5983	Clarana	PE
6040	Floresta	PE
6058	Granito	PE
6078	Icaicara	PE
6080	Igapo	PE
6110	Jaqueira	PE
6115	Jatoba	PE
6187	Goiana	PE
6192	Gravata	PE
6202	Henrique Dias	PE
6250	Jatiuca	PE
6272	Quitimbu	PE
6312	Custodia	PE
6319	Dormentes	PE
6355	Garanhuns	PE
6386	Ipojuca	PE
6388	Ipuera	PE
6407	Ituguacu	PE
6409	Iuitepora	PE
6421	Jatauba	PE
6422	Jenipapo	PE
6453	Rio da Barra	PE
6478	Cortes	PE
6484	Cruanji	PE
6531	Frexeiras	PE
6538	Goncalves Ferreira	PE
6548	Iati	PE
6552	Ibiranga	PE
6558	Inaja	PE
6577	Itapissuma	PE
6648	Cristalia	PE
6655	Cumaru	PE
6696	Gameleira	PE
6731	Ibimirim	PE
6755	Iraguacu	PE
6798	Jucaral	PE
6840	Escada	PE
6864	Gloria do Goita	PE
6870	Guanumbi	PE
6919	Itaquitinga	PE
6942	Jucati	PE
6965	Riacho Pequeno	PE
6994	Curral Queimado	PE
7020	Exu	PE
7024	Feira Nova	PE
7061	Ibitiranga	PE
7126	Agrestina	PE
7128	Airi	PE
7173	Barreiros	PE
7180	Bizarra	PE
7198	Brejo da Madre de Deus	PE
7214	Camaragibe	PE
7224	Canaa	PE
7236	Carapotos	PE
7239	Carnaubeira da Penha	PE
7240	Carneiro	PE
7241	Caruaru	PE
7244	Catimbau	PE
7289	Alagoinha	PE
7314	Aracoiaba	PE
7320	Arcoverde	PE
7340	Barra do Jardim	PE
7347	Belo Jardim	PE
7376	Caldeiroes	PE
7432	Riacho do Meio	PE
7443	Abreu e Lima	PE
7451	Albuquerque Ne	PE
7483	Araripina	PE
7503	Barra do Brejo	PE
7567	Carpina	PE
7625	Algodoes	PE
7660	Aripibu	PE
7677	Barra do Sirinhaem	PE
7729	Canhotinho	PE
7737	Caraiba	PE
7738	Caraibeiras	PE
7829	Betania	PE
7845	Bom Nome	PE
7851	Bonito	PE
7871	Caicarinha da Penha	PE
7925	Aguas Belas	PE
7996	Bom Jardim	PE
8047	Carima	PE
8054	Casinhas	PE
8145	Batateira	PE
8164	Brejinho	PE
8185	Camocim de Sao Felix	PE
8205	Carqueja	PE
8243	Apoti	PE
8263	Barra de Sao Pedro	PE
8269	Belem de Sao Francisco	PE
8288	Brejao	PE
8296	Cabrobo	PE
8341	Cedro	PE
8370	Agua Fria	PE
8371	Agua Preta	PE
8382	Ameixas	PE
8404	Barra de Guabiraba	PE
8412	Belem de Maria	PE
8441	Cachoeira do Roberto	PE
8465	Capoeiras	PE
8480	Cha Grande	PE
8497	Vicencia	PE
8575	Barra de Farias	PE
8576	Barra do Chata	PE
8609	Buenos Aires	PE
8614	Cabanas	PE
8632	Camutanga	PE
8674	Afranio	PE
8770	Calcado	PE
8787	Caririmirim	PE
8790	Carnaiba	PE
8810	2 Leoes	PE
8811	3 Ladeiras	PE
8822	Altinho	PE
8870	Bentivi	PE
8872	Bernardo Vieira	PE
8874	Bezerros	PE
8881	Bom Conselho	PE
8948	Urucuba	PE
8958	Veneza	PE
8997	Amaraji	PE
9061	Buique	PE
9067	Cachoeirinha	PE
9074	Camela	PE
9096	Catole	PE
9105	Cha de Alegria	PE
9135	Angelim	PE
9181	Bodoco	PE
9205	Calumbi	PE
9223	Carice	PE
9230	Catende	PE
9239	Cha do Rocha	PE
9254	Vila Nova	PE
9267	Xexeu	PE
9309	Arizona	PE
9339	Bengalas	PE
9351	Bonfim	PE
9364	Cabo	PE
9370	Caetes	PE
9445	Afogados da Ingazeira	PE
9453	Alianca	PE
9490	Barra do Riachao	PE
9508	Boas Novas	PE
9570	Rio Formoso	PE
45	Sao Bento	PB
54	Sao Francisco	PB
64	Sao Joao do Tigre	PB
70	Sao Jose de Espinharas	PB
108	Tacima	PB
140	Uirauna	PB
152	Rua Nova	PB
160	Salema	PB
181	Santana de Mangueira	PB
186	Santarem	PB
220	Sao Jose de Marimbas	PB
225	Sao Jose do Sabugi	PB
229	Sao Pedro	PB
248	Serra Grande	PB
299	Salgado de Sao Felix	PB
310	Santa Terezinha	PB
328	Sao Goncalo	PB
335	Sao Jose da Lagoa Tapada	PB
372	Sossego	PB
377	Teixeira	PB
399	Varzea Comprida	PB
443	Santa Teresinha	PB
496	Serido	PB
563	Santa Maria	PB
591	Sao Joao do Rio do Peixe	PB
593	Sao Jose da Mata	PB
595	Sao Jose de Princesa	PB
600	Sao Jose dos Cordeiros	PB
604	Sao Miguel de Taipu	PB
613	Sape	PB
624	Serraria	PB
644	Tenorio	PB
685	Santa Gertrudes	PB
687	Santa Luzia do Cariri	PB
726	Sao Jose de Piranhas	PB
743	Sao Sebastiao de Lagoa de Roca	PB
762	Soledade	PB
799	Santa Helena	PB
813	Sao Bento de Pombal	PB
819	Sao Domingos de Pombal	PB
838	Sao Mamede	PB
861	Serra Branca	PB
882	Taperoa	PB
912	Varzea Nova	PB
914	Vieiropolis	PB
924	Zabele	PB
945	Santa Rita	PB
960	Santo Andre	PB
1015	Serra Redonda	PB
1026	Sucuru	PB
1033	Tambauzinho	PB
1049	Umari	PB
1050	Umbuzeiro	PB
1055	Salgadinho	PB
1065	Santa Cecilia de Umbuzeiro	PB
1121	Serido Sao Vicente do Serido	PB
1211	Santana dos Garrotes	PB
1241	Sao Jose de Caiana	PB
1251	Sao Jose dos Ramos	PB
1264	Sao Sebastiao do Umbuzeiro	PB
1281	Solanea	PB
1326	Santa Cruz	PB
1402	Sobrado	PB
1404	Sousa	PB
1407	Sume	PB
1425	Tavares	PB
1434	Triunfo	PB
1467	Santa Ines	PB
1639	Sertaozinho	PB
1716	Santa Luzia	PB
1744	Sao Jose do Bonfim	PB
1861	Sao Domingos do Cariri	PB
1870	Sao Joao Bosco	PB
1877	Sao Joao do Cariri	PB
1910	Serra da Raiz	PB
2021	Sao Jose do Brejo do Cruz	PB
2107	Lucena	PB
2128	Matinhas	PB
2129	Mato Grosso	PB
2148	Montevideo	PB
2170	Nucleo N 3	PB
2175	Olivedos	PB
2203	Piloes	PB
2205	Pindurao	PB
2212	Pitanga de Estrada	PB
2249	Riacho de Santo Antonio	PB
2372	Piloezinhos	PB
2456	Massaranduba	PB
2547	Pirpirituba	PB
2572	Lastro	PB
2605	Matureia	PB
2623	Mulungu	PB
2629	Natuba	PB
2644	Nova Palmeira	PB
2668	Parari	PB
2676	Pedra Branca	PB
2685	Picui	PB
2687	Pilar	PB
2783	Nossa Senhora do Livramento	PB
2795	Odilandia	PB
2816	Pedras de Fogo	PB
2837	Pocinhos	PB
2838	Poco de Jose de Moura	PB
2899	Maia	PB
2901	Malta	PB
2902	Mamanguape	PB
2912	Mata Limpa	PB
2974	Patos	PB
2989	Pereiros	PB
3084	Monteiro	PB
3140	Passagem	PB
3159	Pio X	PB
3235	Nova Olinda	PB
3302	Puxinana	PB
3312	Riachao	PB
3314	Ribeira	PB
3327	Juru	PB
3357	Marizopolis	PB
3379	Muquem	PB
3486	Livramento	PB
3522	Montadas	PB
3533	Nazarezinho	PB
3559	Ouro Velho	PB
3610	Pombal	PB
3665	Mataraca	PB
3746	Paulista	PB
3755	Pedro Regis	PB
3763	Pianco	PB
3773	Piraua	PB
3831	Melo	PB
3840	Monte Horebe	PB
3858	Nova Floresta	PB
3912	Pitimbu	PB
3913	Poco Dantas	PB
3936	Quixaba	PB
3949	Lagoa	PB
3952	Lagoa de Dentro	PB
4044	Pedra Lavrada	PB
4073	Porteirinha de Pedra	PB
4095	Riachao do Poco	PB
4121	Lagoa Seca	PB
4131	Logradouro	PB
4140	Mae D'agua	PB
4144	Manaira	PB
4157	Marcacao	PB
4163	Mata Virgem	PB
4191	Nazare	PB
4239	Pelo Sinal	PB
4271	Juripiranga	PB
4283	Lerolandia	PB
4300	Mari	PB
4353	Nucleo N 2	PB
4355	Olho D'agua	PB
4465	Mogeiro	PB
4559	Princesa Isabel	PB
4630	Fatima	PB
4692	Itajubatiba	PB
4750	Cuite	PB
4891	Condado	PB
4909	Cupissura	PB
4966	Guarabira	PB
4993	Inga	PB
5015	Itaporanga	PB
5042	Juazeirinho	PB
5058	Congo	PB
5129	Igaracy	PB
5182	Vazante	PB
5224	Cruz do Espirito Santo	PB
5231	Diamante	PB
5253	Forte Velho	PB
5254	Frei Martinho	PB
5257	Galante	PB
5383	Cubati	PB
5384	Cuitegi	PB
5399	Esperanca	PB
5438	Guarita	PB
5552	Engenheiro Avidos	PB
5779	Gurjao	PB
5804	Itabaiana	PB
5832	Junco do Serido	PB
5850	Coronel Maia	PB
5973	Jerico	PB
6101	Itapororoca	PB
6125	Juarez Tavora	PB
6140	Coremas	PB
6241	Itatuba	PB
6277	Riacho dos Cavalos	PB
6314	Damiao	PB
6365	Gurinhem	PB
6378	Imaculada	PB
6500	Emas	PB
6515	Fagundes	PB
6631	Conceicao	PB
6634	Conde	PB
6662	Desterro	PB
6824	Curral de Cima	PB
6826	Curral Velho	PB
6847	Fazenda Nova	PB
6949	Prata	PB
6955	Queimadas	PB
6962	Remigio	PB
6985	Coxixola	PB
6990	Cuite de Mamanguape	PB
7005	Dona Ines	PB
7030	Gado Bravo	PB
7058	Ibiara	PB
7100	Jacarau	PB
7115	Joao Pessoa	PB
7131	Alagoa Nova	PB
7175	Bayeux	PB
7199	Brejo do Cruz	PB
7206	Cachoeira	PB
7231	Capim	PB
7321	Areia de Baraunas	PB
7383	Campo Alegre	PB
7398	Cardoso	PB
7487	Areia	PB
7769	Algodao de Jandaira	PB
7799	Areias	PB
7815	Barra de Santa Rosa	PB
7852	Borborema	PB
7854	Brejo dos Santos	PB
7868	Cachoeirinha	PB
7903	Casserengue	PB
7949	Aracagi	PB
7957	Areial	PB
7965	Assis Chateaubriand	PB
7974	Baia da Traicao	PB
8002	Bonito de Santa Fe	PB
8011	Cabaceiras	PB
8021	Cajazeiras	PB
8061	Caturite	PB
8064	Cepilho	PB
8116	Araruna	PB
8124	Assuncao	PB
8149	Belem	PB
8172	Cachoeira dos Indios	PB
8173	Cacimba de Areia	PB
8236	Amparo	PB
8308	Camalau	PB
8332	Casinha do Homem	PB
8377	Alagoa Grande	PB
8391	Aroeiras	PB
8425	Bom Sucesso	PB
8438	Caapora	PB
8452	Campina Grande	PB
8469	Carrapateira	PB
8522	Alcantil	PB
8549	Arara	PB
8646	Caraubas	PB
8682	Alagoinha	PB
8728	Bananeiras	PB
8732	Barra de Sao Miguel	PB
8734	Barra do Camaratuba	PB
8777	Camurupim	PB
8878	Boa Vista	PB
8900	Cacimba de Dentro	PB
8908	Caldas Brandao	PB
9046	Bernardino Batista	PB
9111	2	PB
9123	Alhandra	PB
9157	Barra de Santana	PB
9170	Belem do Brejo do Cruz	PB
9184	Bom Jesus	PB
9187	Boqueirao	PB
9198	Cacimbas	PB
9200	Caicara	PB
9231	Catingueira	PB
9280	Agua Branca	PB
9287	Aguiar	PB
9363	Cabedelo	PB
9376	Cajazeirinhas	PB
9405	Catole	PB
9418	Varzea	PB
9430	Vista Serrana	PB
9472	Aparecida	PB
9486	Balancos	PB
9489	Barauna	PB
9507	Boa Ventura	PB
9534	Campo Grande	PB
9559	Catole do Rocha	PB
9576	Rio Tinto	PB
38	Santana do Matos	RN
53	Sao Fernando	RN
76	Sao Miguel	RN
97	Senador Georgino Avelino	RN
148	Rosario	RN
183	Santana do Serido	RN
218	Sao Joao do Sabugi	RN
228	Sao Paulo do Potengi	RN
269	Tenente Laurentino Cruz	RN
272	Tibau do Sul	RN
278	Touros	RN
289	Umarizal	RN
327	Sao Francisco do Oeste	RN
357	Sao Vicente	RN
363	Serra de Sao Bento	RN
497	Serra do Mel	RN
503	Severiano Melo	RN
554	Santa Cruz	RN
586	Sao Goncalo do Amarante	RN
596	Sao Jose do Campestre	RN
623	Serra da Tapuia	RN
651	Triunfo Potiguar	RN
706	Sao Bernardo	RN
740	Sao Rafael	RN
765	Taboleiro Grande	RN
833	Sao Jose da Passagem	RN
878	Tangara	RN
897	Trairi	RN
967	Sao Bento do Norte	RN
990	Sao Jose do Serido	RN
1017	Serrinha	RN
1087	Sao Bento do Trairi	RN
1114	Sao Tome	RN
1127	Serrinha dos Pintos	RN
1142	Taipu	RN
1163	Upanema	RN
1187	Rodolfo Fernandes	RN
1197	Santa Fe	RN
1199	Santa Maria	RN
1344	Santo Antonio	RN
1394	Serra Caiada	RN
1457	Ruy Barbosa	RN
1571	Vila Flor	RN
1606	Sao Geraldo	RN
1627	Sao Pedro	RN
1644	Sitio Novo	RN
1659	Tibau	RN
1721	Santa Teresa	RN
1743	Sao Jose de Mipibu	RN
1771	Serra Negra do Norte	RN
1791	Tenente Ananias	RN
1794	Timbauba dos Batistas	RN
1833	Salva Vida	RN
1855	Santo Antonio do Potengi	RN
1890	Sao Miguel de Touros	RN
1946	Varzea	RN
2048	Senador Eloi de Souza	RN
2270	Luis Gomes	RN
2438	Macaiba	RN
2458	Maxaranguape	RN
2467	Montanhas	RN
2532	Pedro Avelino	RN
2670	Passa e Fica	RN
2711	Portalegre	RN
2714	Porto do Mangue	RN
2751	Martins	RN
2758	Messias Targino	RN
2815	Pedra Grande	RN
2911	Mata de Sao Braz	RN
2952	Olho D'agua do Borges	RN
2966	Parana	RN
2977	Pau dos Ferros	RN
3041	Lajes	RN
3063	Marcelino Vieira	RN
3150	Pedro Velho	RN
3186	Lajes Pintadas	RN
3273	Piloes	RN
3306	Rafael Fernandes	RN
3332	Lagoa Nova	RN
3382	Natal	RN
3540	Nova Cruz	RN
3557	Ouro Branco	RN
3638	Macau	RN
3646	Major Felipe	RN
3741	Parelhas	RN
3742	Parnamirim	RN
3791	Lagoa de Pedras	RN
3793	Lagoa de Velhos	RN
3886	Parazinho	RN
3888	Passagem	RN
3892	Patu	RN
3955	Lagoa Salgada	RN
4142	Major Sales	RN
4183	Monte das Gameleiras	RN
4186	Mossoro	RN
4196	Nisia Floresta	RN
4255	Poco Branco	RN
4275	Lagoa D'anta	RN
4288	Lucrecia	RN
4322	Monte Alegre	RN
4387	Pedra Preta	RN
4535	Pendencias	RN
4567	Rafael Godeiro	RN
4568	Riacho da Cruz	RN
4574	Rio do Fogo	RN
4619	Encanto	RN
4627	Extremoz	RN
4781	Espirito Santo	RN
4839	Ipanguacu	RN
4840	Ipiranga	RN
4876	Jose da Penha	RN
4928	Espirito Santo do Oeste	RN
4952	Gameleira	RN
4959	Governador DIX Sept Rosado	RN
5091	Equador	RN
5171	Joao Dias	RN
5216	Coronel Ezequiel	RN
5217	Coronel Joao Pessoa	RN
5317	Jacana	RN
5324	Jardim do Serido	RN
5337	Venha Vereador	RN
5420	Francisco Dantas	RN
5641	Janduis	RN
5798	Ipueira	RN
5824	Jardim de Angicos	RN
5861	Currais Novos	RN
5889	Felipe Guerra	RN
5896	Florania	RN
5968	Jardim de Piranhas	RN
6002	Cruzeta	RN
6037	Fernando Pedroza	RN
6079	Ielmo Marinho	RN
6095	Itaja	RN
6108	Jandaira	RN
6180	Galinhos	RN
6359	Guamare	RN
6596	Joao Camara	RN
6666	Doutor Severiano	RN
6685	Firmamento	RN
6816	Corrego de Sao Mateus	RN
6860	Frutuoso Gomes	RN
6888	Igreja Nova	RN
6929	Japi	RN
6943	Jucurutu	RN
6944	Jundia de Cima	RN
6966	Riachuelo	RN
7040	Goianinha	RN
7043	Grossos	RN
7096	Itau	RN
7127	Agua Nova	RN
7307	Antonio Martins	RN
7387	Campo Redondo	RN
7397	Caraubas	RN
7422	Pureza	RN
7444	Acu	RN
7582	Cerro Cora	RN
7591	Riacho de Santana	RN
7673	Barcelona	RN
7750	Ceara Mirim	RN
7771	Almino Afonso	RN
7774	Alto do Rodrigues	RN
7828	Belo Horizonte	RN
7841	Bom Jesus	RN
7902	Carnauba dos Dantas	RN
7959	Ares	RN
8019	Caico	RN
8039	Canguaretama	RN
8052	Carnaubais	RN
8129	Baia Formosa	RN
8178	Caicara do Rio do Vento	RN
8190	Campo Grande	RN
8274	Bodo	RN
8301	Caicara do Norte	RN
8349	Vera Cruz	RN
8390	Areia Branca	RN
8436	Brejinho	RN
8570	Barauna	RN
8842	Apodi	RN
8871	Bento Fernandes	RN
8984	Alexandria	RN
9002	Angicos	RN
9032	Barao de Serra Branca	RN
9275	Acari	RN
9277	Afonso Bezerra	RN
9421	Vicosa	RN
9506	Boa Saude	RN
24	Santa Felicia	CE
42	Santo Antonio	CE
56	Sao Goncalo do Amarante	CE
87	Sapo	CE
96	Senador Carlos Jereissati	CE
122	Timonha	CE
125	Tome	CE
126	Trairi	CE
130	Tucuns	CE
156	Saboeiro	CE
159	Salao	CE
190	Santo Antonio da Pindoba	CE
235	Sao Romao	CE
243	Sapupara	CE
250	Serrota	CE
255	Sucatinga	CE
262	Tapuiara	CE
288	Umari	CE
336	Sao Jose das Lontras	CE
364	Serragem	CE
381	Tiangua	CE
388	Trussu	CE
390	Ubauna	CE
391	Umarituba	CE
392	Umirim	CE
472	Sao Jose	CE
478	Sao Paulo	CE
489	Sao Vicente	CE
493	Sebastiao de Abreu	CE
509	Sobral	CE
521	Tejucuoca	CE
558	Santa Fe	CE
637	Tanques	CE
663	Umburanas	CE
696	Santa Tereza	CE
704	Sao Bartolomeu	CE
709	Sao Domingos	CE
724	Sao Joaquim do Salgado	CE
732	Sao Miguel	CE
761	Sitios Novos	CE
763	Sucesso	CE
827	Sao Joaquim	CE
870	Siupe	CE
885	Tarrafas	CE
887	Taua	CE
898	Trapia	CE
904	Uruburetama	CE
929	Roldao	CE
955	Santana do Acarau	CE
966	Sao Benedito	CE
973	Sao Felipe	CE
987	Sao Jose de Solonopole	CE
1025	Solonopole	CE
1029	Tabuleiro do Norte	CE
1080	Santana	CE
1125	Serra do Felix	CE
1132	Sitia	CE
1141	Taiba	CE
1146	Tapera	CE
1169	Varjota	CE
1170	Varzea do Gilo	CE
1173	Vertentes do Lagedo	CE
1176	Vicosa do Ceara	CE
1201	Santa Quiteria	CE
1210	Santana do Cariri	CE
1212	Santarem	CE
1261	Sao Sebastiao	CE
1270	Senador Sa	CE
1288	Taboleiro	CE
1371	Sao Jose do Torto	CE
1393	Sereno de Cima	CE
1397	Serrote	CE
1408	Sussuanha	CE
1415	Taperuaba	CE
1437	Tuina	CE
1440	Tururu	CE
1458	Salitre	CE
1486	Santo Antonio dos Fernandes	CE
1521	Senador Pompeu	CE
1546	Tipi	CE
1553	Trici	CE
1560	Uruoca	CE
1587	Santa Ana	CE
1592	Santa Luzia	CE
1607	Sao Goncalo do Umari	CE
1610	Sao Joao do Jaguaribe	CE
1646	Soledade	CE
1680	Uruque	CE
1694	Vila Soares	CE
1705	Russas	CE
1740	Sao Joao dos Queiroz	CE
1750	Sao Luis do Curu	CE
1787	Tamboril	CE
1789	Targinos	CE
1800	Ubiracu	CE
1830	Sabiaguaba	CE
1831	Sacramento	CE
1862	Sao Francisco	CE
1867	Sao Gerardo	CE
1875	Sao Joao de Deus	CE
1936	Troia	CE
1937	Tucunduba	CE
1947	Varzea da Volta	CE
1974	Sambaiba	CE
2036	Sao Pedro	CE
2066	Suassurana	CE
2068	Tabainha	CE
2090	Ubajara	CE
2092	Uiraponga	CE
2102	Lameiro	CE
2122	Marco	CE
2126	Marrecas	CE
2179	Pacoti	CE
2183	Palmatoria	CE
2189	Parapui	CE
2213	Poco Grande	CE
2223	Poranga	CE
2242	Quixariu	CE
2273	Maceio	CE
2290	Milagres	CE
2299	Monguba	CE
2301	Monsenhor Tabosa	CE
2333	Novo Assis	CE
2352	Paracua	CE
2358	Pasta	CE
2365	Pentecoste	CE
2387	Potengi	CE
2391	Prata	CE
2396	Quatiguaba	CE
2414	Justiniano Serpa	CE
2422	Lagoa Grande	CE
2457	Mata Fresca	CE
2463	Miraima	CE
2474	Moraujo	CE
2482	Nascente	CE
2493	Nova Floresta	CE
2516	Panacui	CE
2522	Paripueira	CE
2550	Podimirim	CE
2562	Lacerda	CE
2574	Lima Campos	CE
2589	Mangabeira	CE
2603	Matriz	CE
2608	Milton Belo	CE
2614	Missao Nova	CE
2620	Morrinhos Novos	CE
2628	Naraniu	CE
2648	Novo Oriente	CE
2651	Olho D'agua	CE
2652	Olho D'agua da Bica	CE
2656	Pacuja	CE
2675	Pedra Branca	CE
2693	Pirangi	CE
2699	Pitombeira	CE
2719	Lagoa de Sao Jose	CE
2731	Macambira	CE
2735	Malhada Grande	CE
2762	Missi	CE
2763	Monte Alegre	CE
2767	Monte Grave	CE
2773	Mucambo	CE
2787	Nova Fatima	CE
2794	Ocara	CE
2808	Patriarca	CE
2813	Pecem	CE
2819	Peixe	CE
2820	Penaforte	CE
2823	Pernambuquinho	CE
2888	Lavras da Mangabeira	CE
2909	Massape	CE
2919	Mirambe	CE
2958	Palestina do Norte	CE
2982	Pedrinhas	CE
2996	Pitombeiras	CE
3014	Prudente de Morais	CE
3015	Quincoe	CE
3060	Major Simplicio	CE
3075	Mel	CE
3076	Miragem	CE
3082	Monte Castelo	CE
3085	Montenebo	CE
3095	Mutambeiras	CE
3102	Nossa Senhora do Livramento	CE
3110	Nova Vida	CE
3120	Pacatuba	CE
3127	Palmacia	CE
3161	Pirabibu	CE
3168	Placido Martins	CE
3182	Lagoa do Juvenal	CE
3183	Lagoa dos Crioulos	CE
3203	Mararupa	CE
3223	Morrinhos	CE
3262	Passagem Funda	CE
3278	Pindoretama	CE
3305	Quixere	CE
3307	Redencao	CE
3308	Reriutaba	CE
3341	Logradouro	CE
3346	Madalena	CE
3369	Missao Velha	CE
3384	Nenenlandia	CE
3406	Pacajus	CE
3416	Parambu	CE
3430	Pindoguaba	CE
3433	Pio X	CE
3441	Poco	CE
3445	Ponta da Serra	CE
3447	Porfirio Sampaio	CE
3464	Riachao do Banabuiu	CE
3505	Martinopole	CE
3508	Matias	CE
3513	Miguel Xavier	CE
3519	Moitas	CE
3529	Mundau	CE
3551	Oiticica	CE
3562	Padre Vieira	CE
3580	Patacas	CE
3587	Peixe Gordo	CE
3593	Pessoa Anta	CE
3632	Lambedouro	CE
3635	Livramento	CE
3653	Mapua	CE
3679	Mombaca	CE
3691	Muribeca	CE
3704	Nova Olinda	CE
3706	Nova Russas	CE
3726	Padre Linhares	CE
3736	Paraipaba	CE
3748	Pavuna	CE
3768	Piquet Carneiro	CE
3788	Ladeira Grande	CE
3815	Majorlandia	CE
3818	Manibu	CE
3833	Meruoca	CE
3834	Mineirolandia	CE
3887	Passagem	CE
3920	Porteiras	CE
3928	Potiretama	CE
3934	Quincunca	CE
3935	Quitaius	CE
3960	Lisieux	CE
3969	Manituba	CE
3975	Marrocos	CE
3976	Marruas	CE
3995	Monte Sion	CE
3999	Morro Branco	CE
4023	Oliveiras	CE
4033	Paramoti	CE
4049	Pereiro	CE
4062	Pires Ferreira	CE
4098	Riacho Verde	CE
4120	Lagoa do Mato	CE
4122	Lagoinha	CE
4129	Limoeiro do Norte	CE
4134	Macarau	CE
4150	Maracanau	CE
4151	Maragua	CE
4152	Maranguape	CE
4165	Mauriti	CE
4172	Milha	CE
4188	Mumbaba	CE
4200	Nova Betania	CE
4214	Padre Cicero	CE
4220	Pajucara	CE
4221	Palestina	CE
4256	Poco Comprido	CE
4303	Marinheiros	CE
4333	Mulungu	CE
4360	Oros	CE
4365	Pajeu	CE
4366	Palhano	CE
4437	Macaoca	CE
4471	Morada Nova	CE
4509	Paracuru	CE
4511	Parajuru	CE
4514	Parazinho	CE
4532	Pedras	CE
4570	Riacho Vermelho	CE
4592	Coreau	CE
4599	Cruxati	CE
4601	Cruzeirinho	CE
4635	Flamengo	CE
4646	Giqui	CE
4672	Ibicuitinga	CE
4676	Igaroi	CE
4683	Inhucu	CE
4699	Itatira	CE
4723	Jordao	CE
4731	Coite	CE
4742	Corrego dos Fernandes	CE
4754	Delmiro Gouveia	CE
4779	Esperanca	CE
4792	Fortim	CE
4798	Gado dos Rodrigues	CE
4822	Ibiapaba	CE
4830	Ico	CE
4842	Ipueiras	CE
4848	Itacima	CE
4856	Itapeim	CE
4885	Colina	CE
4926	Erere	CE
4942	Flores	CE
4947	Fortaleza	CE
4973	Guassi	CE
5023	Jacauna	CE
5036	Jijoca de Jericoacoara	CE
5043	Chorozinho	CE
5073	Croata	CE
5090	Engenheiro Jose Lopes	CE
5124	Hidrolandia	CE
5127	Ibaretama	CE
5141	Itagua	CE
5164	Jati	CE
5180	Varzea Alegre	CE
5184	Ventura	CE
5226	Curupira	CE
5236	Donato	CE
5270	Guia	CE
5275	Horizonte	CE
5294	Iracema	CE
5305	Itaitinga	CE
5319	Jaguaretama	CE
5330	Juazeiro do Norte	CE
5378	Cruz	CE
5380	Cruz de Pedra	CE
5395	Engenho Velho	CE
5411	Felizardo	CE
5427	Gazea	CE
5429	Gererau	CE
5430	Girau	CE
5435	Granja	CE
5445	Iborepi	CE
5451	Ingazeiras	CE
5455	Irapua	CE
5462	Itapipoca	CE
5464	Itapo	CE
5479	Jaguaruana	CE
5487	Jucas	CE
5533	Crateus	CE
5540	Deputado Irapuan Pinheiro	CE
5544	Dom Leme	CE
5561	Fatima	CE
5564	Feiticeiro	CE
5598	Ibicatu	CE
5625	Itans	CE
5664	Varzea	CE
5699	Crioulos	CE
5715	Curatis	CE
5747	Farias Brito	CE
5802	Isidoro	CE
5828	Juazeiro de Baixo	CE
5834	Cipo dos Anjos	CE
5837	Codia	CE
5854	Crato	CE
5867	Dom Mauricio	CE
5868	Dom Quintino	CE
5909	General Tiburcio	CE
5921	Guaraciaba do Norte	CE
5931	Iara	CE
5935	Ibuacu	CE
5945	Iraja	CE
5955	Itapebussu	CE
6022	Encantado	CE
6032	Eusebio	CE
6045	Frecheirinha	CE
6049	Genipapeiro	CE
6059	Granjeiro	CE
6060	Groairas	CE
6063	Guaiuba	CE
6064	Guanaces	CE
6086	Inhamuns	CE
6112	Jardimirim	CE
6123	Jose de Alencar	CE
6154	Ebron	CE
6169	Feitosa	CE
6181	Gameleira de Sao Sebastiao	CE
6196	Guaramiranga	CE
6211	Icarai	CE
6218	Iguatu	CE
6223	Ipueiras dos Gomes	CE
6227	Iraucuba	CE
6246	Jaibaras	CE
6253	Joao Cordeiro	CE
6255	Juatama	CE
6291	Cococi	CE
6313	Custodio	CE
6320	Dourados	CE
6322	Ema	CE
6348	Forquilha	CE
6369	Iapi	CE
6419	Jandrangoeira	CE
6425	Jubaia	CE
6438	Quixeramobim	CE
6439	Quixoa	CE
6440	Raimundo Martins	CE
6501	Ematuba	CE
6509	Espinho	CE
6536	General Sampaio	CE
6555	Icapui	CE
6561	Independencia	CE
6585	Jacarecoara	CE
6586	Jamacaru	CE
6610	Quiterianopolis	CE
6646	Cristais	CE
6656	Cuncas	CE
6663	Domingos da Costa	CE
6695	Gado	CE
6707	Graca	CE
6721	Guararu	CE
6723	Guriu	CE
6739	Ibuguacu	CE
6749	Inhuporanga	CE
6754	Ipu	CE
6756	Iratinga	CE
6778	Jaburuna	CE
6779	Jacampari	CE
6782	Jaguarao	CE
6788	Jardim	CE
6796	Jua	CE
6801	Choro	CE
6829	Daniel de Queiros	CE
6842	Espacinha	CE
6869	Guajiru	CE
6883	Ibicua	CE
6887	Ideal	CE
6898	Ipaporanga	CE
6899	Ipaumirim	CE
6905	Itaicaba	CE
6906	Itaipaba	CE
6913	Itapage	CE
6916	Itapiuna	CE
6920	Itarema	CE
6958	Quixelo	CE
6975	Conceicao	CE
6998	Deserto	CE
7011	Engenheiro Joao Tome	CE
7032	Garcas	CE
7050	Guassosse	CE
7054	Holanda	CE
7057	Ibiapina	CE
7059	Ibicuitaba	CE
7068	Icozinho	CE
7110	Jaguaribara	CE
7111	Jaguaribe	CE
7145	Aprazivel	CE
7147	Aracati	CE
7157	Aroeiras	CE
7172	Barreiras	CE
7181	Boa Agua	CE
7182	Boa Esperanca	CE
7251	Poti	CE
7261	Quimami	CE
7263	Quixada	CE
7282	Acarape	CE
7288	Alagoinha	CE
7311	Aquinopolis	CE
7319	Araticum	CE
7342	Barreiros	CE
7344	Baturite	CE
7345	Beberibe	CE
7402	Caririacu	CE
7403	Carius	CE
7406	Catarina	CE
7424	Queimadas	CE
7436	Rinare	CE
7462	Amanari	CE
7478	Arajara	CE
7484	Ararius	CE
7523	Bixopa	CE
7552	Campanario	CE
7566	Carnaubas	CE
7570	Carvoeiro	CE
7575	Catuana	CE
7594	Riacho Grande	CE
7617	Agua Verde	CE
7619	Aguai	CE
7650	Aracas	CE
7655	Aratuba	CE
7684	Barroquinha	CE
7693	Boa Vista	CE
7703	Brejinho	CE
7715	Cachoeira Grande	CE
7718	Caicara	CE
7719	Calabaca	CE
7736	Caracara	CE
7783	America	CE
7788	Antonio Diogo	CE
7792	Aracoiaba	CE
7822	Barra Nova	CE
7826	Bela Cruz	CE
7827	Bela Vista	CE
7848	Bonhu	CE
7850	Bonito	CE
7860	Buritizal	CE
7870	Caicarinha	CE
7893	Capistrano	CE
7909	Caucaia	CE
7932	Altaneira	CE
7952	Aranau	CE
7954	Araripe	CE
7960	Arneiroz	CE
7980	Barro	CE
8020	Caioca	CE
8028	Camilos	CE
8049	Cariutaba	CE
8051	Carmelopolis	CE
8055	Castanhao	CE
8063	Cemoaba	CE
8102	Aningas	CE
8123	Assare	CE
8141	Barro Alto	CE
8167	Brejo Santo	CE
8206	Carquejo	CE
8228	Algodoes	CE
8233	Amanaiara	CE
8245	Ararenda	CE
8283	Borges	CE
8294	Buritizinho	CE
8306	Caldeirao	CE
8318	Canaan	CE
8329	Carnaubinha	CE
8330	Caruatai	CE
8381	Amarelas	CE
8388	Arapari	CE
8399	Banabuiu	CE
8437	Brejo Grande	CE
8449	Camocim	CE
8467	Caridade	CE
8498	Vicosa	CE
8519	Aiuaba	CE
8523	Almofala	CE
8531	Amaro	CE
8532	Amontada	CE
8538	Antonio Marques	CE
8543	Aquiraz	CE
8548	Araquem	CE
8558	Assuncao	CE
8573	Barra	CE
8624	Campestre	CE
8631	Campos Sales	CE
8636	Cangati	CE
8658	Caxitore	CE
8693	Alto Santo	CE
8704	Apuiares	CE
8714	Ariscos dos Marianos	CE
8717	Arrojado	CE
8731	Barbalha	CE
8748	Bitupita	CE
8750	Boa Viagem	CE
8751	Boa Vista do Caxitore	CE
8779	Canafistula	CE
8780	Caninde	CE
8781	Canindezinho	CE
8784	Caponga da Bernarda	CE
8792	Carnaubal	CE
8794	Carrapateiras	CE
8797	Carvalho	CE
8798	Cascavel	CE
8800	Catunda	CE
8805	Chaval	CE
8814	Abilio Martins	CE
8815	Adrianopolis	CE
8837	Anjinhos	CE
8857	Baixa Grande	CE
8865	Barrento	CE
8894	Brotas	CE
8931	Carire	CE
8957	Vazantes	CE
8983	Alcantaras	CE
8996	Amaniutuba	CE
9009	Aracatiacu	CE
9012	Arapa	CE
9014	Araporanga	CE
9015	Aratama	CE
9031	Barao de Aquiraz	CE
9035	Barra do Sotero	CE
9036	Barreira	CE
9063	Cachoeira	CE
9069	Caio Prado	CE
9071	Camara	CE
9114	Acarau	CE
9115	Acopiara	CE
9121	Aiua	CE
9141	Areial	CE
9204	California	CE
9206	Camboas	CE
9273	Abaiara	CE
9312	Aruaru	CE
9315	Aurora	CE
9323	Bandeira	CE
9334	Bau	CE
9340	Betania	CE
9350	Bonfim	CE
9393	Caponga	CE
9409	Cedro	CE
9463	Anaua	CE
9469	Antonina do Norte	CE
9475	Aracatiara	CE
9484	Baixio	CE
9485	Baixio da Donana	CE
9492	Barreira dos Vianas	CE
9517	Cabreiro	CE
9523	Caipu	CE
9558	Catole	CE
170	Santa Ines	MA
173	Santa Luzia do Parua	MA
195	Santo Antonio dos Lopes	MA
208	Sao Francisco do Maranhao	MA
234	Sao Raimundo do Doca Bezerra	MA
285	Turilandia	MA
300	Sambaiba	MA
308	Santa Quiteria do Maranhao	MA
333	Sao Joao do Soter	MA
373	Sucupira do Riachao	MA
397	Vargem Grande	MA
414	Rocado	MA
450	Santo Amaro	MA
460	Sao Bento	MA
462	Sao Felix de Balsas	MA
526	Timon	MA
560	Santa Luzia	MA
652	Tufilandia	MA
711	Sao Domingos do Maranhao	MA
812	Sao Benedito do Rio Preto	MA
825	Sao Joao do Paraiso	MA
844	Sao Pedro da Agua Branca	MA
847	Sao Raimundo de Codo	MA
855	Satubinha	MA
858	Senador La Rocque	MA
925	Ze Doca	MA
956	Santana do Maranhao	MA
1045	Trizidela do Vale	MA
1133	Sitio Novo	MA
1189	Rosario	MA
1230	Sao Joao de Cortes	MA
1231	Sao Joao do Caru	MA
1328	Santa Filomena do Maranhao	MA
1329	Santa Helena	MA
1352	Sao Bernardo	MA
1357	Sao Francisco do Brejao	MA
1364	Sao Joao dos Patos	MA
1380	Sao Raimundo das Mangabeiras	MA
1489	Sao Domingos do Azeitao	MA
1510	Sao Pedro dos Crentes	MA
1511	Sao Roberto	MA
1520	Senador Alexandre Costa	MA
1532	Sucupira do Norte	MA
1653	Tasso Fragoso	MA
1662	Timbiras	MA
1670	Tuntum	MA
1672	Turiacu	MA
1674	Tutoia	MA
1704	Roque	MA
1736	Sao Joao Batista	MA
1741	Sao Joaquim dos Melos	MA
1773	Serrano do Maranhao	MA
1886	Sao Luis	MA
1887	Sao Luis Gonzaga do Maranhao	MA
1889	Sao Mateus do Maranhao	MA
1904	Sao Vicente Ferrer	MA
1987	Santa Rita	MA
2019	Sao Jose de Ribamar	MA
2028	Sao Jose dos Basilios	MA
2095	Urbano Santos	MA
2185	Papagaio	MA
2187	Paraibano	MA
2238	Presidente Sarney	MA
2287	Matoes do Norte	MA
2375	Pinheiro	MA
2393	Presidente Juscelino	MA
2403	Resplandes	MA
2428	Leandro	MA
2501	Olinda Nova do Maranhao	MA
2530	Paulino Neves	MA
2570	Lajeado Novo	MA
2575	Lima Campos	MA
2584	Magalhaes de Almeida	MA
2599	Mata	MA
2622	Morros	MA
2653	Olho D'agua das Cunhas	MA
2745	Marianopolis	MA
2817	Pedro do Rosario	MA
2822	Peritoro	MA
2836	Pocao de Pedras	MA
2844	Porto das Gabarras	MA
2848	Presidente Dutra	MA
2860	Raposa	MA
2921	Mirinzal	MA
3011	Presidente Medici	MA
3037	Lagoa do Mato	MA
3154	Peri Mirim	MA
3184	Lagoa Grande do Maranhao	MA
3202	Maraja do Sena	MA
3208	Mata Roma	MA
3217	Miranda do Norte	MA
3257	Palmeirandia	MA
3277	Pindare Mirim	MA
3373	Montes Altos	MA
3425	Pedreiras	MA
3493	Maioba	MA
3576	Passagem Franca	MA
3616	Porto Franco	MA
3700	Nova Colinas	MA
3767	Pio XII	MA
3820	Maracacume	MA
3894	Paulo Ramos	MA
3929	Presidente Vargas	MA
3940	Ribeirao Azul	MA
3948	Lago do Junco	MA
3962	Luis Domingues	MA
3983	Milagres do Maranhao	MA
3991	Moncao	MA
4008	Nova Iorque	MA
4061	Pirapemas	MA
4100	Ribamar Fiquene	MA
4117	Lago dos Rodrigues	MA
4126	Lapela	MA
4132	Loreto	MA
4153	Maranhaozinho	MA
4164	Matoes	MA
4195	Nina Rodrigues	MA
4233	Pastos Bons	MA
4273	Lago da Pedra	MA
4274	Lago Verde	MA
4307	Matinha	MA
4378	Parnarama	MA
4399	Pimentel	MA
4461	Mirador	MA
4493	Nova Olinda do Maranhao	MA
4503	Paco do Lumiar	MA
4534	Penalva	MA
4639	Fortuna	MA
4673	Icatu	MA
4694	Itamatare	MA
4695	Itapecuru Mirim	MA
4720	Joao Lisboa	MA
4784	Estandarte	MA
4808	Grajau	MA
4819	Humberto de Campos	MA
4878	Junco do Maranhao	MA
4913	Davinopolis	MA
4977	Ibipira	MA
5018	Itinga do Maranhao	MA
5049	Coelho Neto	MA
5053	Conceicao do Lago Acu	MA
5077	Curupa	MA
5087	Duque Bacelar	MA
5092	Estreito	MA
5103	Fortaleza dos Nogueiras	MA
5130	Igarape Grande	MA
5185	Viana	MA
5227	Custodio Lima	MA
5325	Jatoba	MA
5433	Governador Nunes Freire	MA
5434	Graca Aranha	MA
5447	Igarape do Meio	MA
5611	Imperatriz	MA
5676	Cidelandia	MA
5728	Dom Pedro	MA
5741	Esperantinopolis	MA
5757	Formosa da Serra Negra	MA
5849	Coroata	MA
5916	Governador Eugenio Barros	MA
5917	Governador Newton Bello	MA
5926	Guimaraes	MA
6044	Frecheiras	MA
6053	Goncalves Dias	MA
6055	Governador Archer	MA
6056	Governador Edison Lobao	MA
6190	Governador Luiz Rocha	MA
6310	Cururupu	MA
6311	Curva Grande	MA
6395	Itaipava do Grajau	MA
6433	Primeira Cruz	MA
6460	Codo	MA
6595	Jenipapo dos Vieiras	MA
6616	Riachao	MA
6624	Colinas	MA
6682	Fernando Falcao	MA
6804	Codozinho	MA
6849	Feira Nova do Maranhao	MA
6938	Joselandia	MA
7039	Godofredo Viana	MA
7093	Itapera	MA
7150	Araguana	MA
7155	Arari	MA
7169	Barra do Corda	MA
7187	Bom Jardim	MA
7246	Central do Maranhao	MA
7249	Porto Rico do Maranhao	MA
7329	Bacuri	MA
7337	Barao de Tromai	MA
7464	Amarante do Maranhao	MA
7495	Axixa	MA
7535	Brejo de Areia	MA
7538	Buriti	MA
7540	Buriticupu	MA
7578	Caxias	MA
7652	Arame	MA
7672	Barao de Grajau	MA
7764	Alcantara	MA
7772	Alto Alegre do Pindare	MA
7777	Alto Parnaiba	MA
7790	Apicum Acu	MA
7812	Balsas	MA
7858	Buriti Cortado	MA
7873	Cajapio	MA
7899	Caraiba do Norte	MA
7968	Aurizona	MA
7971	Bacatuba	MA
7991	Benedito Leite	MA
8007	Brejo	MA
8041	Capinzal do Norte	MA
8082	Agua Doce do Maranhao	MA
8090	Altamira do Maranhao	MA
8128	Bacabal	MA
8140	Barreirinhas	MA
8148	Belagua	MA
8151	Bequimao	MA
8157	Bom Lugar	MA
8179	Cajari	MA
8225	Aldeias Altas	MA
8276	Bom Jesus das Selvas	MA
8279	Bonfim do Arari	MA
8309	Campestre do Maranhao	MA
8319	Candido Mendes	MA
8397	Bacurituba	MA
8481	Chapadinha	MA
8547	Araioses	MA
8562	Bacabeira	MA
8606	Brejo de Sao Felix	MA
8611	Buritirama	MA
8746	Bernardo do Mearim	MA
8763	Buriti Bravo	MA
8793	Carolina	MA
8867	Barro Duro	MA
8879	Boa Vista do Pindare	MA
8942	Centro do Guilherme	MA
8963	Vila Nova dos Martirios	MA
8975	Acailandia	MA
8999	Anajatuba	MA
9065	Cachoeira Grande	MA
9097	Cedral	MA
9126	Alto Alegre do Maranhao	MA
9128	Amapa do Maranhao	MA
9237	Centro Novo do Maranhao	MA
9264	Vitorino Freire	MA
9278	Afonso Cunha	MA
9335	Bela Vista do Maranhao	MA
9347	Boa Vista do Gurupi	MA
9389	Cantanhede	MA
9400	Carutapera	MA
9432	Vitoria do Mearim	MA
9462	Anapurus	MA
50	Sao Domingos do Capim	PA
65	Sao Jorge	PA
102	Serra Pelada	PA
118	Terra Santa	PA
214	Sao Joao de Pirabas	PA
233	Sao Raimundo de Borralhos	PA
295	Ruropolis	PA
307	Santa Maria	PA
382	Tijoca	PA
402	Vila Socorro	PA
410	Riozinho	PA
436	Santa Luzia do Para	PA
445	Santana do Araguaia	PA
452	Santo Antonio	PA
467	Sao Joao do Araguaia	PA
522	Tentugal	PA
546	Salinopolis	PA
549	Salvaterra	PA
565	Santa Maria das Barreiras	PA
573	Santarem Novo	PA
583	Sao Francisco da Jararaca	PA
601	Sao Luiz do Tapajos	PA
691	Santa Maria do Para	PA
718	Sao Joao do Acangata	PA
736	Sao Pedro de Viseu	PA
775	Tauari	PA
848	Sao Raimundo do Araguaia	PA
916	Vila dos Cabanos	PA
921	Vitoria do Xingu	PA
936	Santa Cruz do Arari	PA
974	Sao Francisco	PA
1000	Sao Sebastiao da Boa Vista	PA
1030	Tailandia	PA
1090	Sao Francisco do Para	PA
1107	Sao Pedro do Capim	PA
1135	Soure	PA
1156	Trairao	PA
1186	Rio Vermelho	PA
1195	Santa Barbara do Para	PA
1205	Santa Rosa da Vigia	PA
1223	Sao Felix do Xingu	PA
1236	Sao Joaquim do Tapara	PA
1245	Sao Jose do Gurupi	PA
1248	Sao Jose do Piria	PA
1300	Timboteua	PA
1310	Ulianopolis	PA
1336	Santa Terezinha	PA
1365	Sao Joao dos Ramos	PA
1388	Sapucaia	PA
1424	Tatuteua	PA
1436	Tucuma	PA
1453	Rondon do Para	PA
1468	Santa Isabel do Para	PA
1494	Sao Geraldo do Araguaia	PA
1513	Sao Sebastiao de Vicosa	PA
1602	Sao Domingos do Araguaia	PA
1624	Sao Miguel do Guama	PA
1625	Sao Miguel dos Macacos	PA
1655	Tauarizinho	PA
1692	Vila Nova	PA
1701	Xinguarinha	PA
1723	Santarem	PA
1730	Sao Caetano de Odivelas	PA
1795	Tucurui	PA
1820	Vilarinho do Monte	PA
1821	Vista Alegre	PA
1826	Xinguara	PA
1874	Sao Joao da Ponta	PA
1894	Sao Raimundo dos Furtados	PA
1895	Sao Roberto	PA
1932	Tome Acu	PA
1949	Veiros	PA
1959	Vila Santa Fe	PA
2001	Santo Antonio do Taua	PA
2017	Sao Joao do Piria	PA
2049	Senador Jose Porfirio	PA
2077	Terra Alta	PA
2082	Tracuateua	PA
2096	Uruara	PA
2141	Moju	PA
2166	Nova Timboteua	PA
2178	Pacaja	PA
2181	Palestina do Para	PA
2230	Porto Trombetas	PA
2278	Maracana	PA
2295	Mirasselvas	PA
2337	Novo Repartimento	PA
2341	Nucleo Urbano Quilometro 30	PA
2344	Osvaldilandia	PA
2370	Picarra	PA
2416	Km 19	PA
2517	Paragominas	PA
2534	Penhalonga	PA
2553	Ponta de Ramos	PA
2586	Maiauata	PA
2590	Manjeiro	PA
2615	Mocajuba	PA
2619	Morada Nova	PA
2627	Muta	PA
2681	Pesqueiro	PA
2713	Porto de Moz	PA
2741	Marapanim	PA
2753	Mata Geral	PA
2774	Mutucal	PA
2829	Pinhal	PA
2915	Meruu	PA
2936	Muana	PA
2937	Mujui dos Campos	PA
2955	Pacoval	PA
2968	Paratins	PA
2976	Pau D'arco	PA
3000	Ponta de Pedras	PA
3003	Portel	PA
3069	Maruda	PA
3093	Muraja	PA
3167	Placas	PA
3188	Limoeiro do Ajuru	PA
3199	Maraba	PA
3221	Monte Dourado	PA
3268	Pedreira	PA
3336	Lauro Sodre	PA
3371	Monsaras	PA
3383	Nazare dos Patos	PA
3400	Oriximina	PA
3586	Peixe Boi	PA
3605	Piria	PA
3641	Magalhaes Barata	PA
3664	Matapiquara	PA
3677	Miritituba	PA
3701	Nova Esperanca do Piria	PA
3830	Melgaco	PA
3838	Monte Alegre	PA
3867	Novo Progresso	PA
3869	Oeiras do Para	PA
3873	Otelo	PA
3900	Perseveranca	PA
3990	Moiraba	PA
4002	Murucupi	PA
4016	Novo Planalto	PA
4018	Obidos	PA
4081	Primavera	PA
4092	Redencao	PA
4094	Repartimento	PA
4115	Juruti	PA
4168	Medicilandia	PA
4170	Menino Deus do Anapu	PA
4212	Ourilandia do Norte	PA
4228	Parauapebas	PA
4250	Piraquara	PA
4291	Mae do Rio	PA
4304	Marituba	PA
4323	Monte Alegre do Mau	PA
4337	Nazare de Mocajuba	PA
4344	Nova Ipixuna	PA
4395	Piabas	PA
4419	Km 26	PA
4433	Ligacao do Para	PA
4444	Marajoara	PA
4478	Murumuru	PA
4492	Nova Mocajuba	PA
4502	Ourem	PA
4649	Gradaus	PA
4666	Hidreletrica Tucurui	PA
4715	Japerica	PA
4773	Emborai	PA
4791	Flexal	PA
4807	Goianesia do Para	PA
4859	Itatupa	PA
4934	Faro	PA
4944	Floresta	PA
4982	Igarape Acu	PA
5041	Juaba	PA
5102	Floresta do Araguaia	PA
5160	Jacunda	PA
5177	Urucuri	PA
5187	Vila do Carmo do Tocantins	PA
5196	Vista Alegre do Para	PA
5206	Conceicao	PA
5208	Conceicao do Araguaia	PA
5223	Cripurizao	PA
5276	Iatai	PA
5285	Inanu	PA
5316	Itupiranga	PA
5332	Urucuriteua	PA
5344	Vigia	PA
5385	Cuiu Cuiu	PA
5387	Curuai	PA
5436	Guajara Miri	PA
5441	Gurupizinho	PA
5452	Inhangapi	PA
5519	Colares	PA
5534	Cripurizinho	PA
5603	Igarape Miri	PA
5649	Joanes	PA
5673	Vila Franca	PA
5742	Espirito Santo do Taua	PA
5763	Garrafao do Norte	PA
5809	Itaituba	PA
5860	Curionopolis	PA
5874	Eldorado dos Carajas	PA
5891	Fernandes Belo	PA
5966	Jambuacu	PA
5974	Joana Coeli	PA
5989	Condeixa	PA
6005	Cumaru do Norte	PA
6109	Jandiai	PA
6121	Joana Peres	PA
6148	Curua	PA
6152	Dom Eliseu	PA
6214	Igarape da Lama	PA
6287	Rio Maria	PA
6418	Jamanxinzinho	PA
6426	Jubim	PA
6470	Coqueiro	PA
6488	Curumu	PA
6584	Jacareacanga	PA
6614	Remansao	PA
6658	Curuca	PA
6771	Itapixuna	PA
6811	Concordia do Para	PA
6875	Gurupa	PA
6902	Irituia	PA
6926	Jaguarari	PA
6995	Curralinho	PA
6996	Curucambaba	PA
7046	Guajara Acu	PA
7077	Ipixuna do Para	PA
7153	Arapixuna	PA
7158	Aruri	PA
7162	Aveiro	PA
7200	Brejo do Meio	PA
7207	Cachoeira de Piria	PA
7215	Camiranga	PA
7234	Carajas	PA
7254	Prainha	PA
7259	Quatipuru	PA
7278	4 Bocas	PA
7281	Acara	PA
7295	Alter do Chao	PA
7325	Arumanduba	PA
7330	Bagre	PA
7352	Boa Vista do Iririteua	PA
7357	Bom Jardim	PA
7365	Brasil Novo	PA
7380	Cambuquira	PA
7392	Capanema	PA
7446	Afua	PA
7491	Aturiai	PA
7509	Barreiras	PA
7528	Bonito	PA
7583	Porto Salvo	PA
7614	Agropolis Bela Vista	PA
7689	Benevides	PA
7690	Benfica	PA
7740	Caraparu	PA
7741	Caratateua	PA
7742	Caripi	PA
7839	Boim	PA
7906	Castelo dos Sonhos	PA
7930	Almoco	PA
7946	Apeu	PA
7985	Baturite	PA
7986	Bela Vista do Caracol	PA
8005	Brasilia Legal	PA
8026	Camara do Marajo	PA
8156	Bom Jesus do Tocantins	PA
8166	Brejo Grande do Araguaia	PA
8168	Breves	PA
8191	Canaa dos Carajas	PA
8213	Chaves	PA
8238	Ananindeua	PA
8240	Antonio Lemos	PA
8246	Arco Iris	PA
8248	Areias	PA
8254	Aurora do Para	PA
8261	Barcarena	PA
8272	Boa Fe	PA
8291	Bujaru	PA
8302	Cairari	PA
8326	Capitao Poco	PA
8327	Caracara do Arari	PA
8365	Abaetetuba	PA
8378	Altamira	PA
8447	Cameta	PA
8504	Vila Planalto	PA
8568	Bannach	PA
8580	Barreira dos Campos	PA
8591	Boa Sorte	PA
8652	Castanhal	PA
8672	Abel Figueiredo	PA
8686	Alenquer	PA
8687	Algodoal	PA
8691	Alta Para	PA
8698	Anajas	PA
8709	Araquaim	PA
8796	Carrazedo	PA
8833	Americano	PA
8893	Breu Branco	PA
8961	Vila Isol	PA
8993	Alvorada	PA
9007	Apinages	PA
9037	Barreira Branca	PA
9047	Boa Esperanca	PA
9118	Agua Azul do Norte	PA
9131	Anapu	PA
9167	Beja	PA
9189	Braganca	PA
9202	Caju	PA
9221	Carapajo	PA
9319	Baiao	PA
9338	Belterra	PA
9373	Cafezal	PA
9424	Vila Goreth	PA
9429	Viseu	PA
9447	Agua Fria	PA
9454	Almeirim	PA
9482	Augusto Correa	PA
9498	Belem	PA
9519	Cachoeira do Arari	PA
28	Santa Luzia do Pacui	AP
488	Sao Tome	AP
918	Vila Velha	AP
942	Santa Maria	AP
1079	Santana	AP
1183	Vitoria do Jari	AP
1423	Tartarugalzinho	AP
1523	Serra do Navio	AP
1898	Sao Sebastiao do Livramento	AP
2067	Sucuriju	AP
2267	Laranjal do Jari	AP
2459	Mazagao Velho	AP
2498	Oiapoque	AP
2606	Mazagao	AP
2727	Lourenco	AP
3008	Pracuuba	AP
3058	Macapa	AP
4268	Porto Grande	AP
4376	Paredao	AP
4434	Livramento do Pacui	AP
4674	Igarape do Lago	AP
4678	Ilha de Santana	AP
4898	Corre Agua	AP
5097	Ferreira Gomes	AP
5256	Gaivota	AP
5274	Gurupora	AP
5314	Itaubal	AP
5355	Clevelandia do Norte	AP
5859	Curiau	AP
6006	Cunani	AP
6175	Fortaleza	AP
6335	Fazendinha	AP
6659	Cutias	AP
6893	Inaja	AP
7122	Abacate da Pedreira	AP
7809	Bailique	AP
7836	Boca do Jari	AP
7874	Calcoene	AP
7939	Ambe	AP
8541	Aporema	AP
8695	Amapa	AP
8788	Carmo	AP
8850	Ariri	AP
9211	Cantanzal	AP
9281	Agua Branca do Amapari	AP
9460	Amapari	AP
41	Santo Amaro de Campos	RJ
90	Sapucaia	RJ
157	Sacra Familia do Tingua	RJ
192	Santo Antonio do Imbe	RJ
217	Sao Joao do Paraiso	RJ
231	Sao Pedro da Aldeia	RJ
237	Sao Sebastiao do Alto	RJ
301	Sana	RJ
306	Santa Isabel do Rio Preto	RJ
331	Sao Joao de Meriti	RJ
341	Sao Jose do Ribeirao	RJ
352	Sao Sebastiao de Campos	RJ
437	Santa Maria	RJ
448	Santanesia	RJ
501	Serrinha	RJ
519	Tarituba	RJ
530	Triunfo	RJ
609	Sao Sebastiao do Paraiba	RJ
618	Sebastiao de Lacerda	RJ
715	Sao Goncalo	RJ
796	Santa Clara	RJ
797	Santa Cruz da Serra	RJ
806	Santo Antonio de Padua	RJ
811	Santo Eduardo	RJ
826	Sao Joao Marcos	RJ
834	Sao Jose de Uba	RJ
877	Tamoios	RJ
879	Tangua	RJ
1002	Sao Vicente de Paula	RJ
1028	Taboas	RJ
1074	Santa Maria Madalena	RJ
1193	Sambaetiba	RJ
1203	Santa Rita da Floresta	RJ
1234	Sao Joaquim	RJ
1274	Seropedica	RJ
1285	Sumidouro	RJ
1356	Sao Francisco de Itabapoana	RJ
1372	Sao Jose do Vale do Rio Preto	RJ
1382	Sao Sebastiao dos Ferreiros	RJ
1389	Saquarema	RJ
1429	Teresopolis	RJ
1490	Sao Fidelis	RJ
1527	Silva Jardim	RJ
1531	Sodrelandia	RJ
1548	Tocos	RJ
1551	Trajano de Morais	RJ
1567	Vassouras	RJ
1568	Venda das Pedras	RJ
1582	Rosal	RJ
1651	Tapera	RJ
1666	Travessao	RJ
1693	Vila Nova de Campos	RJ
1709	Salutaris	RJ
1724	Santo Aleixo	RJ
1782	Subaio	RJ
1806	Varre Sai	RJ
1834	Sampaio Correia	RJ
1872	Sao Joao da Barra	RJ
1915	Sossego	RJ
1917	Surui	RJ
1944	Valenca	RJ
1979	Santa Cruz	RJ
2027	Sao Jose do Turvo	RJ
2159	Nossa Senhora da Penha	RJ
2190	Parati	RJ
2201	Piabeta	RJ
2227	Porto das Caixas	RJ
2248	Resende	RJ
2272	Macae	RJ
2312	Mussurepe	RJ
2318	Nossa Senhora da Aparecida	RJ
2355	Parapeuna	RJ
2378	Pirangai	RJ
2446	Manuel Duarte	RJ
2465	Monera	RJ
2468	Monte Alegre	RJ
2486	Nilopolis	RJ
2526	Paty do Alferes	RJ
2585	Mage	RJ
2596	Marica	RJ
2607	Miguel Pereira	RJ
2683	Piao	RJ
2691	Pirai	RJ
2778	Niteroi	RJ
2853	Quatis	RJ
2962	Paquequer Pequeno	RJ
3043	Laranjais	RJ
3062	Maniva	RJ
3134	Papucaia	RJ
3151	Pentagna	RJ
3160	Pipeiras	RJ
3175	Portela	RJ
3196	Macuco	RJ
3225	Morro Grande	RJ
3301	Purilandia	RJ
3438	Pirapetinga de Bom Jesus	RJ
3456	Quarteis	RJ
3462	Renascenca	RJ
3489	Macabuzinho	RJ
3532	Natividade	RJ
3534	Nhunguacu	RJ
3541	Nova Friburgo	RJ
3573	Paraiso do Tobias	RJ
3574	Paraoquena	RJ
3649	Mambucaba	RJ
3652	Manoel Ribeiro	RJ
3655	Marangatu	RJ
3672	Mendes	RJ
3743	Passa 3	RJ
3762	Petropolis	RJ
3782	Porciuncula	RJ
3799	Laje do Muriae	RJ
3808	Lidice	RJ
3816	Mangaratiba	RJ
3874	Ourania	RJ
3922	Porto Real	RJ
3931	Pureza	RJ
3985	Miracema	RJ
4057	Pinheiral	RJ
4077	Praia de Aracatiba	RJ
4105	Rio de Janeiro	RJ
4227	Parati Mirim	RJ
4237	Pedra Selada	RJ
4328	Morangaba	RJ
4343	Nova Iguacu	RJ
4371	Paracambi	RJ
4372	Paraiba do Sul	RJ
4468	Monte Verde	RJ
4470	Monumento	RJ
4472	Morro do Coco	RJ
4591	Cordeiro	RJ
4614	Doutor Elias	RJ
4657	Guapimirim	RJ
4682	Inhomirim	RJ
4690	Itabapoana	RJ
4886	Colonia	RJ
4900	Correntezas	RJ
4922	Doutor Loreti	RJ
4932	Euclidelandia	RJ
5005	Itaborai	RJ
5007	Itacurussa	RJ
5085	Dores de Macabu	RJ
5109	Glicerio	RJ
5183	Venda das Flores	RJ
5188	Vila do Frade	RJ
5198	Volta Redonda	RJ
5292	Ipuca	RJ
5301	Itaguai	RJ
5309	Itaocara	RJ
5361	Conceicao de Jacarei	RJ
5363	Conrado	RJ
5394	Engenheiro Pedreira	RJ
5439	Guia de Pacobaiba	RJ
5469	Itatiaia	RJ
5491	Valao do Barro	RJ
5511	Werneck	RJ
5528	Corrego da Prata	RJ
5546	Duque de Caxias	RJ
5606	Iguaba Grande	RJ
5643	Japeri	RJ
5674	Visconde de Imbe	RJ
5731	Dorandia	RJ
5768	Goitacazes	RJ
5769	Governador Portela	RJ
5784	Ibitiguacu	RJ
5810	Itajara	RJ
5938	Inconfidencia	RJ
5992	Conservatoria	RJ
6024	Engenheiro Paulo de Frontin	RJ
6047	Fumaca	RJ
6208	Ibitioca	RJ
6221	Ipiabas	RJ
6236	Italva	RJ
6248	Japuiba	RJ
6271	Queimados	RJ
6283	Rio Bonito	RJ
6298	Comendador Levy Gasparian	RJ
6325	Engenheiro Passos	RJ
6401	Itaperuna	RJ
6442	Raposo	RJ
6454	Rio das Flores	RJ
6475	Correas	RJ
6485	Cunhambebe	RJ
6588	Jamapara	RJ
6600	Porto Velho do Cunha	RJ
6609	Quissama	RJ
6630	Comendador Venancio	RJ
6642	Corrego do Ouro	RJ
6694	Funil	RJ
6701	Getulandia	RJ
6767	Itambi	RJ
6783	Jaguarembe	RJ
6810	Conceicao de Macabu	RJ
6897	Inoa	RJ
7018	Estrada Nova	RJ
7035	Gavioes	RJ
7104	Jacuecanga	RJ
7188	Bom Jardim	RJ
7204	Cabucu	RJ
7274	2 Barras	RJ
7283	Afonso Arinos	RJ
7317	Araruama	RJ
7335	Barao de Juparana	RJ
7399	Cardoso Moreira	RJ
7431	Retiro do Muriae	RJ
7486	Areal	RJ
7493	Avelar	RJ
7499	Barcelos	RJ
7505	Barra Mansa	RJ
7542	Cabo Frio	RJ
7603	Rio Claro	RJ
7605	Rio das Ostras	RJ
7662	Arraial do Cabo	RJ
7686	Belford Roxo	RJ
7687	Bemposta	RJ
7735	Carabucu	RJ
7807	Bacaxa	RJ
7817	Barra de Sao Joao	RJ
7843	Bom Jesus do Itabapoana	RJ
7844	Bom Jesus do Querendo	RJ
7875	Calheiros	RJ
7918	Abraao	RJ
8027	Cambuci	RJ
8203	Carmo	RJ
8252	Arrozal	RJ
8265	Barra do Pirai	RJ
8316	Campos dos Goytacazes	RJ
8359	3 Irmaos	RJ
8363	3 Rios	RJ
8386	Anta	RJ
8401	Banquete	RJ
8402	Barra Alegre	RJ
8592	Boa Ventura	RJ
8617	Cachoeiras de Macacu	RJ
8670	Abarracamento	RJ
8836	Andrade Pinto	RJ
8851	Armacao de Buzios	RJ
8877	Boa Sorte	RJ
8929	Carapebus	RJ
8962	Vila Muriqui	RJ
9029	Baltazar	RJ
9073	Cambiasca	RJ
9164	Barra Seca	RJ
9247	Vargem Alegre	RJ
9250	Vila da Grama	RJ
9299	Aperibe	RJ
9369	Cachoeiros	RJ
9388	Cantagalo	RJ
9402	Casimiro de Abreu	RJ
9468	Angra dos Reis	RJ
9504	Boa Esperanca	RJ
60	Sao Joao da Baliza	RR
731	Sao Luiz	RR
930	Rorainopolis	RR
1801	Uiramuta	RR
2306	Mucajai	RR
3253	Pacaraima	RR
3536	Normandia	RR
5619	Iracema	RR
7136	Amajari	RR
8042	Caracarai	RR
8160	Bonfim	RR
8417	Boa Vista	RR
9083	Canta	RR
9093	Caroebe	RR
9456	Alto Alegre	RR
51	Sao Felipe	AM
191	Santo Antonio do Ica	AM
486	Sao Sebastiao do Uatuma	AM
559	Santa Isabel do Rio Negro	AM
626	Silves	AM
658	Uarini	AM
823	Sao Gabriel da Cachoeira	AM
1202	Santa Rita	AM
1414	Tapaua	AM
1550	Tonantins	AM
1678	Urucurituba	AM
1893	Sao Paulo de Olivenca	AM
1918	Tabatinga	AM
1924	Tefe	AM
2099	Lago Preto	AM
2116	Manacapuru	AM
2275	Manaus	AM
2296	Mocambo	AM
2311	Murutinga	AM
2332	Novo Airao	AM
2357	Parintins	AM
2485	Nhamunda	AM
2739	Maraa	AM
2757	Maues	AM
2910	Massauari	AM
2934	Moura	AM
2946	Nova Olinda do Norte	AM
3031	Jurua	AM
3034	Labrea	AM
3349	Manicore	AM
3401	Osorio da Fonseca	AM
3620	Jutai	AM
3711	Novo Aripuana	AM
3745	Pauini	AM
4145	Manaquiri	AM
4389	Pedras	AM
4579	Codajas	AM
4655	Guajara	AM
4693	Itamarati	AM
4777	Envira	AM
4908	Cucui	AM
4979	Icana	AM
5032	Japura	AM
5126	Iauarete	AM
5252	Fonte Boa	AM
5463	Itapiranga	AM
5929	Humaita	AM
5984	Coari	AM
6089	Ipixuna	AM
6352	Freguesia do Andira	AM
6499	Eirunepe	AM
6602	Presidente Figueiredo	AM
6857	Floriano Peixoto	AM
7078	Iranduba	AM
7080	Itacoatiara	AM
7164	Badajos	AM
7310	Apui	AM
7332	Balbina	AM
7381	Cameta	AM
7396	Carauari	AM
7400	Careiro da Varzea	AM
7492	Autazes	AM
7522	Beruri	AM
7564	Careiro	AM
7589	Repartimento	AM
7637	Amatari	AM
7743	Carvoeiro	AM
7833	Boa Vista do Ramos	AM
8097	Amatura	AM
8239	Anori	AM
8321	Canuma	AM
8394	Augusto Montenegro	AM
8429	Borba	AM
8529	Alvaraes	AM
8587	Benjamin Constant	AM
8699	Anama	AM
8765	Caapiranga	AM
8848	Ariau	AM
8947	Urucara	AM
9025	Axinim	AM
9109	Rio Preto da Eva	AM
9165	Barreirinha	AM
9179	Boca do Acre	AM
9212	Canutama	AM
9258	Vila Pitinga	AM
9313	Atalaia do Norte	AM
9327	Barcelos	AM
1	10 de Maio	AC
752	Sena Madureira	AC
1120	Senador Guiomard	AC
1594	Santa Rosa	AC
1699	Xapuri	AC
1923	Tarauaca	AC
1970	Rodrigues Alves	AC
2870	Rio Branco	AC
3295	Porto Walter	AC
3775	Placido de Castro	AC
3968	Mancio Lima	AC
4147	Manoel Urbano	AC
4158	Marechal Thaumaturgo	AC
4265	Porto Acre	AC
4633	Feijo	AC
4907	Cruzeiro do Sul	AC
5738	Epitaciolandia	AC
6424	Jordao	AC
7367	Bujari	AC
7490	Assis Brasil	AC
8464	Capixaba	AC
8514	Acrelandia	AC
8756	Brasileia	AC
63	Sao Joao do Arraial	PI
79	Sao Miguel do Tapuio	PI
93	Sebastiao Barros	PI
164	Santa Cruz do Piaui	PI
182	Santana do Piaui	PI
209	Sao Goncalo do Gurgueia	PI
321	Santo Antonio dos Milagres	PI
326	Sao Felix do Piaui	PI
340	Sao Jose do Peixe	PI
343	Sao Lourenco do Piaui	PI
345	Sao Luis do Piaui	PI
376	Tamboril do Piaui	PI
514	Tanque do Piaui	PI
537	Uniao	PI
576	Santo Antonio de Lisboa	PI
587	Sao Goncalo do Piaui	PI
589	Sao Joao da Fronteira	PI
733	Sao Miguel do Fidalgo	PI
836	Sao Juliao	PI
975	Sao Francisco do Piaui	PI
1006	Sebastiao Leal	PI
1024	Socorro do Piaui	PI
1101	Sao Jose do Piaui	PI
1151	Teresina	PI
1180	Vila Nova do Piaui	PI
1244	Sao Jose do Divino	PI
1259	Sao Raimundo Nonato	PI
1353	Sao Braz do Piaui	PI
1362	Sao Joao da Serra	PI
1409	Sussuapara	PI
1466	Santa Filomena	PI
1475	Santa Rosa do Piaui	PI
1589	Santa Cruz dos Milagres	PI
1608	Sao Joao da Varjota	PI
1640	Sigefredo Pacheco	PI
1642	Simoes	PI
1677	Urucui	PI
1715	Santa Luz	PI
1739	Sao Joao do Piaui	PI
1754	Sao Pedro do Piaui	PI
1863	Sao Francisco de Assis do Piaui	PI
1873	Sao Joao da Canabrava	PI
1954	Vera Mendes	PI
2002	Santo Inacio do Piaui	PI
2035	Sao Miguel da Baixa Grande	PI
2061	Simplicio Mendes	PI
2169	Novo Oriente do Piaui	PI
2225	Porto Alegre do Piaui	PI
2250	Riacho Frio	PI
2261	Lagoinha do Piaui	PI
2319	Nossa Senhora dos Remedios	PI
2347	Padre Marcos	PI
2351	Paqueta	PI
2359	Patos do Piaui	PI
2412	Jurema	PI
2440	Madeiro	PI
2444	Manoel Emidio	PI
2461	Milton Brandao	PI
2488	Nossa Senhora de Nazare	PI
2512	Pajeu do Piaui	PI
2544	Piripiri	PI
2662	Palmeira do Piaui	PI
2718	Lagoa Alegre	PI
2755	Matias Olimpio	PI
2765	Monte Alegre do Piaui	PI
2770	Morro Cabeca No Tempo	PI
2776	Nazare do Piaui	PI
2790	Nova Santa Rita	PI
2811	Paulistana	PI
2846	Prata do Piaui	PI
2916	Miguel Alves	PI
2925	Monsenhor Gil	PI
2970	Passagem Franca do Piaui	PI
3054	Luis Correia	PI
3057	Luzilandia	PI
3071	Massape do Piaui	PI
3138	Parnagua	PI
3139	Parnaiba	PI
3269	Pedro Laurentino	PI
3272	Picos	PI
3282	Piracuruca	PI
3316	Ribeira do Piaui	PI
3397	Novo Santo Antonio	PI
3409	Palmeirais	PI
3526	Morro do Chapeu do Piaui	PI
3625	Lagoa do Barro do Piaui	PI
3785	Porto	PI
3792	Lagoa de Sao Francisco	PI
3794	Lagoa do Piaui	PI
3847	Murici dos Portelas	PI
3973	Marcos Parente	PI
3982	Miguel Leao	PI
4046	Pedro II	PI
4178	Monsenhor Hipolito	PI
4209	Novo Nilo	PI
4216	Paes Landim	PI
4278	Landri Sales	PI
4356	Olho D'agua do Piaui	PI
4386	Pavussu	PI
4398	Pimenteiras	PI
4421	Lagoa do Sitio	PI
4447	Marcolandia	PI
4498	Oeiras	PI
4539	Pio IX	PI
4617	Eliseu Martins	PI
4652	Guadalupe	PI
4722	Joca Marques	PI
4752	Curral Novo do Piaui	PI
4763	Dom Inocencio	PI
4802	Geminiano	PI
4841	Ipiranga do Piaui	PI
4883	Coivaras	PI
5047	Cocal	PI
5071	Cristino Castro	PI
5159	Jacobina do Piaui	PI
5162	Jaicos	PI
5234	Domingos Mourao	PI
5298	Isaias Coelho	PI
5323	Jardim do Mulato	PI
5326	Jatoba do Piaui	PI
5388	Dirceu Arcoverde	PI
5493	Varzea Branca	PI
5539	Demerval Lobao	PI
5650	Joao Costa	PI
5659	Valenca do Piaui	PI
5679	Cocal de Telha	PI
5684	Conceicao do Caninde	PI
5716	Currais	PI
5759	Francisco Ayres	PI
5826	Jerumenha	PI
5835	Cocal dos Alves	PI
5838	Colonia do Gurgueia	PI
5862	Curralinhos	PI
5924	Guaribas	PI
5994	Coronel Jose Dias	PI
6043	Francinopolis	PI
6103	Itaueira	PI
6127	Julio Borges	PI
6156	Elesbao Veloso	PI
6162	Esperantina	PI
6186	Gilbues	PI
6203	Hugo Napoleao	PI
6293	Colonia do Piaui	PI
6306	Cristalandia do Piaui	PI
6345	Floriano	PI
6476	Corrente	PI
6493	Dom Expedito Lopes	PI
6570	Itainopolis	PI
6613	Redencao do Gurgueia	PI
6657	Curimata	PI
6677	Fartura do Piaui	PI
6687	Flores do Piaui	PI
6688	Floresta do Piaui	PI
6692	Francisco Santos	PI
6693	Fronteiras	PI
6794	Jose de Freitas	PI
6890	Ilha Grande	PI
6937	Joaquim Pires	PI
6941	Juazeiro do Piaui	PI
6954	Queimada Nova	PI
7028	Francisco Macedo	PI
7075	Inhuma	PI
7228	Canto do Buriti	PI
7267	Ribeiro Goncalves	PI
7350	Bertolinia	PI
7368	Buriti dos Lopes	PI
7374	Cajazeiras do Piaui	PI
7428	Regeneracao	PI
7450	Alagoinha do Piaui	PI
7510	Barreiras do Piaui	PI
7661	Arraial	PI
7665	Assuncao do Piaui	PI
7675	Barra D'alcantara	PI
7691	Betania do Piaui	PI
7710	Cabeceiras do Piaui	PI
7782	Amarante	PI
7786	Angical do Piaui	PI
7810	Baixa Grande do Ribeiro	PI
7880	Campinas do Piaui	PI
7881	Campo Alegre do Fidalgo	PI
7897	Caracol	PI
7905	Castelo do Piaui	PI
7961	Aroazes	PI
7988	Belem do Piaui	PI
8023	Cajueiro da Praia	PI
8044	Caraubas do Piaui	PI
8080	Agua Branca	PI
8088	Alegrete do Piaui	PI
8169	Buriti dos Montes	PI
8267	Barro Duro	PI
8314	Campo Grande do Piaui	PI
8315	Campo Largo do Piaui	PI
8348	Varzea Grande	PI
8385	Anisio de Abreu	PI
8426	Bonfim do Piaui	PI
8530	Alvorada do Gurgueia	PI
8740	Batalha	PI
8749	Boa Hora	PI
8772	Caldeirao Grande do Piaui	PI
8786	Caridade do Piaui	PI
8889	Boqueirao do Piaui	PI
8920	Canavieira	PI
8965	Wall Ferraz	PI
8989	Altos	PI
9024	Avelino Lopes	PI
9044	Bela Vista do Piaui	PI
9087	Capitao Gervasio Oliveira	PI
9117	Agricolandia	PI
9138	Antonio Almeida	PI
9180	Bocaina	PI
9186	Bom Principio do Piaui	PI
9234	Caxingo	PI
9291	Alto Longa	PI
9331	Barras	PI
9356	Brasileira	PI
9384	Campo Maior	PI
9441	Acaua	PI
9500	Beneditinos	PI
9510	Bom Jesus	PI
9514	Brejo do Piaui	PI
9548	Capitao de Campos	PI
9571	Rio Grande do Piaui	PI
5	Riolandia	MT
8	Rondonopolis	MT
15	Sangradouro	MT
22	Santa Elvira	MT
30	Santa Rita	MT
40	Santo Afonso	MT
49	Sao Domingos	MT
68	Sao Jose	MT
72	Sao Jose do Planalto	MT
73	Sao Jose dos 4 Marcos	MT
113	Tapirapua	MT
150	Rosario Oeste	MT
166	Santa Fe	MT
193	Santo Antonio do Leverger	MT
241	Sao Vicente	MT
271	Tesouro	MT
275	Toricueyje	MT
342	Sao Lourenco de Fatima	MT
349	Sao Pedro da Cipa	MT
371	Sorriso	MT
395	Vale Rico	MT
463	Sao Felix do Araguaia	MT
528	Torixoreu	MT
648	Terra Roxa	MT
728	Sao Jose do Xingu	MT
760	Sinop	MT
764	Tabapora	MT
778	Terra Nova do Norte	MT
816	Sao Cristovao	MT
829	Sao Jorge	MT
915	Vila Atlantica	MT
989	Sao Jose do Rio Claro	MT
1035	Tangara da Serra	MT
1126	Serra Nova	MT
1243	Sao Jose do Apui	MT
1249	Sao Jose do Povo	MT
1269	Selma	MT
1312	Uniao do Sul	MT
1349	Santo Antonio do Rio Bonito	MT
1497	Sao Joaquim	MT
1516	Sapezal	MT
1533	Sumidouro	MT
1563	Vale dos Sonhos	MT
1572	Vila Paulista	MT
1573	Vila Progresso	MT
1652	Tapurah	MT
1849	Santa Terezinha	MT
1853	Santaninha	MT
1945	Varginha	MT
1958	Vila Rica	MT
1972	Salto do Ceu	MT
1977	Santa Carmem	MT
2064	Sonho Azul	MT
2108	Lucialva	MT
2158	Nossa Senhora da Guia	MT
2165	Nova Maringa	MT
2218	Pontal do Araguaia	MT
2224	Porto Alegre do Norte	MT
2228	Porto Estrela	MT
2291	Mimoso	MT
2323	Nova Brasilia	MT
2325	Nova Galileia	MT
2326	Nova Guarita	MT
2388	Poxoreo	MT
2426	Lambari D'oeste	MT
2435	Luciara	MT
2492	Nova Brasilandia	MT
2497	Novo Sao Joaquim	MT
2511	Padronal	MT
2524	Passagem da Conceicao	MT
2546	Pirizal	MT
2560	Juscimeira	MT
2598	Marzagao	MT
2636	Nova Canaa do Norte	MT
2642	Nova Olimpia	MT
2645	Nova Ubirata	MT
2659	Pai Andre	MT
2706	Pombas	MT
2708	Pontes e Lacerda	MT
2779	Nobres	MT
2781	Nortelandia	MT
2788	Nova Lacerda	MT
2803	Paraiso do Leste	MT
2834	Planalto da Serra	MT
2850	Progresso	MT
2869	Ribeiraozinho	MT
2997	Placa de Santo Antonio	MT
3004	Porto dos Gauchos	MT
3019	Reserva do Cabacal	MT
3103	Nova Bandeirantes	MT
3107	Nova Mutum	MT
3112	Novo Parana	MT
3242	Novo Eldorado	MT
3261	Paranaita	MT
3317	Ribeirao Cascalheira	MT
3390	Nova Alvorada	MT
3454	Primavera do Leste	MT
3488	Lucas do Rio Verde	MT
3500	Marcelandia	MT
3535	Nonoai do Norte	MT
3612	Ponte Branca	MT
3613	Pontinopolis	MT
3662	Mata Dentro	MT
3669	Matupa	MT
3675	Mirassol D'oeste	MT
3698	Nossa Senhora do Livramento	MT
3713	Novo Diamantino	MT
3715	Novo Horizonte do Norte	MT
3718	Novo Mundo	MT
3749	Pedra Preta	MT
3756	Peixoto de Azevedo	MT
3787	Juruena	MT
3805	Lavouras	MT
3861	Nova Marilandia	MT
3914	Pocone	MT
4090	Rancharia	MT
4137	Machado	MT
4202	Nova Catanduva	MT
4207	Nova Xavantina	MT
4226	Paranatinga	MT
4347	Nova Monte Verde	MT
4546	Ponte de Pedra	MT
4551	Porto Esperidiao	MT
4595	Cotrel	MT
4620	Engenho	MT
4638	Fontanilhas	MT
4644	General Carneiro	MT
4730	Cocalinho	MT
4790	Filadelfia	MT
4801	Gaucha do Norte	MT
4884	Colider	MT
4935	Faval	MT
4969	Guaranta do Norte	MT
4990	Indianapolis	MT
4991	Indiavai	MT
5024	Jaciara	MT
5079	Denise	MT
5096	Feliz Natal	MT
5122	Guarita	MT
5125	Horizonte do Oeste	MT
5140	Irenopolis	MT
5165	Jatoba	MT
5174	Juara	MT
5192	Vila Santo Antonio	MT
5241	Engenho Velho	MT
5272	Guiratinga	MT
5327	Jauru	MT
5345	Vila Bela da Santissima Trindade	MT
5377	Cristinopolis	MT
5413	Flor da Serra	MT
5480	Jangada	MT
5494	Varzea Grande	MT
5553	Entre Rios	MT
5646	Jarudore	MT
5652	Joselandia	MT
5655	Juina	MT
5717	Curvelandia	MT
5722	Diamantino	MT
5864	Del Rios	MT
5911	Gloria D'oeste	MT
5987	Colorado do Norte	MT
5991	Confresa	MT
5998	Coxipo do Ouro	MT
6004	Cuiaba	MT
6030	Estrela do Leste	MT
6130	Claudia	MT
6318	Dom Aquino	MT
6449	Ribeirao dos Cocais	MT
6458	Cidade Morena	MT
6463	Comodoro	MT
6474	Coronel Ponce	MT
6482	Coxipo Acu	MT
6520	Figueiropolis D Oeste	MT
6606	Querencia	MT
6644	Cotriguacu	MT
6679	Fazenda de Cima	MT
6765	Itamarati Norte	MT
6774	Itauba	MT
6951	Primavera	MT
6967	Rio Branco	MT
7097	Itiquira	MT
7253	Praia Rica	MT
7297	Alto Juruena	MT
7298	Alto Paraguai	MT
7308	Apiacas	MT
7322	Arenapolis	MT
7346	Bel Rios	MT
7448	Ainhumas	MT
7456	Alto Araguaia	MT
7516	Baus	MT
7618	Aguacu	MT
7692	Bezerro Branco	MT
7775	Alto Garcas	MT
7776	Alto Paraiso	MT
7779	Alto Taquari	MT
7819	Barra do Garcas	MT
7882	Campo Novo do Parecis	MT
7900	Caravagio	MT
7923	Agua Boa	MT
7951	Araguainha	MT
8012	Caceres	MT
8056	Castanheira	MT
8078	Acorizal	MT
8098	Analandia do Norte	MT
8155	Boa Vista	MT
8195	Cangas	MT
8200	Caramujo	MT
8224	Alcantilado	MT
8260	Barao de Melgaco	MT
8277	Bom Sucesso	MT
8287	Brasnorte	MT
8344	Chapada dos Guimaraes	MT
8373	Aguapei	MT
8496	Vera	MT
8525	Alto Coite	MT
8546	Araguaiana	MT
8553	Aripuana	MT
8557	Assari	MT
8583	Batovi	MT
8630	Campos de Julio	MT
8656	Catuai	MT
8708	Araputanga	MT
8733	Barra do Bugres	MT
8762	Buriti	MT
8778	Canabrava do Norte	MT
8782	Capao Grande	MT
8825	Alto Boa Vista	MT
8876	Boa Esperanca	MT
8904	Caite	MT
8913	Campinapolis	MT
8978	Agua Fria	MT
8986	Alta Floresta	MT
9018	Arruda	MT
9042	Bauxi	MT
9080	Canarana	MT
9175	Boa Uniao	MT
9208	Campos Novos	MT
9256	Vila Operaria	MT
9398	Carlinda	MT
9403	Cassununga	MT
9438	3 Pontes	MT
9448	Aguas Claras	MT
9537	Campo Verde	MT
9547	Capao Verde	MT
9573	Rio Manso	MT
177	Santa Rita do Pardo	MS
367	Sidrolandia	MS
425	Sanga Puita	MS
543	Rochedo	MS
751	Selviria	MS
951	Santa Terezinha	MS
991	Sao Jose do Sucuriu	MS
997	Sao Romao	MS
1363	Sao Joao do Apore	MS
1378	Sao Pedro	MS
1420	Taquari	MS
1422	Taquarussu	MS
1448	Rio Verde de Mato Grosso	MS
1535	Tacuru	MS
1605	Sao Gabriel do Oeste	MS
1615	Sao Jose	MS
1649	Tamandare	MS
1695	Vila Vargas	MS
1702	Rochedinho	MS
1808	Velhacaria	MS
1814	Vila Marques	MS
1926	Terenos	MS
2065	Sonora	MS
2076	Taunay	MS
2264	Laguna Carapa	MS
2304	Morangas	MS
2308	Mundo Novo	MS
2336	Novo Horizonte do Sul	MS
2354	Paraiso	MS
2554	Ponte Vermelha	MS
2559	Juscelandia	MS
2630	Nioaque	MS
2633	Nova Andradina	MS
2782	Nossa Senhora de Fatima	MS
2876	Ladario	MS
3006	Porto XV de Novembro	MS
3116	Oriente	MS
3125	Paiaguas	MS
3228	Nhecolandia	MS
3258	Palmeiras	MS
3285	Piraputanga	MS
3299	Presidente Castelo	MS
3330	Lagoa Bonita	MS
3457	Quebracho	MS
3499	Maracaju	MS
3539	Nova America	MS
3695	Navirai	MS
3703	Nova Jales	MS
3734	Panambi	MS
3739	Paranhos	MS
3842	Montese	MS
3919	Pontinha do Cocho	MS
3947	Juti	MS
4001	Morumbi	MS
4034	Paranaiba	MS
4052	Picadinha	MS
4204	Nova Esperanca	MS
4249	Pirapora	MS
4258	Ponta Pora	MS
4316	Miranda	MS
4330	Morraria do Sul	MS
4417	Porto Esperanca	MS
4485	Nova Alvorada do Sul	MS
4533	Pedro Gomes	MS
4594	Corumba	MS
4631	Fatima do Sul	MS
4647	Gloria de Dourados	MS
4709	Jabuti	MS
4769	Dourados	MS
4789	Figueirao	MS
4866	Jaraguari	MS
4867	Jardim	MS
4905	Cruzaltina	MS
4984	Iguatemi	MS
5031	Japora	MS
5059	Congonha	MS
5115	Guaculandia	MS
5116	Guadalupe do Alto Parana	MS
5134	Indaia Grande	MS
5157	Jacarei	MS
5168	Jauru	MS
5218	Coronel Sapucaia	MS
5286	Indaia do Sul	MS
5303	Itahum	MS
5366	Corguinho	MS
5386	Cupins	MS
5465	Itapora	MS
5506	Vila Uniao	MS
5584	Guacu	MS
5608	Ilha Grande	MS
5615	Inocencia	MS
5778	Guia Lopes da Laguna	MS
5789	Ilha Comprida	MS
5795	Ipezal	MS
5819	Ivinhema	MS
5873	Eldorado	MS
6019	Douradina	MS
6144	Costa Rica	MS
6149	Deodapolis	MS
6268	Quebra Coco	MS
6288	Rio Negro	MS
6303	Coxim	MS
6428	Porto Vilma	MS
6461	Coimbra	MS
6534	Garcias	MS
6560	Indapolis	MS
6594	Jatei	MS
6605	Prudencio Thomaz	MS
6660	Debrasa	MS
6773	Itaquirai	MS
6822	Culturama	MS
6945	Porto Murtinho	MS
6970	Cipolandia	MS
6987	Cristalina	MS
7190	Bonito	MS
7196	Brasilandia	MS
7291	Alcinopolis	MS
7299	Amandina	MS
7326	Arvore Grande	MS
7377	Camapua	MS
7385	Campo Grande	MS
7433	Ribas do Rio Pardo	MS
7442	Sete Quedas	MS
7515	Baus	MS
7530	Boqueirao	MS
7541	Cabeceira do Apa	MS
7602	Rio Brilhante	MS
7633	Alto Sucuriu	MS
7722	Campestre	MS
7784	Amolar	MS
7789	Antonio Joao	MS
7838	Bocaja	MS
7942	Angelica	MS
7945	Aparecida do Taboado	MS
7948	Aquidauana	MS
8013	Cachoeira	MS
8081	Agua Clara	MS
8099	Anastacio	MS
8144	Bataypora	MS
8244	Arapua	MS
8351	Vicentina	MS
8387	Aral Moreira	MS
8448	Camisao	MS
8521	Albuquerque	MS
8565	Balsamo	MS
8567	Bandeirantes	MS
8596	Bom Fim	MS
8667	Tres Lagoas	MS
8676	Agua Boa	MS
8739	Bataguassu	MS
8742	Bela Vista	MS
8935	Cassilandia	MS
8968	Dois Irmaos do Buriti	MS
8994	Amambai	MS
9028	Baianopolis	MS
9086	Capao Seco	MS
9137	Anhandui	MS
9182	Bodoquena	MS
9228	Carumbe	MS
9252	Vila Formosa	MS
9262	Vista Alegre	MS
9362	Caarapo	MS
9394	Caracol	MS
9428	Vila Rica	MS
9464	Anaurilandia	MS
9478	Areado	MS
9566	Chapadao do Sul	MS
119	Theobroma	RO
146	Rolim de Moura	RO
325	Sao Felipe D'oeste	RO
411	Riozinho	RO
435	Santa Luzia do Oeste	RO
1410	Tabajara	RO
1562	Vale do Anari	RO
1604	Sao Francisco do Guapore	RO
1657	Teixeiropolis	RO
1767	Seringueiras	RO
1823	Vista Alegre do Abuna	RO
1892	Sao Miguel do Guapore	RO
1960	Vilhena	RO
2140	Mirante da Serra	RO
2164	Nova Mamore	RO
2204	Pimenteiras do Oeste	RO
2236	Presidente Medici	RO
2373	Pimenta Bueno	RO
2472	Monte Negro	RO
2496	Novo Horizonte do Oeste	RO
2508	Ouro Preto do Oeste	RO
3147	Pedras Negras	RO
3195	Machadinho D'oeste	RO
3239	Nova Uniao	RO
3391	Nova Brasilandia D'oeste	RO
3418	Parecis	RO
3515	Ministro Andreazza	RO
3823	Marco Rondon	RO
3926	Porto Velho	RO
4082	Primavera de Rondonia	RO
4496	Nova Vida	RO
4560	Principe da Beira	RO
5045	Chupinguaia	RO
5117	Guajara Mirim	RO
5245	Espigao D'oeste	RO
5489	Urupa	RO
5682	Colorado do Oeste	RO
5695	Corumbiara	RO
5696	Costa Marques	RO
6114	Jaru	RO
6245	Jaci Parana	RO
6247	Jamari	RO
6540	Governador Jorge Teixeira	RO
6654	Cujubim	RO
6789	Ji Parana	RO
7202	Buritis	RO
7437	Rio Crespo	RO
7636	Alvorada do Oeste	RO
7712	Cacaulandia	RO
7747	Castanheiras	RO
7803	Ariquemes	RO
7920	Abuna	RO
8015	Cacoal	RO
8036	Candeias do Jamari	RO
8628	Campo Novo de Rondonia	RO
8689	Alta Alegre dos Parecis	RO
8690	Alta Floresta do Oeste	RO
8769	Calama	RO
8897	Cabixi	RO
9100	Cerejeiras	RO
9251	Vila Extrema	RO
9416	Vale do Paraiso	RO
9458	Alto Paraiso	RO
9577	Brasília	DF
2	Chorao	RS
4	Rio Toldo	RS
7	Rolador	RS
14	Salvador do Sul	RS
17	Santa Cristina	RS
33	Santa Rosa	RS
34	Santa Teresinha	RS
57	Sao Jeronimo	RS
66	Sao Jorge	RS
74	Sao Lourenco das Missoes	RS
99	Serafim Schmidt	RS
105	Tabajara	RS
120	Tiaraju	RS
129	Triunfo	RS
133	Tupancireta	RS
134	Tupinamba	RS
141	Umbu	RS
145	Rolantinho da Figueira	RS
147	Rondinha	RS
162	Sant Auta	RS
165	Santa Cruz do Sul	RS
168	Santa Flora	RS
188	Santo Antonio	RS
196	Santo Cristo	RS
200	Sao Borja	RS
222	Sao Jose do Inhacora	RS
227	Sao Nicolau	RS
245	Sede Nova	RS
251	Sertao	RS
252	Silveira Martins	RS
258	Tamandua	RS
277	Touro Passo	RS
279	Travesseiro	RS
281	Tucunduva	RS
283	Tupantuba	RS
292	Rosario do Sul	RS
296	Sagrada Familia	RS
297	Saica	RS
314	Santana do Livramento	RS
320	Santo Antonio de Castro	RS
322	Sao Carlos	RS
339	Sao Jose do Norte	RS
348	Sao Pedro	RS
362	Serafina Correa	RS
368	Sinimbu	RS
375	Tabai	RS
386	Tramandai	RS
387	Trentin	RS
401	Vila Seca	RS
409	Xingu	RS
412	Riozinho	RS
427	Santa Barbara	RS
432	Santa Lucia	RS
433	Santa Lucia do Piai	RS
457	Santo Expedito do Sul	RS
479	Sao Paulo das Missoes	RS
504	Silva Jardim	RS
506	Sirio	RS
511	Taim	RS
515	Tapejara	RS
531	Tupancy Ou Vila Block	RS
538	Uniao da Serra	RS
544	Ronda Alta	RS
552	Santa Clara do Sul	RS
556	Santa Cruz da Concordia	RS
568	Santa Rita do Sul	RS
570	Santa Silvana	RS
598	Sao Jose do Hortencio	RS
606	Sao Pedro do Sul	RS
610	Sao Vendelino	RS
649	Teutonia	RS
653	Tunel Verde	RS
661	Ubiretama	RS
670	Rodeio Bonito	RS
674	Saldanha Marinho	RS
678	Santa Cecilia	RS
690	Santa Maria do Herval	RS
734	Sao Paulo	RS
748	Sao Valentim do Sul	RS
772	Taquara	RS
776	Tenente Portela	RS
781	Toroqua	RS
790	Rosario	RS
822	Sao Gabriel	RS
832	Sao Jose da Gloria	RS
841	Sao Marcos	RS
853	Sao Vicente do Sul	RS
881	Tapera	RS
896	Torres	RS
920	Vista Gaucha	RS
934	Santa Barbara do Sul	RS
941	Santa Luiza	RS
961	Santo Antonio do Bom Retiro	RS
964	Santo Inacio	RS
985	Sao Jose	RS
988	Sao Jose do Centro	RS
993	Sao Luiz	RS
994	Sao Miguel	RS
995	Sao Miguel das Missoes	RS
999	Sao Sebastiao	RS
1009	Senador Salgado Filho	RS
1011	Serio	RS
1018	Sertao Santana	RS
1019	Severiano de Almeida	RS
1023	Sobradinho	RS
1056	Saltinho	RS
1059	Salvador das Missoes	RS
1064	Santa Catarina	RS
1071	Santa Maria	RS
1077	Santa Vitoria do Palmar	RS
1092	Sao Joao da Urtiga	RS
1103	Sao Jose dos Ausentes	RS
1104	Sao Luis Rei	RS
1112	Sao Sebastiao do Cai	RS
1119	Seberi	RS
1131	Silveira	RS
1134	Soledade	RS
1136	Souza Ramos	RS
1144	Tanque	RS
1149	Tavares	RS
1152	Timbauva	RS
1158	Trindade do Sul	RS
1159	Tuparendi	RS
1165	Vale do Sol	RS
1175	Viamao	RS
1177	Vila Cruz	RS
1179	Vila Maria	RS
1188	Roque Gonzales	RS
1194	Sananduva	RS
1198	Santa Luzia	RS
1209	Santana	RS
1213	Santiago	RS
1216	Santo Antonio do Palma	RS
1224	Sao Francisco de Assis	RS
1229	Sao Joao Batista	RS
1246	Sao Jose do Herval	RS
1257	Sao Pedro da Serra	RS
1266	Sapiranga	RS
1297	Tesouras	RS
1323	Salto do Jacui	RS
1330	Santa Izabel do Sul	RS
1334	Santa Tereza	RS
1346	Santo Antonio da Patrulha	RS
1348	Santo Antonio do Planalto	RS
1351	Santo Augusto	RS
1370	Sao Jose de Castro	RS
1385	Sao Valerio do Sul	RS
1391	Seival	RS
1396	Serrinha	RS
1401	Sitio Gabriel	RS
1431	Torquato Severo	RS
1439	Tupanci do Sul	RS
1447	Unistalda	RS
1449	Roca Sales	RS
1451	Rolante	RS
1481	Santo Amaro do Sul	RS
1482	Santo Antonio das Missoes	RS
1495	Sao Joao	RS
1502	Sao Luiz Gonzaga	RS
1503	Sao Manuel	RS
1505	Sao Martinho da Serra	RS
1508	Sao Pedro do Butia	RS
1509	Sao Pedro do Iraxim	RS
1561	Vacacai	RS
1564	Vale Veneto	RS
1570	Victor Graeff	RS
1588	Santa Clara do Ingai	RS
1590	Santa Ines	RS
1603	Sao Francisco	RS
1611	Sao Joao do Polesine	RS
1632	Seca	RS
1647	Suspiro	RS
1658	Terra de Areia	RS
1668	Tuiuti	RS
1707	Salto	RS
1729	Sao Bom Jesus	RS
1733	Sao Domingos do Sul	RS
1748	Sao Lourenco do Sul	RS
1797	Turucu	RS
1822	Vista Alegre	RS
1836	Santa Cruz	RS
1857	Sao Bento	RS
1864	Sao Francisco de Paula	RS
1871	Sao Joao Bosco	RS
1881	Sao Jose das Missoes	RS
1884	Sao Leopoldo	RS
1900	Sao Sepe	RS
1902	Sao Valentim	RS
1905	Sapucaia do Sul	RS
1906	Sarandi	RS
1908	Segredo	RS
1911	Serra dos Gregorios	RS
1913	Sertaozinho	RS
1921	Taquarichim	RS
1922	Taquarucu do Sul	RS
1930	Tiradentes do Sul	RS
1933	Toropi	RS
1934	Torrinhas	RS
1939	Tupandi	RS
1943	Vacaria	RS
1955	Veranopolis	RS
1990	Santana da Boa Vista	RS
1994	Santo Angelo	RS
2024	Sao Jose do Ouro	RS
2032	Sao Martinho	RS
2038	Sao Roque	RS
2042	Sao Simao	RS
2043	Scharlau	RS
2044	Sede Aurora	RS
2046	Selbach	RS
2050	Sentinela do Sul	RS
2071	Tainhas	RS
2073	Tapes	RS
2075	Taquari	RS
2084	Tronqueiras	RS
2087	Tunas	RS
2088	Tupi Silveira	RS
2089	Turvinho	RS
2130	Mato Leitao	RS
2146	Monte Alverne	RS
2150	Mostardas	RS
2157	Nossa Senhora da Conceicao	RS
2160	Nova Araca	RS
2161	Nova Brescia	RS
2168	Novo Barreiro	RS
2182	Palmares do Sul	RS
2192	Passo Burmann	RS
2219	Pontao	RS
2229	Porto Lucena	RS
2231	Pouso Novo	RS
2247	Relvado	RS
2253	Rincao dos Mendes	RS
2254	Rio Azul	RS
2265	Lajeado	RS
2268	Linha Comprida	RS
2286	Mato Grande	RS
2327	Nova Hartz	RS
2335	Novo Horizonte	RS
2339	Novo Tiradentes	RS
2346	Pacheca	RS
2360	Paverama	RS
2401	Redentora	RS
2404	Restinga Seca	RS
2408	Rio Pardinho	RS
2419	Lagoa Bonita	RS
2424	Lajeado Bonito	RS
2477	Mucum	RS
2478	Muliterno	RS
2494	Novo Cabrais	RS
2502	Oralina	RS
2506	Otavio Rocha	RS
2515	Pampeiro	RS
2533	Pedro Paiva	RS
2539	Pinhal	RS
2540	Pinheiro Marcado	RS
2549	Plano Alto	RS
2551	Poligono do Erval	RS
2578	Lindolfo Collor	RS
2588	Manchinha	RS
2595	Mariano Moro	RS
2601	Mato Castelhano	RS
2610	Miraguaia	RS
2621	Morro Azul	RS
2643	Nova Padua	RS
2666	Parai	RS
2672	Passo do Adao	RS
2695	Pirapo	RS
2705	Polo Petroquimico de Triunfo	RS
2720	Lara	RS
2722	Laranjeira	RS
2725	Lavras do Sul	RS
2737	Mampituba	RS
2744	Mariana Pimentel	RS
2772	Morro Redondo	RS
2784	Nova Boa Vista	RS
2785	Nova Candelaria	RS
2789	Nova Ramada	RS
2798	Osvaldo Kroeff	RS
2818	Pedro Osorio	RS
2830	Pinhal Alto	RS
2842	Porto Alegre	RS
2859	Rancho Velho	RS
2880	Lagoa dos 3 Cantos	RS
2890	Leonel Rocha	RS
2898	Macambara	RS
2903	Mangueiras	RS
2914	Maua	RS
2927	Monte Bonito	RS
2931	Morrinhos do Sul	RS
2971	Passo das Pedras	RS
2972	Passo Fundo	RS
2986	Pejucara	RS
2993	Pirai	RS
2994	Piratini	RS
3001	Ponte Preta	RS
3007	Povo Novo	RS
3017	Quiteria	RS
3024	Rincao Del Rei	RS
3025	Rincao do Meio	RS
3040	Lajeado do Bugre	RS
3072	Mata	RS
3131	Palmitinho	RS
3143	Pavao	RS
3171	Poco das Antas	RS
3206	Marques de Souza	RS
3216	Minas do Leao	RS
3219	Monte Alegre	RS
3233	Nova Esperanca do Sul	RS
3237	Nova Palma	RS
3280	Pinheiro Machado	RS
3323	Rio Grande	RS
3333	Lagoa Vermelha	RS
3338	Linha Vitoria	RS
3355	Mariante	RS
3365	Miraguai	RS
3372	Montauri	RS
3376	Mormaco	RS
3424	Pedras Altas	RS
3458	Quevedos	RS
3483	Liberato Salzano	RS
3487	Loreto	RS
3490	Machadinho	RS
3543	Nova Santa Rita	RS
3555	Osorio	RS
3556	Osvaldo Cruz	RS
3578	Passo Raso	RS
3583	Paulo Bento	RS
3594	Picada Cafe	RS
3600	Pinhal Grande	RS
3617	Porto Maua	RS
3670	Maximiliano de Almeida	RS
3683	Montenegro	RS
3688	Morro Reuter	RS
3707	Nova Sardenha	RS
3725	Padre Gonzales	RS
3727	Paim Filho	RS
3764	Pinhal da Serra	RS
3774	Pitanga	RS
3798	Lagoao	RS
3828	Mato Queimado	RS
3839	Monte Belo do Sul	RS
3866	Novo Machado	RS
3878	Palmeira das Missoes	RS
3880	Pantano Grande	RS
3883	Paraiso do Sul	RS
3890	Passo Novo	RS
3897	Pedro Garcia	RS
3944	Rio Branco	RS
3966	Magisterio	RS
3972	Marcorama	RS
3977	Matarazzo	RS
3987	Mirim	RS
3997	Morrinhos	RS
3998	Morro Alto	RS
4004	Nazare	RS
4007	Nossa Senhora Aparecida	RS
4012	Nova Prata	RS
4014	Novo Hamburgo	RS
4017	Novo Planalto	RS
4039	Passa 7	RS
4040	Passo do Sobrado	RS
4048	Pelotas	RS
4055	Pinhalzinho	RS
4074	Porto Batista	RS
4084	Putinga	RS
4088	Quintao	RS
4102	Rincao do Cristovao Pereira	RS
4112	Rio Telha	RS
4124	Lajeado Grande	RS
4155	Marau	RS
4167	Medianeira	RS
4180	Monte Alegre dos Campos	RS
4190	Nao Me Toque	RS
4193	Nicolau Vergueiro	RS
4232	Passo da Areia	RS
4287	Linha Nova	RS
4302	Mariapolis	RS
4339	Nonoai	RS
4348	Nova Roma do Sul	RS
4357	Oliva	RS
4361	Padilha	RS
4375	Pareci Novo	RS
4390	Pedreiras	RS
4401	Pinheirinho do Vale	RS
4403	Pinto Bandeira	RS
4408	Planalto	RS
4416	Portao	RS
4426	Lajeado Cerne	RS
4431	Lava Pes	RS
4442	Manoel Viana	RS
4443	Maquine	RS
4445	Marata	RS
4446	Marcelino Ramos	RS
4473	Morungava	RS
4475	Muitos Capoes	RS
4484	Nova Alvorada	RS
4487	Nova Bassano	RS
4491	Nova Milano	RS
4494	Nova Petropolis	RS
4506	Palmas	RS
4508	Panambi	RS
4515	Parobe	RS
4518	Passinhos	RS
4519	Passo da Caveira	RS
4522	Passo do Sabao	RS
4557	Pranchada	RS
4563	Pulador	RS
4564	Quarai	RS
4572	Rincao dos Kroeff	RS
4580	Colinas	RS
4582	Colonia Sao Joao	RS
4603	Daltro Filho	RS
4622	Entrepelado	RS
4629	Farrapos	RS
4650	Gramado dos Loureiros	RS
4659	Guapore	RS
4689	Irui	RS
4712	Jaguari	RS
4717	Jazidas Ou Capela Sao Vicente	RS
4725	Jua	RS
4734	Colonia Municipal	RS
4746	Costao	RS
4753	Delfina	RS
4755	Derrubadas	RS
4764	Dom Pedrito	RS
4765	Dom Pedro de Alcantara	RS
4770	Doutor Mauricio Cardoso	RS
4774	Encantado	RS
4778	Ernestina	RS
4782	Estacao	RS
4787	Faxinal do Soturno	RS
4818	Herval	RS
4849	Itacurubi	RS
4861	Ivoti	RS
4872	Joao Arregui	RS
4882	Coimbra	RS
4888	Coloninha	RS
4897	Coronel Teixeira	RS
4906	Cruzeiro	RS
4910	Curral Alto	RS
4919	Dom Diogo	RS
4924	Eletra	RS
4930	Estancia Grande	RS
4943	Flores da Cunha	RS
4948	Fortaleza dos Valos	RS
4964	Guaiba	RS
4975	Herveiras	RS
4987	Imigrante	RS
5016	Itapuca	RS
5057	Condor	RS
5062	Coronel Barros	RS
5068	Coxilha Grande	RS
5070	Cristal do Sul	RS
5094	Fagundes Varela	RS
5110	Gloria	RS
5111	Goio En	RS
5114	Gravatai	RS
5123	Guassupi	RS
5144	Itai	RS
5151	Itatiba do Sul	RS
5186	Vicente Dutra	RS
5189	Vila Flores	RS
5190	Vila Laranjeira	RS
5191	Vila Rica	RS
5199	Xadrez	RS
5201	Clemente Argolo	RS
5235	Dona Francisca	RS
5243	Ernesto Alves	RS
5247	Evangelista	RS
5261	Gramado	RS
5263	Guabiju	RS
5318	Jacutinga	RS
5338	Vera Cruz	RS
5341	Vertentes	RS
5348	Vista Alegre do Prata	RS
5350	Volta Fechada	RS
5351	Cidreira	RS
5352	Clara	RS
5360	Colorado	RS
5364	Coqueiro Baixo	RS
5367	Coronel Bicaco	RS
5369	Coronel Pilar	RS
5391	Dourado	RS
5397	Erveiras	RS
5401	Espigao Alto	RS
5402	Espumoso	RS
5403	Esquina Gaucha	RS
5407	Eugenio de Castro	RS
5409	Fao	RS
5410	Faxinal	RS
5422	Frederico Westphalen	RS
5424	Frei Sebastiao	RS
5425	Freire	RS
5432	Girua	RS
5443	Humaita	RS
5444	Ibiaca	RS
5449	Igrejinha	RS
5453	Ipiranga do Sul	RS
5476	Jacuizinho	RS
5499	Vespasiano Correa	RS
5500	Viadutos	RS
5503	Vila Bender	RS
5508	Vitoria	RS
5520	Colonia das Almas	RS
5545	Doutor Edgardo Pereira Velho	RS
5554	Erval Grande	RS
5555	Espinilho Grande	RS
5557	Estreito	RS
5559	Faria Lemos	RS
5563	Faxinalzinho	RS
5577	Gentil	RS
5596	Hulha Negra	RS
5618	Ipuacu	RS
5626	Itao	RS
5634	Jaboticaba	RS
5642	Jansen	RS
5657	Vale Real	RS
5689	Constantina	RS
5697	Coxilha	RS
5698	Cr 1	RS
5701	Crissiumal	RS
5705	Cruz Alta	RS
5730	Dona Otilia	RS
5734	Doutor Ricardo	RS
5739	Erebango	RS
5744	Esquina Ipiranga	RS
5788	Ijui	RS
5792	Ilopolis	RS
5803	Itaara	RS
5816	Itaqui	RS
5825	Jari	RS
5845	Consolata	RS
5848	Cordilheira	RS
5852	Cotipora	RS
5878	Entre Ijuis	RS
5881	Esperanca do Sul	RS
5907	Gaurama	RS
5910	Getulio Vargas	RS
5928	Horizontina	RS
5962	Ituim	RS
5976	Joca Tavares	RS
5981	Chuvisca	RS
6000	Cruz Altense	RS
6008	Dario Lassance	RS
6010	David Canabarro	RS
6016	Divino	RS
6026	Esquina Bom Sucesso	RS
6027	Esquina Piratini	RS
6028	Estancia Velha	RS
6034	Farinhas	RS
6041	Forquetinha	RS
6050	Glorinha	RS
6071	Ibare	RS
6075	Ibiraiaras	RS
6088	Ipiranga	RS
6106	Ivora	RS
6141	Coroados	RS
6143	Costa da Cadeia	RS
6155	Eldorado do Sul	RS
6157	Encruzilhada do Sul	RS
6163	Espirito Santo	RS
6174	Forninho	RS
6195	Guajuviras	RS
6219	Ijucapirama	RS
6243	Ivai	RS
6254	Joia	RS
6274	Refugiado	RS
6279	Rincao de Sao Pedro	RS
6280	Rincao Vermelho	RS
6289	Cinquentenario	RS
6290	Ciriaco	RS
6295	Colonia Medeiros	RS
6305	Cristal	RS
6315	Deposito	RS
6323	Encruzilhada	RS
6330	Estrela Velha	RS
6333	Fazenda Fialho	RS
6334	Fazenda Souza	RS
6337	Feliz	RS
6344	Floresta	RS
6362	Guarani das Missoes	RS
6373	Ibiruba	RS
6405	Itauba	RS
6416	Jaguarao	RS
6417	Jaguarete	RS
6434	Protasio Alves	RS
6452	Rincao do Segredo	RS
6457	Rio dos Indios	RS
6471	Coqueiros do Sul	RS
6477	Cortado	RS
6492	Dilermando de Aguiar	RS
6494	Dom Feliciano	RS
6505	Erechim	RS
6507	Erval Seco	RS
6511	Esquina Araujo	RS
6512	Estrela	RS
6523	Floriano Peixoto	RS
6524	Florida	RS
6525	Formigueiro	RS
6546	Hidraulica	RS
6557	Ilha dos Marinheiros	RS
6563	Ipe	RS
6565	Irai	RS
6608	Quinta	RS
6627	Colonia Z 3	RS
6629	Comandai	RS
6649	Criuva	RS
6650	Cruzeiro do Sul	RS
6671	Espigao	RS
6673	Esteio	RS
6674	Esteira	RS
6676	Farroupilha	RS
6698	Garibaldi	RS
6700	General Camara	RS
6708	Gramado Sao Pedro	RS
6709	Gramado Xavier	RS
6734	Ibirapuita	RS
6746	Inhacora	RS
6760	Itacolomi	RS
6786	Jaquirana	RS
6795	Jose Otavio	RS
6800	Julio de Castilhos	RS
6806	Colonia Nova	RS
6827	Curumim	RS
6830	Deodoro	RS
6837	Doutor Bozano	RS
6841	Esmeralda	RS
6848	Fazenda Vilanova	RS
6852	Ferreira	RS
6858	Formosa	RS
6863	Garibaldina	RS
6876	Harmonia	RS
6881	Ibarama	RS
6892	Imbe	RS
6918	Itapua	RS
6921	Itati	RS
6936	Joao Rodrigues	RS
6948	Povoado Tozzo	RS
6969	Chui	RS
6981	Coronel Finzito	RS
7012	Engenho Velho	RS
7014	Entre Rios do Sul	RS
7027	Fontoura Xavier	RS
7033	Garruchos	RS
7072	Independencia	RS
7082	Itaimbezinho	RS
7118	16 de Novembro	RS
7120	3 Palmeiras	RS
7130	Ajuricaba	RS
7166	Balneario Pinhal	RS
7171	Barracao	RS
7185	Boa Vista do Burica	RS
7194	Braga	RS
7213	Camaqua	RS
7217	Campestre Baixo	RS
7218	Campina Redonda	RS
7225	Candelaria	RS
7227	Candiota	RS
7233	Capinzal	RS
7247	Chapada	RS
7250	Porto Vera Cruz	RS
7258	Progresso	RS
7268	Rincao Doce	RS
7348	Benjamin Constant do Sul	RS
7353	Boa Vista do Sul	RS
7355	Boi Preto	RS
7363	Boqueirao do Leao	RS
7394	Capivari do Sul	RS
7408	Cedro Marcado	RS
7409	Cerro Alto	RS
7416	Pratos	RS
7418	Presidente Lucena	RS
7423	Quaraim	RS
7426	Quilombo	RS
7455	Almirante Tamandare	RS
7460	Alto da Uniao	RS
7494	Avelino Paranhos	RS
7498	Banhado do Colegio	RS
7511	Barreiro	RS
7561	Capitao	RS
7571	Caseiros	RS
7577	Cavajureta	RS
7581	Cerro Branco	RS
7584	Porto Xavier	RS
7604	Rio da Ilha	RS
7607	15 de Novembro	RS
7608	3 Arroios	RS
7630	Alto Paredao	RS
7663	Arroio do Padre	RS
7666	Aurea	RS
7671	Barao	RS
7676	Barra do Rio Azul	RS
7694	Boa Vista do Cadeado	RS
7698	Bom Progresso	RS
7706	Brochier	RS
7727	Campo Seco	RS
7730	Capao Comprido	RS
7731	Capela Velha	RS
7744	Casca	RS
7749	Caxias do Sul	RS
7752	Centro Linha Brasil	RS
7754	3 Coroas	RS
7765	Alecrim	RS
7795	Arambare	RS
7798	Aratiba	RS
7830	Bexiga	RS
7857	Buriti	RS
7861	Butia	RS
7895	Capo Ere	RS
7896	Capoeira Grande	RS
7912	Cerrito do Ouro Ou Vila do Cerrito	RS
7915	Charrua	RS
7917	2 Irmaos	RS
7927	Alegrete	RS
7928	Alfredo Brenner	RS
7933	Alto Alegre	RS
7943	Anta Gorda	RS
7953	Ararica	RS
7955	Arco Verde	RS
7977	Barao do Triunfo	RS
7998	Bom Retiro do Sul	RS
8034	Campo Novo	RS
8067	Cerro Grande	RS
8072	3 Cachoeiras	RS
8074	3 de Maio	RS
8075	3 Forquilhas	RS
8083	Agua Santa	RS
8089	Alegria	RS
8105	Antonio Kerpel	RS
8121	Arroio Canoas	RS
8122	Arvorezinha	RS
8134	Barra do Ouro	RS
8136	Barra do Ribeiro	RS
8142	Barro Vermelho	RS
8177	Caibate	RS
8180	Camargo	RS
8182	Cambara do Sul	RS
8187	Campinas do Sul	RS
8194	Canela	RS
8198	Canudos	RS
8210	Cerrito Alegre	RS
8216	7 Lagoas	RS
8231	Alto Feliz	RS
8232	Alvorada	RS
8266	Barra do Quarai	RS
8268	Barros Cassal	RS
8311	Campinas	RS
8320	Canoas	RS
8323	Capao Bonito	RS
8324	Capao da Porteira	RS
8325	Capao do Cipo	RS
8343	Cerrito	RS
8345	Uruguaiana	RS
8346	Vale Verde	RS
8356	Vila Turvo	RS
8364	3 Vendas	RS
8375	Agudo	RS
8383	Andre da Rocha	RS
8392	Arroio dos Ratos	RS
8408	Barro Preto	RS
8420	Bom Jesus	RS
8424	Bom Retiro do Guaiba	RS
8431	Bossoroca	RS
8440	Cacequi	RS
8442	Cachoeira do Sul	RS
8445	Cacique Doble	RS
8459	Candido Godoi	RS
8461	Capane	RS
8477	Cerro do Martins	RS
8478	Cerro do Roque	RS
8482	Chicoloma	RS
8485	Rio Tigre	RS
8488	Valdastico	RS
8489	Vale do Rio Cai	RS
8491	Vanini	RS
8495	Venancio Aires	RS
8503	Vila Langaro	RS
8507	Volta Grande	RS
8508	Xangri La	RS
8512	2 Lajeados	RS
8527	Alto Uruguai	RS
8554	Arroio do Meio	RS
8555	Arroio do Tigre	RS
8556	Arroio Grande	RS
8569	Barao de Cotegipe	RS
8581	Basilio	RS
8597	Bom Jardim	RS
8599	Bom Principio	RS
8613	Butias	RS
8618	Cachoeirinha	RS
8625	Campestre da Serra	RS
8629	Campo Vicente	RS
8649	Carlos Barbosa	RS
8650	Cascata	RS
8657	Catuipe	RS
8688	Alpestre	RS
8713	Arco Iris	RS
8716	Arroio do So	RS
8726	Baliza	RS
8735	Barreirinho	RS
8745	Beluno	RS
8754	Bom Retiro	RS
8775	Campos Borges	RS
8801	Cazuza Ferreira	RS
8812	3 Passos	RS
8828	Alto Recreio	RS
8834	Ametista do Sul	RS
8839	Antonio Prado	RS
8852	Atafona	RS
8853	Atiacu	RS
8880	Bojuru	RS
8901	Cadorna	RS
8911	Campina das Missoes	RS
8916	Campo do Meio	RS
8923	Capao da Canoa	RS
8924	Capao do Cedro	RS
8927	Caraa	RS
8930	Carazinho	RS
8945	Rio Pardo	RS
8964	Vitoria das Missoes	RS
8967	2 Irmaos das Missoes	RS
8972	4 Irmaos	RS
8973	7 de Setembro	RS
8976	Acegua	RS
9022	Augusto Pestana	RS
9026	Azevedo Sodre	RS
9027	Bacupari	RS
9043	Bela Vista	RS
9049	Boca do Monte	RS
9055	Borore	RS
9056	Botucarai	RS
9077	Campo Branco	RS
9090	Caraja Seival	RS
9106	Chimarrao	RS
9116	Afonso Rodrigues	RS
9129	Amaral Ferrador	RS
9145	Arvore So	RS
9149	Bage	RS
9159	Barra do Guarita	RS
9161	Barra Funda	RS
9172	Bento Goncalves	RS
9176	Boa Vista das Missoes	RS
9177	Boa Vista do Incra	RS
9225	Carlos Gomes	RS
9236	Centenario	RS
9238	Cerro Grande do Sul	RS
9242	Chiapetta	RS
9265	Volta Alegre	RS
9284	Aguas Claras	RS
9289	Albardao	RS
9346	Boa Vista	RS
9352	Bonito	RS
9353	Boqueirao	RS
9374	Caicara	RS
9391	Capela de Santana	RS
9408	Cavera	RS
9427	Vila Nova do Sul	RS
9435	3 Barras	RS
9479	Arroio do Sal	RS
9505	Boa Esperanca	RS
9518	Cacapava do Sul	RS
9533	Campo Bom	RS
9536	Campo Santo	RS
9541	Candido Freire	RS
9543	Cangucu	RS
9544	Canhembora	RS
9545	Capao do Leao	RS
9550	Capivarita	RS
9556	Carovi	RS
9557	Castelinho	RS
9564	Cerro Claro	RS
9565	Cerro Largo	RS
9567	Charqueadas	RS
10	Sai	SC
39	Santiago do Sul	SC
48	Sao Carlos	SC
59	Sao Joao Batista	SC
81	Sao Miguel D'oeste	SC
94	Sede Oldemburg	SC
172	Santa Izabel	SC
199	Sao Bento Baixo	SC
203	Sao Domingos	SC
215	Sao Joao do Itaperiu	SC
273	Timbo Grande	SC
291	Urubici	SC
338	Sao Jose do Cedro	SC
359	Schroeder	SC
366	Sideropolis	SC
374	Sul Brasil	SC
431	Santa Helena	SC
513	Tangara	SC
592	Sao Joaquim	SC
605	Sao Pedro de Alcantara	SC
639	Taquara Verde	SC
667	Riqueza	SC
739	Sao Pedro Tobias	SC
801	Santa Lucia	SC
804	Santo Amaro da Imperatriz	SC
814	Sao Bonifacio	SC
817	Sao Cristovao	SC
835	Sao Jose do Laranjal	SC
891	Timbe do Sul	SC
906	Urussanga	SC
909	Vargem Bonita	SC
923	Xaxim	SC
927	Rodeio	SC
949	Santa Rosa de Lima	SC
983	Sao Joao do Sul	SC
1031	Taio	SC
1041	Tijucas	SC
1060	Sangao	SC
1100	Sao Jose do Cerrito	SC
1105	Sao Miguel da Serra	SC
1110	Sao Roque	SC
1111	Sao Sebastiao do Arvoredo	SC
1116	Saudades	SC
1157	Treviso	SC
1167	Vargem	SC
1196	Santa Cruz do Timbo	SC
1200	Santa Maria	SC
1207	Santa Terezinha do Progresso	SC
1225	Sao Francisco do Sul	SC
1226	Sao Gabriel	SC
1232	Sao Joao do Oeste	SC
1238	Sao Jose	SC
1252	Sao Miguel da Boa Vista	SC
1267	Sapiranga	SC
1283	Sorocaba do Sul	SC
1298	Tigrinhos	SC
1299	Timbo	SC
1311	Uniao do Oeste	SC
1319	Salete	SC
1322	Saltinho	SC
1333	Santa Rosa do Sul	SC
1338	Santa Terezinha do Salto	SC
1373	Sao Leonardo	SC
1375	Sao Martinho	SC
1419	Taquaras	SC
1452	Romelandia	SC
1477	Santa Terezinha	SC
1586	Sanga da Toca	SC
1600	Sao Bento do Sul	SC
1601	Sao Cristovao do Sul	SC
1631	Seara	SC
1636	Serra Alta	SC
1660	Tigipio	SC
1671	Tupitinga	SC
1690	Vidal Ramos	SC
1696	Vitor Meireles	SC
1700	Xavantina	SC
1708	Salto Veloso	SC
1711	Santa Cecilia	SC
1761	Sao Sebastiao do Sul	SC
1781	Sombrio	SC
1858	Sao Bernardino	SC
1885	Sao Lourenco do Oeste	SC
1942	Turvo	SC
1957	Vila Nova	SC
2030	Sao Ludgero	SC
2057	Sertao do Maruim	SC
2083	Trombudo Central	SC
2085	Tubarao	SC
2086	Tunapolis	SC
2144	Monte Alegre	SC
2163	Nova Guarita	SC
2235	Presidente Kennedy	SC
2252	Ribeirao Pequeno	SC
2263	Laguna	SC
2366	Pescaria Brava	SC
2377	Pinheiros	SC
2384	Porto Belo	SC
2386	Porto Uniao	SC
2392	Presidente Castelo Branco	SC
2399	Rancho Queimado	SC
2417	Lacerdopolis	SC
2429	Leao	SC
2447	Maracaja	SC
2451	Marechal Bormann	SC
2470	Monte Castelo	SC
2536	Peritiba	SC
2557	Jupia	SC
2564	Lagoa da Estiva	SC
2577	Lindoia do Sul	SC
2582	Luzerna	SC
2593	Marema	SC
2682	Petrolandia	SC
2702	Planalto Alegre	SC
2734	Major Vieira	SC
2742	Marata	SC
2746	Mariflor	SC
2801	Palmeira	SC
2841	Ponte Alta	SC
2857	Quilometro 12	SC
2897	Luiz Alves	SC
2907	Marcilio Dias	SC
2924	Mondai	SC
2933	Morro Grande	SC
2948	Novo Horizonte	SC
2953	Orleans	SC
2979	Paula Pereira	SC
3029	Rio da Anta	SC
3050	Lontras	SC
3052	Lourdes	SC
3081	Monte Carlo	SC
3108	Nova Petropolis	SC
3164	Piratuba	SC
3205	Marombas Bossardi	SC
3240	Nova Veneza	SC
3249	Otacilio Costa	SC
3256	Palma Sola	SC
3279	Pinheiral	SC
3296	Pouso Redondo	SC
3298	Prata	SC
3318	Rio Antinha	SC
3329	Lages	SC
3345	Machados	SC
3368	Mirim Doce	SC
3395	Nova Teutonia	SC
3413	Palmitos	SC
3428	Picarras	SC
3444	Pomerode	SC
3468	Rio Negrinho	SC
3491	Macieira	SC
3492	Mafra	SC
3506	Massaranduba	SC
3518	Modelo	SC
3560	Ouro Verde	SC
3565	Palhoca	SC
3571	Papanduva	SC
3579	Passos Maia	SC
3585	Pedras Grandes	SC
3590	Perico	SC
3634	Lebon Regis	SC
3647	Major Gercino	SC
3658	Marombas	SC
3668	Matos Costa	SC
3676	Mirim	SC
3685	Morro Chato	SC
3686	Morro da Fumaca	SC
3723	Ouro	SC
3776	Poco Preto	SC
3801	Lajeado Grande	SC
3803	Laurentino	SC
3821	Marari	SC
3822	Maravilha	SC
3859	Nova Itaberaba	SC
3865	Nova Trento	SC
3889	Passo Manso	SC
3898	Penha	SC
3907	Pinhalzinho	SC
3945	Rio das Antas	SC
3957	Leoberto Leal	SC
4031	Paraiso	SC
4041	Paulo Lopes	SC
4053	Pindotiba	SC
4080	Presidente Getulio	SC
4107	Rio do Oeste	SC
4111	Rio Rufino	SC
4197	Nossa Senhora de Caravaggio	SC
4203	Nova Cultura	SC
4217	Paial	SC
4247	Pinheiro Preto	SC
4262	Ponte Alta do Norte	SC
4280	Lauro Muller	SC
4286	Linha das Palmeiras	SC
4315	Mirador	SC
4341	Nova Erechim	SC
4364	Painel	SC
4457	Meleiro	SC
4481	Navegantes	SC
4521	Passo de Torres	SC
4542	Planalto	SC
4547	Ponte Serrada	SC
4573	Rio Bonito	SC
4587	Concordia	SC
4621	Engenho Velho	SC
4651	Gravatal	SC
4665	Herciliopolis	SC
4681	Imbuia	SC
4687	Ipora do Oeste	SC
4688	Ipuacu	SC
4719	Joacaba	SC
4735	Colonia Santana	SC
4783	Estacao Cocal	SC
4809	Grao Para	SC
4813	Guaraciaba	SC
4845	Iraputa	SC
4850	Itaio	SC
4852	Itajai	SC
4875	Jose Boiteux	SC
4881	Cocal do Sul	SC
4920	Dona Emma	SC
4936	Faxinal dos Guedes	SC
4940	Felipe Schmidt	SC
4962	Grapia	SC
4972	Guaruja do Sul	SC
4976	Ibicare	SC
4988	Indaial	SC
4992	Indios	SC
4996	Ipira	SC
4997	Ipomeia	SC
4999	Ipumirim	SC
5001	Ita	SC
5011	Itapema	SC
5051	Colonia Santa Tereza	SC
5136	Invernada	SC
5200	Zortea	SC
5242	Enseada de Brito	SC
5295	Iraceminha	SC
5297	Irati	SC
5311	Itapiranga	SC
5343	Videira	SC
5486	Joinville	SC
5488	Uruguai	SC
5512	Witmarsum	SC
5516	Claraiba	SC
5536	Dalbergia	SC
5541	Descanso	SC
5572	Formosa do Sul	SC
5581	Governador Celso Ramos	SC
5609	Imbituba	SC
5616	Iomere	SC
5632	Ituporanga	SC
5662	Vargem do Cedro	SC
5671	Vila de Volta Grande	SC
5691	Correia Pinto	SC
5712	Cunha Pora	SC
5755	Florianopolis	SC
5777	Guata	SC
5783	Ibicui	SC
5791	Ilhota	SC
5851	Corupa	SC
5883	Espinilho	SC
5904	Galvao	SC
5949	Itaiopolis	SC
5993	Cordilheira Alta	SC
6014	Dionisio Cerqueira	SC
6042	Fragosos	SC
6051	Goio En	SC
6153	Doutor Pedrinho	SC
6160	Entre Rios	SC
6168	Fazenda Zandavalli	SC
6176	Frei Rogerio	SC
6182	Garcia	SC
6183	Garopaba	SC
6184	Garuva	SC
6193	Guabiruba	SC
6197	Guaramirim	SC
6199	Guatambu	SC
6206	Ibiam	SC
6228	Irineopolis	SC
6239	Itapoa	SC
6259	Praia Grande	SC
6262	Presidente Juscelino	SC
6286	Rio dos Bugres	SC
6356	Gaspar	SC
6368	Herval D'oeste	SC
6379	Imarui	SC
6420	Jardinopolis	SC
6437	Quarta Linha	SC
6455	Rio das Furnas	SC
6473	Coronel Martins	SC
6486	Cunhatai	SC
6487	Curitibanos	SC
6489	Dal Pai	SC
6506	Ermo	SC
6508	Erval Velho	SC
6519	Figueira	SC
6521	Flor do Sertao	SC
6526	Forquilhinha	SC
6529	Frederico Wastner	SC
6571	Itajuba	SC
6593	Jaragua do Sul	SC
6603	Princesa	SC
6615	Residencia Fuck	SC
6623	Rio do Campo	SC
6645	Criciuma	SC
6690	Fraiburgo	SC
6714	Guaporanga	SC
6733	Ibirama	SC
6777	Jabora	SC
6877	Hercilio Luz	SC
6900	Irakitan	SC
6901	Irani	SC
6917	Itapocu	SC
6927	Jaguaruna	SC
6950	Presidente Nereu	SC
6956	Quilombo	SC
6982	Coronel Freitas	SC
7065	Icara	SC
7103	Jacinto Machado	SC
7129	Aiure	SC
7272	Rio dos Cedros	SC
7273	13 de Maio	SC
7285	Agrolandia	SC
7316	Araquari	SC
7364	Braco do Norte	SC
7384	Campo Belo do Sul	SC
7410	Chapadao do Lageado	SC
7411	Chapeco	SC
7439	Rio da Luz	SC
7457	Alto Bela Vista	SC
7496	Balneario Morro dos Conventos	SC
7520	Bela Vista do Sul	SC
7525	Bocaina do Sul	SC
7572	Catanduvas	SC
7613	Agronomica	SC
7615	Agua Doce	SC
7620	Aguas Brancas	SC
7627	Alto da Serra	SC
7641	Anchieta	SC
7644	Anta Gorda	SC
7669	Balneario Arroio do Silva	SC
7679	Barra Velha	SC
7713	Cachoeira de Fatima	SC
7761	Aguas Frias	SC
7762	Aguas Mornas	SC
7767	Alfredo Wagner	SC
7805	Arroio 30	SC
7806	Azambuja	SC
7824	Barro Branco	SC
7853	Braco do Trombudo	SC
7862	Cacador	SC
7888	Canelinha	SC
7898	Caraiba	SC
7907	Catuira	SC
7963	Ascurra	SC
7989	Belmonte	SC
8103	Anitapolis	SC
8109	Arabuta	SC
8146	Bela Vista	SC
8154	Blumenau	SC
8158	Bom Retiro	SC
8183	Cambuinzal	SC
8188	Campo Ere	SC
8217	Abelardo Luz	SC
8230	Alto Alegre	SC
8251	Armazem	SC
8258	Bandeirante	SC
8275	Bom Jesus	SC
8278	Bombinhas	SC
8340	Caxambu do Sul	SC
8376	Aguti	SC
8389	Ararangua	SC
8395	Aurora	SC
8403	Barra Bonita	SC
8405	Barra Grande	SC
8463	Capivari de Baixo	SC
8492	Vargeao	SC
8509	13 Tilias	SC
8536	Anita Garibaldi	SC
8537	Antonio Carlos	SC
8574	Barra da Prata	SC
8604	Botuvera	SC
8608	Brunopolis	SC
8623	Camboriu	SC
8639	Capao Alto	SC
8671	Abdon Batista	SC
8679	Aguas de Chapeco	SC
8718	Arvoredo	SC
8720	Atalanta	SC
8727	Balneario Barra do Sul	SC
8759	Brusque	SC
8806	Rio Fortuna	SC
8860	Barra Clara	SC
8921	Canoinhas	SC
8944	Rio do Sul	SC
8949	Urupema	SC
8970	3 Barras	SC
9040	Bateias de Baixo	SC
9051	Bom Jardim da Serra	SC
9053	Bom Sucesso	SC
9079	Campos Novos	SC
9098	Cedro Alto	SC
9103	Cerro Negro	SC
9169	Bela Vista do Toldo	SC
9173	Biguacu	SC
9183	Boiteuxburgo	SC
9253	Vila Milani	SC
9285	Aguas Claras	SC
9297	Angelina	SC
9301	Apiuna	SC
9310	Arnopolis	SC
9317	Baia Alta	SC
9320	Balneario Gaivota	SC
9330	Barra Fria	SC
9348	Bom Jesus do Oeste	SC
9377	Calmon	SC
9387	Canoas	SC
9392	Capinzal	SC
9422	Vila Conceicao	SC
9433	Xanxere	SC
9481	Aterrado Torto	SC
9487	Balneario Camboriu	SC
9501	Benedito Novo	SC
9522	Caibi	SC
9532	Campo Alegre	SC
9562	Celso Ramos	SC
9569	Rio D'una	SC
9575	Rio Preto do Sul	SC
3	Jundiai do Sul	PR
21	Santa Eliza	PR
25	Santa Lucia	PR
58	Sao Joao	PR
67	Sao Jorge D'oeste	PR
78	Sao Miguel do Iguacu	PR
82	Sao Pedro do Florido	PR
83	Sao Pedro do Ivai	PR
84	Sao Pedro do Parana	PR
95	Selva	PR
98	Senhor Bom Jesus dos Gramados	PR
103	Socorro	PR
104	Sumare	PR
116	Teixeira Soares	PR
121	Timbu Velho	PR
127	Tranqueira	PR
128	Trindade	PR
142	Uniao da Vitoria	PR
149	Rosario do Ivai	PR
155	Sabaudia	PR
167	Santa Fe	PR
171	Santa Ines	PR
175	Santa Maria do Oeste	PR
194	Santo Antonio do Paraiso	PR
204	Sao Francisco	PR
206	Sao Francisco de Imbau	PR
207	Sao Francisco de Sales	PR
211	Sao Jeronimo da Serra	PR
216	Sao Joao do Ivai	PR
256	Sulina	PR
323	Sao Clemente	PR
346	Sao Luiz do Puruna	PR
416	Rondon	PR
420	Sagrada Familia	PR
423	Samambaia	PR
428	Santa Cecilia do Pavao	PR
430	Santa Esmeralda	PR
468	Sao Joao do Caiua	PR
470	Sao Joao do Pinhal	PR
481	Sao Pio X	PR
483	Sao Sebastiao	PR
494	Sede Nova Sant'ana	PR
500	Serranopolis do Iguacu	PR
518	Taquaruna	PR
524	Terra Rica	PR
529	Triangulo	PR
542	Roca Velha	PR
561	Santa Luzia da Alvorada	PR
566	Santa Monica	PR
567	Santa Quiteria	PR
599	Sao Jose do Iguacu	PR
602	Sao Martinho	PR
607	Sao Salvador	PR
615	Sapopema	PR
621	Senges	PR
631	Sussui	PR
636	Tambarutaca	PR
641	Taquari dos Russos	PR
643	Telemaco Borba	PR
645	Teolandia	PR
646	Tereza Breda	PR
655	Tupinamba	PR
672	Rolandia	PR
676	Salgado Filho	PR
689	Santa Maria	PR
705	Sao Bento	PR
707	Sao Cirilo	PR
708	Sao Cristovao	PR
713	Sao Gabriel	PR
722	Sao Joao do Triunfo	PR
723	Sao Joao D'oeste	PR
729	Sao Jose dos Pinhais	PR
747	Sao Valentim	PR
768	Tamarana	PR
784	Tupassi	PR
785	Ubauna	PR
787	Umuarama	PR
788	Uniflor	PR
789	Rio Verde	PR
792	Salles de Oliveira	PR
795	Salto Portao	PR
840	Sao Manoel do Parana	PR
843	Sao Paulo	PR
845	Sao Pedro do Iguacu	PR
846	Sao Pedro Lopei	PR
849	Sao Roque do Pinhal	PR
854	Sape	PR
865	Sertaozinho	PR
884	Taquara	PR
908	Valentins	PR
926	Roberto Silveira	PR
935	Santa Cruz de Monte Castelo	PR
938	Santa Fe do Pirapo	PR
943	Santa Maria do Rio do Peixe	PR
946	Santa Rita	PR
953	Santana	PR
962	Santo Antonio do Iratim	PR
969	Sao Braz	PR
971	Sao Carlos do Ivai	PR
978	Sao Gotardo	PR
992	Sao Luiz	PR
1005	Saudade do Iguacu	PR
1040	Tereza Cristina	PR
1043	Tomaz Coelho	PR
1057	Saltinho do Oeste	PR
1058	Salto do Itarare	PR
1061	Santa Amelia	PR
1083	Santo Antonio	PR
1086	Santo Inacio	PR
1097	Sao Jose da Boa Vista	PR
1113	Sao Silvestre	PR
1143	Tamboara	PR
1145	Tanque Grande	PR
1154	Toledo	PR
1178	Vila Guay	PR
1182	Virmond	PR
1184	Vitorino	PR
1218	Santo Rei	PR
1237	Sao Jose	PR
1254	Sao Pedro	PR
1276	Serra dos Dourados	PR
1278	Sertanopolis	PR
1295	Terra Nova	PR
1296	Terra Roxa	PR
1301	Tindiquera	PR
1309	Ubaldino Taques	PR
1315	Roncador	PR
1337	Santa Terezinha de Itaipu	PR
1339	Santa Zelia	PR
1368	Sao Jose das Palmeiras	PR
1386	Sao Vicente	PR
1390	Sarandi	PR
1398	Sertaneja	PR
1399	Siqueira Belo	PR
1438	Tuneiras do Oeste	PR
1444	Ubirata	PR
1445	Uniao	PR
1470	Santa Lurdes	PR
1471	Santa Margarida	PR
1474	Santa Rita do Oeste	PR
1488	Sao Camilo	PR
1500	Sao Lourenco	PR
1504	Sao Marcos	PR
1507	Sao Mateus do Sul	PR
1539	Taquari dos Polacos	PR
1544	Terra Boa	PR
1545	Tibagi	PR
1555	Tronco	PR
1559	Uniao do Oeste	PR
1581	Rondinha	PR
1591	Santa Isabel do Ivai	PR
1593	Santa Mariana	PR
1595	Santana do Itarare	PR
1612	Sao Joaquim	PR
1613	Sao Jorge do Ivai	PR
1614	Sao Jorge do Patrocinio	PR
1619	Sao Jose do Ivai	PR
1633	Sede Alvorada	PR
1634	Sede Chaparral	PR
1637	Serra Negra	PR
1650	Tapejara	PR
1665	Tomazina	PR
1667	Triolandia	PR
1669	Tunas do Parana	PR
1682	Vargeado	PR
1687	Ventania	PR
1688	Vere	PR
1698	Xambre	PR
1703	Romeopolis	PR
1722	Santa Tereza do Oeste	PR
1745	Sao Jose do Itavo	PR
1746	Sao Judas Tadeu	PR
1747	Sao Leonardo	PR
1774	Silvolandia	PR
1779	Socavao	PR
1784	Sutis	PR
1786	Taipa	PR
1788	Tapira	PR
1799	Turvo	PR
1813	Vila Gandhi	PR
1815	Vila Paraiso	PR
1816	Vila Rica do Ivai	PR
1818	Vila Silva Jardim	PR
1819	Vila Velha	PR
1824	Vitoria	PR
1832	Salto do Lontra	PR
1841	Santa Helena	PR
1843	Santa Izabel do Oeste	PR
1847	Santa Rosa	PR
1854	Santo Antonio da Platina	PR
1891	Sao Miguel do Cambui	PR
1896	Sao Roque	PR
1901	Sao Tome	PR
1929	Tijuco Preto	PR
1953	Vera Guarani	PR
1961	Vista Alegre	PR
1978	Santa Clara	PR
1997	Santo Antonio do Caiua	PR
1999	Santo Antonio do Palmital	PR
2000	Santo Antonio do Sudoeste	PR
2004	Sao Domingos	PR
2011	Sao Joao da Boa Vista	PR
2018	Sao Joaquim do Pontal	PR
2034	Sao Miguel	PR
2039	Sao Sebastiao da Amoreira	PR
2045	Sede Progresso	PR
2055	Serraria Klas	PR
2056	Serrinha	PR
2062	Siqueira Campos	PR
2074	Tapui	PR
2079	Tijucas do Sul	PR
2080	Tiradentes	PR
2094	Urai	PR
2120	Marajo	PR
2121	Marcelino	PR
2123	Maria Luiza	PR
2125	Marmelandia	PR
2139	Miranda	PR
2152	Munhoz de Melo	PR
2167	Nova Videira	PR
2184	Palmitopolis	PR
2193	Pato Bragado	PR
2206	Pinhalzinho	PR
2217	Ponta Grossa	PR
2226	Porto Camargo	PR
2244	Rancho Alegre D'oeste	PR
2255	Rio Claro do Sul	PR
2256	Rio das Pedras	PR
2257	Juvinopolis	PR
2260	Lagoinha	PR
2276	Mandaguacu	PR
2282	Mariental	PR
2283	Marilena	PR
2288	Maua da Serra	PR
2289	Mercedes	PR
2294	Mirante do Piquiri	PR
2302	Monte Real	PR
2305	Morro Alto	PR
2320	Nova Amoreira	PR
2322	Nova Bilac	PR
2329	Nova Lourdes	PR
2331	Nova Tirol	PR
2338	Novo Sobradinho	PR
2348	Paiol Queimado	PR
2362	Pedras	PR
2369	Piassuguera	PR
2376	Pinheiro	PR
2383	Porto Barreiro	PR
2402	Reianopolis	PR
2406	Ribeirao Bonito	PR
2411	Juranda	PR
2415	Kalore	PR
2442	Mandaguari	PR
2452	Marilandia do Sul	PR
2453	Marilu	PR
2491	Nova America da Colina	PR
2507	Ourizona	PR
2520	Paranagi	PR
2527	Pau D'alho do Sul	PR
2545	Piriquitos	PR
2568	Lagoa Dourada	PR
2579	Loanda	PR
2581	Lovat	PR
2597	Mariza	PR
2631	Nossa Senhora da Candelaria	PR
2647	Novo Jardim	PR
2671	Passo da Ilha	PR
2680	Perola Independente	PR
2696	Piraquara	PR
2701	Planaltina do Parana	PR
2710	Porecatu	PR
2712	Porto Belo	PR
2724	Lavra	PR
2728	Luar	PR
2729	Luiziana	PR
2730	Lupionopolis	PR
2736	Malu	PR
2748	Mariopolis	PR
2749	Maristela	PR
2756	Matinhos	PR
2791	Novo Horizonte	PR
2806	Passo Liso	PR
2807	Patos Velhos	PR
2810	Paula Freitas	PR
2812	Paulo Frontin	PR
2840	Pontal do Parana	PR
2866	Reserva do Iguacu	PR
2871	Rio Pinheiro	PR
2875	Km 30	PR
2889	Lavrinha	PR
2893	Lobato	PR
2906	Maravilha	PR
2908	Maripa	PR
2943	Nossa Senhora Aparecida	PR
2944	Nova Esperanca do Sudoeste	PR
2954	Ouro Verde do Piquiri	PR
2960	Palmital	PR
2961	Palotina	PR
2969	Passa Una	PR
2973	Pato Branco	PR
2999	Pocinho	PR
3009	Prata	PR
3012	Primeiro de Maio	PR
3026	Rio Bom	PR
3027	Rio Bonito	PR
3044	Laranjal	PR
3047	Leopolis	PR
3048	Lerroville	PR
3049	Linha Giacomini	PR
3051	Lopei	PR
3055	Lunardelli	PR
3064	Marcionopolis	PR
3065	Margarida	PR
3101	Nordestina	PR
3104	Nova Brasilia	PR
3105	Nova Concordia	PR
3109	Nova Prata do Iguacu	PR
3113	Olho Agudo	PR
3132	Panema	PR
3136	Paranagua	PR
3157	Pinhao	PR
3162	Pirai do Sul	PR
3165	Pitangueiras	PR
3180	Lagoa	PR
3185	Lajeado Bonito	PR
3192	Macaco	PR
3200	Maraba	PR
3207	Martins	PR
3226	Morro Ingles	PR
3231	Nova Alianca do Ivai	PR
3232	Nova Cantu	PR
3234	Nova Fatima	PR
3238	Nova Riqueza	PR
3248	Oroite	PR
3255	Paicandu	PR
3260	Paraiso do Norte	PR
3275	Pinare	PR
3289	Poema	PR
3293	Porto Meira	PR
3294	Porto Sao Jose	PR
3297	Pranchita	PR
3303	Quinzopolis	PR
3311	Retiro	PR
3319	Rio das Antas	PR
3321	Rio das Mortes	PR
3325	Rio Saudade	PR
3328	Jussara	PR
3335	Lambari	PR
3347	Mangueirinha	PR
3352	Maracana	PR
3354	Marechal Candido Rondon	PR
3356	Mariluz	PR
3361	Matelandia	PR
3367	Miraselva	PR
3386	Nilza	PR
3389	Nova Altamira	PR
3393	Nova Esperanca	PR
3408	Paiquere	PR
3411	Palmeirinha	PR
3412	Palmital de Sao Silvestre	PR
3435	Piquirivai	PR
3446	Ponta do Pasto	PR
3449	Porto Rico	PR
3450	Porto Vitoria	PR
3460	Reboucas	PR
3463	Reserva	PR
3469	Rio Negro	PR
3470	Rio Novo	PR
3478	Lagoa dos Ribas	PR
3481	Laranjeiras do Sul	PR
3495	Mandiocaba	PR
3496	Mandirituba	PR
3504	Marrecas	PR
3509	Mato Queimado	PR
3520	Monjolinho	PR
3525	Moreira Sales	PR
3531	Natingui	PR
3537	Nossa Senhora da Aparecida	PR
3544	Nova Tebas	PR
3566	Palmeira	PR
3577	Passo Fundo	PR
3591	Perola do Oeste	PR
3596	Pien	PR
3599	Pinhais	PR
3601	Pinhalao	PR
3603	Piracema	PR
3615	Porto de Cima	PR
3623	Lagoa Bonita	PR
3643	Maira	PR
3645	Maita	PR
3651	Manfrinopolis	PR
3657	Marialva	PR
3659	Marquinho	PR
3671	Meia Lua	PR
3699	Nova Brasilia do Itarare	PR
3730	Palmas	PR
3733	Palmira	PR
3735	Pangare	PR
3737	Paranacity	PR
3760	Perola	PR
3800	Lajeado Grande	PR
3802	Lapa	PR
3826	Marimbondo	PR
3863	Nova Santa Rosa	PR
3870	Olho D'agua	PR
3875	Ourilandia	PR
3885	Paranapoema	PR
3910	Pirapo	PR
3924	Porto San Juan	PR
3925	Porto Sao Carlos	PR
3930	Pulinopolis	PR
3938	Renascenca	PR
3939	Retiro Grande	PR
3941	Ribeirao do Pinheiro	PR
3956	Lajeado	PR
3959	Lidianopolis	PR
3970	Manoel Ribas	PR
3974	Marques de Abrantes	PR
3978	Mato Rico	PR
3981	Mendeslandia	PR
4010	Nova Laranjeiras	PR
4011	Nova Olimpia	PR
4019	Olaria	PR
4026	Ouro Verde do Oeste	PR
4029	Paiol de Baixo	PR
4035	Paranavai	PR
4054	Pinhal do Sao Bento	PR
4063	Pitangui	PR
4072	Portao	PR
4076	Prado Ferreira	PR
4079	Prata 1	PR
4083	Progresso	PR
4108	Rio do Salto	PR
4138	Macucos	PR
4143	Mambore	PR
4160	Marumbi	PR
4166	Medianeira	PR
4177	Missal	PR
4185	Morretes	PR
4198	Nossa Senhora de Lourdes	PR
4199	Nossa Senhora do Carmo	PR
4211	Ortigueira	PR
4238	Pedro Lustosa	PR
4246	Pinhal Preto	PR
4252	Pitanga	PR
4253	Planalto	PR
4264	Porteira Preta	PR
4266	Porto Brasilio	PR
4285	Lindoeste	PR
4292	Mallet	PR
4294	Mandacaia	PR
4301	Maria Helena	PR
4305	Marmeleiro	PR
4346	Nova Londrina	PR
4351	Novo Itacolomi	PR
4352	Novo Sarandi	PR
4363	Padre Ponciano	PR
4370	Papagaios Novos	PR
4374	Parana D'oeste	PR
4392	Pelado	PR
4394	Perobal	PR
4423	Lagoa Seca	PR
4424	Lagoa Verde	PR
4429	Laranja Azeda	PR
4435	Londrina	PR
4452	Maringa	PR
4458	Memoria	PR
4462	Mirador	PR
4483	Nossa Senhora das Gracas	PR
4486	Nova Aurora	PR
4495	Nova Santa Barbara	PR
4497	Novo 3 Passos	PR
4523	Passo dos Pupos	PR
4527	Paulistania	PR
4528	Peabiru	PR
4529	Pedra Branca do Araraquara	PR
4550	Porto Amazonas	PR
4553	Porto Santana	PR
4565	Quebra Freio	PR
4566	Quitandinha	PR
4575	Cidade Gaucha	PR
4604	Diamante D'oeste	PR
4613	Dorizon	PR
4632	Fazenda Rio Grande	PR
4637	Fluviopolis	PR
4645	Geremia Lunardelli	PR
4653	Guaipora	PR
4654	Guairaca	PR
4656	Guajuvira	PR
4662	Guarani	PR
4663	Guaraniacu	PR
4670	Iarama	PR
4679	Ilha dos Valadares	PR
4684	Inspetor Carvalho	PR
4686	Iolopolis	PR
4701	Itinga	PR
4707	Jaborandi	PR
4708	Jaburu	PR
4714	Janiopolis	PR
4732	Coitinho	PR
4733	Colonia Castrolanda	PR
4739	Conchas Velhas	PR
4741	Coronel Domingos Soares	PR
4747	Costeira	PR
4762	Doce Grande	PR
4795	Frei Timoteo	PR
4799	Gamela	PR
4816	Guaratuba	PR
4843	Irapuan	PR
4874	Jordaozinho	PR
4887	Colonia Padre Paulo	PR
4923	Doutor Oliveira Castro	PR
4957	Goioxim	PR
4986	Imbau	PR
5022	Jaboti	PR
5027	Jaguapita	PR
5033	Jardim	PR
5040	Jose Lacerda	PR
5046	Clevelandia	PR
5054	Conciolandia	PR
5061	Conselheiro Zacarias	PR
5063	Coronel Vivida	PR
5076	Curiuva	PR
5080	Despraiado	PR
5086	Douradina	PR
5093	Euzebio de Oliveira	PR
5098	Flor da Serra	PR
5099	Flor da Serra do Sul	PR
5118	Guaporema	PR
5119	Guaraci	PR
5139	Irati	PR
5147	Itapara	PR
5152	Itauna do Sul	PR
5153	Ivai	PR
5154	Ivatuba	PR
5169	Javacae	PR
5175	Juciara	PR
5203	Colonia Esperanca	PR
5204	Colonia Sapucai	PR
5205	Comur	PR
5221	Covo	PR
5222	Coxilha Rica	PR
5232	Diamante do Norte	PR
5251	Florida	PR
5259	Gaucha	PR
5284	Inacio Martins	PR
5302	Itaguaje	PR
5333	Uvaia	PR
5358	Colonia Cristina	PR
5359	Colonia Dom Carlos	PR
5373	Correia de Freitas	PR
5392	Doutor Camargo	PR
5400	Esperanca do Norte	PR
5404	Estacao Roca Nova	PR
5417	Florestopolis	PR
5418	Foz do Iguacu	PR
5419	Foz do Jordao	PR
5450	Iguatemi	PR
5457	Iretama	PR
5472	Ivaipora	PR
5473	Ivate	PR
5483	Jaracatia	PR
5484	Jardim Paulista	PR
5510	Wenceslau Braz	PR
5514	Cintra Pimentel	PR
5521	Colonia General Carneiro	PR
5522	Colonia Tapera	PR
5526	Copacabana do Norte	PR
5531	Corvo	PR
5551	Emboguacu	PR
5556	Espirito Santo	PR
5562	Faxinal do Ceu	PR
5565	Felpudo	PR
5567	Figueira do Oeste	PR
5569	Florai	PR
5571	Floriano	PR
5575	Francisco Frederico Teixeira Guimaraes	PR
5576	Gamadinho	PR
5585	Guamiranga	PR
5586	Guamirim	PR
5588	Guara	PR
5589	Guarapuavinha	PR
5590	Guarauna	PR
5594	Herveira	PR
5597	Ibaiti	PR
5602	Icara	PR
5605	Igrejinha	PR
5607	Iguatu	PR
5612	Inaja	PR
5624	Itaiacoca	PR
5636	Jacutinga	PR
5637	Jaguariaiva	PR
5640	Jandaia do Sul	PR
5660	Valerio	PR
5665	Vassoural	PR
5669	Vidigal	PR
5672	Vila Florida	PR
5675	Warta	PR
5681	Colonia Santos Andrade	PR
5688	Conselheiro Mairinck	PR
5706	Cruz Machado	PR
5707	Cruzeiro do Iguacu	PR
5708	Cruzeiro do Norte	PR
5709	Cruzeiro do Sul	PR
5713	Cunhaporanga	PR
5718	Deputado Jose Afonso	PR
5735	Encruzilhada	PR
5737	Entre Rios do Oeste	PR
5740	Esperanca Nova	PR
5749	Faxinal	PR
5752	Fenix	PR
5758	Formosa do Oeste	PR
5760	Fueros	PR
5764	General Osorio	PR
5767	Goioere	PR
5775	Guaravera	PR
5797	Ipora	PR
5811	Itapanhacanga	PR
5820	Jaboticabal	PR
5843	Congonhas	PR
5844	Congonhinhas	PR
5846	Contenda	PR
5847	Corbelia	PR
5857	Cruzeiro do Oeste	PR
5863	Curucaca	PR
5865	Diamante do Sul	PR
5870	Doutor Antonio Paranhos	PR
5875	Encantado D'oeste	PR
5886	Estacao General Lucio	PR
5888	Faxina	PR
5894	Ferreiras	PR
5899	Formigone	PR
5902	Francisco Beltrao	PR
5915	Goncalves Junior	PR
5919	Guapore	PR
5937	Imbauzinho	PR
5939	Indianopolis	PR
5941	Invernada	PR
5961	Itaqui	PR
5965	Jaciaba	PR
5969	Jardim Paredao	PR
5970	Jardinopolis	PR
5979	Porto Mendes	PR
6021	Eduardo Xavier da Silva	PR
6025	Entre Rios	PR
6052	Gois	PR
6066	Guaraituba	PR
6070	Hidreletrica Itaipu	PR
6084	Imbituva	PR
6092	Irere	PR
6105	Ivaitinga	PR
6111	Jardim Olinda	PR
6119	Jesuitas	PR
6120	Joa	PR
6128	Cianorte	PR
6134	Colombo	PR
6135	Colonia Acioli	PR
6136	Colonia Sao Jose	PR
6142	Coronel Firmino Martins	PR
6158	Eneas Marques	PR
6166	Faisqueira	PR
6171	Ferraria	PR
6191	Graciosa	PR
6225	Iracema do Oeste	PR
6249	Jataizinho	PR
6266	Quatigua	PR
6269	Quedas do Iguacu	PR
6273	Realeza	PR
6284	Rio Branco do Sul	PR
6285	Rio da Prata	PR
6294	Colonia Iapo	PR
6296	Colonia Melissa	PR
6297	Colorado	PR
6299	Cornelio Procopio	PR
6309	Cruzmaltina	PR
6321	Doutor Ulysses	PR
6332	Faxinal dos Elias	PR
6336	Fazendinha	PR
6339	Fernandes Pinheiro	PR
6341	Figueira	PR
6342	Fiusas	PR
6343	Floresta	PR
6346	Floropolis	PR
6351	Francisco Alves	PR
6366	Herculandia	PR
6376	Iguaracu	PR
6377	Iguipora	PR
6397	Itaipulandia	PR
6423	Joaquim Tavora	PR
6431	Presidente Castelo Branco	PR
6435	Prudentopolis	PR
6464	Conceicao	PR
6495	Dom Rodrigo	PR
6502	Emboque	PR
6516	Farol	PR
6518	Fernao Dias	PR
6532	Fundao	PR
6542	Guapirama	PR
6550	Ibipora	PR
6590	Jangada do Sul	PR
6592	Japura	PR
6607	Querencia do Norte	PR
6611	Ramilandia	PR
6618	Ribeirao Claro	PR
6620	Rio 14	PR
6625	Colonia Castelhanos	PR
6626	Colonia Murici	PR
6665	Doutor Ernesto	PR
6672	Espigao Alto do Iguacu	PR
6680	Fazenda do Brigadeiro	PR
6681	Fazenda Jangada	PR
6703	Godoy Moreira	PR
6710	Grandes Rios	PR
6716	Guaragi	PR
6719	Guarapuava	PR
6725	Herval Grande	PR
6726	Honorio Serpa	PR
6729	Ibema	PR
6740	Icaraima	PR
6742	Ilha do Mel	PR
6745	Independencia	PR
6750	Invernadinha	PR
6769	Itapejara D'oeste	PR
6780	Jacare	PR
6785	Jangada	PR
6807	Colonia Pereira	PR
6817	Corumbatai do Sul	PR
6820	Cristo Rei	PR
6831	Diamante	PR
6839	Engenheiro Beltrao	PR
6846	Faxinal Santa Cruz	PR
6868	Guaira	PR
6872	Guaraquecaba	PR
6874	Guardamoria	PR
6911	Itambaraca	PR
6915	Itaperucu	PR
6925	Ivailandia	PR
6959	Rancho Alegre	PR
6973	Colonia Centenario	PR
6974	Colonia Saude	PR
6993	Curitiba	PR
6999	Despique	PR
7019	Europa	PR
7022	Fazenda dos Barbosas	PR
7023	Fazenda Salmo 23	PR
7034	Gaviao	PR
7036	General Carneiro	PR
7048	Guararema	PR
7053	Harmonia	PR
7055	Ibiaci	PR
7066	Icatu	PR
7076	Ipiranga	PR
7085	Itambe	PR
7101	Jacarezinho	PR
7112	Japira	PR
7113	Jardim Alegre	PR
7121	7 Saltos de Cima	PR
7125	Adhemar de Barros	PR
7140	Antas	PR
7177	Bela Vista do Tapiracui	PR
7183	Boa Ventura de Sao Roque	PR
7193	Borrazopolis	PR
7195	Braganey	PR
7205	Cacatu	PR
7210	Caetano Mendes	PR
7229	Capao Bonito	PR
7256	Presidente Kennedy	PR
7260	Queimados	PR
7262	Quinta do Sol	PR
7269	Rio Abaixo	PR
7270	Rio Bonito do Iguacu	PR
7271	Rio Branco do Ivai	PR
7276	2 Vizinhos	PR
7277	3 Placas	PR
7318	Araruna	PR
7336	Barao de Lucena	PR
7349	Bernardelli	PR
7360	Bom Sucesso do Sul	PR
7371	Cafeara	PR
7373	Caita	PR
7382	Campinas	PR
7412	Chopinzinho	PR
7429	Regiao dos Valos	PR
7440	Rio das Pombas	PR
7445	Adrianopolis	PR
7447	Agua Branca	PR
7461	Alto do Amparo	PR
7463	Amapora	PR
7465	Amorinha	PR
7480	Aranha	PR
7481	Arapoti	PR
7485	Araucaria	PR
7504	Barra Grande	PR
7506	Barracao	PR
7508	Barras	PR
7512	Barrinha	PR
7517	Bela Vista	PR
7519	Bela Vista do Ivai	PR
7527	Bom Sucesso	PR
7549	California	PR
7556	Campo do Tenente	PR
7562	Caratuva	PR
7579	Centenario do Sul	PR
7597	Ribeirao do Pinhal	PR
7601	Rio Azul	PR
7616	Agua Mineral	PR
7629	Alto Parana	PR
7632	Alto Santa Fe	PR
7640	Anahy	PR
7654	Arapua	PR
7659	Aricanduva	PR
7667	Bairro Limoeiro	PR
7674	Barra Bonita	PR
7695	Bocaina	PR
7696	Bocaiuva do Sul	PR
7697	Bom Progresso	PR
7699	Borda do Campo de Sao Sebastiao	PR
7702	Bourbonia	PR
7714	Cachoeira de Sao Jose	PR
7716	Cachoeirinha	PR
7726	Campo Largo da Roseira	PR
7733	Capitao Leonidas Marques	PR
7746	Cascavel	PR
7753	3 Capoes	PR
7755	4o. Centenario	PR
7758	Agua Boa	PR
7766	Alexandra	PR
7796	Ararapira	PR
7800	Areias	PR
7820	Barra do Jacare	PR
7840	Bom Jardim do Sul	PR
7869	Cafeeiros	PR
7876	Cambiju	PR
7887	Candoi	PR
7911	Central Lupion	PR
7913	Cerro Azul	PR
7929	Almirante Tamandare	PR
7934	Alto Sao Joao	PR
7947	Apucarana	PR
7975	Balsa Nova	PR
7979	Barreiro das Frutas	PR
7982	Barro Preto	PR
7993	Bituruna	PR
7995	Boa Vista	PR
7997	Bom Jesus do Sul	PR
8003	Bragantina	PR
8014	Cachoeira de Cima	PR
8017	Cadeadinho	PR
8029	Campina Grande do Sul	PR
8032	Campo Magro	PR
8033	Campo Mourao	PR
8038	Candido de Abreu	PR
8040	Capao Alto	PR
8045	Carazinho	PR
8060	Catanduvas do Sul	PR
8066	Cerne	PR
8073	3 Corregos	PR
8079	Acungui	PR
8091	Altamira do Parana	PR
8095	Alto Piquiri	PR
8096	Alto Pora	PR
8101	Angulo	PR
8106	Antonio Olinto	PR
8125	Astorga	PR
8139	Barra Mansa	PR
8147	Bela Vista do Caroba	PR
8153	Betaras	PR
8175	Cafelandia	PR
8186	Campina do Simao	PR
8193	Canela	PR
8219	Agua Azul	PR
8221	Agua do Boi	PR
8271	Boa Esperanca do Iguacu	PR
8282	Borda do Campo	PR
8286	Brasilandia do Sul	PR
8290	Bugre	PR
8310	Campina da Lagoa	PR
8322	Canzianopolis	PR
8335	Castro	PR
8342	Cedro	PR
8352	Vida Nova	PR
8353	Vila Diniz	PR
8354	Vila Nova	PR
8357	Vista Bonita	PR
8361	3 Pinheiros	PR
8366	Abapa	PR
8398	Bairro do Felisberto	PR
8413	Bentopolis	PR
8451	Campina	PR
8462	Capao da Lagoa	PR
8470	Casa Nova	PR
8483	Rio do Mato	PR
8499	Vila Alta	PR
8505	Vila Reis	PR
8510	2 Irmaos	PR
8513	4 Pontes	PR
8524	Alto Alegre do Iguacu	PR
8528	Altonia	PR
8539	Aparecida do Oeste	PR
8542	Aquidaban	PR
8551	Areia Branca dos Assis	PR
8584	Bela Vista do Piquiri	PR
8590	Boa Esperanca	PR
8593	Boa Vista da Aparecida	PR
8600	Bom Retiro	PR
8601	Borman	PR
8626	Campina dos Furtados	PR
8644	Carambei	PR
8648	Carbonera	PR
8654	Catanduvas	PR
8655	Catarinenses	PR
8666	3 Bocas	PR
8678	Agua Vermelha	PR
8692	Alto Para	PR
8702	Antonina	PR
8706	Arapongas	PR
8729	Bandeirantes D'oeste	PR
8773	Campo do Meio	PR
8802	Centenario	PR
8803	Ceu Azul	PR
8824	Alto Amparo	PR
8829	Alvorada do Sul	PR
8835	Andorinhas	PR
8840	Anunciacao	PR
8854	Aurora do Iguacu	PR
8864	Barreiro	PR
8868	Bela Vista do Paraiso	PR
8890	Botuquara	PR
8902	Cafezal do Sul	PR
8910	Cambara	PR
8926	Cara Cara	PR
8943	Cerro Velho	PR
8969	2 Marcos	PR
8971	3 Lagoas	PR
8987	Alto Alegre	PR
9001	Angai	PR
9003	Antonio Brandao de Oliveira	PR
9006	Apiaba	PR
9017	Ariranha do Ivai	PR
9020	Assai	PR
9039	Bateias	PR
9041	Baulandia	PR
9072	Cambe	PR
9085	Cantagalo	PR
9088	Capoeirinha	PR
9089	Cara Pintado	PR
9102	Cerrado Grande	PR
9112	Abatia	PR
9113	Acampamento das Minas	PR
9122	Alecrim	PR
9144	Arquimedes	PR
9146	Atalaia	PR
9152	Bairro Cachoeira	PR
9156	Bandeirantes	PR
9163	Barra Santa Salete	PR
9195	Cachoeira	PR
9213	Capanema	PR
9219	Capivara	PR
9224	Carlopolis	PR
9229	Cascatinha	PR
9233	Caxambu	PR
9244	Rio Saltinho	PR
9248	Vera Cruz do Oeste	PR
9259	Vila Roberto Brzezinski	PR
9266	Xaxim	PR
9268	3 Bicos	PR
9270	4 Barras	PR
9293	Alvorada do Iguacu	PR
9294	Ampere	PR
9296	Andira	PR
9311	Aroeira	PR
9325	Banhado	PR
9326	Barbosa Ferraz	PR
9361	Bulcao	PR
9365	Cabrito	PR
9368	Cachoeira do Espirito Santo	PR
9382	Campina do Miranguava	PR
9383	Campo Bonito	PR
9390	Capao Rico	PR
9396	Caraja	PR
9397	Caramuru	PR
9410	Centralito	PR
9415	Usina	PR
9423	Vila dos Roldos	PR
9426	Vila Nova de Florenca	PR
9434	Yolanda	PR
9436	3 Barras do Parana	PR
9446	Agostinho	PR
9449	Agudos do Sul	PR
9455	Altaneira	PR
9459	Alto Sabia	PR
9477	Arapuan	PR
9480	Assis Chateaubriand	PR
9493	Barreiros	PR
9524	Caixa Prego	PR
9527	Calogeras	PR
9530	Cambira	PR
9531	Campestrinho	PR
9535	Campo Largo	PR
9546	Capao Grande	PR
9563	Centro Novo	PR
6	Rochedo de Minas	MG
9	Sabara	MG
11	Salinas	MG
19	Santa Cruz do Prata	MG
20	Santa Efigenia de Minas	MG
23	Santa Fe de Minas	MG
29	Santa Maria de Itabira	MG
32	Santa Rita Durao	MG
36	Santana do Deserto	MG
37	Santana do Garambeu	MG
44	Santos Dumont	MG
47	Sao Candido	MG
55	Sao Geraldo de Tumiritinga	MG
61	Sao Joao da Serra Negra	MG
71	Sao Jose do Buriti	MG
85	Sao Pedro do Suacui	MG
86	Sao Sebastiao dos Pocoes	MG
89	Sapucaia	MG
91	Sapucaia de Guanhaes	MG
100	Serra das Araras	MG
101	Serra dos Aimores	MG
106	Tabauna	MG
123	Timoteo	MG
138	Turvolandia	MG
144	Roca Grande	MG
158	Sacramento	MG
176	Santa Rita do Cedro	MG
184	Santana do Tabuleiro	MG
185	Santana dos Montes	MG
189	Santo Antonio da Fortaleza	MG
197	Santo Hipolito	MG
198	Sao Bento Abade	MG
210	Sao Goncalo do Para	MG
212	Sao Joao Batista do Gloria	MG
213	Sao Joao da Vereda	MG
223	Sao Jose do Jacuri	MG
224	Sao Jose do Mantimento	MG
232	Sao Pedro do Avai	MG
236	Sao Sebastiao da Vala	MG
238	Sao Sebastiao do Rio Verde	MG
246	Serra dos Lemes	MG
249	Serranos	MG
253	Simao Pereira	MG
265	Tarumirim	MG
268	Tebas	MG
270	Teofilo Otoni	MG
274	Tocantins	MG
282	Tuiutinga	MG
293	Roseiral	MG
303	Santa Barbara do Tugurio	MG
304	Santa Cruz da Aparecida	MG
311	Santa Terezinha de Minas	MG
313	Santana do Capivari	MG
318	Santo Antonio da Boa Vista	MG
324	Sao Domingos das Dores	MG
329	Sao Gotardo	MG
332	Sao Joao do Paraiso	MG
337	Sao Jose do Acacio	MG
350	Sao Roberto	MG
353	Sao Sebastiao do Oculo	MG
354	Sao Sebastiao do Oeste	MG
356	Sao Sebastiao do Sacramento	MG
358	Sarzedo	MG
360	Senhora das Dores	MG
361	Senhora de Oliveira	MG
380	Terra Branca	MG
383	Toledo	MG
394	Uniao de Minas	MG
404	Virgolandia	MG
405	Vista Alegre	MG
406	Volta Grande	MG
413	Ritapolis	MG
418	Rosario de Minas	MG
419	Sabinopolis	MG
429	Santa Cruz de Minas	MG
440	Santa Rita do Itueto	MG
442	Santa Rita do Rio do Peixe	MG
444	Santana de Caldas	MG
446	Santana do Manhuacu	MG
453	Santo Antonio do Gloria	MG
455	Santo Antonio do Monte	MG
465	Sao Goncalo do Rio Preto	MG
466	Sao Joao da Serra	MG
469	Sao Joao do Manhuacu	MG
473	Sao Jose da Safira	MG
474	Sao Jose do Itueto	MG
475	Sao Jose dos Salgados	MG
480	Sao Pedro das Tabocas	MG
484	Sao Sebastiao da Vitoria	MG
485	Sao Sebastiao do Soberbo	MG
490	Sao Vitor	MG
495	Senador Amaral	MG
499	Serrania	MG
510	Sobralia	MG
536	Umbuzeiro	MG
547	Salto da Divisa	MG
557	Santa da Pedra	MG
569	Santa Rosa da Serra	MG
571	Santana do Aracuai	MG
572	Santana do Paraiso	MG
577	Santo Antonio do Itambe	MG
580	Sao Braz	MG
582	Sao Francisco	MG
590	Sao Joao da Sapucaia	MG
597	Sao Jose do Divino	MG
603	Sao Mateus de Minas	MG
611	Sao Vicente do Grama	MG
612	Sao Vicente do Rio Doce	MG
619	Senador Jose Bento	MG
622	Serra da Canastra	MG
642	Taruacu	MG
654	Tupaciguara	MG
657	Turmalina	MG
659	Uba	MG
666	Rio Vermelho	MG
669	Rodeador	MG
681	Santa Cruz de Botumirim	MG
682	Santa Cruz de Salinas	MG
686	Santa Luzia	MG
692	Santa Rita da Estrela	MG
693	Santa Rita de Caldas	MG
695	Santa Teresa do Bonito	MG
697	Santana do Alfie	MG
698	Santana do Campestre	MG
699	Santo Antonio do Aventureiro	MG
700	Santo Antonio do Boqueirao	MG
701	Santo Antonio do Grama	MG
702	Santo Antonio do Manhuacu	MG
703	Santo Hilario	MG
710	Sao Domingos da Bocaina	MG
714	Sao Geraldo	MG
719	Sao Joao do Manteninha	MG
737	Sao Pedro do Gloria	MG
744	Sao Sebastiao do Anta	MG
745	Sao Sebastiao do Barreiro	MG
746	Sao Sebastiao do Paraiso	MG
755	Sereno	MG
758	Silva Campos	MG
771	Taparuba	MG
780	Tobati	MG
786	Umburatiba	MG
798	Santa Filomena	MG
800	Santa Juliana	MG
802	Santa Maria do Salto	MG
803	Santa Rita de Ouro Preto	MG
809	Santo Antonio do Pirapetinga	MG
818	Sao Domingos	MG
820	Sao Felix de Minas	MG
824	Sao Goncalo do Monte	MG
828	Sao Joaquim	MG
830	Sao Jose da Barra	MG
839	Sao Manoel do Guaiacu	MG
851	Sao Tome das Letras	MG
852	Sao Vicente	MG
859	Senador Modestino Goncalves	MG
860	Senhora da Gloria	MG
867	Silveira Carvalho	MG
868	Silveirania	MG
872	Sopa	MG
875	Tabajara	MG
876	Tabuleiro	MG
893	Tombos	MG
894	Torneiros	MG
902	Unai	MG
917	Vila Pereira	MG
919	Virgem da Lapa	MG
928	Rodrigo Silva	MG
939	Santa Helena de Minas	MG
947	Santa Rita de Minas	MG
948	Santa Rosa de Lima	MG
954	Santana de Cataguases	MG
958	Santana do Riacho	MG
965	Sao Bartolomeu	MG
977	Sao Goncalo do Sapucai	MG
982	Sao Joao do Oriente	MG
984	Sao Joao Nepomuceno	MG
998	Sao Roque de Minas	MG
1003	Sapucai	MG
1004	Saudade	MG
1007	Sem Peixe	MG
1008	Senador Mourao	MG
1010	Senhora do Porto	MG
1012	Seritinga	MG
1014	Serra Nova	MG
1016	Serranopolis de Minas	MG
1037	Tapira	MG
1042	Tocos do Moji	MG
1044	Topazio	MG
1047	Ubai	MG
1051	Uruana de Minas	MG
1062	Santa Barbara do Monte Verde	MG
1069	Santa Luzia da Serra	MG
1070	Santa Margarida	MG
1073	Santa Maria do Suacui	MG
1076	Santa Rosa dos Dourados	MG
1081	Santana da Vargem	MG
1084	Santo Antonio do Jacinto	MG
1085	Santo Antonio do Rio Abaixo	MG
1091	Sao Joao da Ponte	MG
1093	Sao Joao do Pacui	MG
1094	Sao Joao Evangelista	MG
1098	Sao Jose do Barreiro	MG
1106	Sao Pedro de Caldas	MG
1108	Sao Pedro do Jequitinhonha	MG
1109	Sao Romao	MG
1115	Sao Vicente de Minas	MG
1122	Serra Azul	MG
1123	Serra Bonita	MG
1124	Serra do Camapua	MG
1128	Serro	MG
1129	Silva Xavier	MG
1130	Silvano	MG
1148	Taquaracu de Minas	MG
1150	Teixeiras	MG
1153	Tiros	MG
1160	Ubaporanga	MG
1164	Vai Volta	MG
1171	Veredinha	MG
1174	Vespasiano	MG
1185	Zito Soares	MG
1204	Santa Rita do Ibitipoca	MG
1215	Santo Antonio do Norte	MG
1220	Sao Bento de Caldas	MG
1227	Sao Geraldo do Baixio	MG
1228	Sao Goncalo de Botelhos	MG
1235	Sao Joaquim de Bicas	MG
1242	Sao Jose do Alegre	MG
1247	Sao Jose do Paraopeba	MG
1250	Sao Jose dos Lopes	MG
1256	Sao Pedro da Garca	MG
1258	Sao Pedro dos Ferros	MG
1262	Sao Sebastiao do Barreado	MG
1268	Sapucai Mirim	MG
1271	Senhora da Penha	MG
1272	Senhora do Carmo	MG
1273	Senhora dos Remedios	MG
1279	Simao Campos	MG
1290	Tapirai	MG
1304	Torreoes	MG
1306	Tumiritinga	MG
1316	Rubelita	MG
1325	Santa Barbara do Leste	MG
1327	Santa Efigenia	MG
1340	Santana de Pirapama	MG
1342	Santana do Paraopeba	MG
1350	Santo Antonio dos Araujos	MG
1358	Sao Goncalo do Abaete	MG
1359	Sao Goncalo do Rio das Pedras	MG
1361	Sao Joao da Chapada	MG
1367	Sao Jose da Varginha	MG
1369	Sao Jose das Tronqueiras	MG
1381	Sao Sebastiao do Maranhao	MG
1384	Sao Tomas de Aquino	MG
1395	Serra da Saudade	MG
1411	Tabuao	MG
1417	Tapuirama	MG
1430	Tocandira	MG
1442	Ubari	MG
1443	Uberlandia	MG
1450	Rodeiro	MG
1455	Rosario da Limeira	MG
1456	Rosario do Pontal	MG
1459	Salitre de Minas	MG
1484	Santo Antonio do Cruzeiro	MG
1485	Santo Antonio dos Campos	MG
1491	Sao Francisco do Gloria	MG
1498	Sao Jose da Lapa	MG
1514	Sao Sebastiao do Bugre	MG
1517	Sapucaia do Norte	MG
1519	Sardoa	MG
1526	Setubinha	MG
1528	Simonesia	MG
1547	Tiradentes	MG
1565	Vargem Alegre	MG
1579	Rocas Novas	MG
1580	Romaria	MG
1596	Santo Antonio do Mucuri	MG
1598	Santo Antonio do Retiro	MG
1609	Sao Joao das Missoes	MG
1618	Sao Jose do Goiabal	MG
1620	Sao Jose do Mato Dentro	MG
1622	Sao Lourenco	MG
1623	Sao Miguel do Anta	MG
1629	Sao Sebastiao da Barra	MG
1635	Senador Firmino	MG
1638	Sertaozinho	MG
1641	Silvestre	MG
1645	Sobral Pinto	MG
1684	Vargem Linda	MG
1685	Varginha	MG
1719	Santa Rita de Jacutinga	MG
1725	Santo Antonio da Vargem Alegre	MG
1727	Santo Antonio do Leite	MG
1737	Sao Joao Del Rei	MG
1738	Sao Joao do Bonito	MG
1742	Sao Jose da Pedra Menina	MG
1753	Sao Pedro da Uniao	MG
1755	Sao Sebastiao da Bela Vista	MG
1756	Sao Sebastiao da Vargem Alegre	MG
1757	Sao Sebastiao de Braunas	MG
1758	Sao Sebastiao do Baixio	MG
1759	Sao Sebastiao do Bonsucesso	MG
1760	Sao Sebastiao do Pontal	MG
1762	Sao Sebastiao dos Torres	MG
1763	Sao Tiago	MG
1764	Sao Vicente da Estrela	MG
1765	Sarandira	MG
1766	Sericita	MG
1780	Soledade de Minas	MG
1790	Tejuco	MG
1805	Vale Verde de Minas	MG
1807	Vazante	MG
1810	Verissimo	MG
1811	Vermelho Novo	MG
1812	Vila Bom Jesus	MG
1829	Rubim	MG
1835	Sanatorio Santa Fe	MG
1838	Santa Cruz do Escalvado	MG
1845	Santa Rita do Sapucai	MG
1850	Santa Vitoria	MG
1852	Santana do Jacare	MG
1859	Sao Bras do Suacui	MG
1865	Sao Francisco do Humaita	MG
1868	Sao Goncalo do Rio Abaixo	MG
1869	Sao Jeronimo dos Pocoes	MG
1878	Sao Joao do Jacutinga	MG
1879	Sao Jose da Bela Vista	MG
1882	Sao Jose do Batatal	MG
1899	Sao Sebastiao do Rio Preto	MG
1935	Trimonte	MG
1940	Tuparece	MG
1948	Vau Acu	MG
1952	Vera Cruz de Minas	MG
1956	Vereda do Paraiso	MG
1965	Wenceslau Braz	MG
1967	Zelandia	MG
1976	Santa Barbara	MG
1984	Santa Isabel	MG
1991	Santana de Patos	MG
1996	Santo Antonio do Amparo	MG
2005	Sao Domingos do Prata	MG
2006	Sao Francisco de Paula	MG
2007	Sao Francisco de Sales	MG
2008	Sao Geraldo da Piedade	MG
2009	Sao Geraldo do Baguari	MG
2012	Sao Joao da Lagoa	MG
2013	Sao Joao da Mata	MG
2025	Sao Jose do Pantano	MG
2040	Sao Sebastiao do Gil	MG
2041	Sao Sebastiao dos Robertos	MG
2047	Senador Cortes	MG
2052	Serra Azul de Minas	MG
2053	Serra do Salitre	MG
2060	Silvianopolis	MG
2072	Taiobeiras	MG
2081	Tomas Gonzaga	MG
2091	Uberaba	MG
2098	Ladainha	MG
2100	Lagoa da Prata	MG
2103	Lavras	MG
2105	Levinopolis	MG
2109	Luizlandia do Oeste	MG
2111	Macuco	MG
2112	Mae dos Homens	MG
2117	Manhumirim	MG
2124	Marlieria	MG
2127	Martins Soares	MG
2132	Mendanha	MG
2133	Merces	MG
2134	Merces de Agua Limpa	MG
2137	Minduri	MG
2147	Monte Santo de Minas	MG
2149	Morada Nova de Minas	MG
2151	Mundo Novo de Minas	MG
2162	Nova Era	MG
2186	Paracatu	MG
2197	Pedra Azul	MG
2202	Pic Sagarana	MG
2207	Pinheirinhos	MG
2215	Pocoes de Paineiras	MG
2216	Pocos de Caldas	MG
2221	Ponte Alta de Minas	MG
2222	Ponte Nova	MG
2237	Presidente Olegario	MG
2239	Queixada	MG
2240	Quilombo	MG
2258	Lagoa Grande	MG
2259	Lagoa Santa	MG
2266	Lapinha	MG
2271	Luislandia	MG
2284	Marmelopolis	MG
2285	Matias Cardoso	MG
2300	Monsenhor Joao Alexandre	MG
2314	Natalandia	MG
2315	Nelson de Sena	MG
2317	Nicolandia	MG
2328	Nova Lima	MG
2330	Nova Modica	MG
2334	Novo Cruzeiro	MG
2353	Paraguacu	MG
2356	Paredao de Minas	MG
2361	Pecanha	MG
2363	Pedras de Maria da Cruz	MG
2368	Piao	MG
2380	Planalto de Minas	MG
2381	Pocrane	MG
2394	Presidente Pena	MG
2395	Quartel Geral	MG
2409	Rio Pardo de Minas	MG
2450	Maravilhas	MG
2460	Miguel Burnier	MG
2473	Montezuma	MG
2475	Morro do Ferro	MG
2481	Nanuque	MG
2509	Ouro Verde de Minas	MG
2510	Padre Carvalho	MG
2518	Paraguai	MG
2523	Passa Tempo	MG
2525	Passagem de Mariana	MG
2535	Pequi	MG
2537	Piedade do Paraopeba	MG
2543	Pirauba	MG
2555	Ponto Chique	MG
2558	Juruaia	MG
2571	Lajinha	MG
2583	Machado	MG
2591	Mantiqueira do Palmital	MG
2594	Maria da Fe	MG
2611	Miralta	MG
2617	Monte Siao	MG
2618	Monte Verde	MG
2625	Munhoz	MG
2641	Nova Minda	MG
2654	Oliveira	MG
2655	Ouro Preto	MG
2657	Padre Fialho	MG
2658	Padre Pinto	MG
2679	Penha Longa	MG
2686	Piedade do Rio Grande	MG
2689	Pinheiros Altos	MG
2694	Pirangucu	MG
2709	Ponto do Marambaia	MG
2715	Jureia	MG
2733	Machacalis	MG
2754	Mathias Lobato	MG
2766	Monte Belo	MG
2775	Natercia	MG
2777	Ninheira	MG
2793	Novorizonte	MG
2800	Padre Julio Maria	MG
2809	Patrimonio	MG
2814	Pedra Grande	MG
2825	Piau	MG
2827	Pindaibas	MG
2831	Pires e Albuquerque	MG
2832	Pitangui	MG
2839	Poncianos	MG
2845	Pouso Alegre	MG
2849	Presidente Kubitschek	MG
2861	Raul Soares	MG
2864	Reduto	MG
2867	Riachinho	MG
2886	Laranjal	MG
2891	Limeira D'oeste	MG
2895	Lourenco Velho	MG
2905	Marambainha	MG
2918	Mirai	MG
2920	Miravania	MG
2923	Moeda	MG
2926	Monsenhor Horta	MG
2932	Morro	MG
2938	Muriae	MG
2939	Muzambinho	MG
2940	Neolandia	MG
2947	Nova Ponte	MG
2956	Padre Joao Afonso	MG
2957	Pai Pedro	MG
2965	Paraisopolis	MG
2978	Paula Lima	MG
2983	Pedro Lessa	MG
2984	Pedro Teixeira	MG
2987	Penha de Franca	MG
2998	Plautino Soares	MG
3010	Pratapolis	MG
3016	Quintinos	MG
3018	Ravena	MG
3021	Ribeirao das Neves	MG
3022	Ribeirao de Sao Domingos	MG
3032	Jurumirim	MG
3033	Juvenilia	MG
3035	Lacerdinha	MG
3053	Lufa	MG
3059	Major Ezequiel	MG
3067	Maripa de Minas	MG
3073	Mateus Leme	MG
3079	Monsenhor Isidro	MG
3089	Morro da Garca	MG
3098	Nazareno	MG
3099	Nepomuceno	MG
3111	Novilhona	MG
3114	Onca de Pitangui	MG
3117	Orizania	MG
3121	Paciencia	MG
3124	Padre Brito	MG
3126	Pains	MG
3135	Para de Minas	MG
3137	Paraopeba	MG
3141	Patrocinio	MG
3142	Pavao	MG
3144	Pe do Morro	MG
3145	Pedra do Anta	MG
3146	Pedra do Indaia	MG
3149	Pedro Leopoldo	MG
3153	Perdoes	MG
3155	Pilar	MG
3156	Pingo D'agua	MG
3172	Pontevila	MG
3176	Porto dos Mendes	MG
3187	Lambari	MG
3190	Luz	MG
3198	Malacacheta	MG
3204	Marilac	MG
3209	Mata Verde	MG
3212	Matutina	MG
3213	Medina	MG
3215	Milho Verde	MG
3220	Monte Carmelo	MG
3247	Oratorios	MG
3254	Padre Felisberto	MG
3263	Patrocinio do Muriae	MG
3267	Pedra Dourada	MG
3270	Penedia	MG
3281	Piracaiba	MG
3286	Piscamba	MG
3287	Pitarana	MG
3290	Ponte Segura	MG
3291	Porto Agrario	MG
3309	Resende Costa	MG
3320	Rio das Mortes	MG
3322	Rio do Prado	MG
3342	Luminosa	MG
3343	Macaia	MG
3348	Manhuacu	MG
3350	Mantiqueira	MG
3358	Martinho Campos	MG
3377	Morro do Pilar	MG
3378	Mucuri	MG
3381	Naque Nanuque	MG
3385	Nhandutiba	MG
3394	Nova Resende	MG
3398	Olhos D'agua	MG
3403	Ouro Branco	MG
3407	Paineiras	MG
3423	Pedra Bonita	MG
3426	Pereirinhas	MG
3427	Petunia	MG
3429	Pimenta	MG
3432	Pintos Negreiros	MG
3437	Pirapetinga	MG
3471	Rio Pomba	MG
3472	Rio Preto	MG
3473	Urucania	MG
3482	Leme do Prado	MG
3485	Lima Duarte	MG
3497	Mantena	MG
3502	Mario Campos	MG
3510	Mendes Pimentel	MG
3516	Miragaia	MG
3517	Mocambeiro	MG
3521	Monjolos	MG
3524	Monte Rei	MG
3545	Nova Uniao	MG
3549	Novo Horizonte	MG
3553	Olimpio Campos	MG
3558	Ouro Fino	MG
3569	Pantano	MG
3570	Papagaios	MG
3581	Patis	MG
3582	Patos de Minas	MG
3588	Penha do Cassiano	MG
3592	Perpetuo Socorro	MG
3595	Piedade de Ponte Nova	MG
3606	Piumhi	MG
3622	Lagamar	MG
3648	Major Porto	MG
3666	Materlandia	MG
3667	Matipo	MG
3678	Mocambinho	MG
3680	Monte Alegre de Minas	MG
3681	Monte Celeste	MG
3689	Morro Vermelho	MG
3693	Naque	MG
3720	Olegario Maciel	MG
3732	Palmeiral	MG
3765	Pinhotiba	MG
3766	Pintopolis	MG
3772	Piranguita	MG
3780	Ponte dos Ciganos	MG
3781	Ponte Firme	MG
3783	Porteirinha	MG
3796	Lagoa Formosa	MG
3806	Leandro Ferreira	MG
3810	Lontra	MG
3825	Mariana	MG
3827	Matias Barbosa	MG
3829	Medeiros	MG
3832	Melo Viana	MG
3841	Montes Claros	MG
3850	Nazare de Minas	MG
3856	Nova Belem	MG
3864	Nova Serrana	MG
3868	Ocidente	MG
3871	Olimpio Noronha	MG
3891	Passos	MG
3902	Pescador	MG
3908	Piracema	MG
3932	Quartel de Sao Joao	MG
3933	Quem Quem	MG
3937	Realeza	MG
3954	Lagoa dos Patos	MG
3958	Leopoldina	MG
3961	Lobo Leite	MG
3979	Mato Verde	MG
3984	Mirabela	MG
3988	Missionario	MG
3989	Moema	MG
3992	Monjolinho de Minas	MG
4003	Nacip Raydan	MG
4015	Novo Oriente de Minas	MG
4022	Olhos D'agua do Oeste	MG
4030	Palmeirinha	MG
4032	Paraiso Garcia	MG
4043	Pedra do Sino	MG
4045	Pedrinopolis	MG
4047	Pedro Versiani	MG
4059	Pirajuba	MG
4060	Piranga	MG
4067	Poaia	MG
4070	Ponto dos Volantes	MG
4085	Quartel do Sacramento	MG
4086	Queluzita	MG
4104	Rio Casca	MG
4110	Rio Paranaiba	MG
4119	Lagoa Bonita	MG
4125	Lamounier	MG
4127	Liberdade	MG
4133	Luminarias	MG
4139	Madre de Deus de Minas	MG
4149	Mar de Espanha	MG
4173	Minas Novas	MG
4174	Miradouro	MG
4179	Montalvania	MG
4182	Monte Azul	MG
4205	Nova Porteirinha	MG
4210	Olaria	MG
4218	Paiolinho	MG
4219	Paiva	MG
4222	Palma	MG
4223	Palmopolis	MG
4230	Parque Durval de Barros	MG
4231	Passa 10	MG
4236	Pedra Corrida	MG
4240	Perdigao	MG
4241	Perdilandia	MG
4242	Perdizes	MG
4244	Piedade dos Gerais	MG
4248	Pirapanema	MG
4254	Planura	MG
4260	Pontalete	MG
4267	Porto das Flores	MG
4270	Juramento	MG
4276	Lagoa Dourada	MG
4279	Lassance	MG
4284	Limeira de Mantena	MG
4290	Luisburgo	MG
4293	Mamonas	MG
4309	Mesquita	MG
4310	Mestre Caetano	MG
4311	Milagre	MG
4318	Mirantao	MG
4319	Miraporanga	MG
4321	Monsenhor Paulo	MG
4324	Monte Formoso	MG
4362	Padre Paraiso	MG
4369	Palmital dos Carvalhos	MG
4379	Passa 20	MG
4382	Paula Candido	MG
4384	Paulistas	MG
4388	Pedralva	MG
4393	Penha do Capim	MG
4396	Piacatuba	MG
4397	Piedade de Caratinga	MG
4405	Pirapora	MG
4412	Pompeu	MG
4414	Ponte Alta	MG
4415	Ponto Chique do Martelo	MG
4418	Porto Firme	MG
4428	Lamim	MG
4430	Laranjeiras de Caldas	MG
4436	Luiz Pires de Minas	MG
4439	Macuco de Minas	MG
4441	Manga	MG
4451	Marilandia	MG
4454	Martinesia	MG
4455	Martins Guimaraes	MG
4456	Matozinhos	MG
4459	Mendonca	MG
4476	Muquem	MG
4479	Mutum	MG
4489	Nova Esperanca	MG
4501	Oliveira Fortes	MG
4504	Padre Viegas	MG
4516	Passa 4	MG
4517	Passabem	MG
4530	Pedra Menina	MG
4536	Penha do Norte	MG
4537	Pequeri	MG
4538	Periquito	MG
4540	Piranguinho	MG
4544	Poco Fundo	MG
4577	Cisneiros	MG
4583	Conceicao da Aparecida	MG
4584	Conceicao da Barra de Minas	MG
4585	Conceicao das Pedras	MG
4586	Conceicao do Para	MG
4588	Congonhas do Norte	MG
4589	Consolacao	MG
4593	Coronel Fabriciano	MG
4596	Crisolia	MG
4598	Cristina	MG
4602	Cruzeiro dos Peixotos	MG
4605	Dias	MG
4607	Divino	MG
4608	Divino das Laranjeiras	MG
4611	Dom Modesto	MG
4615	Doutor Lund	MG
4623	Ervalia	MG
4628	Faria Lemos	MG
4640	Frei Lagonegro	MG
4641	Fronteira	MG
4648	Gonzaga	MG
4664	Hematita	MG
4671	Ibertioga	MG
4700	Itauna	MG
4704	Ituiutaba	MG
4705	Itutinga	MG
4710	Jacinto	MG
4726	Juatuba	MG
4729	Claudio Manuel	MG
4738	Conceicao do Mato Dentro	MG
4744	Correia de Almeida	MG
4756	Desterro de Entre Rios	MG
4757	Diamantina	MG
4759	Dionisio	MG
4766	Dona Euzebia	MG
4767	Dores da Vitoria	MG
4776	Engenho do Ribeiro	MG
4793	Frei Eustaquio	MG
4794	Frei Orlando	MG
4797	Funchal	MG
4805	Goiabeira	MG
4806	Goianases	MG
4811	Guape	MG
4817	Guidoval	MG
4820	Iapu	MG
4821	Ibia	MG
4828	Ibitira	MG
4833	Igarape	MG
4835	Ijaci	MG
4838	Ipaba	MG
4854	Itanhandu	MG
4855	Itanhomi	MG
4864	Jaguarao	MG
4865	Janauba	MG
4877	Jose Goncalves de Minas	MG
4890	Concordia de Mucuri	MG
4894	Coracao de Jesus	MG
4899	Corrego do Bom Jesus	MG
4903	Crisolita	MG
4911	Curvelo	MG
4915	Dias Tavares Siderurgica	MG
4916	Divino de Virgolandia	MG
4918	Divino Espirito Santo	MG
4921	Dores do Paraibuna	MG
4925	Engenheiro Navarro	MG
4927	Esmeraldas	MG
4939	Felicio dos Santos	MG
4945	Formiga	MG
4949	Fortuna de Minas	MG
4950	Funilandia	MG
4955	Glaucilandia	MG
4968	Guaranilandia	MG
4970	Guarataia	MG
4980	Icarai de Minas	MG
4995	Inimutaba	MG
5006	Itacambira	MG
5010	Itamuri	MG
5020	Iturama	MG
5028	Jaguaritira	MG
5029	Jampruca	MG
5034	Jequitai	MG
5035	Jesuania	MG
5037	Joanesia	MG
5052	Conceicao do Formoso	MG
5060	Conselheiro Mata	MG
5065	Corrego do Barro	MG
5081	Diamante de Uba	MG
5101	Floresta	MG
5104	Franciscopolis	MG
5106	Furquim	MG
5107	Galena	MG
5112	Graminea	MG
5113	Granada	MG
5120	Guarani	MG
5121	Guarda dos Ferreiros	MG
5143	Itaguara	MG
5145	Itamarandiba	MG
5146	Itamirim	MG
5172	Joao Pinheiro	MG
5173	Josenopolis	MG
5176	Urucuia	MG
5193	Vilas Boas	MG
5195	Virginia	MG
5212	Conselheiro Lafaiete	MG
5213	Cordisburgo	MG
5214	Coroaci	MG
5219	Correntinho	MG
5233	Dom Silverio	MG
5237	Dores do Indaia	MG
5240	Engenho Novo	MG
5244	Esmeraldas de Ferros	MG
5246	Eugenopolis	MG
5248	Farias	MG
5249	Fernandes Tourinho	MG
5250	Ferruginha	MG
5255	Fruta de Leite	MG
5265	Guacui	MG
5267	Guarda Mor	MG
5269	Guaxupe	MG
5279	Ibiracatu	MG
5299	Itacarambi	MG
5315	Itueta	MG
5328	Jequitinhonha	MG
5335	Vargem Bonita	MG
5336	Varjao de Minas	MG
5340	Verdelandia	MG
5349	Vitorinos	MG
5353	Claro de Minas	MG
5354	Claro dos Pocoes	MG
5365	Cordislandia	MG
5370	Corrego do Ouro	MG
5371	Corrego Novo	MG
5372	Corregos	MG
5389	Divinopolis	MG
5393	Emboabas	MG
5398	Espera Feliz	MG
5405	Esteios	MG
5406	Estrela da Barra	MG
5408	Ewbank da Camara	MG
5414	Flor de Minas	MG
5426	Furnas	MG
5437	Guarara	MG
5440	Gurinhata	MG
5471	Itui	MG
5481	Japaraiba	MG
5490	Valao	MG
5492	Valo Fundo	MG
5497	Veredas	MG
5498	Vermelho	MG
5502	Vieiras	MG
5504	Vila Nova de Minas	MG
5505	Vila Nova dos Pocoes	MG
5507	Visconde do Rio Branco	MG
5517	Cocais	MG
5523	Comercinho	MG
5524	Conceicao da Ibitipoca	MG
5529	Corrego Fundo	MG
5535	Curimatai	MG
5542	Descoberto	MG
5550	Eloi Mendes	MG
5558	Euxenita	MG
5574	Francisco Dumont	MG
5579	Glucinio	MG
5582	Governador Valadares	MG
5591	Guimarania	MG
5592	Heliodora	MG
5595	Honoropolis	MG
5599	Ibiraci	MG
5614	Inhapim	MG
5621	Itabirinha de Mantena	MG
5628	Itatiaiucu	MG
5629	Iterere	MG
5635	Jacutinga	MG
5648	Jenipapo de Minas	MG
5656	Juiz de Fora	MG
5668	Vermelho Velho	MG
5677	Cipotanea	MG
5678	Citrolandia	MG
5683	Conceicao de Ipanema	MG
5685	Conceicao do Capim	MG
5686	Conceicao dos Ouros	MG
5687	Congonhal	MG
5690	Contagem	MG
5700	Crispim Jaques	MG
5719	Desemboque	MG
5721	Desterro do Melo	MG
5724	Divinesia	MG
5725	Divinolandia de Minas	MG
5732	Dores de Campos	MG
5733	Dores de Guanhaes	MG
5745	Estiva	MG
5746	Extracao	MG
5753	Fidalgo	MG
5754	Fidelandia	MG
5771	Guaipava	MG
5773	Guaraciaba	MG
5793	Ipatinga	MG
5799	Irai de Minas	MG
5823	Jaiba	MG
5829	Jubai	MG
5831	Junco de Minas	MG
5836	Coco	MG
5842	Conceicao de Tronqueiras	MG
5856	Crucilandia	MG
5858	Cruzilia	MG
5866	Divisa Nova	MG
5869	Doresopolis	MG
5877	Engenheiro Schnoor	MG
5880	Ermidinha	MG
5884	Espirito Santo do Dourado	MG
5890	Felisburgo	MG
5893	Ferreiras	MG
5898	Fonseca	MG
5901	Formoso	MG
5903	Frei Gaspar	MG
5905	Gama	MG
5906	Gameleiras	MG
5908	Gaviao	MG
5918	Grao Mogol	MG
5923	Guardinha	MG
5927	Guiricema	MG
5934	Ibituruna	MG
5940	Inhauma	MG
5947	Itaboca	MG
5950	Itamarati de Minas	MG
5953	Itamonte	MG
5954	Itapagipe	MG
5958	Itapeva	MG
5971	Jequeri	MG
5988	Condado do Norte	MG
5995	Coronel Pacheco	MG
6009	Datas	MG
6011	Delfim Moreira	MG
6012	Delfinopolis	MG
6013	Derribadinha	MG
6017	Dom Joaquim	MG
6029	Estevao de Araujo	MG
6033	Fama	MG
6046	Frutal	MG
6054	Gorutuba	MG
6061	Grota	MG
6065	Guaraciama	MG
6067	Guaranesia	MG
6083	Ilheus do Prata	MG
6096	Itambacuri	MG
6098	Itapiru	MG
6116	Jeceaba	MG
6124	Jose Raydan	MG
6131	Claudio	MG
6137	Conceicao de Minas	MG
6138	Contria	MG
6150	Deputado Augusto Clementino	MG
6151	Dom Cavati	MG
6161	Entre Rios de Minas	MG
6164	Estrela Dalva	MG
6165	Estrela de Jordania	MG
6170	Felixlandia	MG
6177	Frei Serafim	MG
6188	Gouvea	MG
6205	Ibiai	MG
6224	Ipuiuna	MG
6232	Itaim	MG
6233	Itajuba	MG
6252	Joaima	MG
6256	Juiracu	MG
6258	Prados	MG
6260	Prata	MG
6261	Presidente Bernardes	MG
6267	Quatituba	MG
6282	Rio Acima	MG
6300	Coromandel	MG
6301	Coronel Xavier Chaves	MG
6302	Couto de Magalhaes de Minas	MG
6304	Cristais	MG
6307	Cristalia	MG
6308	Cristiano Otoni	MG
6317	Divisopolis	MG
6340	Ferreiropolis	MG
6353	Freire Cardoso	MG
6354	Galileia	MG
6358	Goiana	MG
6360	Guanhaes	MG
6393	Itabira	MG
6396	Itaipe	MG
6404	Itau de Minas	MG
6406	Itinga	MG
6410	Jaboticatubas	MG
6411	Jacare	MG
6415	Jacui	MG
6430	Pratinha	MG
6451	Ribeiros	MG
6459	Claraval	MG
6462	Comendador Gomes	MG
6465	Conceicao das Alagoas	MG
6466	Conceicao de Itagua	MG
6469	Conego Joao Pio	MG
6479	Costas	MG
6480	Costas da Mantiqueira	MG
6491	Delta	MG
6497	Dores do Turvo	MG
6498	Douradoquara	MG
6503	Engenheiro Caldas	MG
6504	Entre Folhas	MG
6510	Espinosa	MG
6513	Estrela do Sul	MG
6514	Expedicionario Alicio	MG
6517	Fechados	MG
6522	Florestina	MG
6528	Francisco Badaro	MG
6530	Frei Inocencio	MG
6539	Gororos	MG
6545	Guinda	MG
6559	Indaiabira	MG
6562	Independencia	MG
6564	Ipiacu	MG
6573	Itaobim	MG
6575	Itapecerica	MG
6579	Itauninha	MG
6580	Itaverava	MG
6591	Januaria	MG
6597	Joaquim Felicio	MG
6628	Coluna	MG
6632	Conceicao de Piracicaba	MG
6635	Congonhas	MG
6637	Contrato	MG
6639	Coronel Murta	MG
6640	Corrego Danta	MG
6651	Cubas	MG
6653	Cuite Velho	MG
6664	Doutor Campolina	MG
6667	Edgard Melo	MG
6675	Extrema	MG
6683	Ferros	MG
6686	Floralia	MG
6689	Fortaleza de Minas	MG
6691	Francisco Sa	MG
6702	Glaura	MG
6706	Goncalves	MG
6711	Grupiara	MG
6722	Guaxima	MG
6724	Hermilo Alves	MG
6744	Ilicinea	MG
6747	Inhai	MG
6751	Ipanema	MG
6753	Ipoema	MG
6770	Itapirucu	MG
6776	Itira	MG
6792	Joao Monlevade	MG
6802	Chumbo	MG
6808	Conceicao da Boa Vista	MG
6809	Conceicao da Brejauba	MG
6812	Conego Marinho	MG
6813	Confins	MG
6814	Conselheiro Pena	MG
6818	Costa Sena	MG
6821	Cruzeiro da Fortaleza	MG
6823	Cuparaque	MG
6825	Curral de Dentro	MG
6834	Dom Lara	MG
6836	Douradinho	MG
6844	Estrela do Indaia	MG
6851	Fernao Dias	MG
6853	Fervedouro	MG
6856	Florestal	MG
6859	Fronteira dos Vales	MG
6862	Garapuava	MG
6885	Ibirite	MG
6889	Iguatama	MG
6895	Ingai	MG
6903	Itabirito	MG
6904	Itacolomi	MG
6909	Itamarati	MG
6923	Itumirim	MG
6930	Japonvar	MG
6932	Jequitiba	MG
6939	Joselandia	MG
6952	Professor Sperber	MG
6953	Providencia	MG
6960	Raposos	MG
6964	Riacho da Cruz	MG
6972	Coimbra	MG
6976	Conceicao do Rio Acima	MG
6977	Conceicao do Rio Verde	MG
6978	Conquista	MG
6979	Coqueiral	MG
6980	Corinto	MG
6997	Desembargador Otoni	MG
7001	Diogo de Vasconcelos	MG
7002	Divisa Alegre	MG
7003	Dom Bosco	MG
7004	Dom Vicoso	MG
7008	Durande	MG
7010	Engenheiro Correia	MG
7015	Epaminondas Otoni	MG
7025	Felicina	MG
7031	Galego	MG
7062	Ibitiura de Minas	MG
7069	Igaratinga	MG
7070	Imbe de Minas	MG
7071	Inconfidentes	MG
7073	Indianopolis	MG
7079	Itaci	MG
7084	Itajutiba	MG
7086	Itambe do Mato Dentro	MG
7087	Itamogi	MG
7092	Itapanhoacanga	MG
7099	Jacarandira	MG
7108	Jaguaracu	MG
7114	Jardinesia	MG
7116	Jordania	MG
7133	Alvacao	MG
7134	Alvinopolis	MG
7146	Aracai	MG
7152	Arantina	MG
7156	Arcos	MG
7159	Ascencao	MG
7179	Bituri	MG
7184	Boa Vista de Minas	MG
7189	Bom Jesus do Galho	MG
7216	Campanario	MG
7219	Campo Florido	MG
7221	Campo Redondo	MG
7223	Canaa	MG
7230	Capetinga	MG
7235	Carandai	MG
7242	Carvalhopolis	MG
7243	Catas Altas	MG
7245	Cedro do Abaete	MG
7264	Ressaquinha	MG
7290	Albertos	MG
7292	Aldeia	MG
7293	Alfenas	MG
7294	Alpinopolis	MG
7312	Aracati de Minas	MG
7315	Araponga	MG
7338	Barbacena	MG
7341	Barreiro da Raiz	MG
7354	Bocaina de Minas	MG
7359	Bom Jesus da Penha	MG
7361	Bonfim	MG
7370	Cachoeira de Santa Cruz	MG
7388	Canastrao	MG
7404	Carlos Alves	MG
7413	Pote	MG
7415	Pouso Alto	MG
7421	Prudente de Morais	MG
7427	Recreio	MG
7434	Ribeiro Junqueira	MG
7441	2 de Abril	MG
7452	Alegria	MG
7454	Almeida	MG
7459	Alto Capim	MG
7466	Amparo da Serra	MG
7479	Aranha	MG
7501	Barra da Figueira	MG
7507	Barranco Alto	MG
7518	Bela Vista de Minas	MG
7526	Bom Repouso	MG
7533	Braunas	MG
7544	Cachoeira de Pajeu	MG
7551	Camanducaia	MG
7553	Campestre	MG
7558	Cana Verde	MG
7563	Carbonita	MG
7565	Carmo da Mata	MG
7576	Catuti	MG
7586	Presidente Juscelino	MG
7590	Resplendor	MG
7592	Riacho dos Machados	MG
7600	Ribeirao Vermelho	MG
7611	Acaiaca	MG
7624	Alegre	MG
7628	Alto Jequitiba	MG
7635	Alvorada	MG
7643	Anguereta	MG
7645	Antonio Pereira	MG
7647	Aparecida de Minas	MG
7656	Araujos	MG
7657	Araxa	MG
7658	Argirita	MG
7668	Baldim	MG
7678	Barra Feliz	MG
7681	Barreiro Branco	MG
7683	Barrocao	MG
7707	Brumadinho	MG
7711	Caburu	MG
7724	Campina Verde	MG
7725	Campo Azul	MG
7732	Capelinha	MG
7745	Cascalho Rico	MG
7759	Agua Comprida	MG
7760	Aguas de Contendas	MG
7763	Aimores	MG
7778	Alto Rio Doce	MG
7780	Amanhece	MG
7785	Angelandia	MG
7787	Angicos de Minas	MG
7802	Arinos	MG
7813	Bambui	MG
7832	Boa Uniao de Itabirinha	MG
7837	Bocaiuva	MG
7842	Bom Jesus do Divino	MG
7846	Bom Retiro	MG
7859	Buritis	MG
7865	Cachoeira do Campo	MG
7866	Cachoeira do Manteiga	MG
7867	Cachoeira Dourada	MG
7877	Cambui	MG
7883	Campos Gerais	MG
7891	Capela Nova	MG
7892	Capinopolis	MG
7894	Capitania	MG
7901	Carmesia	MG
7908	Catuji	MG
7910	Centenario	MG
7914	Chapada de Minas	MG
7916	Chonim	MG
7936	Alvorada de Minas	MG
7937	Amarantina	MG
7964	Assarai	MG
7970	Bacao	MG
7972	Baependi	MG
7973	Baguari	MG
7990	Belo Horizonte	MG
8000	Bonanca	MG
8004	Bras Pires	MG
8024	Calixto	MG
8043	Carai	MG
8050	Carlos Chagas	MG
8059	Cataguarino	MG
8068	Chale	MG
8069	Chapada Gaucha	MG
8076	Abaete dos Mendes	MG
8077	Abreus	MG
8093	Alto Maranhao	MG
8104	Antonio dos Santos	MG
8107	Antunes	MG
8110	Aracitaba	MG
8113	Aramirim	MG
8115	Arapora	MG
8117	Arcangelo	MG
8118	Areado	MG
8132	Barao de Cocais	MG
8133	Barao de Monte Alto	MG
8159	Bom Sucesso	MG
8163	Borba Gato	MG
8171	Cachoeira Alegre	MG
8176	Caiana	MG
8181	Camargos	MG
8184	Cambuquira	MG
8199	Caputira	MG
8201	Careacu	MG
8204	Carmo do Cajuru	MG
8212	Chapada do Norte	MG
8214	7 Cachoeiras	MG
8215	7 Lagoas	MG
8218	Abre Campo	MG
8222	Aguanil	MG
8223	Aguas de Araxa	MG
8226	Alexandrita	MG
8234	Amanda	MG
8255	Baixa	MG
8264	Barra do Ariranha	MG
8270	Berilo	MG
8281	Borda da Mata	MG
8284	Botumirim	MG
8289	Brejaubinha	MG
8295	Cabo Verde	MG
8297	Cachoeira da Prata	MG
8299	Caetanopolis	MG
8303	Caldas	MG
8313	Campo Belo	MG
8331	Carvalhos	MG
8336	Cataguases	MG
8358	3 Ilhas	MG
8360	3 Marias	MG
8369	Agua Branca de Minas	MG
8393	Astolfo Dutra	MG
8396	Babilonia	MG
8400	Bandeira	MG
8406	Barra Longa	MG
8414	Biquinhas	MG
8421	Bom Jesus da Cachoeira	MG
8423	Bom Jesus do Amparo	MG
8427	Bonito de Minas	MG
8432	Botelhos	MG
8435	Brejauba	MG
8439	Cabeceira Grande	MG
8443	Cachoeira dos Antunes	MG
8446	Caete	MG
8450	Campestrinho	MG
8455	Canabrava	MG
8466	Caratinga	MG
8471	Catiara	MG
8476	Central de Minas	MG
8479	Cervo	MG
8486	Usina Monte Alegre	MG
8487	Valadares	MG
8493	Vargem Grande do Rio Pardo	MG
8494	Varzea da Palma	MG
8502	Vila Costina	MG
8515	Adao Colares	MG
8518	Aguas Ferreas	MG
8520	Alagoa	MG
8552	Argenita	MG
8559	Ataleia	MG
8560	Avai do Jacinto	MG
8577	Barra do Cuiete	MG
8588	Berizal	MG
8612	Buritizeiro	MG
8616	Cachoeira do Brumado	MG
8627	Campo do Meio	MG
8633	Canapolis	MG
8637	Canoeiros	MG
8651	Cassia	MG
8653	Catajas	MG
8660	Central de Santa Helena	MG
8661	Chacara	MG
8662	Chaveslandia	MG
8663	Chiador	MG
8664	Rio Doce	MG
8669	Abaete	MG
8675	Agua Boa	MG
8680	Aguas Formosas	MG
8681	Aiuruoca	MG
8683	Albertina	MG
8685	Alem Paraiba	MG
8703	Antonio Carlos	MG
8707	Arapua	MG
8736	Barreiro do Rio Verde	MG
8737	Barretos de Alvinopolis	MG
8741	Bau	MG
8744	Belo Oriente	MG
8774	Campolide	MG
8789	Carmopolis de Minas	MG
8808	Rio Novo	MG
8813	3 Pontas	MG
8817	Alberto Isaacson	MG
8820	Almenara	MG
8821	Alterosa	MG
8827	Alto Caparao	MG
8849	Aricanduva	MG
8856	Azurita	MG
8858	Balbinopolis	MG
8859	Barra Alegre	MG
8869	Belmiro Braga	MG
8873	Bertopolis	MG
8875	Bias Fortes	MG
8882	Bom Jardim de Minas	MG
8883	Bom Jesus do Madeira	MG
8885	Bom Pastor	MG
8887	Bonfinopolis de Minas	MG
8891	Brasopolis	MG
8892	Brejo Bonito	MG
8895	Buarque de Macedo	MG
8896	Bueno Brandao	MG
8898	Cacaratiba	MG
8917	Campos Altos	MG
8925	Capim Branco	MG
8932	Carmo de Minas	MG
8933	Carmo do Paranaiba	MG
8934	Casa Grande	MG
8937	Catuni	MG
8939	Caxambu	MG
8941	Centralina	MG
8946	Rio Piracicaba	MG
8956	Varzelandia	MG
8960	Vicosa	MG
8974	Abadia dos Dourados	MG
8990	Alvarenga	MG
9000	Andiroba	MG
9004	Antonio Ferreira	MG
9016	Arauna	MG
9045	Bentopolis de Minas	MG
9050	Bom Despacho	MG
9052	Bom Jesus de Cardosos	MG
9059	Brumal	MG
9060	Bueno	MG
9062	Caatinga	MG
9066	Cachoeirinha	MG
9068	Caiapo	MG
9081	Candeias	MG
9084	Cantagalo	MG
9092	Carmo da Cachoeira	MG
9095	Catas Altas da Noruega	MG
9119	Agua Viva	MG
9124	Alpercata	MG
9133	Andrequice	MG
9134	Angaturama	MG
9136	Angustura	MG
9143	Aristides Batista	MG
9148	Augusto de Lima	MG
9151	Baioes	MG
9154	Bandeira do Sul	MG
9155	Bandeirantes	MG
9171	Belo Vale	MG
9190	Brasilia de Minas	MG
9193	Bugre	MG
9196	Cachoeira de Minas	MG
9203	Cajuri	MG
9207	Campo Alegre de Minas	MG
9214	Caparao	MG
9217	Capitao Andrade	MG
9218	Capitao Eneas	MG
9220	Carangola	MG
9222	Cardeal Mota	MG
9226	Carmo do Rio Claro	MG
9227	Carneirinho	MG
9243	Rio Espera	MG
9261	Virginopolis	MG
9286	Aguas Vermelhas	MG
9290	Alto de Santa Helena	MG
9292	Altolandia	MG
9304	Aracuai	MG
9306	Araguari	MG
9307	Arceburgo	MG
9332	Barroso	MG
9341	Betim	MG
9342	Bicas	MG
9344	Boa Esperanca	MG
9345	Boa Familia	MG
9359	Buenopolis	MG
9367	Cacarema	MG
9378	Camacho	MG
9381	Campanha	MG
9399	Carrancas	MG
9413	Rio Melo	MG
9437	3 Coracoes	MG
9440	Abaiba	MG
9442	Acucena	MG
9444	Acurui	MG
9452	Alfredo Vasconcelos	MG
9465	Andradas	MG
9466	Andrelandia	MG
9470	Antonio Dias	MG
9471	Antonio Prado de Minas	MG
9499	Belisario	MG
9503	Bicuiba	MG
9511	Bom Sucesso de Patos	MG
9512	Brasilandia de Minas	MG
9513	Brejo do Amparo	MG
9521	Caetano Lopes	MG
9549	Capitolio	MG
9552	Caranaiba	MG
9553	Carioca	MG
9560	Catune	MG
9572	Rio Manso	MG
9574	Rio Pretinho	MG
88	Sapucaia	ES
124	Todos Os Santos	ES
187	Santissima Trindade	ES
219	Sao Jose de Mantenopolis	ES
309	Santa Terezinha	ES
315	Santo Agostinho	ES
334	Sao Jorge da Barra Seca	ES
347	Sao Mateus	ES
464	Sao Geraldo	ES
525	Timbui	ES
551	Santa Angelica	ES
562	Santa Luzia de Mantenopolis	ES
585	Sao Francisco Xavier do Guandu	ES
668	Rive	ES
717	Sao Jacinto	ES
727	Sao Jose do Sobradinho	ES
741	Sao Roque do Cannaa	ES
756	Serra Pelada	ES
850	Sao Tiago	ES
950	Santa Teresa	ES
980	Sao Joao de Petropolis	ES
981	Sao Joao de Vicosa	ES
986	Sao Jose das Torres	ES
996	Sao Pedro de Itabapoana	ES
1096	Sao Jorge do Tiradentes	ES
1168	Vargem Alta	ES
1181	Vila Valerio	ES
1191	Sagrada Familia	ES
1214	Santo Antonio do 15	ES
1217	Santo Antonio do Pousalegre	ES
1280	Sobreiro	ES
1313	Urania	ES
1343	Santo Antonio	ES
1347	Santo Antonio do Canaa	ES
1366	Sao Jorge do Oliveira	ES
1377	Sao Pedro	ES
1379	Sao Pedro de Rates	ES
1403	Sooretama	ES
1469	Santa Leopoldina	ES
1473	Santa Marta	ES
1492	Sao Francisco do Novo Brasil	ES
1496	Sao Joao do Sobrado	ES
1522	Serra	ES
1574	Vinhatico	ES
1597	Santo Antonio do Muqui	ES
1617	Sao Jose do Calcado	ES
1712	Santa Cruz	ES
1717	Santa Luzia do Azul	ES
1732	Sao Domingos do Norte	ES
1735	Sao Gabriel da Palha	ES
1809	Venda Nova do Imigrante	ES
1844	Santa Maria de Jetiba	ES
1985	Santa Julia	ES
1986	Santa Luzia do Norte	ES
2037	Sao Rafael	ES
2143	Montanha	ES
2195	Paulista	ES
2209	Piracema	ES
2234	Presidente Kennedy	ES
2245	Regencia	ES
2279	Marechal Floriano	ES
2364	Pendanga	ES
2443	Mangarai	ES
2556	Porto Barra do Riacho	ES
2592	Marataizes	ES
2600	Matilde	ES
2688	Pinheiros	ES
2700	Piuma	ES
2721	Laranja da Terra	ES
2858	Quilometro 14 do Mutum	ES
2928	Monte Carmelo do Rio Novo	ES
2930	Monte Sinai	ES
3013	Princesa	ES
3122	Pacotuba	ES
3173	Ponto Belo	ES
3241	Nova Verona	ES
3259	Pancas	ES
3339	Linhares	ES
3364	Mimoso do Sul	ES
3452	Praia Grande	ES
3589	Pequia	ES
3630	Lajinha	ES
3673	Menino Jesus	ES
3708	Nova Venecia	ES
3712	Novo Brasil	ES
3714	Novo Horizonte	ES
3731	Palmeira	ES
3752	Pedro Canario	ES
3759	Perdicao	ES
3779	Ponte de Itabapoana	ES
3809	Limoeiro	ES
3846	Muqui	ES
3857	Nova Canaa	ES
3884	Paraju	ES
4028	Paineiras	ES
4051	Piacu	ES
4071	Poranga	ES
4103	Rio Bananal	ES
4148	Mantenopolis	ES
4169	Melgaco	ES
4192	Nestor Gomes	ES
4325	Monte Pio	ES
4334	Mundo Novo	ES
4335	Muniz Freire	ES
4368	Palmerino	ES
4450	Marilandia	ES
4474	Mucurici	ES
4548	Pontoes	ES
4610	Djalma Coutinho	ES
4612	Dona America	ES
4616	Ecoporanga	ES
4711	Jaguare	ES
4768	Dores do Rio Preto	ES
4785	Estrela do Norte	ES
4846	Irundi	ES
4860	Iuna	ES
4893	Coqueiral	ES
4917	Divino Espirito Santo	ES
4953	Garrafao	ES
4960	Governador Lacerda de Aguiar	ES
4961	Graca Aranha	ES
4967	Guarana	ES
5017	Itaunas	ES
5026	Jacupemba	ES
5039	Joao Neiva	ES
5066	Corrego dos Monos	ES
5083	Divino de Sao Lourenco	ES
5142	Itaguacu	ES
5155	Jabaquara	ES
5170	Jeronimo Monteiro	ES
5179	Vargem Grande do Soturno	ES
5209	Conceicao do Castelo	ES
5264	Guacui	ES
5329	Jose Carlos	ES
5346	Vila Verde	ES
5356	Colatina	ES
5431	Gironda	ES
5459	Itaimbe	ES
5485	Joatuba	ES
5610	Imburana	ES
5670	Vieira Machado	ES
5720	Desengano	ES
5785	Ibitirui	ES
5801	Irupi	ES
5806	Itacu	ES
5808	Itaici	ES
5812	Itapecoa	ES
5822	Jacigua	ES
5840	Conceicao da Barra	ES
5887	Fartura	ES
5952	Itamira	ES
5956	Itaperuna	ES
5990	Conduru	ES
6018	Domingos Martins	ES
6048	Fundao	ES
6057	Governador Lindenberg	ES
6068	Guarapari	ES
6102	Itarana	ES
6167	Fazenda Guandu	ES
6204	Ibatiba	ES
6238	Itapina	ES
6270	Queimado	ES
6276	Riacho	ES
6390	Isabel	ES
6468	Conceicao do Muqui	ES
6481	Cotaxe	ES
6483	Cristal do Norte	ES
6556	Iconha	ES
6619	Ribeirao do Cristo	ES
6621	Rio Calcado	ES
6720	Guararema	ES
6730	Ibicaba	ES
6736	Ibitirama	ES
6757	Iriritiba	ES
6758	Itabaiana	ES
6775	Itauninhas	ES
6907	Itaipava	ES
6914	Itapemirim	ES
6934	Joacuba	ES
6988	Crubixa	ES
7044	Gruta	ES
7060	Ibiracu	ES
7063	Ibituba	ES
7090	Itaoca	ES
7154	Ararai	ES
7208	Cachoeiro de Itapemirim	ES
7284	Agha	ES
7303	Angelo Frechiani	ES
7351	Boa Esperanca	ES
7378	Camara	ES
7401	Cariacica	ES
7453	Alfredo Chaves	ES
7458	Alto Calcado	ES
7475	Araguaia	ES
7502	Barra de Novo Brasil	ES
7529	Bonsucesso	ES
7631	Alto Rio Novo	ES
7649	Apiaca	ES
7793	Aracruz	ES
7823	Barra Seca	ES
7835	Boapaba	ES
7904	Castelo	ES
7950	Aracui	ES
7978	Barra do Itapemirim	ES
8071	25 de Julho	ES
8126	Atilio Vivacqua	ES
8262	Barra de Sao Francisco	ES
8350	Viana	ES
8411	Bebedouro	ES
8484	Rio Preto	ES
8506	Vila Velha	ES
8526	Alto Santa Maria	ES
8544	Aracatiba	ES
8605	Brejetuba	ES
8619	Cachoeirinha de Itauna	ES
8684	Alegre	ES
8724	Baixo Guandu	ES
8760	Burarama	ES
8807	Rio Muqui	ES
8809	Rio Novo do Sul	ES
8826	Alto Caldeirao	ES
8841	Anutiba	ES
8844	Arace	ES
8863	Barra Nova	ES
8966	2 Barras	ES
8977	Afonso Claudio	ES
8981	Aguia Branca	ES
9150	Baia Nova	ES
9185	Bom Jesus do Norte	ES
9188	Braco do Rio	ES
9235	Celina	ES
9255	Vila Nova de Bananal	ES
9257	Vila Pavao	ES
9276	Acioli	ES
9282	Agua Doce do Norte	ES
9288	Airituba	ES
9295	Anchieta	ES
9372	Cafe	ES
9425	Vila Nelita	ES
9431	Vitoria	ES
9457	Alto Mutum Preto	ES
9496	Baunilha	ES
9528	Calogi	ES
12	Salinas da Margarida	BA
27	Santa Luzia	BA
43	Santo Antonio de Barcelona	BA
114	Taquarinha	BA
115	Tartaruga	BA
117	Teofilandia	BA
139	Ubaitaba	BA
154	Ruy Barbosa	BA
202	Sao Desiderio	BA
247	Serra Dourada	BA
260	Tanhacu	BA
261	Tapiraipe	BA
280	Tucano	BA
286	Uaua	BA
287	Ubiracaba	BA
290	Urandi	BA
369	Sitio do Quinto	BA
378	Teodoro Sampaio	BA
379	Teolandia	BA
393	Una	BA
396	Valenca	BA
408	Wanderley	BA
421	Salgadalia	BA
439	Santa Maria da Vitoria	BA
447	Santana do Sobrado	BA
449	Santiago do Iguape	BA
461	Sao Domingos	BA
487	Sao Timoteo	BA
491	Satiro Dias	BA
498	Serra do Ramalho	BA
502	Serrolandia	BA
507	Sitio Grande	BA
516	Tapiramuta	BA
517	Tapiranga	BA
581	Sao Felipe	BA
614	Sapeacu	BA
627	Sitio do Mato	BA
628	Sitio do Meio	BA
634	Tabocas do Brejo Velho	BA
660	Ubiraita	BA
694	Santa Rita de Cassia	BA
712	Sao Francisco do Conde	BA
716	Sao Goncalo dos Campos	BA
749	Saubara	BA
754	Senhor do Bonfim	BA
770	Tanque Novo	BA
774	Taquarendi	BA
783	Tremedal	BA
793	Salobrinho	BA
821	Sao Felix do Coribe	BA
842	Sao Miguel das Matas	BA
856	Saudavel	BA
857	Sebastiao Laranjeiras	BA
862	Serra da Canabrava	BA
873	Subauma	BA
880	Tanquinho do Poco	BA
890	Tijuacu	BA
905	Urucuca	BA
907	Utinga	BA
910	Varzea da Roca	BA
911	Varzea do Cerco	BA
913	Vereda	BA
922	Wenceslau Guimaraes	BA
959	Santanopolis	BA
979	Sao Joao da Fortaleza	BA
1022	Simoes Filho	BA
1034	Tamburil	BA
1039	Teixeira de Freitas	BA
1063	Santa Brigida	BA
1066	Santa Cruz da Vitoria	BA
1067	Santa Ines	BA
1078	Santaluz	BA
1102	Sao Jose do Prado	BA
1117	Saude	BA
1118	Seabra	BA
1137	Sussuarana	BA
1147	Tapuia	BA
1161	Ubata	BA
1162	Uibai	BA
1240	Sao Jose da Vitoria	BA
1263	Sao Sebastiao do Passe	BA
1289	Tagua	BA
1302	Tiquarucu	BA
1314	Rodelas	BA
1318	Saldanha	BA
1321	Salobro	BA
1335	Santa Terezinha	BA
1392	Sento Se	BA
1400	Sitio da Barauna	BA
1405	Souto Soares	BA
1416	Tapirama	BA
1441	Ubaira	BA
1465	Santa Cruz Cabralia	BA
1478	Santana	BA
1483	Santo Antonio de Jesus	BA
1493	Sao Gabriel	BA
1530	Soares	BA
1534	Taboleiro do Castro	BA
1537	Tanquinho	BA
1538	Taperoa	BA
1554	Triunfo do Sincora	BA
1558	Umbuzeiro	BA
1577	Xique Xique	BA
1585	Sambaiba	BA
1628	Sao Roque do Paraguacu	BA
1654	Tauape	BA
1691	Vila do Cafe	BA
1728	Santo Inacio	BA
1734	Sao Felix	BA
1752	Sao Paulinho	BA
1772	Serra Preta	BA
1778	Sobradinho	BA
1825	Wagner	BA
1856	Santo Estevao	BA
1883	Sao Jose do Rio Grande	BA
1912	Serrinha	BA
1950	Velha Boipeba	BA
1951	Ventura	BA
1963	Volta Grande	BA
1973	Salvador	BA
1975	Santa Barbara	BA
1992	Santo Amaro	BA
2014	Sao Joao da Vitoria	BA
2022	Sao Jose do Colonia	BA
2023	Sao Jose do Jacuipe	BA
2051	Sergi	BA
2054	Serra Grande	BA
2063	Sitio Novo	BA
2070	Taboquinhas	BA
2078	Terra Nova	BA
2093	Umburanas	BA
2101	Lajedo do Tabocal	BA
2113	Maetinga	BA
2114	Maiquinique	BA
2115	Mairi	BA
2154	Nage	BA
2173	Olhos D'agua do Seco	BA
2174	Olindina	BA
2176	Olivenca	BA
2233	Presidente Janio Quadros	BA
2280	Maria Quiteria	BA
2297	Mogiquicaba	BA
2307	Mulungu do Morro	BA
2324	Nova Fatima	BA
2340	Nucleo Residencial Pilar	BA
2345	Ouricuri do Ouro	BA
2413	Jussiape	BA
2423	Lagoa Real	BA
2434	Lucaia	BA
2437	Lustosa	BA
2439	Macurure	BA
2441	Malhada	BA
2445	Mantiba	BA
2448	Maragogipe	BA
2454	Mariquita	BA
2471	Monte Gordo	BA
2479	Mundo Novo	BA
2513	Palame	BA
2519	Paramirim	BA
2569	Lagoa Grande	BA
2609	Minas do Mimoso	BA
2612	Miranga	BA
2613	Mirante	BA
2626	Muquem do Sao Francisco	BA
2634	Nova Brasilia	BA
2635	Nova Canaa	BA
2639	Nova Itaipe	BA
2646	Novo Horizonte	BA
2649	Novo Triunfo	BA
2660	Paiol	BA
2661	Palmas de Monte Alto	BA
2669	Parateca	BA
2684	Picarrao	BA
2698	Piritiba	BA
2717	Jussari	BA
2743	Marcionilio Souza	BA
2752	Mascote	BA
2759	Miguel Calmon	BA
2760	Mimoso do Oeste	BA
2771	Morro das Flores	BA
2796	Olhos D'agua do Serafim	BA
2799	Ouricana	BA
2802	Palmeiras	BA
2833	Planaltino	BA
2852	Quaracu	BA
2854	Queimadas	BA
2856	Quijingue	BA
2862	Recife	BA
2865	Remedios	BA
2872	Jupagua	BA
2877	Lagoa Clara	BA
2881	Laje do Banco	BA
2883	Lajedinho	BA
2884	Lajedo Alto	BA
2885	Lapao	BA
2887	Largo	BA
2900	Malhada de Pedras	BA
2904	Mansidao	BA
2929	Monte Cruzeiro	BA
2942	Nordestina	BA
2963	Parafuso	BA
2967	Paratinga	BA
2981	Pedras Altas do Mirim	BA
2985	Peixe	BA
2991	Pindobacu	BA
3005	Porto Seguro	BA
3046	Lauro de Freitas	BA
3074	Medeiros Neto	BA
3083	Monte Reconcavo	BA
3091	Morro do Chapeu	BA
3097	Nazare	BA
3158	Pintadas	BA
3166	Pituba	BA
3169	Planalto	BA
3179	Lafaiete Coutinho	BA
3193	Macajuba	BA
3201	Maragogipinho	BA
3210	Matina	BA
3211	Matinha	BA
3214	Milagres	BA
3230	Nova Alegria	BA
3245	Oliveira dos Brejinhos	BA
3246	Onha	BA
3250	Ouricangas	BA
3271	Petim	BA
3274	Pimenteira	BA
3276	Pindai	BA
3300	Presidente Dutra	BA
3315	Ribeira do Amparo	BA
3331	Lagoa de Melquiades	BA
3334	Laje	BA
3360	Mataripe	BA
3366	Mirangaba	BA
3380	Mutuipe	BA
3422	Pe de Serra	BA
3431	Pinhoes	BA
3436	Pirajuia	BA
3439	Piri	BA
3442	Pocos	BA
3443	Pojuca	BA
3475	Juraci	BA
3480	Lajedao	BA
3484	Licinio de Almeida	BA
3501	Maricoabo	BA
3507	Mata de Sao Joao	BA
3530	Mutas	BA
3550	Nuguacu	BA
3575	Paripiranga	BA
3597	Pilao Arcado	BA
3618	Juremal	BA
3626	Lagoa do Boi	BA
3628	Lagoa Jose Luis	BA
3631	Lamarao do Passe	BA
3640	Madre de Deus	BA
3650	Mandiroba	BA
3656	Marcolino Moura	BA
3661	Massaroca	BA
3687	Morro de Sao Paulo	BA
3694	Narandiba	BA
3705	Nova Redencao	BA
3710	Nova Vicosa	BA
3729	Pajeu do Vento	BA
3744	Patamute	BA
3770	Pirai do Norte	BA
3817	Maniacu	BA
3819	Manoel Vitorino	BA
3836	Mocambo	BA
3844	Mucuri	BA
3845	Muniz Ferreira	BA
3860	Nova Itarana	BA
3893	Paulo Afonso	BA
3895	Pedrao	BA
3896	Pedro Alexandre	BA
3903	Piabanha	BA
3904	Piata	BA
3915	Polo Petroquimico de Camacari	BA
3964	Macarani	BA
3971	Mar Grande	BA
3996	Morrinhos	BA
4000	Mortugaba	BA
4013	Nova Soure	BA
4025	Oriente Novo	BA
4027	Ourolandia	BA
4058	Piragi	BA
4068	Pocoes	BA
4096	Riachao do Utinga	BA
4097	Riacho de Santana	BA
4106	Rio do Braco	BA
4116	Jussara	BA
4128	Limoeiro do Bom Viver	BA
4130	Livramento do Brumado	BA
4154	Marau	BA
4161	Massacara	BA
4184	Monte Santo	BA
4187	Mucuge	BA
4194	Nilo Pecanha	BA
4208	Novo Acre	BA
4213	Outeiro Redondo	BA
4263	Ponto Novo	BA
4289	Luis Viana	BA
4296	Mangue Seco	BA
4297	Maracas	BA
4306	Mata da Alianca	BA
4317	Mirandela	BA
4329	Morpara	BA
4342	Nova Ibia	BA
4345	Nova Lidice	BA
4381	Pau Brasil	BA
4404	Piraja	BA
4406	Piripa	BA
4410	Poco de Fora	BA
4413	Ponta da Areia	BA
4420	Km 7	BA
4422	Lagoa Preta	BA
4427	Lamarao	BA
4432	Lencois	BA
4438	Macaubas	BA
4460	Minas do Espirito Santo	BA
4477	Muritiba	BA
4524	Pataiba	BA
4525	Pau A Pique	BA
4543	Poco Central	BA
4556	Prado	BA
4578	Cocos	BA
4590	Coquinhos	BA
4597	Crisopolis	BA
4600	Cruz das Almas	BA
4606	Diogenes Sampaio	BA
4642	Gabiarra	BA
4658	Guapira	BA
4677	Igua	BA
4691	Itacava	BA
4702	Itiuba	BA
4724	Jose Goncalves	BA
4728	Cicero Dantas	BA
4737	Conceicao do Coite	BA
4740	Coracao de Maria	BA
4758	Dias Coelho	BA
4775	Engenheiro Pontes	BA
4823	Ibicarai	BA
4824	Ibiquera	BA
4826	Ibirataia	BA
4834	Iguai	BA
4853	Itamira	BA
4868	Jequie	BA
4892	Copixaba	BA
4895	Cordeiros	BA
4937	Feira de Santana	BA
4946	Formosa do Rio Preto	BA
4951	Galeao	BA
4958	Gongogi	BA
4974	Guine	BA
4978	Ibiraba	BA
4985	Iguitu	BA
4994	Inhata	BA
5000	Irundiara	BA
5004	Itaberaba	BA
5012	Itapicuru	BA
5014	Itapirema	BA
5021	Jaborandi	BA
5038	Joao Amaro	BA
5044	Chorrocho	BA
5056	Condeuba	BA
5082	Dias D Avila	BA
5128	Ibotirama	BA
5133	Ilha de Mare	BA
5135	Inubia	BA
5158	Jacobina	BA
5161	Jaguaquara	BA
5167	Jaua	BA
5178	Valente	BA
5181	Varzea do Caldas	BA
5207	Conceicao da Feira	BA
5210	Conceicao do Jacuipe	BA
5211	Conde	BA
5225	Cunhangi	BA
5228	Dario Meira	BA
5229	Delfino	BA
5260	Gloria	BA
5271	Guirapa	BA
5278	Ibiacu	BA
5280	Ibitiguira	BA
5281	Ico	BA
5293	Ipucaba	BA
5296	Iraporanga	BA
5300	Itacare	BA
5304	Itaia	BA
5307	Itanagra	BA
5310	Itapetinga	BA
5313	Itatingui	BA
5320	Jaguaripe	BA
5321	Japomirim	BA
5357	Colonia	BA
5368	Coronel Joao Sa	BA
5376	Coutos	BA
5446	Igapora	BA
5454	Ipiuna	BA
5456	Irece	BA
5458	Itabuna	BA
5461	Itanhem	BA
5467	Itapura	BA
5468	Itati	BA
5470	Itirucu	BA
5475	Jacu	BA
5515	Cipo	BA
5549	Elisio Medrado	BA
5568	Filadelfia	BA
5578	Gentio do Ouro	BA
5593	Helvecia	BA
5613	Inema	BA
5622	Itaete	BA
5623	Itagiba	BA
5631	Ituacu	BA
5638	Jaiba	BA
5653	Juazeiro	BA
5654	Juerana	BA
5658	Vale Verde	BA
5666	Vera Cruz	BA
5693	Corta Mao	BA
5704	Crussai	BA
5711	Cumuruxatiba	BA
5727	Dom Basilio	BA
5751	Feira da Mata	BA
5761	Gamboa	BA
5762	Gandu	BA
5765	Geolandia	BA
5770	Guagirus	BA
5772	Guanambi	BA
5774	Guarajuba	BA
5780	Hidrolandia	BA
5787	Iguaibi	BA
5796	Ipira	BA
5805	Itabela	BA
5814	Itapitanga	BA
5817	Itarantim	BA
5821	Jacaraci	BA
5830	Junco	BA
5839	Comercio	BA
5876	Encruzilhada	BA
5879	Erico Cardoso	BA
5885	Esplanada	BA
5925	Guerem	BA
5932	Ibicoara	BA
5933	Ibiraja	BA
5943	Ipupiara	BA
5972	Jequirica	BA
5975	Joao Dourado	BA
6062	Guai	BA
6069	Guaratinga	BA
6072	Ibatui	BA
6073	Ibiassuce	BA
6076	Ibirapitanga	BA
6082	Iguira	BA
6085	Indai	BA
6087	Inhobim	BA
6090	Irajuba	BA
6091	Irara	BA
6094	Itagi	BA
6097	Itaparica	BA
6099	Itapora	BA
6104	Itubera	BA
6126	Jucurucu	BA
6145	Cravolandia	BA
6146	Cristopolis	BA
6147	Curral Falso	BA
6173	Floresta Azul	BA
6189	Governador Joao Durval Carneiro	BA
6194	Guajeru	BA
6201	Heliopolis	BA
6207	Ibipitanga	BA
6212	Ichu	BA
6215	Igarite	BA
6216	Igrapiuna	BA
6217	Iguatemi	BA
6222	Ipiau	BA
6226	Iraquara	BA
6229	Ita Azul	BA
6234	Itajubaquara	BA
6235	Itajuipe	BA
6237	Itapeipu	BA
6240	Itaquarai	BA
6264	Prevenido	BA
6331	Euclides da Cunha	BA
6349	Franca	BA
6357	Gaviao	BA
6370	Ibiapora	BA
6371	Ibiranhem	BA
6372	Ibirapua	BA
6374	Ibitira	BA
6375	Igatu	BA
6382	Inhambupe	BA
6383	Ipecaeta	BA
6389	Iramaia	BA
6394	Itachama	BA
6398	Itajai	BA
6399	Itaju do Colonia	BA
6408	Itupeva	BA
6429	Potiragua	BA
6444	Remanso	BA
6445	Riachao do Jacuipe	BA
6448	Ribeirao do Largo	BA
6456	Rio do Pires	BA
6467	Conceicao do Almeida	BA
6496	Dona Maria	BA
6549	Ibicui	BA
6553	Ibitita	BA
6554	Ibitupa	BA
6568	Itagimirim	BA
6572	Itamaraju	BA
6574	Itape	BA
6578	Itatim	BA
6581	Itororo	BA
6583	Iuiu	BA
6589	Jandaira	BA
6599	Porto Novo	BA
6601	Poxim do Sul	BA
6617	Riacho da Guia	BA
6622	Rio da Dona	BA
6636	Contendas do Sincora	BA
6638	Coribe	BA
6643	Correntina	BA
6661	Descoberto	BA
6670	Engenheiro Franca	BA
6678	Fatima	BA
6697	Gameleira do Assurua	BA
6727	Iacu	BA
6732	Ibipetum	BA
6735	Ibitiara	BA
6738	Ibo	BA
6741	Igara	BA
6759	Itacimirim	BA
6761	Itaguacu da Bahia	BA
6762	Itaibo	BA
6763	Itaitu	BA
6764	Itajuru	BA
6766	Itambe	BA
6768	Itapebi	BA
6781	Jacuipe	BA
6790	Jiribatuba	BA
6791	Jitauna	BA
6797	Juacema	BA
6815	Coqueiros	BA
6835	Dom Macedo Costa	BA
6845	Eunapolis	BA
6855	Firmino Alves	BA
6861	Gameleira da Lapa	BA
6879	Humildes	BA
6884	Ibipeba	BA
6891	Ilheus	BA
6896	Inhaumas	BA
6910	Itamari	BA
6912	Itamotinga	BA
6931	Japu	BA
6933	Jeremoabo	BA
6935	Joao Correia	BA
6947	Posto da Mata	BA
6957	Quixaba	BA
6963	Riachao das Neves	BA
6968	Rio de Contas	BA
6971	Coaraci	BA
6984	Cotegipe	BA
6986	Cristalandia	BA
6992	Curaca	BA
7013	Entre Rios	BA
7026	Filanesia	BA
7042	Governador Mangabeira	BA
7052	Gurupa Mirim	BA
7056	Ibiajara	BA
7064	Ibitunane	BA
7083	Itaipu	BA
7088	Itanage	BA
7089	Itanhi	BA
7095	Itaquara	BA
7106	Jacuruna	BA
7107	Jaguara	BA
7109	Jaguarari	BA
7132	Alegre	BA
7149	Araci	BA
7151	Aramari	BA
7168	Barcelos do Sul	BA
7170	Barra do Tarrachil	BA
7178	Biritinga	BA
7201	Brejoes	BA
7211	Caimbe	BA
7212	Camamu	BA
7232	Capim Grosso	BA
7238	Caripare	BA
7265	Retirolandia	BA
7280	Abare	BA
7300	Amelia Rodrigues	BA
7304	Anguera	BA
7306	Antas	BA
7313	Aracatu	BA
7331	Baixa Grande	BA
7334	Banzae	BA
7358	Bom Jesus da Lapa	BA
7375	Caldeiras	BA
7389	Candeias	BA
7395	Caraibas	BA
7407	Catolandia	BA
7420	Presidente Tancredo Neves	BA
7470	Antonio Goncalves	BA
7472	Apora	BA
7488	Argolo	BA
7513	Barro Alto	BA
7514	Bate Pe	BA
7537	Buris de Abrantes	BA
7543	Cabralia	BA
7545	Caete Acu	BA
7547	Caldeirao Grande	BA
7554	Campo Alegre de Lourdes	BA
7559	Candeal	BA
7573	Catingal	BA
7574	Catu	BA
7587	Quixabeira	BA
7588	Rafael Jambeiro	BA
7595	Riacho Seco	BA
7596	Ribeira do Pombal	BA
7598	Ribeirao do Salto	BA
7606	Rio do Antonio	BA
7610	Abaira	BA
7623	Alagoinhas	BA
7626	Almadina	BA
7638	America Dourada	BA
7642	Andarai	BA
7680	Barracas	BA
7688	Bendego	BA
7705	Brejolandia	BA
7708	Buracica	BA
7717	Cafarnaum	BA
7720	Caldeirao	BA
7739	Caraibuna	BA
7756	Abobora	BA
7757	Acu da Torre	BA
7768	Algodao	BA
7770	Algodoes	BA
7791	Apuarema	BA
7801	Argoim	BA
7811	Baixinha	BA
7818	Barra do Choca	BA
7821	Barra do Rocha	BA
7831	Boa Uniao	BA
7834	Boa Vista do Tupim	BA
7849	Boninal	BA
7856	Brotas de Macaubas	BA
7863	Cacha Pregos	BA
7886	Candido Sales	BA
7890	Cansancao	BA
7919	Abrantes	BA
7921	Acupe	BA
7922	Afranio Peixoto	BA
7938	Amargosa	BA
7958	Arembepe	BA
7967	Aurelino Leal	BA
7981	Barro Preto	BA
7987	Belem da Cachoeira	BA
7999	Bom Sossego	BA
8001	Bonito	BA
8010	Caatiba	BA
8018	Caetanos	BA
8025	Camacan	BA
8031	Campinhos	BA
8037	Candiba	BA
8046	Cardeal da Silva	BA
8048	Carinhanha	BA
8053	Carrapichel	BA
8058	Castro Alves	BA
8065	Ceraima	BA
8070	2 Barras do Morro	BA
8085	Aiquara	BA
8087	Alcobaca	BA
8100	Angico	BA
8120	Aribice	BA
8135	Barra do Pojuca	BA
8143	Barrocas	BA
8150	Bento Simoes	BA
8161	Bonfim da Feira	BA
8165	Brejinho das Ametistas	BA
8170	Cachoeira	BA
8174	Cacule	BA
8197	Canto do Sol	BA
8235	Americo Alves	BA
8237	Anage	BA
8247	Areias	BA
8256	Baixao	BA
8257	Banco Central	BA
8259	Bandiacu	BA
8273	Boa Nova	BA
8292	Buranhem	BA
8298	Caem	BA
8304	Caldas do Jorro	BA
8307	Camacari	BA
8339	Catu de Abrantes	BA
8367	Abelhas	BA
8410	Batinga	BA
8415	Boa Espera	BA
8418	Boca do Corrego	BA
8456	Canabravinha	BA
8458	Canavieiras	BA
8472	Catinga do Moura	BA
8473	Catoles	BA
8517	Adustina	BA
8535	Angical	BA
8564	Baixa do Palmeira	BA
8566	Banco da Vitoria	BA
8578	Barra do Mendes	BA
8586	Bem Bom	BA
8594	Boa Vista do Lagamar	BA
8598	Bom Jesus da Serra	BA
8602	Botupora	BA
8603	Botuquara	BA
8607	Brumado	BA
8610	Buril	BA
8634	Canarana	BA
8635	Canche	BA
8638	Canudos	BA
8643	Caraiva	BA
8647	Caravelas	BA
8659	Central	BA
8673	Afligidos	BA
8677	Agua Doce	BA
8710	Arataca	BA
8711	Aratuipe	BA
8738	Bastiao	BA
8743	Belmonte	BA
8766	Cabaceiras do Paraguacu	BA
8776	Camurugi	BA
8785	Caraguatai	BA
8791	Carnaiba do Sertao	BA
8816	Agua Fria	BA
8831	Amado Bahia	BA
8832	Amaniu	BA
8838	Antonio Cardoso	BA
8899	Cachoeira do Mato	BA
8903	Caicara	BA
8905	Caiubi	BA
8922	Capao	BA
8938	Caturama	BA
8954	Varzea do Poco	BA
8955	Varzedo	BA
8979	Aguas do Paulista	BA
8988	Alto Bonito	BA
9008	Aracas	BA
9033	Baraunas	BA
9038	Barreiras	BA
9048	Boacu	BA
9057	Brejo da Serra	BA
9058	Brejo Luiza de Brito	BA
9078	Campo Formoso	BA
9107	Rio do Meio	BA
9108	Rio Fundo	BA
9132	Andorinha	BA
9153	Bandeira do Colonia	BA
9160	Barra do Jacuipe	BA
9168	Bela Flor	BA
9191	Bucuituba	BA
9201	Cairu	BA
9210	Canapolis	BA
9215	Capela do Alto Alegre	BA
9263	Vitoria da Conquista	BA
9271	5 Rios	BA
9274	Acajutiba	BA
9308	Aritagua	BA
9318	Baianopolis	BA
9324	Bandeira do Almada	BA
9328	Barra	BA
9329	Barra da Estiva	BA
9337	Belo Campo	BA
9354	Boquira	BA
9358	Brejo Novo	BA
9360	Buerarema	BA
9371	Caetite	BA
9379	Camassandi	BA
9380	Camirim	BA
9385	Canatiba	BA
9386	Canoao	BA
9395	Caraipe	BA
9401	Casa Nova	BA
9404	Castelo Novo	BA
9406	Catolezinho	BA
9414	Rio Real	BA
9419	Varzea Nova	BA
9420	Varzeas	BA
9439	Abadia	BA
9443	Acudina	BA
9476	Arapiranga	BA
9488	Baluarte	BA
9494	Barro Vermelho	BA
9515	Buritirama	BA
9525	Cajui	BA
9561	Cavunge	BA
18	Santa Cruz de Goias	GO
31	Santa Rita do Novo Destino	GO
62	Sao Joao D'alianca	GO
75	Sao Luiz do Norte	GO
135	Tupiracaba	GO
137	Turvania	GO
153	Rubiataba	GO
161	Sanclerlandia	GO
169	Santa Helena de Goias	GO
180	Santa Tereza de Goias	GO
317	Santo Antonio da Barra	GO
330	Sao Joao da Parauna	GO
355	Sao Sebastiao do Rio Claro	GO
417	Rosalandia	GO
476	Sao Miguel do Passa 4	GO
477	Sao Patricio	GO
520	Taveira	GO
539	Uruacu	GO
540	Riverlandia	GO
578	Santo Antonio do Rio Verde	GO
617	Sarandi	GO
671	Rodrigues Nascimento	GO
677	Santa Barbara de Goias	GO
679	Santa Cruz das Lajes	GO
683	Santa Fe de Goias	GO
753	Senador Canedo	GO
773	Taquaral de Goias	GO
837	Sao Luiz do Tocantins	GO
899	Trombas	GO
940	Santa Isabel	GO
952	Santa Terezinha de Goias	GO
1052	Rio Verde	GO
1075	Santa Rosa de Goias	GO
1089	Sao Francisco de Goias	GO
1253	Sao Miguel do Araguaia	GO
1284	Sousania	GO
1332	Santa Rita do Araguaia	GO
1355	Sao Domingos	GO
1383	Sao Simao	GO
1428	Teresina de Goias	GO
1432	Trindade	GO
1524	Serra Dourada	GO
1525	Serranopolis	GO
1569	Vianopolis	GO
1643	Simolandia	GO
1675	Uirapuru	GO
1679	Uruita	GO
1686	Varjao	GO
1749	Sao Luis de Montes Belos	GO
1776	Sitio D'abadia	GO
1792	Terezopolis de Goias	GO
1798	Turvelandia	GO
1804	Uruana	GO
1817	Vila Sertaneja	GO
1866	Sao Gabriel de Goias	GO
1903	Sao Vicente	GO
1927	Termas do Itaja	GO
1989	Santa Rosa	GO
1995	Santo Antonio de Goias	GO
1998	Santo Antonio do Descoberto	GO
2010	Sao Joao	GO
2059	Silvania	GO
2131	Maurilandia	GO
2136	Mimoso de Goias	GO
2180	Palestina de Goias	GO
2200	Petrolina de Goias	GO
2211	Pires do Rio	GO
2241	Quirinopolis	GO
2262	Lagolandia	GO
2313	Mutunopolis	GO
2321	Nova Aurora	GO
2410	Rio Quente	GO
2462	Minacu	GO
2476	Mossamedes	GO
2489	Nova America	GO
2514	Palminopolis	GO
2531	Pedra Branca	GO
2538	Piloandia	GO
2541	Piranhas	GO
2561	Jussara	GO
2602	Matrincha	GO
2624	Mundo Novo	GO
2664	Palmelo	GO
2868	Rianapolis	GO
2949	Novo Planalto	GO
2990	Pilar de Goias	GO
3002	Porangatu	GO
3061	Mambai	GO
3070	Marzagao	GO
3086	Montividiu	GO
3088	Morro Agudo de Goias	GO
3106	Nova Gloria	GO
3119	Ouro Verde de Goias	GO
3123	Padre Bernardo	GO
3178	Juscelino Kubitschek	GO
3227	Mozarlandia	GO
3243	Novo Gama	GO
3252	Ouroana	GO
3288	Planaltina	GO
3351	Mara Rosa	GO
3374	Montividiu do Norte	GO
3392	Nova Crixas	GO
3396	Novo Brasil	GO
3410	Palmeiras de Goias	GO
3448	Porteirao	GO
3465	Rialma	GO
3512	Messianopolis	GO
3542	Nova Iguacu de Goias	GO
3604	Pires Belo	GO
3636	Lucilandia	GO
3644	Mairipotaba	GO
3684	Morrinhos	GO
3709	Nova Veneza	GO
3719	Olaria do Angico	GO
3724	Ouvidor	GO
3740	Parauna	GO
3769	Piracanjuba	GO
3778	Pontalina	GO
3784	Portelandia	GO
3807	Leopoldo de Bulhoes	GO
3849	Natinopolis	GO
3852	Niquelandia	GO
3872	Orizona	GO
3899	Perolandia	GO
3927	Posse	GO
3953	Lagoa do Bauzinho	GO
3963	Luziania	GO
3993	Monte Alegre de Goias	GO
4005	Nazario	GO
4021	Olhos D'agua	GO
4206	Nova Roma	GO
4224	Panama	GO
4272	Juscelandia	GO
4299	Marcianopolis	GO
4308	Meia Ponte	GO
4313	Mineiros	GO
4320	Moipora	GO
4326	Montes Claros de Goias	GO
4338	Neropolis	GO
4512	Paranaiguara	GO
4526	Pau Terra	GO
4541	Pirenopolis	GO
4561	Professor Jamil	GO
4661	Guaraita	GO
4667	Hidrolina	GO
4685	Interlandia	GO
4718	Jesupolis	GO
4727	Cibele	GO
4743	Corrego Rico	GO
4748	Cristianopolis	GO
4749	Crominia	GO
4772	Edeia	GO
4803	Geriacu	GO
4847	Itaberai	GO
4879	Cidade Ocidental	GO
4904	Cristalina	GO
4912	Davinopolis	GO
4933	Faina	GO
4956	Goianesia	GO
5009	Itaja	GO
5013	Itapirapua	GO
5072	Crixas	GO
5074	Cruzeiro do Norte	GO
5095	Fazenda Nova	GO
5163	Jatai	GO
5258	Gameleira de Goias	GO
5288	Indiara	GO
5290	Inhumas	GO
5322	Jaragua	GO
5334	Valdelandia	GO
5374	Corumba de Goias	GO
5390	Domiciano Ribeiro	GO
5415	Flores de Goias	GO
5537	Damianopolis	GO
5538	Davidopolis	GO
5543	Diolandia	GO
5580	Goiatuba	GO
5617	Ipora	GO
5647	Jaupaci	GO
5694	Corumbaiba	GO
5723	Diorama	GO
5756	Formosa	GO
5807	Itaguaru	GO
5815	Itapuranga	GO
5900	Formoso	GO
5912	Goialandia	GO
5913	Goianira	GO
5942	Ipameri	GO
5946	Israelandia	GO
5963	Itumbiara	GO
5967	Jandaia	GO
5978	Joviania	GO
5980	Choupana	GO
5985	Cocalzinho de Goias	GO
5986	Colinas do Sul	GO
6031	Estrela do Norte	GO
6039	Firminopolis	GO
6118	Jeroaquara	GO
6122	Joanapolis	GO
6129	Cirilandia	GO
6200	Heitorai	GO
6220	Inaciolandia	GO
6230	Itaguari	GO
6361	Guapo	GO
6363	Guarani de Goias	GO
6364	Guarinos	GO
6403	Itaruma	GO
6490	Damolandia	GO
6527	Forte	GO
6537	Goiania	GO
6547	Hidrolandia	GO
6641	Corrego do Ouro	GO
6704	Goiandira	GO
6705	Goias	GO
6832	Divinopolis de Goias	GO
6838	Edealina	GO
6865	Goianapolis	GO
6880	Iaciara	GO
6922	Itaucu	GO
6946	Posse D'abadia	GO
6991	Cumari	GO
7007	Doverlandia	GO
7041	Gouvelandia	GO
7081	Itaguacu	GO
7091	Itapaci	GO
7098	Ivolandia	GO
7102	Jacilandia	GO
7142	Aparecida	GO
7163	Avelinopolis	GO
7220	Campo Limpo	GO
7279	Abadia de Goias	GO
7309	Apore	GO
7323	Arenopolis	GO
7324	Aruana	GO
7328	Bacilandia	GO
7343	Barro Alto	GO
7430	Registro do Araguaia	GO
7539	Buriti Alegre	GO
7580	Ceres	GO
7646	Aparecida de Goias	GO
7685	Bela Vista de Goias	GO
7709	Buriti de Goias	GO
7751	Cebrasa	GO
7773	Alto Alvorada	GO
7781	Amaralina	GO
7794	Aracu	GO
7864	Cachoeira de Goias	GO
7924	Agua Fria de Goias	GO
7931	Aloandia	GO
7976	Bandeirantes	GO
8016	Cacu	GO
8030	Campinacu	GO
8035	Cana Brava	GO
8057	Castrinopolis	GO
8092	Alto Horizonte	GO
8094	Alto Paraiso de Goias	GO
8111	Aragoiania	GO
8192	Canada	GO
8227	Alexania	GO
8241	Aparecida do Rio Claro	GO
8293	Buritinopolis	GO
8305	Caldazinha	GO
8312	Campinorte	GO
8328	Carmo do Rio Verde	GO
8333	Castelandia	GO
8337	Catalao	GO
8355	Vila Propicio	GO
8362	3 Ranchos	GO
8368	Acreuna	GO
8374	Aguas Lindas de Goias	GO
8384	Anicuns	GO
8422	Bom Jesus de Goias	GO
8428	Bonopolis	GO
8434	Brazabrantes	GO
8453	Campolandia	GO
8474	Cavalcante	GO
8490	Valparaiso de Goias	GO
8501	Vila Boa	GO
8516	Adelandia	GO
8533	Amorinopolis	GO
8534	Anapolis	GO
8571	Barbosilandia	GO
8615	Cabeceiras	GO
8621	Caicara	GO
8694	Alvorada do Norte	GO
8696	Americano do Brasil	GO
8721	Aurilandia	GO
8725	Baliza	GO
8753	Bom Jardim de Goias	GO
8758	Britania	GO
8771	Caldas Novas	GO
8804	Chapadao do Ceu	GO
8909	Calixto	GO
8915	Campo Alegre de Goias	GO
8928	Caraiba	GO
8950	Urutai	GO
8951	Uva	GO
9005	Aparecida de Goiania	GO
9011	Araguapaz	GO
9023	Auriverde	GO
9054	Bonfinopolis	GO
9064	Cachoeira Alta	GO
9075	Campestre de Goias	GO
9192	Buenolandia	GO
9199	Caiaponia	GO
9216	Capelinha	GO
9232	Caturai	GO
9249	Vicentinopolis	GO
9272	Abadiania	GO
9283	Agua Limpa	GO
9298	Anhanguera	GO
9305	Aragarcas	GO
9407	Cavalheiro	GO
9411	Cezarina	GO
9473	Aparecida do Rio Doce	GO
9520	Cachoeira Dourada	GO
9526	Calcilandia	GO
9538	Campos Belos	GO
9539	Campos Verdes	GO
\.


--
-- Data for Name: _ckeditor; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _ckeditor (_id, _name, _mimetype, _size, _user, _create, _update, _hash) FROM stdin;
\.


--
-- Name: _ckeditor__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_ckeditor__id_seq', 1, false);


--
-- Data for Name: _cloud; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _cloud (_id, _code, _name, _mimetype, _size, _counter, _user, _create, _update, _author, _devise, _change, _ready, _deleted) FROM stdin;
\.


--
-- Name: _cloud__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_cloud__id_seq', 1, false);


--
-- Data for Name: _contact; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _contact (_id, _send_date, _responser, _response_date, _responsed, _response, _actor_name, _actor_email, _actor_subject, _actor_message) FROM stdin;
\.


--
-- Name: _contact__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_contact__id_seq', 1, false);


--
-- Name: _disambiguation; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_disambiguation', 1, false);


--
-- Data for Name: _file; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _file (_id, _name, _mimetype, _size, _description, _create_date, _user, _counter, _public, _hash) FROM stdin;
\.


--
-- Name: _file__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_file__id_seq', 1, false);


--
-- Data for Name: _group; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _group (_id, _name, _description, _admin, _chat) FROM stdin;
1	Administradores	\N	1	1
\.


--
-- Name: _group__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_group__id_seq', 1, false);


--
-- Data for Name: _instance; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _instance (_unix, _name, _description, _logo, _user, _create, _update) FROM stdin;
\.


--
-- Data for Name: _mail; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _mail (_name, _group) FROM stdin;
\.


--
-- Data for Name: _media; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _media (_id, _name, _mimetype, _size, _description, _insert, _update, _user) FROM stdin;
\.


--
-- Name: _media__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_media__id_seq', 1, false);


--
-- Data for Name: _mobile; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _mobile (_id, _pk, _user, _create, _update, _name, _access, _counter, _gcm) FROM stdin;
\.


--
-- Name: _mobile__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_mobile__id_seq', 1, false);


--
-- Data for Name: _note; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _note (_id, _code, _title, _note, _longitude, _latitude, _altitude, _user, _create, _update, _author, _change, _devise, _deleted) FROM stdin;
\.


--
-- Name: _note__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_note__id_seq', 1, false);


--
-- Data for Name: _note_media; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _note_media (_id, _code, _note, _type, _user, _create, _update, _longitude, _latitude, _altitude, _deleted, _date, _file) FROM stdin;
\.


--
-- Name: _note_media__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_note_media__id_seq', 1, false);


--
-- Data for Name: _permission; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _permission (_name, _group) FROM stdin;
\.


--
-- Data for Name: _rss; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _rss (_id, _url, _column_index, _height, _number, _minutes, _user) FROM stdin;
\.


--
-- Name: _rss__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_rss__id_seq', 1, false);


--
-- Data for Name: _simple; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _simple (_id, _content, _user, _update_date) FROM stdin;
\.


--
-- Data for Name: _state; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _state (_uf, _name, _region) FROM stdin;
SP	São Paulo	Sudeste
TO	Tocantins	Norte
SE	Sergipe	Nordeste
AL	Alagoas	Nordeste
PE	Pernambuco	Nordeste
PB	Paraíba	Nordeste
RN	Rio Grande do Norte	Nordeste
CE	Ceará	Nordeste
MA	Maranhão	Nordeste
PA	Pará	Norte
AP	Amapá	Norte
RJ	Rio de Janeiro	Sudeste
RR	Roraima	Norte
AM	Amazonas	Norte
AC	Acre	Norte
PI	Piauí	Nordeste
MT	Mato Grosso	Centro Oeste
MS	Mato Grosso do Sul	Centro Oeste
RO	Rondonia	Norte
DF	Distrito Federal	Centro Oeste
RS	Rio Grande do Sul	Sul
SC	Santa Catarina	Sul
PR	Paraná	Sul
MG	Minas Gerais	Sudeste
ES	Espírito Santo	Sudeste
BA	Bahia	Nordeste
GO	Goias	Centro Oeste
\.


--
-- Data for Name: _type_group; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _type_group (_type, _group) FROM stdin;
\.


--
-- Data for Name: _user; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _user (_id, _name, _login, _password, _active, _email, _deleted, _type, _language, _create_date, _update_date, _last_logon, _alert, _timezone, _google, _facebook, street, number, quarter, cep, city, state, phone, mobile, complement, msn, skype, photo, url, orkut, cpf, birth_date, gender, marriage) FROM stdin;
1	Administrador	admin	d033e22ae348aeb5660fc2140aec35850c4da997	1		0	manager	pt_BR	2016-03-29 13:00:22.579003-04	2016-03-29 13:00:22.579003-04	2016-03-29 13:00:22.579003-04	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	_M_	_OTHER_
\.


--
-- Name: _user__id_seq; Type: SEQUENCE SET; Schema: titan; Owner: -
--

SELECT pg_catalog.setval('_user__id_seq', 1, false);


--
-- Data for Name: _user_group; Type: TABLE DATA; Schema: titan; Owner: -
--

COPY _user_group (_group, _user) FROM stdin;
1	1
\.


--
-- Name: _alert_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _alert
    ADD CONSTRAINT _alert_idx UNIQUE (_template, _assign);


--
-- Name: _alert_mail_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _alert_mail
    ADD CONSTRAINT _alert_mail_idx PRIMARY KEY (_alert, _trigger);


--
-- Name: _alert_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _alert
    ADD CONSTRAINT _alert_pkey PRIMARY KEY (_id);


--
-- Name: _alert_user_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _alert_user
    ADD CONSTRAINT _alert_user_idx PRIMARY KEY (_alert, _user);


--
-- Name: _browser__user_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _browser
    ADD CONSTRAINT _browser__user_key UNIQUE (_user);


--
-- Name: _browser_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _browser
    ADD CONSTRAINT _browser_pkey PRIMARY KEY (_id);


--
-- Name: _city_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _city
    ADD CONSTRAINT _city_pkey PRIMARY KEY (_id);


--
-- Name: _ckeditor_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _ckeditor
    ADD CONSTRAINT _ckeditor_pkey PRIMARY KEY (_id);


--
-- Name: _cloud__code_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _cloud
    ADD CONSTRAINT _cloud__code_key UNIQUE (_code);


--
-- Name: _cloud_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _cloud
    ADD CONSTRAINT _cloud_pkey PRIMARY KEY (_id);


--
-- Name: _contact_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _contact
    ADD CONSTRAINT _contact_pkey PRIMARY KEY (_id);


--
-- Name: _file_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _file
    ADD CONSTRAINT _file_pkey PRIMARY KEY (_id);


--
-- Name: _group_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _group
    ADD CONSTRAINT _group_pkey PRIMARY KEY (_id);


--
-- Name: _group_type_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _type_group
    ADD CONSTRAINT _group_type_idx PRIMARY KEY (_group, _type);


--
-- Name: _instance_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _instance
    ADD CONSTRAINT _instance_pkey PRIMARY KEY (_unix);


--
-- Name: _mail_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _mail
    ADD CONSTRAINT _mail_idx PRIMARY KEY (_group, _name);


--
-- Name: _media_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _media
    ADD CONSTRAINT _media_pkey PRIMARY KEY (_id);


--
-- Name: _mobile_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _mobile
    ADD CONSTRAINT _mobile_pkey PRIMARY KEY (_id);


--
-- Name: _note_code_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _note
    ADD CONSTRAINT _note_code_key UNIQUE (_code);


--
-- Name: _note_media__code_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media__code_key UNIQUE (_code);


--
-- Name: _note_media__file_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media__file_key UNIQUE (_file);


--
-- Name: _note_media_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media_pkey PRIMARY KEY (_id);


--
-- Name: _note_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _note
    ADD CONSTRAINT _note_pkey PRIMARY KEY (_id);


--
-- Name: _permission_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _permission
    ADD CONSTRAINT _permission_idx PRIMARY KEY (_group, _name);


--
-- Name: _simple_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _simple
    ADD CONSTRAINT _simple_pkey PRIMARY KEY (_id);


--
-- Name: _state_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _state
    ADD CONSTRAINT _state_pkey PRIMARY KEY (_uf);


--
-- Name: _user__email_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user__email_key UNIQUE (_email);


--
-- Name: _user__facebook_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user__facebook_key UNIQUE (_facebook);


--
-- Name: _user__google_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user__google_key UNIQUE (_google);


--
-- Name: _user__login_key; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user__login_key UNIQUE (_login);


--
-- Name: _user_group_idx; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user_group
    ADD CONSTRAINT _user_group_idx PRIMARY KEY (_user, _group);


--
-- Name: _user_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user_pkey PRIMARY KEY (_id);


--
-- Name: rss_pkey; Type: CONSTRAINT; Schema: titan; Owner: -; Tablespace: 
--

ALTER TABLE ONLY _rss
    ADD CONSTRAINT rss_pkey PRIMARY KEY (_id);


--
-- Name: _alert_mail_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _alert_mail
    ADD CONSTRAINT _alert_mail_fk FOREIGN KEY (_alert) REFERENCES _alert(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _alert_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _alert
    ADD CONSTRAINT _alert_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _alert_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _alert_user
    ADD CONSTRAINT _alert_user_fk FOREIGN KEY (_alert) REFERENCES _alert(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _alert_user_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _alert_user
    ADD CONSTRAINT _alert_user_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _browser_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _browser
    ADD CONSTRAINT _browser_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _city_state_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _city
    ADD CONSTRAINT _city_state_fk FOREIGN KEY (_state) REFERENCES _state(_uf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _ckeditor_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _ckeditor
    ADD CONSTRAINT _ckeditor_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _cloud_author_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _cloud
    ADD CONSTRAINT _cloud_author_fk FOREIGN KEY (_author) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _cloud_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _cloud
    ADD CONSTRAINT _cloud_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _contact_responser_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _contact
    ADD CONSTRAINT _contact_responser_fk FOREIGN KEY (_responser) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _file_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _file
    ADD CONSTRAINT _file_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _group_type_group_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _type_group
    ADD CONSTRAINT _group_type_group_fk FOREIGN KEY (_group) REFERENCES _group(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _instance_logo_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _instance
    ADD CONSTRAINT _instance_logo_fk FOREIGN KEY (_logo) REFERENCES _file(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _instance_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _instance
    ADD CONSTRAINT _instance_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _mail_group_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _mail
    ADD CONSTRAINT _mail_group_fk FOREIGN KEY (_group) REFERENCES _group(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _media_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _media
    ADD CONSTRAINT _media_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _mobile_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _mobile
    ADD CONSTRAINT _mobile_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _note_author_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note
    ADD CONSTRAINT _note_author_fk FOREIGN KEY (_author) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _note_media__file_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media__file_fk FOREIGN KEY (_file) REFERENCES _cloud(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _note_media__user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media__user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _note_media_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note_media
    ADD CONSTRAINT _note_media_fk FOREIGN KEY (_note) REFERENCES _note(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _note_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _note
    ADD CONSTRAINT _note_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _permission_group_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _permission
    ADD CONSTRAINT _permission_group_fk FOREIGN KEY (_group) REFERENCES _group(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _simple_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _simple
    ADD CONSTRAINT _simple_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _user_city_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user_city_fk FOREIGN KEY (city) REFERENCES _city(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _user_file_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user_file_fk FOREIGN KEY (photo) REFERENCES _file(_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _user_group_group_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user_group
    ADD CONSTRAINT _user_group_group_fk FOREIGN KEY (_group) REFERENCES _group(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _user_group_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user_group
    ADD CONSTRAINT _user_group_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _user_state_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _user
    ADD CONSTRAINT _user_state_fk FOREIGN KEY (state) REFERENCES _state(_uf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rss_user_fk; Type: FK CONSTRAINT; Schema: titan; Owner: -
--

ALTER TABLE ONLY _rss
    ADD CONSTRAINT rss_user_fk FOREIGN KEY (_user) REFERENCES _user(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

