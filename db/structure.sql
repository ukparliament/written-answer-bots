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

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answering_bodies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answering_bodies (
    id integer NOT NULL,
    mnis_id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: answering_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answering_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answering_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answering_bodies_id_seq OWNED BY public.answering_bodies.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.members (
    id integer NOT NULL,
    mnis_id integer NOT NULL,
    display_name character varying(255) NOT NULL,
    handle character varying(255)
);


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    question_id integer NOT NULL,
    asking_member_id integer NOT NULL,
    house character varying(20) NOT NULL,
    member_interest boolean DEFAULT false,
    date_tabled date NOT NULL,
    uin character varying(20) NOT NULL,
    question_text text NOT NULL,
    is_named_day boolean DEFAULT false,
    is_holding_answer boolean DEFAULT false,
    is_correcting_answer boolean DEFAULT false,
    answering_member_id integer NOT NULL,
    correcting_member_id integer,
    date_answered date NOT NULL,
    answer_text text NOT NULL,
    original_answer_text text,
    comparable_answer_text text,
    date_answer_corrected date,
    date_answer_holding date,
    heading character varying(255),
    pertinent_date date NOT NULL,
    answering_body_id integer NOT NULL,
    tweeted boolean DEFAULT false
);


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: written_statements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.written_statements (
    id integer NOT NULL,
    made_on date NOT NULL,
    uin character varying(20) NOT NULL,
    title character varying(255) NOT NULL,
    house_name character varying(20) NOT NULL,
    member_role character varying(255) NOT NULL,
    member_id integer NOT NULL,
    answering_body_id integer NOT NULL,
    posted_to_mastodon boolean DEFAULT false,
    posted_to_bluesky boolean DEFAULT false
);


--
-- Name: written_statements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.written_statements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: written_statements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.written_statements_id_seq OWNED BY public.written_statements.id;


--
-- Name: answering_bodies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answering_bodies ALTER COLUMN id SET DEFAULT nextval('public.answering_bodies_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: written_statements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.written_statements ALTER COLUMN id SET DEFAULT nextval('public.written_statements_id_seq'::regclass);


--
-- Name: answering_bodies answering_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answering_bodies
    ADD CONSTRAINT answering_bodies_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: written_statements written_statements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.written_statements
    ADD CONSTRAINT written_statements_pkey PRIMARY KEY (id);


--
-- Name: questions fk_answering_body; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_answering_body FOREIGN KEY (answering_body_id) REFERENCES public.answering_bodies(id);


--
-- Name: written_statements fk_answering_body; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.written_statements
    ADD CONSTRAINT fk_answering_body FOREIGN KEY (answering_body_id) REFERENCES public.answering_bodies(id);


--
-- Name: written_statements fk_member; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.written_statements
    ADD CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;



