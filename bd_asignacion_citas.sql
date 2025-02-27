PGDMP  :                    }            Proyectos Grupo 20Enero2025    16.8    17.2 0    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            z           1262    1622016    Proyectos Grupo 20Enero2025    DATABASE        CREATE DATABASE "Proyectos Grupo 20Enero2025" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
 -   DROP DATABASE "Proyectos Grupo 20Enero2025";
                     Comfe_owner    false                        2615    1622038    William Uribe    SCHEMA        CREATE SCHEMA "William Uribe";
    DROP SCHEMA "William Uribe";
                     Comfe_owner    false            {           0    0    SCHEMA "William Uribe"    COMMENT     �   COMMENT ON SCHEMA "William Uribe" IS '1.- BD  Llamadas Linea Atencion
---> 2.- BD  Asignacion Citas  <--- (seleccionada) ----.
3.- BD  Gestion Chat Atencion';
                        Comfe_owner    false    8            �            1259    1630342 	   convenios    TABLE     l   CREATE TABLE "William Uribe".convenios (
    id integer NOT NULL,
    nom_convenio character varying(20)
);
 &   DROP TABLE "William Uribe".convenios;
       William Uribe         heap r       Comfe_owner    false    8            �            1259    1630341    convenios_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".convenios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE "William Uribe".convenios_id_seq;
       William Uribe               Comfe_owner    false    244    8            |           0    0    convenios_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "William Uribe".convenios_id_seq OWNED BY "William Uribe".convenios.id;
          William Uribe               Comfe_owner    false    243            �            1259    1630274    departamentos    TABLE     l   CREATE TABLE "William Uribe".departamentos (
    id integer NOT NULL,
    nom_dpto character varying(30)
);
 *   DROP TABLE "William Uribe".departamentos;
       William Uribe         heap r       Comfe_owner    false    8            �            1259    1630273    departamento_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "William Uribe".departamento_id_seq;
       William Uribe               Comfe_owner    false    232    8            }           0    0    departamento_id_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE "William Uribe".departamento_id_seq OWNED BY "William Uribe".departamentos.id;
          William Uribe               Comfe_owner    false    231                       1259    1630419    especialidades    TABLE     u   CREATE TABLE "William Uribe".especialidades (
    id integer NOT NULL,
    nom_especialidad character varying(20)
);
 +   DROP TABLE "William Uribe".especialidades;
       William Uribe         heap r       Comfe_owner    false    8                       1259    1630418    especialidades_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".especialidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "William Uribe".especialidades_id_seq;
       William Uribe               Comfe_owner    false    8    258            ~           0    0    especialidades_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "William Uribe".especialidades_id_seq OWNED BY "William Uribe".especialidades.id;
          William Uribe               Comfe_owner    false    257            �            1259    1630335 
   municipios    TABLE     �   CREATE TABLE "William Uribe".municipios (
    id integer NOT NULL,
    departamentos_id integer,
    nom_municip character varying(30)
);
 '   DROP TABLE "William Uribe".municipios;
       William Uribe         heap r       Comfe_owner    false    8            �            1259    1630334    municipios_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".municipios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "William Uribe".municipios_id_seq;
       William Uribe               Comfe_owner    false    8    242                       0    0    municipios_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE "William Uribe".municipios_id_seq OWNED BY "William Uribe".municipios.id;
          William Uribe               Comfe_owner    false    241            �            1259    1630254 	   pacientes    TABLE       CREATE TABLE "William Uribe".pacientes (
    id integer NOT NULL,
    tipo_doc character varying(3),
    nro_doc character varying(20),
    direccion_residencia character varying(50),
    movil_contacto character varying(10),
    departamentos_id integer,
    municipios_id integer
);
 &   DROP TABLE "William Uribe".pacientes;
       William Uribe         heap r       Comfe_owner    false    8            �            1259    1630253    pacientes_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE "William Uribe".pacientes_id_seq;
       William Uribe               Comfe_owner    false    8    228            �           0    0    pacientes_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "William Uribe".pacientes_id_seq OWNED BY "William Uribe".pacientes.id;
          William Uribe               Comfe_owner    false    227            �            1259    1630356    profesionales    TABLE     6  CREATE TABLE "William Uribe".profesionales (
    id integer NOT NULL,
    nombre_prof character varying(50),
    tipo_doc character varying(3),
    nro_doc character varying(15),
    ubicacion character varying(30),
    sede character varying(10),
    especialidades_id integer,
    activo boolean NOT NULL
);
 *   DROP TABLE "William Uribe".profesionales;
       William Uribe         heap r       Comfe_owner    false    8            �            1259    1630355    profesionales_id_seq    SEQUENCE     �   CREATE SEQUENCE "William Uribe".profesionales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "William Uribe".profesionales_id_seq;
       William Uribe               Comfe_owner    false    8    248            �           0    0    profesionales_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "William Uribe".profesionales_id_seq OWNED BY "William Uribe".profesionales.id;
          William Uribe               Comfe_owner    false    247            �           2604    1630345    convenios id    DEFAULT     ~   ALTER TABLE ONLY "William Uribe".convenios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".convenios_id_seq'::regclass);
 D   ALTER TABLE "William Uribe".convenios ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    244    243    244            �           2604    1630277    departamentos id    DEFAULT     �   ALTER TABLE ONLY "William Uribe".departamentos ALTER COLUMN id SET DEFAULT nextval('"William Uribe".departamento_id_seq'::regclass);
 H   ALTER TABLE "William Uribe".departamentos ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    232    231    232            �           2604    1630422    especialidades id    DEFAULT     �   ALTER TABLE ONLY "William Uribe".especialidades ALTER COLUMN id SET DEFAULT nextval('"William Uribe".especialidades_id_seq'::regclass);
 I   ALTER TABLE "William Uribe".especialidades ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    257    258    258            �           2604    1630338    municipios id    DEFAULT     �   ALTER TABLE ONLY "William Uribe".municipios ALTER COLUMN id SET DEFAULT nextval('"William Uribe".municipios_id_seq'::regclass);
 E   ALTER TABLE "William Uribe".municipios ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    242    241    242            �           2604    1630257    pacientes id    DEFAULT     ~   ALTER TABLE ONLY "William Uribe".pacientes ALTER COLUMN id SET DEFAULT nextval('"William Uribe".pacientes_id_seq'::regclass);
 D   ALTER TABLE "William Uribe".pacientes ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    228    227    228            �           2604    1630359    profesionales id    DEFAULT     �   ALTER TABLE ONLY "William Uribe".profesionales ALTER COLUMN id SET DEFAULT nextval('"William Uribe".profesionales_id_seq'::regclass);
 H   ALTER TABLE "William Uribe".profesionales ALTER COLUMN id DROP DEFAULT;
       William Uribe               Comfe_owner    false    247    248    248            p          0    1630342 	   convenios 
   TABLE DATA           >   COPY "William Uribe".convenios (id, nom_convenio) FROM stdin;
    William Uribe               Comfe_owner    false    244   �9       l          0    1630274    departamentos 
   TABLE DATA           >   COPY "William Uribe".departamentos (id, nom_dpto) FROM stdin;
    William Uribe               Comfe_owner    false    232   :       t          0    1630419    especialidades 
   TABLE DATA           G   COPY "William Uribe".especialidades (id, nom_especialidad) FROM stdin;
    William Uribe               Comfe_owner    false    258   5:       n          0    1630335 
   municipios 
   TABLE DATA           P   COPY "William Uribe".municipios (id, departamentos_id, nom_municip) FROM stdin;
    William Uribe               Comfe_owner    false    242   R:       j          0    1630254 	   pacientes 
   TABLE DATA           �   COPY "William Uribe".pacientes (id, tipo_doc, nro_doc, direccion_residencia, movil_contacto, departamentos_id, municipios_id) FROM stdin;
    William Uribe               Comfe_owner    false    228   o:       r          0    1630356    profesionales 
   TABLE DATA           �   COPY "William Uribe".profesionales (id, nombre_prof, tipo_doc, nro_doc, ubicacion, sede, especialidades_id, activo) FROM stdin;
    William Uribe               Comfe_owner    false    248   �:       �           0    0    convenios_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"William Uribe".convenios_id_seq', 1, false);
          William Uribe               Comfe_owner    false    243            �           0    0    departamento_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"William Uribe".departamento_id_seq', 1, false);
          William Uribe               Comfe_owner    false    231            �           0    0    especialidades_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"William Uribe".especialidades_id_seq', 1, false);
          William Uribe               Comfe_owner    false    257            �           0    0    municipios_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"William Uribe".municipios_id_seq', 1, false);
          William Uribe               Comfe_owner    false    241            �           0    0    pacientes_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"William Uribe".pacientes_id_seq', 1, false);
          William Uribe               Comfe_owner    false    227            �           0    0    profesionales_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"William Uribe".profesionales_id_seq', 1, false);
          William Uribe               Comfe_owner    false    247            �           2606    1630347    convenios convenios_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "William Uribe".convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY "William Uribe".convenios DROP CONSTRAINT convenios_pkey;
       William Uribe                 Comfe_owner    false    244            �           2606    1630279    departamentos departamento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "William Uribe".departamentos
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "William Uribe".departamentos DROP CONSTRAINT departamento_pkey;
       William Uribe                 Comfe_owner    false    232            �           2606    1630424 "   especialidades especialidades_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "William Uribe".especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY "William Uribe".especialidades DROP CONSTRAINT especialidades_pkey;
       William Uribe                 Comfe_owner    false    258            �           2606    1630340    municipios municipios_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "William Uribe".municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY "William Uribe".municipios DROP CONSTRAINT municipios_pkey;
       William Uribe                 Comfe_owner    false    242            �           2606    1630259    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "William Uribe".pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY "William Uribe".pacientes DROP CONSTRAINT pacientes_pkey;
       William Uribe                 Comfe_owner    false    228            �           2606    1630361     profesionales profesionales_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "William Uribe".profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY "William Uribe".profesionales DROP CONSTRAINT profesionales_pkey;
       William Uribe                 Comfe_owner    false    248            p      x������ � �      l      x������ � �      t      x������ � �      n      x������ � �      j      x������ � �      r      x������ � �     