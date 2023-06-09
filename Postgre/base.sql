PGDMP     ,            	        {            transportation    14.7    14.7 G    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    16398    transportation    DATABASE     m   CREATE DATABASE transportation WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE transportation;
                postgres    false                        3079    16644    dblink 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;
    DROP EXTENSION dblink;
                   false            g           0    0    EXTENSION dblink    COMMENT     _   COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';
                        false    2            �            1255    16581    consulta_usuarios()    FUNCTION     �  CREATE FUNCTION public.consulta_usuarios() RETURNS void
    LANGUAGE plpgsql
    AS $$    DECLARE
        rec record;
        contador integer :=0;
    BEGIN 
        --recorre  tabla pasajero y lo guarda en la variable rec
        FOR rec IN SELECT * FROM passengers LOOP 
            RAISE NOTICE 'id: % ,Nombre: %      ',rec.id,rec.name;
            contador := contador + 1;
        END LOOP;
        RAISE NOTICE 'cantidad de registros:    %', contador;
    END 
$$;
 *   DROP FUNCTION public.consulta_usuarios();
       public          postgres    false            �            1255    16589    registrador()    FUNCTION     q  CREATE FUNCTION public.registrador() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
 contador integer = 0;
 i record;
BEGIN
 	FOR i IN SELECT * FROM passengers LOOP
	 contador := contador + 1;
	END LOOP;
	INSERT INTO contador_pasajeros(fecha_registro, contador_registro)
	-- now() devuelve la fecha y hora actual
	VALUES (now(), contador);
	RETURN NEW;
END
$$;
 $   DROP FUNCTION public.registrador();
       public          postgres    false            �            1259    16583    contador_pasajeros    TABLE     �   CREATE TABLE public.contador_pasajeros (
    id integer NOT NULL,
    fecha_registro time with time zone,
    contador_registro integer
);
 &   DROP TABLE public.contador_pasajeros;
       public         heap    postgres    false            �            1259    16582    contador_pasajeros_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contador_pasajeros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.contador_pasajeros_id_seq;
       public          postgres    false    223            h           0    0    contador_pasajeros_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.contador_pasajeros_id_seq OWNED BY public.contador_pasajeros.id;
          public          postgres    false    222            �            1259    16512 
   passengers    TABLE     �   CREATE TABLE public.passengers (
    id integer NOT NULL,
    name character varying(100),
    direction_residencia character varying,
    fecha_nacimiento date
);
    DROP TABLE public.passengers;
       public         heap    postgres    false            i           0    0    TABLE passengers    ACL     T   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.passengers TO usuario_consulatta;
          public          postgres    false    215            �            1259    16511    passengers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.passengers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.passengers_id_seq;
       public          postgres    false    215            j           0    0    passengers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.passengers_id_seq OWNED BY public.passengers.id;
          public          postgres    false    214            �            1259    16521    routes    TABLE     �   CREATE TABLE public.routes (
    id integer NOT NULL,
    station_id integer,
    train_id integer,
    name character varying
);
    DROP TABLE public.routes;
       public         heap    postgres    false            k           0    0    TABLE routes    ACL     P   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.routes TO usuario_consulatta;
          public          postgres    false    217            �            1259    16520    routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.routes_id_seq;
       public          postgres    false    217            l           0    0    routes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;
          public          postgres    false    216            �            1259    16494    stations    TABLE     w   CREATE TABLE public.stations (
    id integer NOT NULL,
    name character varying,
    direction character varying
);
    DROP TABLE public.stations;
       public         heap    postgres    false            m           0    0    TABLE stations    ACL     R   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.stations TO usuario_consulatta;
          public          postgres    false    211            �            1259    16493    stations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.stations_id_seq;
       public          postgres    false    211            n           0    0    stations_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;
          public          postgres    false    210            �            1259    16503    trains    TABLE     k   CREATE TABLE public.trains (
    id integer NOT NULL,
    model character varying,
    capacity integer
);
    DROP TABLE public.trains;
       public         heap    postgres    false            o           0    0    TABLE trains    ACL     P   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trains TO usuario_consulatta;
          public          postgres    false    213            �            1259    16502    trains_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.trains_id_seq;
       public          postgres    false    213            p           0    0    trains_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;
          public          postgres    false    212            �            1259    16530    travels    TABLE     �   CREATE TABLE public.travels (
    id integer NOT NULL,
    passengers_id integer,
    route_id integer,
    inicio date,
    fin date
);
    DROP TABLE public.travels;
       public         heap    postgres    false            q           0    0    TABLE travels    ACL     Q   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.travels TO usuario_consulatta;
          public          postgres    false    219            �            1259    16529    travels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.travels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.travels_id_seq;
       public          postgres    false    219            r           0    0    travels_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.travels_id_seq OWNED BY public.travels.id;
          public          postgres    false    218            �            1259    16537    travels_routes    TABLE     m   CREATE TABLE public.travels_routes (
    id integer NOT NULL,
    travel_id integer,
    route_id integer
);
 "   DROP TABLE public.travels_routes;
       public         heap    postgres    false            s           0    0    TABLE travels_routes    ACL     X   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.travels_routes TO usuario_consulatta;
          public          postgres    false    221            �            1259    16536    travels_routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.travels_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.travels_routes_id_seq;
       public          postgres    false    221            t           0    0    travels_routes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.travels_routes_id_seq OWNED BY public.travels_routes.id;
          public          postgres    false    220            �           2604    16586    contador_pasajeros id    DEFAULT     ~   ALTER TABLE ONLY public.contador_pasajeros ALTER COLUMN id SET DEFAULT nextval('public.contador_pasajeros_id_seq'::regclass);
 D   ALTER TABLE public.contador_pasajeros ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16515    passengers id    DEFAULT     n   ALTER TABLE ONLY public.passengers ALTER COLUMN id SET DEFAULT nextval('public.passengers_id_seq'::regclass);
 <   ALTER TABLE public.passengers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16524 	   routes id    DEFAULT     f   ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);
 8   ALTER TABLE public.routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16497    stations id    DEFAULT     j   ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);
 :   ALTER TABLE public.stations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    16506 	   trains id    DEFAULT     f   ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);
 8   ALTER TABLE public.trains ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    16533 
   travels id    DEFAULT     h   ALTER TABLE ONLY public.travels ALTER COLUMN id SET DEFAULT nextval('public.travels_id_seq'::regclass);
 9   ALTER TABLE public.travels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16540    travels_routes id    DEFAULT     v   ALTER TABLE ONLY public.travels_routes ALTER COLUMN id SET DEFAULT nextval('public.travels_routes_id_seq'::regclass);
 @   ALTER TABLE public.travels_routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            `          0    16583    contador_pasajeros 
   TABLE DATA           S   COPY public.contador_pasajeros (id, fecha_registro, contador_registro) FROM stdin;
    public          postgres    false    223   �O       X          0    16512 
   passengers 
   TABLE DATA           V   COPY public.passengers (id, name, direction_residencia, fecha_nacimiento) FROM stdin;
    public          postgres    false    215   P       Z          0    16521    routes 
   TABLE DATA           @   COPY public.routes (id, station_id, train_id, name) FROM stdin;
    public          postgres    false    217   �X       T          0    16494    stations 
   TABLE DATA           7   COPY public.stations (id, name, direction) FROM stdin;
    public          postgres    false    211   �]       V          0    16503    trains 
   TABLE DATA           5   COPY public.trains (id, model, capacity) FROM stdin;
    public          postgres    false    213   ed       \          0    16530    travels 
   TABLE DATA           K   COPY public.travels (id, passengers_id, route_id, inicio, fin) FROM stdin;
    public          postgres    false    219   �h       ^          0    16537    travels_routes 
   TABLE DATA           A   COPY public.travels_routes (id, travel_id, route_id) FROM stdin;
    public          postgres    false    221   m       u           0    0    contador_pasajeros_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contador_pasajeros_id_seq', 2, true);
          public          postgres    false    222            v           0    0    passengers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.passengers_id_seq', 105, true);
          public          postgres    false    214            w           0    0    routes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.routes_id_seq', 102, true);
          public          postgres    false    216            x           0    0    stations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.stations_id_seq', 202, true);
          public          postgres    false    210            y           0    0    trains_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.trains_id_seq', 202, true);
          public          postgres    false    212            z           0    0    travels_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.travels_id_seq', 104, true);
          public          postgres    false    218            {           0    0    travels_routes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.travels_routes_id_seq', 100, true);
          public          postgres    false    220            �           2606    16588 *   contador_pasajeros contador_pasajeros_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.contador_pasajeros
    ADD CONSTRAINT contador_pasajeros_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.contador_pasajeros DROP CONSTRAINT contador_pasajeros_pkey;
       public            postgres    false    223            �           2606    16519    passengers passengers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public            postgres    false    215            �           2606    16528    routes routes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.routes DROP CONSTRAINT routes_pkey;
       public            postgres    false    217            �           2606    16501    stations stations_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.stations DROP CONSTRAINT stations_pkey;
       public            postgres    false    211            �           2606    16510    trains trains_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trains DROP CONSTRAINT trains_pkey;
       public            postgres    false    213            �           2606    16535    travels travels_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.travels DROP CONSTRAINT travels_pkey;
       public            postgres    false    219            �           2606    16542 "   travels_routes travels_routes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.travels_routes
    ADD CONSTRAINT travels_routes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.travels_routes DROP CONSTRAINT travels_routes_pkey;
       public            postgres    false    221            �           2620    16590    passengers trigger_registrador    TRIGGER     y   CREATE TRIGGER trigger_registrador AFTER INSERT ON public.passengers FOR EACH ROW EXECUTE FUNCTION public.registrador();
 7   DROP TRIGGER trigger_registrador ON public.passengers;
       public          postgres    false    226    215            �           2620    16591    passengers trigger_registrador2    TRIGGER     z   CREATE TRIGGER trigger_registrador2 AFTER DELETE ON public.passengers FOR EACH ROW EXECUTE FUNCTION public.registrador();
 8   DROP TRIGGER trigger_registrador2 ON public.passengers;
       public          postgres    false    226    215            �           2606    16545    routes FK_routes_station    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT "FK_routes_station" FOREIGN KEY (station_id) REFERENCES public.stations(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.routes DROP CONSTRAINT "FK_routes_station";
       public          postgres    false    3251    217    211            �           2606    16550    routes FK_routes_train    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT "FK_routes_train" FOREIGN KEY (train_id) REFERENCES public.trains(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public.routes DROP CONSTRAINT "FK_routes_train";
       public          postgres    false    213    217    3253            �           2606    16555    travels fk_travel_passenger    FK CONSTRAINT     �   ALTER TABLE ONLY public.travels
    ADD CONSTRAINT fk_travel_passenger FOREIGN KEY (passengers_id) REFERENCES public.passengers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.travels DROP CONSTRAINT fk_travel_passenger;
       public          postgres    false    219    3255    215            �           2606    16560    travels fk_travel_route    FK CONSTRAINT     �   ALTER TABLE ONLY public.travels
    ADD CONSTRAINT fk_travel_route FOREIGN KEY (route_id) REFERENCES public.routes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.travels DROP CONSTRAINT fk_travel_route;
       public          postgres    false    217    3257    219            �           2606    16570 '   travels_routes fk_travels_routes_routes    FK CONSTRAINT     �   ALTER TABLE ONLY public.travels_routes
    ADD CONSTRAINT fk_travels_routes_routes FOREIGN KEY (route_id) REFERENCES public.routes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.travels_routes DROP CONSTRAINT fk_travels_routes_routes;
       public          postgres    false    217    3257    221            �           2606    16575 (   travels_routes fk_travels_routes_travels    FK CONSTRAINT     �   ALTER TABLE ONLY public.travels_routes
    ADD CONSTRAINT fk_travels_routes_travels FOREIGN KEY (travel_id) REFERENCES public.travels(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public.travels_routes DROP CONSTRAINT fk_travels_routes_travels;
       public          postgres    false    221    219    3259            `   5   x�%��  ���Ebe���D�{l̢ʧ���>�8��b����~8��5	�      X   �  x�eW�rܺ\�_��,���" �zX�d�v$Ů������B���v��,�7��n��n��8}��4�����ϱ	?w��a�"��d�6�*�\e���o�q-�����0Չ7uBf����(�����v.�sY����������{w`_>���.��(��U^�d�i�ͷ[��|���a��̇-�jC���f�˕�����S���u/�cg�8�T�ʒ>)�̰��m;����c�W%U+�~ˬ,�Ù���K��*��W��D��l����:����C�qY��I�)��O>��=�o�k����JTJ�ՁA��;�F��?�6bS�P5���X�"�7<:���l��Vj]��^�&}�`�`[��K��-��V�tt�V�N�,�jl,j��9��e����\��ʄf��뭍��f��h`����ň1|�ck�s��!\���3a�E�v�[�g �C�/Ÿ�ԸN��L����1�o!�-���5�T3�d�Σ���־n��L�W5MD�4�"��]��`hk��a�~�gIǡ	)ٵ}��K��p3�.�y�f%P�al�� �p�Hifl���}��р_�]��Z7�VDK��r�ɒ���GBm�qw�#�U��/jv�:�OR�|�&�� :A5�b��0�w�.���O�
�� ̀*1��_��m�!t��VC�``��hA�����d��~uB�膸G���w��MK�T�;*����i�˂H�"�LW3fr����5v��-�:�S�5Mj���t5�/8��d9�H�P)E�Ne���]<��C�ͧ�<]�\7�`��0�[ۭ-zӧ,��kҾ��+�������ҀRI�z6$��u�ݰ�;�k�HD�S�&�_gʰ�vg�#��0aN�$IW���'������l�̃Ov�%���_!0�:����mj�%�� �졉����q��LEu�h�gp�����cן:�*�|�sd�b�����D��[Y͐"ZQ����9tD|��)��� ,��.x���־��*	��
�>a7������T��U������ñ=N}��rUV�t�Ӂc�ݸ�y$�|��I]@����7��/��e?�?T	Z�Y���`p�(���R��M��^L������2Z����J|��g���T*vkwGu��¤�l�R(A��'�l�Y�����!9#A.��%;��S����>��3���R�nmCú�wV��-]�de��[ڏ�2����4���6(�:C��S Xߴ���-����7�Rx�ӊ�=��S=2N��*b���3��a�)����2¸t����c��cNBJT�hg[��ՆU�ì�Z�9��h��]�s"���ئ��J�'�����=��P�f1�R͆U���נ�p���@-L�M��Dt
9D�7[Ȁ�q Y��qead�b�cc�Qc�U4mH:6E� PP�_{v��5���I�F��14����u��?�C7)4�~S�+�.>z"G�z0s.+Y�N�*�
_bTH,v<F��*꩒C�U�}��Ϝ���6�ף��uJL�+�U���s���o�8��Df X$1w�?�Zns.FO:2E�:�J�1��׸i�BVK�S�Ǌđ$�0P��ஓ�)��J�h��؆�_�.9B�+�Ƒ�]�؀xW�{	�Zφ�B_U�G�`�L����I�2�ۈ����0~�(�������d����߃G�T�&5��k$�@^����5ߘ�I���rȝ��5�5�Z��)� ���Chh��,�� C�L���B����i��z�>&3��㇥�H�|��Y',*����E�0��)�O���v��0�e��z�C�pS���h�'��h(�0�\��#����9�;�2�{"H��2����&��В	�"Ö��Yߏ���K����UTe5mfx�9���v)i�4� 3��l�A�m�>%���,[�w�0#�\�X�'_�(�yN������G�I�:,�05s#�H������&���BXq�R����>�Y۸�	��Z�y��鍀a�5�y�H���}op��F��;Zsx��Ȗ{�6���'�(S�%�{t�b�4��=�jz	s��۷C����S��	(�P�b�c?���A;L��h�`��0Q����1�Ă7�g�Hϼo��"��v���q��C�j���[<��<�Ye��-˲? qGD      Z   �  x�%U�n�6>�B/�BԿ��f�ݵwQ��m�b,�YJt��ھEOE�E(P�Л���-l�L��~��4>����V	�gzHTJYNUB��W�-�w�S9�&���=7�TA��Lӛ�-;U�N�������.������--������t֨�ʔ��%oFQWS��W����?�F�G]�|L����m�cP:���L0��S*(�k��1^�SI��GV:��y�s�p�#����9ߍ�Ҁ]WT���1���{�+J�w�m��G�d����
���M8�F%1%��2����pz��l{Մ���BGyBEEkk��JR`MJ���o�*��6z�Vf�]�3Ѣu[�.����m���w��T����I �T���B7D�����J*Y�j�2����E���Ό&��3w�o��QiL迖_�����~��y�d���E*�������N'���w���4�W*Y�JT��
�f��=��(�<֡ER�}c�x�Y�P�*ŉ��?�u*��tuL7��A�� tX��Rj¶��s�x@[`ý;b�Ve�Є��V�5*K'�eA+@�9�`�)���M�Ib��Uذ�����X���ݎGoq��b����-� N/��
�Ŋ��۠P�諤o�ЃW�D8�tm|k�FOv�h͇�
��(���A��aJR	�xg���h��PIEr!�:�co/��0'�A�Ox�"w�Mt��К��;�����P	l/�$b��%���V�}�U�c@Ѭ빻�* ���W�n�Y���D�Hk�FH6Y@Vl/�q���:�êΎѺ�>��QH �u�C���:��q�X�v��`"}+� ��ƴl�*'Qe��hN��S�Q-]�I�Uu]Hr�|���?:L&�����+�߱*�i0�Xp�W�*�/��.�[>��b���e2�Z�[������#s��	��D��*+#κ#"שR̟
_��أ�dp�I��Hΰ�av %k���M2q]��f�څ��Q	өx��~3*��s�s�D��IU�4�j$*L%'��;s�ܻ3Fk5#(>g��sHx��$Y*���#$��v��6��d'Hwoe̠�T��ڻ�m.��%��m��*��1�a�Ɲ��:I�_r[I@�1���������
��F�V���g���hθ�FU�Q����>�
�J&�/l؋g!�xN.?0��[Р,���N�*$M`���	Wo��?b��>��۸ݨ��B)�?<��0      T   �  x����n$I�ϑOQ�=�**+����3;3ޱ�J�Kvwҕ�ՙ�>l�'��'�+�����OB�����,åժ̌̈�G��˶�s��!d�.tM��.�eX������t�~)�i�V9�u���X8��Y	/�����˔bN]�� �c\gX�$�����b
��ٗ�kl��[DT�ix�c��h�woD!g��UmMWe/��9���73�ٰ�o-"|�]�"6٥���6���wٳ��Lp.hS����}���9�9��mcg}�;?�@����mb���M�b(�uW�ۿ^𒡄��V�ig�Y�^�O��]_�Ѧ���������w>�8zgࢧ����+���"���,()�5׬@x~[�z5\�+
�^��/��N�d�Krۅ@1A<�-���n|]��ކ*8+<��¶+�ݽaS�B�i�����Oɪ���u���]�ыBó���IiXa�d��d�3
s�r��O�x�\0����}q�i��~�4�#��w��A_x�_�z���8��Ű��E�X挗��7�@~x�vs��[�K�t�׶v��3N��$�C��䚶kx��Z�����K����h�YI����?�7��~��R�b%¹٫�n�2G�����u~H_ɩ�H�q��x���鲄om�ڛ�a�dB��B��m�{#9���p��E��f3�W��v�]���.�ϒ>k����K�tq��,��
x��WRQ��Y��{(z"�וm�vs����q5\,$$P���fx�Α	Rh���cY/��.�zL���%�o���qMi�ư3+r����.��QEb�ovB����7�B3�H���ZT�Z��矿k�f������`��k�P3�X���mu�hD��}�:�}���AXH
�,�͍[�JAA`��E��k�QS
��h�$������(�R�����k���p&%<����8��>�>M*�������]��}cy���)���mݍ-�ZT�T��f^m�_X(��	��,}�nLf�T/(A�+����Vi�.��g��u��l��S�N��><l@��
i�iGY�Q'ͼw�:)%RQ�ls��x��jQ(�&����bМ����6O��o�v�R2�pyH����.���$R
Y��~�Q���p�h�ev���\-���S��i	������>j����jmi��}]k*̶s�l��[����[��G�,�6���y�	�LN�t�A����o(�7�UNm�`������~|m��_V�Y�a�`���I1l#UQ�0�Xe��Q�~��0�(���H����7HШ�w�����vl��-�n�Qq���G�u�z�+������~��X]����}�����4L�^�3�	A:�,�'��4�[0O��S�B����S�2�/��L̓�b��LR��<�1� �$�	��4���`�f0�3��� |D4�$��$�`j0M58�5��L�N�N���p�St�i����S��)��	��4����Ӕ�I��I���`�t0�:8�:��L�&p���)��	�����̃�Ѓ)�����`|p�|p}p�}0?8E?��|�?� L�'����I�$a�0EB��(�I�)��AC��0�C8D� "�@"L1NA>EE��"��"L�Q1	FE
���`�0���J�      V   a  x�m��R�8�磯�0�-Y��؝f��)
��"@MgƱ3�C5���B|!UT�t9gkA���?���\�.6���U��;�����c���P���ܫB.���\�r�L�S^��+d�x� 9��mc�-`y��
Z\Ɵ�*��ϱ~[(�l�ml�j��	��i�v��kB��i ptw W(f�Ӡ\�W����W�)���p?�b��Q�Ri��m��Jk�K+6Vi#zq���u���x>Ϲ-��V.��J;.�}�qY�卑�)]�MU�T
�Y�����+��M)E�����u���p���2F>u}ۤ�����煕�g��]�.-�8�����x�s]*�J4��v�O�3e�{մ|�&�j�y{�Z�g�i��rq���f;�:���F.Z���
���u����'�ʭ|������X�n�*̽�|Y���I��˷����P��T��y	USKe!�a�6]�����;����������4���������6��2v�@e�����۶m)7�V�XN�eŗX�����甃܄�9U�Y�rq��Bץ09#_⏸�nz���z%������9c&�P�a���eO�c+VHs^���C�����V��8Z���2��0���u�{?ɹ���fѼg۔]����z�yMG�(亍��w�`� �Y�î�Ւ{�u=���_2��7��r�X�Ig��+s&f����,x:�e:�n�>T�%cط��uie)wlX������}�B��������-�Jf���*�a$\�<�&3ʳ�|N����*�.�7�9�]+ʳ�Yv�Δ'eJ�wl�j�����b�O�K��b_/pp�'��O�A�&�����dxK�N��!����Jdc*��c�l�%�LdG2���y�ͱ�S8O�y�α�'��<��~b(F��$��Q���(��b)��bB)Ɩb�)&�b�)>x�����9���U�U�)V1q3XqJVLh��V�p�DW�x��W| ca1����!������YL��TZ̨��Z�b�-&�b�3p1��	�����8�.F�b�.&�b�Sz1��8�#���#��(0���8�0�
c`�b�$ƑbL-ƀ1>j��z±q�g�M)�?�_��      \     x�uVY��8�{q �a/��:Rx ^�se�*
I���\,ky$��g�<����(�4Z�癵�M7^iG�K�}��f[HqėJ|�J�m$;�S>����/=���m�<���3:�v3�S]i;I�i������rK[�_��x��B��Ʋ�&�$��od��'�z�i�M:q,������n���,E"��a��%Y�[&����_���HO��{+[ѣ0���`~_��� ���3�ϪP�:c&֚YNҧk���G (}e��E�j��g�T��H
��6G6-� ��]#��p$8�ޕ^���M `!z�ąÛ:��89�`�:��>�����u;xH�l�`5$����>�~��,m��2>��϶�A�q��/g��l*QЌ��WZ��A�D�p�/}����~�VB��zF�Ή�C���@O�i o{����f|x�Ù{�/їam�7��ݗ���gf��Z��w\�D#]�GEË/�z����xH��}���򝵄u�����{R�Њ2��L�Q�<�.*��z;�u��0]�TH$�х0�sײ9��ϛg����+��f�E�3q�I��qֵ�E��p��$��Y�2��XO�uR�YK�h�M���SL�OF.0M��@���,8�Hӏ1�R��(������o��ώ�EnR�����i�9��r�����O(�s���Ք́7Lqv�YD����O�ʤ�	����D�A�����s���&�ܸZ�aq
�[bW1���$��S[�v�� |d��zBۓl1��D߷�Y��o^�%W��LA�(M��ΕƜ7���%��e1��{�ls?⺳o��ӹ[{Ӥ�b�pB�x�,�܌���z��>	�-���mɝ3AҠ��"�B%��W4}����\�(��LN]Ҽ8�s�u�+�s)y���p,g�燢b���.�J�d�y_{�X�iEQ���ȹ��]���*�
,�4�K�����k��s=p%49������\7�^]8�n�<�䂮&	�*����I���>5��/"��Q�      ^   �  x�%��m1��b"cll������Ez:0�$c�8���Vԋ[Z�pl1�:Ί]:q�n���ER�rĎ�ʌ�q1f<2�T�\˞���;�8�V���ķ?%*�v�|F��Y��R�լ��O�d�A�74�25O���oT_�R�X/*U(��W3z���g�hbYB+�]�r�xF�̰Z@#z�n��J�En�Q�Z��Z˭l&F�V�� �.����7r#�vB�"����>3�_у竚$�e��}L�so�O�I5���Nܭfk����l ė��L��n��E���7��5�`��Q8lmDN�iR9�ʽ�SZ~���v!����:�E��a_8B�VOw�]A��-N{J���0���4?h�ە����^+��}\��<�`�/}�`|TDߐW4Mط�� �>���)���e� �,�����_�����H��p��     