PGDMP     /                    {           sertinf    10.22    10.22 �   L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            O           1262    16393    sertinf    DATABASE     �   CREATE DATABASE sertinf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Paraguay.1252' LC_CTYPE = 'Spanish_Paraguay.1252';
    DROP DATABASE sertinf;
             postgres    false                        2615    16394    caja    SCHEMA        CREATE SCHEMA caja;
    DROP SCHEMA caja;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            P           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    17160    servicio    SCHEMA        CREATE SCHEMA servicio;
    DROP SCHEMA servicio;
             postgres    false                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            Q           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                       1259    16976    ajuste    TABLE     g  CREATE TABLE caja.ajuste (
    maestro_stock_producto_prod_cod integer NOT NULL,
    ajus_cant numeric(8,2) NOT NULL,
    fecha date NOT NULL,
    fecha_grabacion time without time zone NOT NULL,
    motivo_mo_cod numeric(3,0),
    canti_anterior numeric(8,2),
    ajus_cod integer NOT NULL,
    usuario_usuario_cod integer,
    union_emp_id_union integer
);
    DROP TABLE caja.ajuste;
       caja         postgres    false    5                       1259    16974    ajuste_ajus_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.ajuste_ajus_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE caja.ajuste_ajus_cod_seq;
       caja       postgres    false    258    5            R           0    0    ajuste_ajus_cod_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE caja.ajuste_ajus_cod_seq OWNED BY caja.ajuste.ajus_cod;
            caja       postgres    false    257            �            1259    16889    cabecera_compras    TABLE     �  CREATE TABLE caja.cabecera_compras (
    compra_nro integer NOT NULL,
    cond_cod integer NOT NULL,
    prov_cod integer NOT NULL,
    compra_fecha date NOT NULL,
    factura_nro character varying(7),
    compra_total numeric(30,2) NOT NULL,
    fecha_grabacion timestamp with time zone NOT NULL,
    iva10 numeric(20,2),
    iva5 numeric(20,2),
    total_exenta numeric(30,2),
    total_gravada5 numeric(30,2),
    total_gravada10 numeric(30,2),
    total_iva numeric(20,2),
    estado character varying(11) NOT NULL,
    usuario_cod integer,
    usu_mod integer,
    union_emp_id_union integer,
    retencion integer,
    factura character varying(9),
    timbrado integer,
    retencion5 numeric(30,2) DEFAULT 0,
    retencion10 numeric(30,2) DEFAULT 0,
    retencionrenta numeric(30,2) DEFAULT 0,
    autorden integer DEFAULT 0,
    boni numeric(10,2) DEFAULT 0,
    porboni numeric(5,2) DEFAULT 0,
    cptcod integer,
    tipo_factura integer,
    caja integer DEFAULT 0,
    ingre_egre character varying(10),
    nro_apertura integer,
    concepto character varying(100),
    anulacion character varying(120),
    rub_cod integer,
    tipo character varying(10)
);
 "   DROP TABLE caja.cabecera_compras;
       caja         postgres    false    5            �            1259    16929    cabecera_compras1    TABLE       CREATE TABLE caja.cabecera_compras1 (
    compra_nro integer NOT NULL,
    condicion_cond_cod integer NOT NULL,
    proveedor_prov_cod integer NOT NULL,
    compra_fecha date NOT NULL,
    factura_nro character varying(7),
    compra_total numeric(30,2) NOT NULL,
    fecha_grabacion timestamp with time zone NOT NULL,
    iva10 numeric(20,2),
    iva5 numeric(20,2),
    total_exenta numeric(30,2),
    total_gravada numeric(30,2),
    total_iva numeric(20,2),
    estado character varying(11) NOT NULL,
    usuario_usuario_cod integer,
    usu_mod integer,
    union_emp_id_union integer,
    moneda_moneda_cod integer,
    coti numeric(30,2),
    factura character varying(9),
    timbrado integer,
    descu numeric(5,0),
    descgs numeric(10,2),
    sfac integer DEFAULT 0
);
 #   DROP TABLE caja.cabecera_compras1;
       caja         postgres    false    5            �            1259    16927     cabecera_compras1_compra_nro_seq    SEQUENCE     �   CREATE SEQUENCE caja.cabecera_compras1_compra_nro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE caja.cabecera_compras1_compra_nro_seq;
       caja       postgres    false    253    5            S           0    0     cabecera_compras1_compra_nro_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE caja.cabecera_compras1_compra_nro_seq OWNED BY caja.cabecera_compras1.compra_nro;
            caja       postgres    false    252            �            1259    16887    cabecera_compras_compra_nro_seq    SEQUENCE     �   CREATE SEQUENCE caja.cabecera_compras_compra_nro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE caja.cabecera_compras_compra_nro_seq;
       caja       postgres    false    251    5            T           0    0    cabecera_compras_compra_nro_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE caja.cabecera_compras_compra_nro_seq OWNED BY caja.cabecera_compras.compra_nro;
            caja       postgres    false    250            �            1259    16748    cabecera_venta    TABLE     �  CREATE TABLE caja.cabecera_venta (
    venta_cod integer NOT NULL,
    condicion_cond_cod integer NOT NULL,
    cliente_clie_cod integer NOT NULL,
    facturador_fact_cod integer NOT NULL,
    venta_fecha date NOT NULL,
    venta_total numeric(30,2) NOT NULL,
    fecha_grabacion timestamp with time zone NOT NULL,
    iva5 numeric(20,2),
    iva10 numeric(20,2),
    totaliva numeric(20,2),
    totalgravada5 numeric(30,2) DEFAULT 0,
    totalgravada10 numeric(30,2) DEFAULT 0,
    totalexenta numeric(30,2),
    totaldescuento numeric(20,2),
    estado character varying(7) NOT NULL,
    usuario_usuario_cod integer,
    union_emp_id_union integer,
    factura_nro numeric(13,0),
    factura character varying(13),
    tipofactura integer,
    redondeo numeric(13,0),
    tarjeta integer,
    timbrado integer,
    nro_factur character varying(15),
    fechafinvigen date,
    solicitud character varying(13),
    fechasoli date,
    digital integer DEFAULT 0,
    nro_apertura integer DEFAULT 0,
    nro_movimiento integer DEFAULT 0,
    razon character varying(200),
    ruc character varying(20),
    facturacion numeric(1,0) DEFAULT 0
)
WITH (autovacuum_enabled='true');
     DROP TABLE caja.cabecera_venta;
       caja         postgres    false    5            �            1259    16746    cabecera_venta_venta_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.cabecera_venta_venta_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE caja.cabecera_venta_venta_cod_seq;
       caja       postgres    false    238    5            U           0    0    cabecera_venta_venta_cod_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE caja.cabecera_venta_venta_cod_seq OWNED BY caja.cabecera_venta.venta_cod;
            caja       postgres    false    237                       1259    16999    caja_apertu    TABLE     o  CREATE TABLE caja.caja_apertu (
    nro_apertura integer NOT NULL,
    usuario_cod integer NOT NULL,
    empresas_codigo_emp integer NOT NULL,
    fecha_aper date,
    hora_aper timestamp with time zone,
    fecha_cierre date,
    hora_cierre timestamp with time zone,
    anulado character(10),
    union_emp_id_union integer,
    importe numeric(12,0) DEFAULT 0
);
    DROP TABLE caja.caja_apertu;
       caja         postgres    false    5                       1259    16997    caja_apertu_nro_apertura_seq    SEQUENCE     �   CREATE SEQUENCE caja.caja_apertu_nro_apertura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE caja.caja_apertu_nro_apertura_seq;
       caja       postgres    false    5    260            V           0    0    caja_apertu_nro_apertura_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE caja.caja_apertu_nro_apertura_seq OWNED BY caja.caja_apertu.nro_apertura;
            caja       postgres    false    259                       1259    17080    caja_arqueo_cab    TABLE     	  CREATE TABLE caja.caja_arqueo_cab (
    nro_arqueo integer NOT NULL,
    empresas_codigo_emp integer NOT NULL,
    usuario_cod integer NOT NULL,
    nro_apertura integer NOT NULL,
    fecha_arqueo date,
    anulado character(10)
)
WITH (autovacuum_enabled='true');
 !   DROP TABLE caja.caja_arqueo_cab;
       caja         postgres    false    5                       1259    17078    caja_arqueo_cab_nro_arqueo_seq    SEQUENCE     �   CREATE SEQUENCE caja.caja_arqueo_cab_nro_arqueo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE caja.caja_arqueo_cab_nro_arqueo_seq;
       caja       postgres    false    5    268            W           0    0    caja_arqueo_cab_nro_arqueo_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE caja.caja_arqueo_cab_nro_arqueo_seq OWNED BY caja.caja_arqueo_cab.nro_arqueo;
            caja       postgres    false    267                       1259    17109    caja_arqueo_doc_det    TABLE       CREATE TABLE caja.caja_arqueo_doc_det (
    empresas_codigo_emp integer NOT NULL,
    nro_arqueo integer NOT NULL,
    usuario_cod integer NOT NULL,
    nro_apertura integer NOT NULL,
    cod_docu_arqueo integer NOT NULL,
    moneda_cod integer NOT NULL,
    monto_doc numeric(30,2)
);
 %   DROP TABLE caja.caja_arqueo_doc_det;
       caja         postgres    false    5                       1259    17144    caja_arqueo_formas_det    TABLE     {  CREATE TABLE caja.caja_arqueo_formas_det (
    empresas_codigo_emp integer NOT NULL,
    nro_arqueo integer NOT NULL,
    usuario_cod integer NOT NULL,
    nro_apertura integer NOT NULL,
    cod_tipo_forma integer NOT NULL,
    moneda_cod integer NOT NULL,
    monto_form numeric(30,2),
    cotitipo numeric(30,2),
    monto_cob numeric(30,2)
)
WITH (autovacuum_enabled='true');
 (   DROP TABLE caja.caja_arqueo_formas_det;
       caja         postgres    false    5                       1259    17101 )   caja_documento_arqueo_cod_docu_arqueo_seq    SEQUENCE     �   CREATE SEQUENCE caja.caja_documento_arqueo_cod_docu_arqueo_seq
    AS integer
    START WITH 1
    INCREMENT BY 14
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE caja.caja_documento_arqueo_cod_docu_arqueo_seq;
       caja       postgres    false    5                       1259    17103    caja_documento_arqueo    TABLE     �   CREATE TABLE caja.caja_documento_arqueo (
    cod_docu_arqueo integer DEFAULT nextval('caja.caja_documento_arqueo_cod_docu_arqueo_seq'::regclass) NOT NULL,
    docu_arqueo_descri character(30)
);
 '   DROP TABLE caja.caja_documento_arqueo;
       caja         postgres    false    269    5            
           1259    17073    caja_mov_factura    TABLE     �   CREATE TABLE caja.caja_mov_factura (
    empresas_codigo_emp integer NOT NULL,
    caja_movimiento_nro_movimiento integer NOT NULL,
    importe numeric(30,2),
    nro_documento integer NOT NULL,
    nro_serie integer NOT NULL
);
 "   DROP TABLE caja.caja_mov_factura;
       caja         postgres    false    5            	           1259    17053    caja_mov_formas    TABLE     x  CREATE TABLE caja.caja_mov_formas (
    empresas_codigo_emp integer NOT NULL,
    nro_movimiento integer NOT NULL,
    cod_tipo_forma integer NOT NULL,
    moneda_cod integer NOT NULL,
    tipo_cambio numeric(30,2),
    fecha_vto date,
    importe numeric(30,2),
    cod_banco integer,
    tipo_cheque character(20),
    nro_cheque numeric(30,0),
    nro_cta numeric(30,0)
);
 !   DROP TABLE caja.caja_mov_formas;
       caja         postgres    false    5                       1259    17023    caja_movimiento    TABLE       CREATE TABLE caja.caja_movimiento (
    empresas_codigo_emp integer NOT NULL,
    nro_movimiento integer NOT NULL,
    usuario_cod integer,
    caja_apertu_nro_apertura integer,
    total_importe numeric(30,2),
    importe_recibido numeric(30,2),
    vuelto numeric(30,2),
    observacion character(40),
    fecha_cobro date,
    hora_cobro timestamp with time zone,
    usuario_insert integer,
    usuario_update integer,
    anulado character(10),
    cobrador_cod integer,
    coti numeric(30,2) DEFAULT 0,
    moneda_cod integer
);
 !   DROP TABLE caja.caja_movimiento;
       caja         postgres    false    5                       1259    17021 "   caja_movimiento_nro_movimiento_seq    SEQUENCE     �   CREATE SEQUENCE caja.caja_movimiento_nro_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE caja.caja_movimiento_nro_movimiento_seq;
       caja       postgres    false    5    262            X           0    0 "   caja_movimiento_nro_movimiento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE caja.caja_movimiento_nro_movimiento_seq OWNED BY caja.caja_movimiento.nro_movimiento;
            caja       postgres    false    261                       1259    17047    caja_tipos_formas_cobros    TABLE     �   CREATE TABLE caja.caja_tipos_formas_cobros (
    cod_tipo_forma integer NOT NULL,
    forma_descripcion character varying(50),
    vuelto numeric(5,0)
);
 *   DROP TABLE caja.caja_tipos_formas_cobros;
       caja         postgres    false    5                       1259    17045 +   caja_tipos_formas_cobros_cod_tipo_forma_seq    SEQUENCE     �   CREATE SEQUENCE caja.caja_tipos_formas_cobros_cod_tipo_forma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE caja.caja_tipos_formas_cobros_cod_tipo_forma_seq;
       caja       postgres    false    264    5            Y           0    0 +   caja_tipos_formas_cobros_cod_tipo_forma_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE caja.caja_tipos_formas_cobros_cod_tipo_forma_seq OWNED BY caja.caja_tipos_formas_cobros.cod_tipo_forma;
            caja       postgres    false    263            �            1259    16578    cliente    TABLE     �  CREATE TABLE caja.cliente (
    clie_cod integer NOT NULL,
    clie_ruc character varying(13),
    clie_ci character varying(20),
    clie_dir character varying(50),
    clie_nom character varying(45) NOT NULL,
    clie_celular numeric(30,0) DEFAULT 0,
    activador_ac_cod numeric(1,0),
    usuario_usuario_cod integer,
    modif_usu integer,
    union_emp_id_union integer,
    denominacion character varying(130),
    tipoiden integer DEFAULT 11
)
WITH (autovacuum_enabled='true');
    DROP TABLE caja.cliente;
       caja         postgres    false    5            �            1259    16576    cliente_clie_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.cliente_clie_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE caja.cliente_clie_cod_seq;
       caja       postgres    false    222    5            Z           0    0    cliente_clie_cod_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE caja.cliente_clie_cod_seq OWNED BY caja.cliente.clie_cod;
            caja       postgres    false    221            �            1259    16414 	   activador    TABLE     n   CREATE TABLE public.activador (
    ac_cod numeric(1,0) NOT NULL,
    ac_nom character varying(8) NOT NULL
);
    DROP TABLE public.activador;
       public         postgres    false    3                       1259    17219    clientebuscar    VIEW     E  CREATE VIEW caja.clientebuscar AS
 SELECT c.clie_cod,
    c.clie_nom,
    c.clie_ruc,
    c.clie_ci,
    c.denominacion,
    a.ac_nom,
    c.activador_ac_cod,
    c.union_emp_id_union
   FROM (caja.cliente c
     LEFT JOIN public.activador a ON ((a.ac_cod = c.activador_ac_cod)))
  WHERE (c.activador_ac_cod = (1)::numeric);
    DROP VIEW caja.clientebuscar;
       caja       postgres    false    201    201    222    222    222    222    222    222    222    5            �            1259    16717 	   condicion    TABLE     a   CREATE TABLE caja.condicion (
    cond_cod integer NOT NULL,
    nombre character varying(50)
);
    DROP TABLE caja.condicion;
       caja         postgres    false    5            �            1259    16715    condicion_cond_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.condicion_cond_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE caja.condicion_cond_cod_seq;
       caja       postgres    false    234    5            [           0    0    condicion_cond_cod_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE caja.condicion_cond_cod_seq OWNED BY caja.condicion.cond_cod;
            caja       postgres    false    233            �            1259    16953    detalle_compras    TABLE     �  CREATE TABLE caja.detalle_compras (
    cabecera_compras_compra_nro integer NOT NULL,
    producto_prod_cod integer NOT NULL,
    cantidad numeric(8,2) NOT NULL,
    costo numeric(13,2) NOT NULL,
    iva numeric(4,2) NOT NULL,
    descuento numeric(4,2) NOT NULL,
    prod_precio numeric(10,2),
    exenta numeric(10,2),
    gravada5 numeric(13,2),
    gravada10 numeric(13,2),
    id integer NOT NULL,
    cant_boni numeric(8,2)
);
 !   DROP TABLE caja.detalle_compras;
       caja         postgres    false    5            �            1259    16951    detalle_compras_id_seq    SEQUENCE     �   CREATE SEQUENCE caja.detalle_compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE caja.detalle_compras_id_seq;
       caja       postgres    false    255    5            \           0    0    detalle_compras_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE caja.detalle_compras_id_seq OWNED BY caja.detalle_compras.id;
            caja       postgres    false    254            �            1259    16789    detalle_venta    TABLE     _  CREATE TABLE caja.detalle_venta (
    cabecera_venta_venta_cod integer NOT NULL,
    producto_prod_cod integer DEFAULT 0,
    prod_cant numeric(8,2) NOT NULL,
    prod_precio numeric(10,2) NOT NULL,
    prod_iva numeric(4,2) NOT NULL,
    descuento numeric(10,2) NOT NULL,
    gravada5 numeric(30,2),
    gravada10 numeric(30,2),
    exenta numeric(30,2),
    idventa integer NOT NULL,
    costoventa numeric(10,2),
    id integer NOT NULL,
    concepto character varying(200),
    ser_cod integer DEFAULT 0,
    servicio integer DEFAULT 0,
    idservi integer DEFAULT 0
)
WITH (autovacuum_enabled='true');
    DROP TABLE caja.detalle_venta;
       caja         postgres    false    5            �            1259    16820    detalle_venta_caja    TABLE     �  CREATE TABLE caja.detalle_venta_caja (
    venta_cod integer,
    efectivo numeric(30,2),
    cheque numeric(30,2),
    tarjeta numeric(30,2),
    documento numeric(30,2),
    chequenro integer,
    fechacheque date,
    codbanco integer,
    idcaja integer NOT NULL,
    docunro integer,
    chequecta integer,
    moneda_cod integer,
    coti numeric(12,0),
    boleta character varying(50),
    trasferencia character varying(80)
);
 $   DROP TABLE caja.detalle_venta_caja;
       caja         postgres    false    5            �            1259    16818    detalle_venta_caja_idcaja_seq    SEQUENCE     �   CREATE SEQUENCE caja.detalle_venta_caja_idcaja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE caja.detalle_venta_caja_idcaja_seq;
       caja       postgres    false    245    5            ]           0    0    detalle_venta_caja_idcaja_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE caja.detalle_venta_caja_idcaja_seq OWNED BY caja.detalle_venta_caja.idcaja;
            caja       postgres    false    244            �            1259    16787    detalle_venta_id_seq    SEQUENCE     �   CREATE SEQUENCE caja.detalle_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE caja.detalle_venta_id_seq;
       caja       postgres    false    241    5            ^           0    0    detalle_venta_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE caja.detalle_venta_id_seq OWNED BY caja.detalle_venta.id;
            caja       postgres    false    240            �            1259    16785    detalle_venta_idventa_seq    SEQUENCE     �   CREATE SEQUENCE caja.detalle_venta_idventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE caja.detalle_venta_idventa_seq;
       caja       postgres    false    241    5            _           0    0    detalle_venta_idventa_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE caja.detalle_venta_idventa_seq OWNED BY caja.detalle_venta.idventa;
            caja       postgres    false    239            �            1259    16725 
   facturador    TABLE     �   CREATE TABLE caja.facturador (
    fact_cod integer NOT NULL,
    nombre character varying(80) NOT NULL,
    activador_ac_cod numeric(1,0),
    usuario_usuario_cod integer,
    m_usuario integer,
    union_emp_id_union integer
);
    DROP TABLE caja.facturador;
       caja         postgres    false    5            �            1259    16723    facturador_fact_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.facturador_fact_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE caja.facturador_fact_cod_seq;
       caja       postgres    false    236    5            `           0    0    facturador_fact_cod_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE caja.facturador_fact_cod_seq OWNED BY caja.facturador.fact_cod;
            caja       postgres    false    235            �            1259    16625    impuesto    TABLE     e   CREATE TABLE caja.impuesto (
    imp_cod numeric(2,0) NOT NULL,
    imp_des numeric(4,2) NOT NULL
);
    DROP TABLE caja.impuesto;
       caja         postgres    false    5            �            1259    16630    linea    TABLE     �   CREATE TABLE caja.linea (
    linea_cod numeric(1,0) NOT NULL,
    linea_nom character varying(30) NOT NULL,
    estado character varying(11)
);
    DROP TABLE caja.linea;
       caja         postgres    false    5            �            1259    16670    maestro_stock    TABLE     �   CREATE TABLE caja.maestro_stock (
    maestro_cod integer NOT NULL,
    producto_prod_cod integer NOT NULL,
    saldo_stock numeric(8,2) NOT NULL,
    union_emp_id_union integer
);
    DROP TABLE caja.maestro_stock;
       caja         postgres    false    5            �            1259    16668    maestro_stock_maestro_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.maestro_stock_maestro_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE caja.maestro_stock_maestro_cod_seq;
       caja       postgres    false    5    230            a           0    0    maestro_stock_maestro_cod_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE caja.maestro_stock_maestro_cod_seq OWNED BY caja.maestro_stock.maestro_cod;
            caja       postgres    false    229            �            1259    16807    moneda    TABLE       CREATE TABLE caja.moneda (
    moneda_cod integer NOT NULL,
    moneda_descri character varying(40),
    moneda_cambio numeric(30,2),
    moneda_simbol character varying(20),
    moneda_calcul numeric(30,2),
    activador_ac_cod numeric(1,0),
    convertir numeric(30,7)
);
    DROP TABLE caja.moneda;
       caja         postgres    false    5            �            1259    16805    moneda_moneda_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.moneda_moneda_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE caja.moneda_moneda_cod_seq;
       caja       postgres    false    5    243            b           0    0    moneda_moneda_cod_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE caja.moneda_moneda_cod_seq OWNED BY caja.moneda.moneda_cod;
            caja       postgres    false    242                        1259    16969    motivo    TABLE     a   CREATE TABLE caja.motivo (
    mo_cod numeric(3,0) NOT NULL,
    mo_nom character varying(35)
);
    DROP TABLE caja.motivo;
       caja         postgres    false    5            �            1259    16637    producto    TABLE       CREATE TABLE caja.producto (
    prod_cod integer NOT NULL,
    impuesto_imp_cod numeric(2,0) NOT NULL,
    linea_linea_cod numeric(2,0) NOT NULL,
    prod_precio numeric(10,2) NOT NULL,
    prod_descripcion character varying(180) NOT NULL,
    prod_minimo numeric(8,2),
    prod_maximo numeric(8,2),
    descuen_maximo numeric(4,2),
    activador_ac_cod numeric(2,0),
    usuario_usuario_cod integer,
    u_modific integer,
    costo numeric(10,2),
    union_emp_id_union integer,
    barras character varying(13)
);
    DROP TABLE caja.producto;
       caja         postgres    false    5            �            1259    16635    producto_prod_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.producto_prod_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE caja.producto_prod_cod_seq;
       caja       postgres    false    5    228            c           0    0    producto_prod_cod_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE caja.producto_prod_cod_seq OWNED BY caja.producto.prod_cod;
            caja       postgres    false    227            �            1259    16603 	   proveedor    TABLE     �  CREATE TABLE caja.proveedor (
    prov_nom character varying(60) NOT NULL,
    prov_ruc character varying(13),
    prov_tel character varying(15),
    ac_cod integer NOT NULL,
    prov_cod integer NOT NULL,
    usuario_cod integer NOT NULL,
    usuario_m integer,
    union_emp_id_union integer NOT NULL,
    timbrado integer,
    vtotim date,
    unionpago integer DEFAULT 0,
    tipoiden integer DEFAULT 11
);
    DROP TABLE caja.proveedor;
       caja         postgres    false    5            �            1259    16601    proveedor_prov_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.proveedor_prov_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE caja.proveedor_prov_cod_seq;
       caja       postgres    false    224    5            d           0    0    proveedor_prov_cod_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE caja.proveedor_prov_cod_seq OWNED BY caja.proveedor.prov_cod;
            caja       postgres    false    223            �            1259    16861    rubro    TABLE     �   CREATE TABLE caja.rubro (
    rub_cod integer NOT NULL,
    nombre character varying(100) NOT NULL,
    usuario_cod integer,
    usuario_m integer,
    ac_cod integer NOT NULL,
    union_emp_id_union integer NOT NULL,
    rubc_cod integer
);
    DROP TABLE caja.rubro;
       caja         postgres    false    5            �            1259    16859    rubro_rub_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.rubro_rub_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE caja.rubro_rub_cod_seq;
       caja       postgres    false    249    5            e           0    0    rubro_rub_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE caja.rubro_rub_cod_seq OWNED BY caja.rubro.rub_cod;
            caja       postgres    false    248            �            1259    16838    rubroclasificacion    TABLE     �   CREATE TABLE caja.rubroclasificacion (
    rubc_cod integer NOT NULL,
    nombre character varying(100) NOT NULL,
    usuario_cod integer,
    usuario_m integer,
    ac_cod integer NOT NULL,
    union_emp_id_union integer NOT NULL
);
 $   DROP TABLE caja.rubroclasificacion;
       caja         postgres    false    5            �            1259    16836    rubroclasificacion_rubc_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.rubroclasificacion_rubc_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE caja.rubroclasificacion_rubc_cod_seq;
       caja       postgres    false    5    247            f           0    0    rubroclasificacion_rubc_cod_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE caja.rubroclasificacion_rubc_cod_seq OWNED BY caja.rubroclasificacion.rubc_cod;
            caja       postgres    false    246            �            1259    16688    servicio    TABLE     E  CREATE TABLE caja.servicio (
    ser_cod integer NOT NULL,
    descripcion character varying(180) NOT NULL,
    imp_cod numeric(2,0) NOT NULL,
    ac_cod numeric(2,0),
    precio numeric(12,2),
    usuario_cod integer NOT NULL,
    usuario_m integer,
    union_emp_id_union integer,
    descuenmax numeric(12,2) DEFAULT 0
);
    DROP TABLE caja.servicio;
       caja         postgres    false    5            �            1259    16686    servicio_ser_cod_seq    SEQUENCE     �   CREATE SEQUENCE caja.servicio_ser_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE caja.servicio_ser_cod_seq;
       caja       postgres    false    232    5            g           0    0    servicio_ser_cod_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE caja.servicio_ser_cod_seq OWNED BY caja.servicio.ser_cod;
            caja       postgres    false    231            �            1259    16570    tipo_ide    TABLE     �   CREATE TABLE caja.tipo_ide (
    tipoide integer NOT NULL,
    codigo character varying(3) NOT NULL,
    nombre character varying(20) NOT NULL
);
    DROP TABLE caja.tipo_ide;
       caja         postgres    false    5            �            1259    16568    tipo_ide_tipoide_seq    SEQUENCE     �   CREATE SEQUENCE caja.tipo_ide_tipoide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE caja.tipo_ide_tipoide_seq;
       caja       postgres    false    5    220            h           0    0    tipo_ide_tipoide_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE caja.tipo_ide_tipoide_seq OWNED BY caja.tipo_ide.tipoide;
            caja       postgres    false    219            �            1259    16403 	   union_emp    TABLE     �   CREATE TABLE public.union_emp (
    id_union integer NOT NULL,
    empresas_codigo_emp integer,
    nombre_suc character(60),
    estado integer DEFAULT 0
);
    DROP TABLE public.union_emp;
       public         postgres    false    3            �            1259    16419    usuario_usuario_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_usuario_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuario_usuario_cod_seq;
       public       postgres    false    3            �            1259    16421    usuario    TABLE     �  CREATE TABLE public.usuario (
    usuario_nom character varying(45) NOT NULL,
    usuario_password character varying(25) NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL,
    activador_ac_cod numeric(1,0),
    usuario_cod integer DEFAULT nextval('public.usuario_usuario_cod_seq'::regclass) NOT NULL,
    usuario integer,
    m_usuario integer,
    union_emp_id_union integer,
    idemp integer
);
    DROP TABLE public.usuario;
       public         postgres    false    202    3            �            1259    16535    acceso_usuario    VIEW       CREATE VIEW public.acceso_usuario AS
 SELECT u.usuario_cod,
    u.usuario_nom,
    u.activador_ac_cod,
    u.usuario_password,
    u.union_emp_id_union,
    e.id_union,
    e.nombre_suc
   FROM public.usuario u,
    public.union_emp e
  WHERE (u.union_emp_id_union = e.id_union);
 !   DROP VIEW public.acceso_usuario;
       public       postgres    false    203    203    203    203    200    200    203    3            �            1259    16442    asignar    TABLE     m   CREATE TABLE public.asignar (
    asignar_cod numeric(1,0) NOT NULL,
    asignar_nom character varying(2)
);
    DROP TABLE public.asignar;
       public         postgres    false    3            �            1259    16541    cargo    TABLE     m   CREATE TABLE public.cargo (
    idcargo integer NOT NULL,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.cargo;
       public         postgres    false    3            �            1259    16539    cargo_idcargo_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_idcargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cargo_idcargo_seq;
       public       postgres    false    3    216            i           0    0    cargo_idcargo_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cargo_idcargo_seq OWNED BY public.cargo.idcargo;
            public       postgres    false    215            �            1259    16519    detalle_impresora    TABLE     v   CREATE TABLE public.detalle_impresora (
    impres integer,
    usuario_cod integer,
    usuimpre integer NOT NULL
);
 %   DROP TABLE public.detalle_impresora;
       public         postgres    false    3            �            1259    16517    detalle_impresora_usuimpre_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_impresora_usuimpre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.detalle_impresora_usuimpre_seq;
       public       postgres    false    213    3            j           0    0    detalle_impresora_usuimpre_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.detalle_impresora_usuimpre_seq OWNED BY public.detalle_impresora.usuimpre;
            public       postgres    false    212            �            1259    16549    empleado    TABLE       CREATE TABLE public.empleado (
    idemp integer NOT NULL,
    ci character varying(13),
    nombre character varying(180) NOT NULL,
    direccion character varying(200),
    celular character varying(50),
    email character varying(200),
    idcargo integer
);
    DROP TABLE public.empleado;
       public         postgres    false    3            �            1259    16547    empleado_idemp_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_idemp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.empleado_idemp_seq;
       public       postgres    false    3    218            k           0    0    empleado_idemp_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.empleado_idemp_seq OWNED BY public.empleado.idemp;
            public       postgres    false    217            �            1259    16397    empresas    TABLE     �   CREATE TABLE public.empresas (
    codigo_emp integer NOT NULL,
    nombre character varying(70),
    ruc character varying(13),
    direccion character varying(160)
);
    DROP TABLE public.empresas;
       public         postgres    false    3            �            1259    16395    empresas_codigo_emp_seq    SEQUENCE     �   CREATE SEQUENCE public.empresas_codigo_emp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empresas_codigo_emp_seq;
       public       postgres    false    3    199            l           0    0    empresas_codigo_emp_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empresas_codigo_emp_seq OWNED BY public.empresas.codigo_emp;
            public       postgres    false    198            �            1259    16472 
   impresoras    TABLE     �   CREATE TABLE public.impresoras (
    impres integer NOT NULL,
    nombre character varying(30) NOT NULL,
    ac_cod numeric(1,0) NOT NULL,
    usuario_cod integer NOT NULL,
    empresa integer NOT NULL,
    autoimpresor integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.impresoras;
       public         postgres    false    3            �            1259    16470    impresoras_impres_seq    SEQUENCE     �   CREATE SEQUENCE public.impresoras_impres_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.impresoras_impres_seq;
       public       postgres    false    209    3            m           0    0    impresoras_impres_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.impresoras_impres_seq OWNED BY public.impresoras.impres;
            public       postgres    false    208            �            1259    16500 
   nrofactura    TABLE     z  CREATE TABLE public.nrofactura (
    nrofac integer NOT NULL,
    timbrado character varying(9),
    prefijo1 integer,
    prefijo2 integer,
    nrodesde integer,
    nrohasta integer,
    impres integer,
    contador integer,
    usuario_cod integer,
    fech date,
    fech_desde date,
    digital integer DEFAULT 0,
    solicitud character varying(13),
    fechasoli date
);
    DROP TABLE public.nrofactura;
       public         postgres    false    3            �            1259    16498    nrofactura_nrofac_seq    SEQUENCE     �   CREATE SEQUENCE public.nrofactura_nrofac_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.nrofactura_nrofac_seq;
       public       postgres    false    3    211            n           0    0    nrofactura_nrofac_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.nrofactura_nrofac_seq OWNED BY public.nrofactura.nrofac;
            public       postgres    false    210            �            1259    16437    roles_usuario    TABLE     y   CREATE TABLE public.roles_usuario (
    roles_cod numeric(3,0) NOT NULL,
    roles_nom character varying(40) NOT NULL
);
 !   DROP TABLE public.roles_usuario;
       public         postgres    false    3            �            1259    16449    usuario_asignacion    TABLE     I  CREATE TABLE public.usuario_asignacion (
    usuario_usuario_cod integer NOT NULL,
    roles_usuario_roles_cod numeric(3,0) NOT NULL,
    asignar_asignar_cod numeric(1,0),
    id integer NOT NULL,
    operador integer,
    insertar numeric(2,0),
    modificar numeric(2,0),
    consultar numeric(2,0),
    borrar numeric(2,0)
);
 &   DROP TABLE public.usuario_asignacion;
       public         postgres    false    3            �            1259    16447    usuario_asignacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_asignacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.usuario_asignacion_id_seq;
       public       postgres    false    3    207            o           0    0    usuario_asignacion_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.usuario_asignacion_id_seq OWNED BY public.usuario_asignacion.id;
            public       postgres    false    206                       1259    17163    cabecera_servicio    TABLE     �   CREATE TABLE servicio.cabecera_servicio (
    servi integer NOT NULL,
    fecha date,
    fechahora timestamp without time zone,
    usuario_cod integer,
    union_emp_id_union integer,
    codclie integer,
    estado character varying(20)
);
 '   DROP TABLE servicio.cabecera_servicio;
       servicio         postgres    false    8                       1259    17161    cabecera_servicio_servi_seq    SEQUENCE     �   CREATE SEQUENCE servicio.cabecera_servicio_servi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE servicio.cabecera_servicio_servi_seq;
       servicio       postgres    false    274    8            p           0    0    cabecera_servicio_servi_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE servicio.cabecera_servicio_servi_seq OWNED BY servicio.cabecera_servicio.servi;
            servicio       postgres    false    273                       1259    17267    detalle_recepcion    TABLE     �   CREATE TABLE servicio.detalle_recepcion (
    idrece integer NOT NULL,
    servi integer,
    fecha date,
    comentario character varying(300),
    idequi integer NOT NULL,
    idmar integer
)
WITH (autovacuum_enabled='true');
 '   DROP TABLE servicio.detalle_recepcion;
       servicio         postgres    false    8                       1259    17265    detalle_recepcion_idrece_seq    SEQUENCE     �   CREATE SEQUENCE servicio.detalle_recepcion_idrece_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE servicio.detalle_recepcion_idrece_seq;
       servicio       postgres    false    8    283            q           0    0    detalle_recepcion_idrece_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE servicio.detalle_recepcion_idrece_seq OWNED BY servicio.detalle_recepcion.idrece;
            servicio       postgres    false    282                       1259    17251    detalle_servicio    TABLE     �  CREATE TABLE servicio.detalle_servicio (
    servicio integer NOT NULL,
    idservicio integer NOT NULL,
    fechai date,
    fechaf date,
    cantidad numeric(10,0),
    diagnostico character varying(180),
    estado character varying(50),
    ser_cod integer,
    descripcionservicio character varying(180),
    imp_cod numeric(10,0),
    precio numeric(10,0),
    importe numeric(10,0),
    facturado integer DEFAULT 0,
    codclie integer,
    esta character varying(20),
    saldo numeric(12,0) DEFAULT 0,
    detide integer NOT NULL,
    pagado numeric(12,0) DEFAULT 0,
    situacion character varying(5),
    usuario_cod integer,
    usuario_m integer
)
WITH (autovacuum_enabled='true');
 &   DROP TABLE servicio.detalle_servicio;
       servicio         postgres    false    8                       1259    17249    detalle_servicio_detide_seq    SEQUENCE     �   CREATE SEQUENCE servicio.detalle_servicio_detide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE servicio.detalle_servicio_detide_seq;
       servicio       postgres    false    8    281            r           0    0    detalle_servicio_detide_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE servicio.detalle_servicio_detide_seq OWNED BY servicio.detalle_servicio.detide;
            servicio       postgres    false    280                       1259    17233    equipo    TABLE     l   CREATE TABLE servicio.equipo (
    idequi integer NOT NULL,
    equiponom character varying(60) NOT NULL
);
    DROP TABLE servicio.equipo;
       servicio         postgres    false    8                       1259    17231    equipo_idequi_seq    SEQUENCE     �   CREATE SEQUENCE servicio.equipo_idequi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE servicio.equipo_idequi_seq;
       servicio       postgres    false    8    279            s           0    0    equipo_idequi_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE servicio.equipo_idequi_seq OWNED BY servicio.equipo.idequi;
            servicio       postgres    false    278                       1259    17225    marca    TABLE     i   CREATE TABLE servicio.marca (
    idmar integer NOT NULL,
    marcanom character varying(60) NOT NULL
);
    DROP TABLE servicio.marca;
       servicio         postgres    false    8                       1259    17297    informe_recepcion    VIEW     �  CREATE VIEW servicio.informe_recepcion AS
 SELECT s.servi,
    s.fecha,
    s.codclie,
    c.clie_nom,
    c.denominacion,
    c.clie_ruc,
    r.comentario,
    r.idequi,
    e.equiponom,
    r.idmar,
    m.marcanom,
    s.estado,
    s.union_emp_id_union
   FROM servicio.cabecera_servicio s,
    servicio.detalle_recepcion r,
    caja.cliente c,
    servicio.marca m,
    servicio.equipo e
  WHERE ((s.servi = r.servi) AND (s.codclie = c.clie_cod) AND (r.idequi = e.idequi) AND (m.idmar = r.idmar));
 &   DROP VIEW servicio.informe_recepcion;
       servicio       postgres    false    279    222    222    274    274    283    283    283    283    274    279    274    274    277    277    222    222    8                       1259    17223    marca_idmar_seq    SEQUENCE     �   CREATE SEQUENCE servicio.marca_idmar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE servicio.marca_idmar_seq;
       servicio       postgres    false    277    8            t           0    0    marca_idmar_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE servicio.marca_idmar_seq OWNED BY servicio.marca.idmar;
            servicio       postgres    false    276            �           2604    16979    ajuste ajus_cod    DEFAULT     n   ALTER TABLE ONLY caja.ajuste ALTER COLUMN ajus_cod SET DEFAULT nextval('caja.ajuste_ajus_cod_seq'::regclass);
 <   ALTER TABLE caja.ajuste ALTER COLUMN ajus_cod DROP DEFAULT;
       caja       postgres    false    258    257    258            �           2604    16892    cabecera_compras compra_nro    DEFAULT     �   ALTER TABLE ONLY caja.cabecera_compras ALTER COLUMN compra_nro SET DEFAULT nextval('caja.cabecera_compras_compra_nro_seq'::regclass);
 H   ALTER TABLE caja.cabecera_compras ALTER COLUMN compra_nro DROP DEFAULT;
       caja       postgres    false    251    250    251            �           2604    16932    cabecera_compras1 compra_nro    DEFAULT     �   ALTER TABLE ONLY caja.cabecera_compras1 ALTER COLUMN compra_nro SET DEFAULT nextval('caja.cabecera_compras1_compra_nro_seq'::regclass);
 I   ALTER TABLE caja.cabecera_compras1 ALTER COLUMN compra_nro DROP DEFAULT;
       caja       postgres    false    253    252    253            �           2604    16751    cabecera_venta venta_cod    DEFAULT     �   ALTER TABLE ONLY caja.cabecera_venta ALTER COLUMN venta_cod SET DEFAULT nextval('caja.cabecera_venta_venta_cod_seq'::regclass);
 E   ALTER TABLE caja.cabecera_venta ALTER COLUMN venta_cod DROP DEFAULT;
       caja       postgres    false    238    237    238            �           2604    17002    caja_apertu nro_apertura    DEFAULT     �   ALTER TABLE ONLY caja.caja_apertu ALTER COLUMN nro_apertura SET DEFAULT nextval('caja.caja_apertu_nro_apertura_seq'::regclass);
 E   ALTER TABLE caja.caja_apertu ALTER COLUMN nro_apertura DROP DEFAULT;
       caja       postgres    false    259    260    260            �           2604    17083    caja_arqueo_cab nro_arqueo    DEFAULT     �   ALTER TABLE ONLY caja.caja_arqueo_cab ALTER COLUMN nro_arqueo SET DEFAULT nextval('caja.caja_arqueo_cab_nro_arqueo_seq'::regclass);
 G   ALTER TABLE caja.caja_arqueo_cab ALTER COLUMN nro_arqueo DROP DEFAULT;
       caja       postgres    false    268    267    268            �           2604    17026    caja_movimiento nro_movimiento    DEFAULT     �   ALTER TABLE ONLY caja.caja_movimiento ALTER COLUMN nro_movimiento SET DEFAULT nextval('caja.caja_movimiento_nro_movimiento_seq'::regclass);
 K   ALTER TABLE caja.caja_movimiento ALTER COLUMN nro_movimiento DROP DEFAULT;
       caja       postgres    false    261    262    262            �           2604    17050 '   caja_tipos_formas_cobros cod_tipo_forma    DEFAULT     �   ALTER TABLE ONLY caja.caja_tipos_formas_cobros ALTER COLUMN cod_tipo_forma SET DEFAULT nextval('caja.caja_tipos_formas_cobros_cod_tipo_forma_seq'::regclass);
 T   ALTER TABLE caja.caja_tipos_formas_cobros ALTER COLUMN cod_tipo_forma DROP DEFAULT;
       caja       postgres    false    264    263    264            �           2604    16581    cliente clie_cod    DEFAULT     p   ALTER TABLE ONLY caja.cliente ALTER COLUMN clie_cod SET DEFAULT nextval('caja.cliente_clie_cod_seq'::regclass);
 =   ALTER TABLE caja.cliente ALTER COLUMN clie_cod DROP DEFAULT;
       caja       postgres    false    222    221    222            �           2604    16720    condicion cond_cod    DEFAULT     t   ALTER TABLE ONLY caja.condicion ALTER COLUMN cond_cod SET DEFAULT nextval('caja.condicion_cond_cod_seq'::regclass);
 ?   ALTER TABLE caja.condicion ALTER COLUMN cond_cod DROP DEFAULT;
       caja       postgres    false    234    233    234            �           2604    16956    detalle_compras id    DEFAULT     t   ALTER TABLE ONLY caja.detalle_compras ALTER COLUMN id SET DEFAULT nextval('caja.detalle_compras_id_seq'::regclass);
 ?   ALTER TABLE caja.detalle_compras ALTER COLUMN id DROP DEFAULT;
       caja       postgres    false    254    255    255            �           2604    16793    detalle_venta idventa    DEFAULT     z   ALTER TABLE ONLY caja.detalle_venta ALTER COLUMN idventa SET DEFAULT nextval('caja.detalle_venta_idventa_seq'::regclass);
 B   ALTER TABLE caja.detalle_venta ALTER COLUMN idventa DROP DEFAULT;
       caja       postgres    false    241    239    241            �           2604    16794    detalle_venta id    DEFAULT     p   ALTER TABLE ONLY caja.detalle_venta ALTER COLUMN id SET DEFAULT nextval('caja.detalle_venta_id_seq'::regclass);
 =   ALTER TABLE caja.detalle_venta ALTER COLUMN id DROP DEFAULT;
       caja       postgres    false    241    240    241            �           2604    16823    detalle_venta_caja idcaja    DEFAULT     �   ALTER TABLE ONLY caja.detalle_venta_caja ALTER COLUMN idcaja SET DEFAULT nextval('caja.detalle_venta_caja_idcaja_seq'::regclass);
 F   ALTER TABLE caja.detalle_venta_caja ALTER COLUMN idcaja DROP DEFAULT;
       caja       postgres    false    244    245    245            �           2604    16728    facturador fact_cod    DEFAULT     v   ALTER TABLE ONLY caja.facturador ALTER COLUMN fact_cod SET DEFAULT nextval('caja.facturador_fact_cod_seq'::regclass);
 @   ALTER TABLE caja.facturador ALTER COLUMN fact_cod DROP DEFAULT;
       caja       postgres    false    236    235    236            �           2604    16673    maestro_stock maestro_cod    DEFAULT     �   ALTER TABLE ONLY caja.maestro_stock ALTER COLUMN maestro_cod SET DEFAULT nextval('caja.maestro_stock_maestro_cod_seq'::regclass);
 F   ALTER TABLE caja.maestro_stock ALTER COLUMN maestro_cod DROP DEFAULT;
       caja       postgres    false    229    230    230            �           2604    16810    moneda moneda_cod    DEFAULT     r   ALTER TABLE ONLY caja.moneda ALTER COLUMN moneda_cod SET DEFAULT nextval('caja.moneda_moneda_cod_seq'::regclass);
 >   ALTER TABLE caja.moneda ALTER COLUMN moneda_cod DROP DEFAULT;
       caja       postgres    false    243    242    243            �           2604    16640    producto prod_cod    DEFAULT     r   ALTER TABLE ONLY caja.producto ALTER COLUMN prod_cod SET DEFAULT nextval('caja.producto_prod_cod_seq'::regclass);
 >   ALTER TABLE caja.producto ALTER COLUMN prod_cod DROP DEFAULT;
       caja       postgres    false    227    228    228            �           2604    16606    proveedor prov_cod    DEFAULT     t   ALTER TABLE ONLY caja.proveedor ALTER COLUMN prov_cod SET DEFAULT nextval('caja.proveedor_prov_cod_seq'::regclass);
 ?   ALTER TABLE caja.proveedor ALTER COLUMN prov_cod DROP DEFAULT;
       caja       postgres    false    223    224    224            �           2604    16864    rubro rub_cod    DEFAULT     j   ALTER TABLE ONLY caja.rubro ALTER COLUMN rub_cod SET DEFAULT nextval('caja.rubro_rub_cod_seq'::regclass);
 :   ALTER TABLE caja.rubro ALTER COLUMN rub_cod DROP DEFAULT;
       caja       postgres    false    248    249    249            �           2604    16841    rubroclasificacion rubc_cod    DEFAULT     �   ALTER TABLE ONLY caja.rubroclasificacion ALTER COLUMN rubc_cod SET DEFAULT nextval('caja.rubroclasificacion_rubc_cod_seq'::regclass);
 H   ALTER TABLE caja.rubroclasificacion ALTER COLUMN rubc_cod DROP DEFAULT;
       caja       postgres    false    247    246    247            �           2604    16691    servicio ser_cod    DEFAULT     p   ALTER TABLE ONLY caja.servicio ALTER COLUMN ser_cod SET DEFAULT nextval('caja.servicio_ser_cod_seq'::regclass);
 =   ALTER TABLE caja.servicio ALTER COLUMN ser_cod DROP DEFAULT;
       caja       postgres    false    231    232    232            �           2604    16573    tipo_ide tipoide    DEFAULT     p   ALTER TABLE ONLY caja.tipo_ide ALTER COLUMN tipoide SET DEFAULT nextval('caja.tipo_ide_tipoide_seq'::regclass);
 =   ALTER TABLE caja.tipo_ide ALTER COLUMN tipoide DROP DEFAULT;
       caja       postgres    false    219    220    220            �           2604    16544    cargo idcargo    DEFAULT     n   ALTER TABLE ONLY public.cargo ALTER COLUMN idcargo SET DEFAULT nextval('public.cargo_idcargo_seq'::regclass);
 <   ALTER TABLE public.cargo ALTER COLUMN idcargo DROP DEFAULT;
       public       postgres    false    216    215    216            �           2604    16522    detalle_impresora usuimpre    DEFAULT     �   ALTER TABLE ONLY public.detalle_impresora ALTER COLUMN usuimpre SET DEFAULT nextval('public.detalle_impresora_usuimpre_seq'::regclass);
 I   ALTER TABLE public.detalle_impresora ALTER COLUMN usuimpre DROP DEFAULT;
       public       postgres    false    213    212    213            �           2604    16552    empleado idemp    DEFAULT     p   ALTER TABLE ONLY public.empleado ALTER COLUMN idemp SET DEFAULT nextval('public.empleado_idemp_seq'::regclass);
 =   ALTER TABLE public.empleado ALTER COLUMN idemp DROP DEFAULT;
       public       postgres    false    218    217    218            }           2604    16400    empresas codigo_emp    DEFAULT     z   ALTER TABLE ONLY public.empresas ALTER COLUMN codigo_emp SET DEFAULT nextval('public.empresas_codigo_emp_seq'::regclass);
 B   ALTER TABLE public.empresas ALTER COLUMN codigo_emp DROP DEFAULT;
       public       postgres    false    198    199    199            �           2604    16475    impresoras impres    DEFAULT     v   ALTER TABLE ONLY public.impresoras ALTER COLUMN impres SET DEFAULT nextval('public.impresoras_impres_seq'::regclass);
 @   ALTER TABLE public.impresoras ALTER COLUMN impres DROP DEFAULT;
       public       postgres    false    208    209    209            �           2604    16503    nrofactura nrofac    DEFAULT     v   ALTER TABLE ONLY public.nrofactura ALTER COLUMN nrofac SET DEFAULT nextval('public.nrofactura_nrofac_seq'::regclass);
 @   ALTER TABLE public.nrofactura ALTER COLUMN nrofac DROP DEFAULT;
       public       postgres    false    211    210    211            �           2604    16452    usuario_asignacion id    DEFAULT     ~   ALTER TABLE ONLY public.usuario_asignacion ALTER COLUMN id SET DEFAULT nextval('public.usuario_asignacion_id_seq'::regclass);
 D   ALTER TABLE public.usuario_asignacion ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �           2604    17166    cabecera_servicio servi    DEFAULT     �   ALTER TABLE ONLY servicio.cabecera_servicio ALTER COLUMN servi SET DEFAULT nextval('servicio.cabecera_servicio_servi_seq'::regclass);
 H   ALTER TABLE servicio.cabecera_servicio ALTER COLUMN servi DROP DEFAULT;
       servicio       postgres    false    273    274    274            �           2604    17270    detalle_recepcion idrece    DEFAULT     �   ALTER TABLE ONLY servicio.detalle_recepcion ALTER COLUMN idrece SET DEFAULT nextval('servicio.detalle_recepcion_idrece_seq'::regclass);
 I   ALTER TABLE servicio.detalle_recepcion ALTER COLUMN idrece DROP DEFAULT;
       servicio       postgres    false    282    283    283            �           2604    17256    detalle_servicio detide    DEFAULT     �   ALTER TABLE ONLY servicio.detalle_servicio ALTER COLUMN detide SET DEFAULT nextval('servicio.detalle_servicio_detide_seq'::regclass);
 H   ALTER TABLE servicio.detalle_servicio ALTER COLUMN detide DROP DEFAULT;
       servicio       postgres    false    280    281    281            �           2604    17236    equipo idequi    DEFAULT     r   ALTER TABLE ONLY servicio.equipo ALTER COLUMN idequi SET DEFAULT nextval('servicio.equipo_idequi_seq'::regclass);
 >   ALTER TABLE servicio.equipo ALTER COLUMN idequi DROP DEFAULT;
       servicio       postgres    false    278    279    279            �           2604    17228    marca idmar    DEFAULT     n   ALTER TABLE ONLY servicio.marca ALTER COLUMN idmar SET DEFAULT nextval('servicio.marca_idmar_seq'::regclass);
 <   ALTER TABLE servicio.marca ALTER COLUMN idmar DROP DEFAULT;
       servicio       postgres    false    277    276    277            1          0    16976    ajuste 
   TABLE DATA               �   COPY caja.ajuste (maestro_stock_producto_prod_cod, ajus_cant, fecha, fecha_grabacion, motivo_mo_cod, canti_anterior, ajus_cod, usuario_usuario_cod, union_emp_id_union) FROM stdin;
    caja       postgres    false    258   �      *          0    16889    cabecera_compras 
   TABLE DATA               �  COPY caja.cabecera_compras (compra_nro, cond_cod, prov_cod, compra_fecha, factura_nro, compra_total, fecha_grabacion, iva10, iva5, total_exenta, total_gravada5, total_gravada10, total_iva, estado, usuario_cod, usu_mod, union_emp_id_union, retencion, factura, timbrado, retencion5, retencion10, retencionrenta, autorden, boni, porboni, cptcod, tipo_factura, caja, ingre_egre, nro_apertura, concepto, anulacion, rub_cod, tipo) FROM stdin;
    caja       postgres    false    251         ,          0    16929    cabecera_compras1 
   TABLE DATA               G  COPY caja.cabecera_compras1 (compra_nro, condicion_cond_cod, proveedor_prov_cod, compra_fecha, factura_nro, compra_total, fecha_grabacion, iva10, iva5, total_exenta, total_gravada, total_iva, estado, usuario_usuario_cod, usu_mod, union_emp_id_union, moneda_moneda_cod, coti, factura, timbrado, descu, descgs, sfac) FROM stdin;
    caja       postgres    false    253   (                0    16748    cabecera_venta 
   TABLE DATA               �  COPY caja.cabecera_venta (venta_cod, condicion_cond_cod, cliente_clie_cod, facturador_fact_cod, venta_fecha, venta_total, fecha_grabacion, iva5, iva10, totaliva, totalgravada5, totalgravada10, totalexenta, totaldescuento, estado, usuario_usuario_cod, union_emp_id_union, factura_nro, factura, tipofactura, redondeo, tarjeta, timbrado, nro_factur, fechafinvigen, solicitud, fechasoli, digital, nro_apertura, nro_movimiento, razon, ruc, facturacion) FROM stdin;
    caja       postgres    false    238   E      3          0    16999    caja_apertu 
   TABLE DATA               �   COPY caja.caja_apertu (nro_apertura, usuario_cod, empresas_codigo_emp, fecha_aper, hora_aper, fecha_cierre, hora_cierre, anulado, union_emp_id_union, importe) FROM stdin;
    caja       postgres    false    260   b      ;          0    17080    caja_arqueo_cab 
   TABLE DATA               z   COPY caja.caja_arqueo_cab (nro_arqueo, empresas_codigo_emp, usuario_cod, nro_apertura, fecha_arqueo, anulado) FROM stdin;
    caja       postgres    false    268         >          0    17109    caja_arqueo_doc_det 
   TABLE DATA               �   COPY caja.caja_arqueo_doc_det (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_docu_arqueo, moneda_cod, monto_doc) FROM stdin;
    caja       postgres    false    271   �      ?          0    17144    caja_arqueo_formas_det 
   TABLE DATA               �   COPY caja.caja_arqueo_formas_det (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_tipo_forma, moneda_cod, monto_form, cotitipo, monto_cob) FROM stdin;
    caja       postgres    false    272   �      =          0    17103    caja_documento_arqueo 
   TABLE DATA               R   COPY caja.caja_documento_arqueo (cod_docu_arqueo, docu_arqueo_descri) FROM stdin;
    caja       postgres    false    270   �      9          0    17073    caja_mov_factura 
   TABLE DATA               �   COPY caja.caja_mov_factura (empresas_codigo_emp, caja_movimiento_nro_movimiento, importe, nro_documento, nro_serie) FROM stdin;
    caja       postgres    false    266   s	      8          0    17053    caja_mov_formas 
   TABLE DATA               �   COPY caja.caja_mov_formas (empresas_codigo_emp, nro_movimiento, cod_tipo_forma, moneda_cod, tipo_cambio, fecha_vto, importe, cod_banco, tipo_cheque, nro_cheque, nro_cta) FROM stdin;
    caja       postgres    false    265   �	      5          0    17023    caja_movimiento 
   TABLE DATA                 COPY caja.caja_movimiento (empresas_codigo_emp, nro_movimiento, usuario_cod, caja_apertu_nro_apertura, total_importe, importe_recibido, vuelto, observacion, fecha_cobro, hora_cobro, usuario_insert, usuario_update, anulado, cobrador_cod, coti, moneda_cod) FROM stdin;
    caja       postgres    false    262   �	      7          0    17047    caja_tipos_formas_cobros 
   TABLE DATA               [   COPY caja.caja_tipos_formas_cobros (cod_tipo_forma, forma_descripcion, vuelto) FROM stdin;
    caja       postgres    false    264   �	                0    16578    cliente 
   TABLE DATA               �   COPY caja.cliente (clie_cod, clie_ruc, clie_ci, clie_dir, clie_nom, clie_celular, activador_ac_cod, usuario_usuario_cod, modif_usu, union_emp_id_union, denominacion, tipoiden) FROM stdin;
    caja       postgres    false    222   4
                0    16717 	   condicion 
   TABLE DATA               3   COPY caja.condicion (cond_cod, nombre) FROM stdin;
    caja       postgres    false    234         .          0    16953    detalle_compras 
   TABLE DATA               �   COPY caja.detalle_compras (cabecera_compras_compra_nro, producto_prod_cod, cantidad, costo, iva, descuento, prod_precio, exenta, gravada5, gravada10, id, cant_boni) FROM stdin;
    caja       postgres    false    255   A                 0    16789    detalle_venta 
   TABLE DATA               �   COPY caja.detalle_venta (cabecera_venta_venta_cod, producto_prod_cod, prod_cant, prod_precio, prod_iva, descuento, gravada5, gravada10, exenta, idventa, costoventa, id, concepto, ser_cod, servicio, idservi) FROM stdin;
    caja       postgres    false    241   ^      $          0    16820    detalle_venta_caja 
   TABLE DATA               �   COPY caja.detalle_venta_caja (venta_cod, efectivo, cheque, tarjeta, documento, chequenro, fechacheque, codbanco, idcaja, docunro, chequecta, moneda_cod, coti, boleta, trasferencia) FROM stdin;
    caja       postgres    false    245   {                0    16725 
   facturador 
   TABLE DATA               z   COPY caja.facturador (fact_cod, nombre, activador_ac_cod, usuario_usuario_cod, m_usuario, union_emp_id_union) FROM stdin;
    caja       postgres    false    236   �                0    16625    impuesto 
   TABLE DATA               2   COPY caja.impuesto (imp_cod, imp_des) FROM stdin;
    caja       postgres    false    225   �                0    16630    linea 
   TABLE DATA               ;   COPY caja.linea (linea_cod, linea_nom, estado) FROM stdin;
    caja       postgres    false    226   �                0    16670    maestro_stock 
   TABLE DATA               f   COPY caja.maestro_stock (maestro_cod, producto_prod_cod, saldo_stock, union_emp_id_union) FROM stdin;
    caja       postgres    false    230   )      "          0    16807    moneda 
   TABLE DATA               �   COPY caja.moneda (moneda_cod, moneda_descri, moneda_cambio, moneda_simbol, moneda_calcul, activador_ac_cod, convertir) FROM stdin;
    caja       postgres    false    243   F      /          0    16969    motivo 
   TABLE DATA               .   COPY caja.motivo (mo_cod, mo_nom) FROM stdin;
    caja       postgres    false    256   �                0    16637    producto 
   TABLE DATA               �   COPY caja.producto (prod_cod, impuesto_imp_cod, linea_linea_cod, prod_precio, prod_descripcion, prod_minimo, prod_maximo, descuen_maximo, activador_ac_cod, usuario_usuario_cod, u_modific, costo, union_emp_id_union, barras) FROM stdin;
    caja       postgres    false    228   �                0    16603 	   proveedor 
   TABLE DATA               �   COPY caja.proveedor (prov_nom, prov_ruc, prov_tel, ac_cod, prov_cod, usuario_cod, usuario_m, union_emp_id_union, timbrado, vtotim, unionpago, tipoiden) FROM stdin;
    caja       postgres    false    224         (          0    16861    rubro 
   TABLE DATA               l   COPY caja.rubro (rub_cod, nombre, usuario_cod, usuario_m, ac_cod, union_emp_id_union, rubc_cod) FROM stdin;
    caja       postgres    false    249          &          0    16838    rubroclasificacion 
   TABLE DATA               p   COPY caja.rubroclasificacion (rubc_cod, nombre, usuario_cod, usuario_m, ac_cod, union_emp_id_union) FROM stdin;
    caja       postgres    false    247   �                0    16688    servicio 
   TABLE DATA               �   COPY caja.servicio (ser_cod, descripcion, imp_cod, ac_cod, precio, usuario_cod, usuario_m, union_emp_id_union, descuenmax) FROM stdin;
    caja       postgres    false    232                   0    16570    tipo_ide 
   TABLE DATA               9   COPY caja.tipo_ide (tipoide, codigo, nombre) FROM stdin;
    caja       postgres    false    220   2      �          0    16414 	   activador 
   TABLE DATA               3   COPY public.activador (ac_cod, ac_nom) FROM stdin;
    public       postgres    false    201   �      �          0    16442    asignar 
   TABLE DATA               ;   COPY public.asignar (asignar_cod, asignar_nom) FROM stdin;
    public       postgres    false    205   �                0    16541    cargo 
   TABLE DATA               5   COPY public.cargo (idcargo, descripcion) FROM stdin;
    public       postgres    false    216   �                0    16519    detalle_impresora 
   TABLE DATA               J   COPY public.detalle_impresora (impres, usuario_cod, usuimpre) FROM stdin;
    public       postgres    false    213   O      	          0    16549    empleado 
   TABLE DATA               Y   COPY public.empleado (idemp, ci, nombre, direccion, celular, email, idcargo) FROM stdin;
    public       postgres    false    218   r      �          0    16397    empresas 
   TABLE DATA               F   COPY public.empresas (codigo_emp, nombre, ruc, direccion) FROM stdin;
    public       postgres    false    199   �                0    16472 
   impresoras 
   TABLE DATA               `   COPY public.impresoras (impres, nombre, ac_cod, usuario_cod, empresa, autoimpresor) FROM stdin;
    public       postgres    false    209   3                0    16500 
   nrofactura 
   TABLE DATA               �   COPY public.nrofactura (nrofac, timbrado, prefijo1, prefijo2, nrodesde, nrohasta, impres, contador, usuario_cod, fech, fech_desde, digital, solicitud, fechasoli) FROM stdin;
    public       postgres    false    211   b      �          0    16437    roles_usuario 
   TABLE DATA               =   COPY public.roles_usuario (roles_cod, roles_nom) FROM stdin;
    public       postgres    false    204   �      �          0    16403 	   union_emp 
   TABLE DATA               V   COPY public.union_emp (id_union, empresas_codigo_emp, nombre_suc, estado) FROM stdin;
    public       postgres    false    200   �      �          0    16421    usuario 
   TABLE DATA               �   COPY public.usuario (usuario_nom, usuario_password, fecha_creacion, activador_ac_cod, usuario_cod, usuario, m_usuario, union_emp_id_union, idemp) FROM stdin;
    public       postgres    false    203         �          0    16449    usuario_asignacion 
   TABLE DATA               �   COPY public.usuario_asignacion (usuario_usuario_cod, roles_usuario_roles_cod, asignar_asignar_cod, id, operador, insertar, modificar, consultar, borrar) FROM stdin;
    public       postgres    false    207   o      A          0    17163    cabecera_servicio 
   TABLE DATA               x   COPY servicio.cabecera_servicio (servi, fecha, fechahora, usuario_cod, union_emp_id_union, codclie, estado) FROM stdin;
    servicio       postgres    false    274   �      I          0    17267    detalle_recepcion 
   TABLE DATA               ^   COPY servicio.detalle_recepcion (idrece, servi, fecha, comentario, idequi, idmar) FROM stdin;
    servicio       postgres    false    283   �      G          0    17251    detalle_servicio 
   TABLE DATA               �   COPY servicio.detalle_servicio (servicio, idservicio, fechai, fechaf, cantidad, diagnostico, estado, ser_cod, descripcionservicio, imp_cod, precio, importe, facturado, codclie, esta, saldo, detide, pagado, situacion, usuario_cod, usuario_m) FROM stdin;
    servicio       postgres    false    281   x      E          0    17233    equipo 
   TABLE DATA               5   COPY servicio.equipo (idequi, equiponom) FROM stdin;
    servicio       postgres    false    279   �      C          0    17225    marca 
   TABLE DATA               2   COPY servicio.marca (idmar, marcanom) FROM stdin;
    servicio       postgres    false    277   �      u           0    0    ajuste_ajus_cod_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('caja.ajuste_ajus_cod_seq', 1, false);
            caja       postgres    false    257            v           0    0     cabecera_compras1_compra_nro_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('caja.cabecera_compras1_compra_nro_seq', 1, false);
            caja       postgres    false    252            w           0    0    cabecera_compras_compra_nro_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('caja.cabecera_compras_compra_nro_seq', 1, false);
            caja       postgres    false    250            x           0    0    cabecera_venta_venta_cod_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('caja.cabecera_venta_venta_cod_seq', 1, false);
            caja       postgres    false    237            y           0    0    caja_apertu_nro_apertura_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('caja.caja_apertu_nro_apertura_seq', 1, false);
            caja       postgres    false    259            z           0    0    caja_arqueo_cab_nro_arqueo_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('caja.caja_arqueo_cab_nro_arqueo_seq', 1, false);
            caja       postgres    false    267            {           0    0 )   caja_documento_arqueo_cod_docu_arqueo_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('caja.caja_documento_arqueo_cod_docu_arqueo_seq', 1, false);
            caja       postgres    false    269            |           0    0 "   caja_movimiento_nro_movimiento_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('caja.caja_movimiento_nro_movimiento_seq', 1, false);
            caja       postgres    false    261            }           0    0 +   caja_tipos_formas_cobros_cod_tipo_forma_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('caja.caja_tipos_formas_cobros_cod_tipo_forma_seq', 6, true);
            caja       postgres    false    263            ~           0    0    cliente_clie_cod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('caja.cliente_clie_cod_seq', 17, true);
            caja       postgres    false    221                       0    0    condicion_cond_cod_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('caja.condicion_cond_cod_seq', 2, true);
            caja       postgres    false    233            �           0    0    detalle_compras_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('caja.detalle_compras_id_seq', 1, false);
            caja       postgres    false    254            �           0    0    detalle_venta_caja_idcaja_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('caja.detalle_venta_caja_idcaja_seq', 1, false);
            caja       postgres    false    244            �           0    0    detalle_venta_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('caja.detalle_venta_id_seq', 1, false);
            caja       postgres    false    240            �           0    0    detalle_venta_idventa_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('caja.detalle_venta_idventa_seq', 1, false);
            caja       postgres    false    239            �           0    0    facturador_fact_cod_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('caja.facturador_fact_cod_seq', 1, true);
            caja       postgres    false    235            �           0    0    maestro_stock_maestro_cod_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('caja.maestro_stock_maestro_cod_seq', 1, false);
            caja       postgres    false    229            �           0    0    moneda_moneda_cod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('caja.moneda_moneda_cod_seq', 2, true);
            caja       postgres    false    242            �           0    0    producto_prod_cod_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('caja.producto_prod_cod_seq', 1, false);
            caja       postgres    false    227            �           0    0    proveedor_prov_cod_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('caja.proveedor_prov_cod_seq', 1, false);
            caja       postgres    false    223            �           0    0    rubro_rub_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('caja.rubro_rub_cod_seq', 4, true);
            caja       postgres    false    248            �           0    0    rubroclasificacion_rubc_cod_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('caja.rubroclasificacion_rubc_cod_seq', 6, true);
            caja       postgres    false    246            �           0    0    servicio_ser_cod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('caja.servicio_ser_cod_seq', 1, false);
            caja       postgres    false    231            �           0    0    tipo_ide_tipoide_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('caja.tipo_ide_tipoide_seq', 3, true);
            caja       postgres    false    219            �           0    0    cargo_idcargo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cargo_idcargo_seq', 10, true);
            public       postgres    false    215            �           0    0    detalle_impresora_usuimpre_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.detalle_impresora_usuimpre_seq', 1, false);
            public       postgres    false    212            �           0    0    empleado_idemp_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.empleado_idemp_seq', 7, true);
            public       postgres    false    217            �           0    0    empresas_codigo_emp_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.empresas_codigo_emp_seq', 1, false);
            public       postgres    false    198            �           0    0    impresoras_impres_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.impresoras_impres_seq', 1, false);
            public       postgres    false    208            �           0    0    nrofactura_nrofac_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.nrofactura_nrofac_seq', 1, false);
            public       postgres    false    210            �           0    0    usuario_asignacion_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.usuario_asignacion_id_seq', 1, true);
            public       postgres    false    206            �           0    0    usuario_usuario_cod_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_usuario_cod_seq', 2, true);
            public       postgres    false    202            �           0    0    cabecera_servicio_servi_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('servicio.cabecera_servicio_servi_seq', 3, true);
            servicio       postgres    false    273            �           0    0    detalle_recepcion_idrece_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('servicio.detalle_recepcion_idrece_seq', 4, true);
            servicio       postgres    false    282            �           0    0    detalle_servicio_detide_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('servicio.detalle_servicio_detide_seq', 1, false);
            servicio       postgres    false    280            �           0    0    equipo_idequi_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('servicio.equipo_idequi_seq', 5, true);
            servicio       postgres    false    278            �           0    0    marca_idmar_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('servicio.marca_idmar_seq', 14, true);
            servicio       postgres    false    276                       2606    16981    ajuste ajuste_cod_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY caja.ajuste
    ADD CONSTRAINT ajuste_cod_pkey PRIMARY KEY (ajus_cod);
 >   ALTER TABLE ONLY caja.ajuste DROP CONSTRAINT ajuste_cod_pkey;
       caja         postgres    false    258            �           2606    16901 &   cabecera_compras cabecera_compras_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT cabecera_compras_pkey PRIMARY KEY (compra_nro);
 N   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT cabecera_compras_pkey;
       caja         postgres    false    251            �           2606    16759 "   cabecera_venta cabecera_venta_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT cabecera_venta_pkey PRIMARY KEY (venta_cod);
 J   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT cabecera_venta_pkey;
       caja         postgres    false    238            �           2606    16935 %   cabecera_compras1 cabeceracompraspkey 
   CONSTRAINT     i   ALTER TABLE ONLY caja.cabecera_compras1
    ADD CONSTRAINT cabeceracompraspkey PRIMARY KEY (compra_nro);
 M   ALTER TABLE ONLY caja.cabecera_compras1 DROP CONSTRAINT cabeceracompraspkey;
       caja         postgres    false    253                       2606    17085 "   caja_arqueo_cab caja_arqueo_cab_pk 
   CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_cab
    ADD CONSTRAINT caja_arqueo_cab_pk PRIMARY KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp);
 J   ALTER TABLE ONLY caja.caja_arqueo_cab DROP CONSTRAINT caja_arqueo_cab_pk;
       caja         postgres    false    268    268    268    268                       2606    17113 *   caja_arqueo_doc_det caja_arqueo_doc_det_fk 
   CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT caja_arqueo_doc_det_fk PRIMARY KEY (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_docu_arqueo, moneda_cod);
 R   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT caja_arqueo_doc_det_fk;
       caja         postgres    false    271    271    271    271    271    271                       2606    17148 0   caja_arqueo_formas_det caja_arqueo_formas_det_pk 
   CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_formas_det
    ADD CONSTRAINT caja_arqueo_formas_det_pk PRIMARY KEY (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_tipo_forma, moneda_cod);
 X   ALTER TABLE ONLY caja.caja_arqueo_formas_det DROP CONSTRAINT caja_arqueo_formas_det_pk;
       caja         postgres    false    272    272    272    272    272    272                       2606    17057 "   caja_mov_formas caja_mov_formas_pk 
   CONSTRAINT     �   ALTER TABLE ONLY caja.caja_mov_formas
    ADD CONSTRAINT caja_mov_formas_pk PRIMARY KEY (empresas_codigo_emp, nro_movimiento, cod_tipo_forma, moneda_cod);
 J   ALTER TABLE ONLY caja.caja_mov_formas DROP CONSTRAINT caja_mov_formas_pk;
       caja         postgres    false    265    265    265    265            �           2606    16585    cliente cliente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY caja.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (clie_cod);
 <   ALTER TABLE ONLY caja.cliente DROP CONSTRAINT cliente_pkey;
       caja         postgres    false    222            	           2606    17052 *   caja_tipos_formas_cobros cod_tipo_forma_pk 
   CONSTRAINT     r   ALTER TABLE ONLY caja.caja_tipos_formas_cobros
    ADD CONSTRAINT cod_tipo_forma_pk PRIMARY KEY (cod_tipo_forma);
 R   ALTER TABLE ONLY caja.caja_tipos_formas_cobros DROP CONSTRAINT cod_tipo_forma_pk;
       caja         postgres    false    264            �           2606    16722    condicion cond_codpk 
   CONSTRAINT     V   ALTER TABLE ONLY caja.condicion
    ADD CONSTRAINT cond_codpk PRIMARY KEY (cond_cod);
 <   ALTER TABLE ONLY caja.condicion DROP CONSTRAINT cond_codpk;
       caja         postgres    false    234                       2606    17108 %   caja_documento_arqueo cpd_docu_arqueo 
   CONSTRAINT     n   ALTER TABLE ONLY caja.caja_documento_arqueo
    ADD CONSTRAINT cpd_docu_arqueo PRIMARY KEY (cod_docu_arqueo);
 M   ALTER TABLE ONLY caja.caja_documento_arqueo DROP CONSTRAINT cpd_docu_arqueo;
       caja         postgres    false    270            �           2606    16958 '   detalle_compras detalle_compras_id_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY caja.detalle_compras
    ADD CONSTRAINT detalle_compras_id_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY caja.detalle_compras DROP CONSTRAINT detalle_compras_id_pkey;
       caja         postgres    false    255            �           2606    16799    detalle_venta detventapkey 
   CONSTRAINT     [   ALTER TABLE ONLY caja.detalle_venta
    ADD CONSTRAINT detventapkey PRIMARY KEY (idventa);
 B   ALTER TABLE ONLY caja.detalle_venta DROP CONSTRAINT detventapkey;
       caja         postgres    false    241            �           2606    16730    facturador factcod_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY caja.facturador
    ADD CONSTRAINT factcod_pkey PRIMARY KEY (fact_cod);
 ?   ALTER TABLE ONLY caja.facturador DROP CONSTRAINT factcod_pkey;
       caja         postgres    false    236                       2606    17077    caja_mov_factura factura_pk 
   CONSTRAINT     �   ALTER TABLE ONLY caja.caja_mov_factura
    ADD CONSTRAINT factura_pk PRIMARY KEY (empresas_codigo_emp, caja_movimiento_nro_movimiento, nro_serie, nro_documento);
 C   ALTER TABLE ONLY caja.caja_mov_factura DROP CONSTRAINT factura_pk;
       caja         postgres    false    266    266    266    266            �           2606    16825    detalle_venta_caja idcajapk 
   CONSTRAINT     [   ALTER TABLE ONLY caja.detalle_venta_caja
    ADD CONSTRAINT idcajapk PRIMARY KEY (idcaja);
 C   ALTER TABLE ONLY caja.detalle_venta_caja DROP CONSTRAINT idcajapk;
       caja         postgres    false    245            �           2606    16629    impuesto impuesto_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY caja.impuesto
    ADD CONSTRAINT impuesto_pkey PRIMARY KEY (imp_cod);
 >   ALTER TABLE ONLY caja.impuesto DROP CONSTRAINT impuesto_pkey;
       caja         postgres    false    225            �           2606    16634    linea linea_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY caja.linea
    ADD CONSTRAINT linea_pkey PRIMARY KEY (linea_cod);
 8   ALTER TABLE ONLY caja.linea DROP CONSTRAINT linea_pkey;
       caja         postgres    false    226            �           2606    16675 ,   maestro_stock maestro_stock_maestro_cod_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY caja.maestro_stock
    ADD CONSTRAINT maestro_stock_maestro_cod_pkey PRIMARY KEY (maestro_cod);
 T   ALTER TABLE ONLY caja.maestro_stock DROP CONSTRAINT maestro_stock_maestro_cod_pkey;
       caja         postgres    false    230                       2606    16973    motivo mo_cod 
   CONSTRAINT     M   ALTER TABLE ONLY caja.motivo
    ADD CONSTRAINT mo_cod PRIMARY KEY (mo_cod);
 5   ALTER TABLE ONLY caja.motivo DROP CONSTRAINT mo_cod;
       caja         postgres    false    256            �           2606    16812    moneda moneda_cod 
   CONSTRAINT     U   ALTER TABLE ONLY caja.moneda
    ADD CONSTRAINT moneda_cod PRIMARY KEY (moneda_cod);
 9   ALTER TABLE ONLY caja.moneda DROP CONSTRAINT moneda_cod;
       caja         postgres    false    243                       2606    17005    caja_apertu nro_apertu 
   CONSTRAINT     ~   ALTER TABLE ONLY caja.caja_apertu
    ADD CONSTRAINT nro_apertu PRIMARY KEY (nro_apertura, usuario_cod, empresas_codigo_emp);
 >   ALTER TABLE ONLY caja.caja_apertu DROP CONSTRAINT nro_apertu;
       caja         postgres    false    260    260    260                       2606    17029    caja_movimiento pk 
   CONSTRAINT     o   ALTER TABLE ONLY caja.caja_movimiento
    ADD CONSTRAINT pk PRIMARY KEY (empresas_codigo_emp, nro_movimiento);
 :   ALTER TABLE ONLY caja.caja_movimiento DROP CONSTRAINT pk;
       caja         postgres    false    262    262            �           2606    16642    producto producto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (prod_cod);
 >   ALTER TABLE ONLY caja.producto DROP CONSTRAINT producto_pkey;
       caja         postgres    false    228            �           2606    16609 !   proveedor proveedor_prov_cod_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY caja.proveedor
    ADD CONSTRAINT proveedor_prov_cod_pkey PRIMARY KEY (prov_cod);
 I   ALTER TABLE ONLY caja.proveedor DROP CONSTRAINT proveedor_prov_cod_pkey;
       caja         postgres    false    224            �           2606    16866    rubro rub_codpk 
   CONSTRAINT     P   ALTER TABLE ONLY caja.rubro
    ADD CONSTRAINT rub_codpk PRIMARY KEY (rub_cod);
 7   ALTER TABLE ONLY caja.rubro DROP CONSTRAINT rub_codpk;
       caja         postgres    false    249            �           2606    16843    rubroclasificacion rubc_codpk 
   CONSTRAINT     _   ALTER TABLE ONLY caja.rubroclasificacion
    ADD CONSTRAINT rubc_codpk PRIMARY KEY (rubc_cod);
 E   ALTER TABLE ONLY caja.rubroclasificacion DROP CONSTRAINT rubc_codpk;
       caja         postgres    false    247            �           2606    16694    servicio ser_codpkey 
   CONSTRAINT     U   ALTER TABLE ONLY caja.servicio
    ADD CONSTRAINT ser_codpkey PRIMARY KEY (ser_cod);
 <   ALTER TABLE ONLY caja.servicio DROP CONSTRAINT ser_codpkey;
       caja         postgres    false    232            �           2606    16575    tipo_ide tipoidepk 
   CONSTRAINT     S   ALTER TABLE ONLY caja.tipo_ide
    ADD CONSTRAINT tipoidepk PRIMARY KEY (tipoide);
 :   ALTER TABLE ONLY caja.tipo_ide DROP CONSTRAINT tipoidepk;
       caja         postgres    false    220            �           2606    16418    activador activador_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.activador
    ADD CONSTRAINT activador_pkey PRIMARY KEY (ac_cod);
 B   ALTER TABLE ONLY public.activador DROP CONSTRAINT activador_pkey;
       public         postgres    false    201            �           2606    16446    asignar asignar_cod_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.asignar
    ADD CONSTRAINT asignar_cod_pkey PRIMARY KEY (asignar_cod);
 B   ALTER TABLE ONLY public.asignar DROP CONSTRAINT asignar_cod_pkey;
       public         postgres    false    205            �           2606    16402    empresas codigo_emp_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT codigo_emp_pkey PRIMARY KEY (codigo_emp);
 B   ALTER TABLE ONLY public.empresas DROP CONSTRAINT codigo_emp_pkey;
       public         postgres    false    199            �           2606    16408    union_emp id_union 
   CONSTRAINT     V   ALTER TABLE ONLY public.union_emp
    ADD CONSTRAINT id_union PRIMARY KEY (id_union);
 <   ALTER TABLE ONLY public.union_emp DROP CONSTRAINT id_union;
       public         postgres    false    200            �           2606    16546    cargo idcargopk 
   CONSTRAINT     R   ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT idcargopk PRIMARY KEY (idcargo);
 9   ALTER TABLE ONLY public.cargo DROP CONSTRAINT idcargopk;
       public         postgres    false    216            �           2606    16557    empleado idemppk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT idemppk PRIMARY KEY (idemp);
 :   ALTER TABLE ONLY public.empleado DROP CONSTRAINT idemppk;
       public         postgres    false    218            �           2606    16477    impresoras imprpk 
   CONSTRAINT     S   ALTER TABLE ONLY public.impresoras
    ADD CONSTRAINT imprpk PRIMARY KEY (impres);
 ;   ALTER TABLE ONLY public.impresoras DROP CONSTRAINT imprpk;
       public         postgres    false    209            �           2606    16506    nrofactura nrofacpk 
   CONSTRAINT     U   ALTER TABLE ONLY public.nrofactura
    ADD CONSTRAINT nrofacpk PRIMARY KEY (nrofac);
 =   ALTER TABLE ONLY public.nrofactura DROP CONSTRAINT nrofacpk;
       public         postgres    false    211            �           2606    16441     roles_usuario roles_usuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.roles_usuario
    ADD CONSTRAINT roles_usuario_pkey PRIMARY KEY (roles_cod);
 J   ALTER TABLE ONLY public.roles_usuario DROP CONSTRAINT roles_usuario_pkey;
       public         postgres    false    204            �           2606    16454 -   usuario_asignacion usuario_asignacion_id_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.usuario_asignacion
    ADD CONSTRAINT usuario_asignacion_id_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.usuario_asignacion DROP CONSTRAINT usuario_asignacion_id_pkey;
       public         postgres    false    207            �           2606    16426     usuario usuario_usuario_cod_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_cod_pkey PRIMARY KEY (usuario_cod);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_usuario_cod_pkey;
       public         postgres    false    203            �           2606    16524    detalle_impresora usuimprepk 
   CONSTRAINT     `   ALTER TABLE ONLY public.detalle_impresora
    ADD CONSTRAINT usuimprepk PRIMARY KEY (usuimpre);
 F   ALTER TABLE ONLY public.detalle_impresora DROP CONSTRAINT usuimprepk;
       public         postgres    false    213                       2606    17259    detalle_servicio detidepk1 
   CONSTRAINT     ^   ALTER TABLE ONLY servicio.detalle_servicio
    ADD CONSTRAINT detidepk1 PRIMARY KEY (detide);
 F   ALTER TABLE ONLY servicio.detalle_servicio DROP CONSTRAINT detidepk1;
       servicio         postgres    false    281                       2606    17238    equipo idequipk 
   CONSTRAINT     S   ALTER TABLE ONLY servicio.equipo
    ADD CONSTRAINT idequipk PRIMARY KEY (idequi);
 ;   ALTER TABLE ONLY servicio.equipo DROP CONSTRAINT idequipk;
       servicio         postgres    false    279                       2606    17230    marca idmarpk 
   CONSTRAINT     P   ALTER TABLE ONLY servicio.marca
    ADD CONSTRAINT idmarpk PRIMARY KEY (idmar);
 9   ALTER TABLE ONLY servicio.marca DROP CONSTRAINT idmarpk;
       servicio         postgres    false    277                       2606    17272    detalle_recepcion idrecepk 
   CONSTRAINT     ^   ALTER TABLE ONLY servicio.detalle_recepcion
    ADD CONSTRAINT idrecepk PRIMARY KEY (idrece);
 F   ALTER TABLE ONLY servicio.detalle_recepcion DROP CONSTRAINT idrecepk;
       servicio         postgres    false    283                       2606    17168    cabecera_servicio servipk 
   CONSTRAINT     \   ALTER TABLE ONLY servicio.cabecera_servicio
    ADD CONSTRAINT servipk PRIMARY KEY (servi);
 E   ALTER TABLE ONLY servicio.cabecera_servicio DROP CONSTRAINT servipk;
       servicio         postgres    false    274            �           1259    17293    fki_idcargofk    INDEX     E   CREATE INDEX fki_idcargofk ON public.empleado USING btree (idcargo);
 !   DROP INDEX public.fki_idcargofk;
       public         postgres    false    218            1           2606    16610    proveedor ac_cod_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY caja.proveedor
    ADD CONSTRAINT ac_cod_fkey FOREIGN KEY (ac_cod) REFERENCES public.activador(ac_cod);
 =   ALTER TABLE ONLY caja.proveedor DROP CONSTRAINT ac_cod_fkey;
       caja       postgres    false    3014    224    201            ;           2606    16695    servicio ac_codfk    FK CONSTRAINT     u   ALTER TABLE ONLY caja.servicio
    ADD CONSTRAINT ac_codfk FOREIGN KEY (ac_cod) REFERENCES public.activador(ac_cod);
 9   ALTER TABLE ONLY caja.servicio DROP CONSTRAINT ac_codfk;
       caja       postgres    false    201    3014    232            K           2606    16844    rubroclasificacion ac_codfk    FK CONSTRAINT        ALTER TABLE ONLY caja.rubroclasificacion
    ADD CONSTRAINT ac_codfk FOREIGN KEY (ac_cod) REFERENCES public.activador(ac_cod);
 C   ALTER TABLE ONLY caja.rubroclasificacion DROP CONSTRAINT ac_codfk;
       caja       postgres    false    201    247    3014            N           2606    16867    rubro ac_codfk    FK CONSTRAINT     r   ALTER TABLE ONLY caja.rubro
    ADD CONSTRAINT ac_codfk FOREIGN KEY (ac_cod) REFERENCES public.activador(ac_cod);
 6   ALTER TABLE ONLY caja.rubro DROP CONSTRAINT ac_codfk;
       caja       postgres    false    3014    249    201            ?           2606    16731    facturador accod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.facturador
    ADD CONSTRAINT accod_fkey FOREIGN KEY (activador_ac_cod) REFERENCES public.activador(ac_cod);
 =   ALTER TABLE ONLY caja.facturador DROP CONSTRAINT accod_fkey;
       caja       postgres    false    3014    236    201            H           2606    16813    moneda activador_ac_cod    FK CONSTRAINT     �   ALTER TABLE ONLY caja.moneda
    ADD CONSTRAINT activador_ac_cod FOREIGN KEY (activador_ac_cod) REFERENCES public.activador(ac_cod);
 ?   ALTER TABLE ONLY caja.moneda DROP CONSTRAINT activador_ac_cod;
       caja       postgres    false    3014    201    243            \           2606    16982    ajuste ajuste_motivo_mo_cod    FK CONSTRAINT     �   ALTER TABLE ONLY caja.ajuste
    ADD CONSTRAINT ajuste_motivo_mo_cod FOREIGN KEY (motivo_mo_cod) REFERENCES caja.motivo(mo_cod);
 C   ALTER TABLE ONLY caja.ajuste DROP CONSTRAINT ajuste_motivo_mo_cod;
       caja       postgres    false    258    3073    256            ]           2606    16987 &   ajuste ajuste_usuario_usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.ajuste
    ADD CONSTRAINT ajuste_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 N   ALTER TABLE ONLY caja.ajuste DROP CONSTRAINT ajuste_usuario_usuario_cod_fkey;
       caja       postgres    false    203    3016    258            W           2606    16936 8   cabecera_compras1 cabecera_compras_condicion_condcodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras1
    ADD CONSTRAINT cabecera_compras_condicion_condcodfkey FOREIGN KEY (condicion_cond_cod) REFERENCES caja.condicion(cond_cod);
 `   ALTER TABLE ONLY caja.cabecera_compras1 DROP CONSTRAINT cabecera_compras_condicion_condcodfkey;
       caja       postgres    false    234    3051    253            X           2606    16941 7   cabecera_compras1 cabecera_compras_proveedorprovcodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras1
    ADD CONSTRAINT cabecera_compras_proveedorprovcodfkey FOREIGN KEY (proveedor_prov_cod) REFERENCES caja.proveedor(prov_cod);
 _   ALTER TABLE ONLY caja.cabecera_compras1 DROP CONSTRAINT cabecera_compras_proveedorprovcodfkey;
       caja       postgres    false    224    3039    253            Y           2606    16946 8   cabecera_compras1 cabecera_compras_usuariousuariocodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras1
    ADD CONSTRAINT cabecera_compras_usuariousuariocodfkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 `   ALTER TABLE ONLY caja.cabecera_compras1 DROP CONSTRAINT cabecera_compras_usuariousuariocodfkey;
       caja       postgres    false    203    3016    253            h           2606    17086    caja_arqueo_cab caja_apertu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_cab
    ADD CONSTRAINT caja_apertu_fk FOREIGN KEY (nro_apertura, usuario_cod, empresas_codigo_emp) REFERENCES caja.caja_apertu(nro_apertura, usuario_cod, empresas_codigo_emp);
 F   ALTER TABLE ONLY caja.caja_arqueo_cab DROP CONSTRAINT caja_apertu_fk;
       caja       postgres    false    268    260    260    260    268    3077    268            k           2606    17114 "   caja_arqueo_doc_det caja_apertu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT caja_apertu_fk FOREIGN KEY (nro_apertura, usuario_cod, empresas_codigo_emp) REFERENCES caja.caja_apertu(nro_apertura, usuario_cod, empresas_codigo_emp);
 J   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT caja_apertu_fk;
       caja       postgres    false    271    271    3077    260    260    271    260            b           2606    17030    caja_movimiento caja_apertufk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_movimiento
    ADD CONSTRAINT caja_apertufk FOREIGN KEY (caja_apertu_nro_apertura, usuario_cod, empresas_codigo_emp) REFERENCES caja.caja_apertu(nro_apertura, usuario_cod, empresas_codigo_emp);
 E   ALTER TABLE ONLY caja.caja_movimiento DROP CONSTRAINT caja_apertufk;
       caja       postgres    false    262    262    262    260    260    260    3077            l           2606    17119 &   caja_arqueo_doc_det caja_arqueo_cab_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT caja_arqueo_cab_fk FOREIGN KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp) REFERENCES caja.caja_arqueo_cab(nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp);
 N   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT caja_arqueo_cab_fk;
       caja       postgres    false    271    271    271    268    268    268    268    3087    271            q           2606    17149 )   caja_arqueo_formas_det caja_arqueo_cab_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_formas_det
    ADD CONSTRAINT caja_arqueo_cab_fk FOREIGN KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp) REFERENCES caja.caja_arqueo_cab(nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp);
 Q   ALTER TABLE ONLY caja.caja_arqueo_formas_det DROP CONSTRAINT caja_arqueo_cab_fk;
       caja       postgres    false    268    272    272    272    272    268    268    268    3087            e           2606    17058     caja_mov_formas caja_mov_caja_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_mov_formas
    ADD CONSTRAINT caja_mov_caja_fk FOREIGN KEY (empresas_codigo_emp, nro_movimiento) REFERENCES caja.caja_movimiento(empresas_codigo_emp, nro_movimiento);
 H   ALTER TABLE ONLY caja.caja_mov_formas DROP CONSTRAINT caja_mov_caja_fk;
       caja       postgres    false    265    3079    262    262    265            B           2606    16760    cabecera_venta cliecodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT cliecodfkey FOREIGN KEY (cliente_clie_cod) REFERENCES caja.cliente(clie_cod);
 B   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT cliecodfkey;
       caja       postgres    false    3037    238    222            .           2606    16586     cliente cliente_activador_ac_cod    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cliente
    ADD CONSTRAINT cliente_activador_ac_cod FOREIGN KEY (activador_ac_cod) REFERENCES public.activador(ac_cod);
 H   ALTER TABLE ONLY caja.cliente DROP CONSTRAINT cliente_activador_ac_cod;
       caja       postgres    false    201    3014    222            /           2606    16591 (   cliente cliente_usuario_usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cliente
    ADD CONSTRAINT cliente_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 P   ALTER TABLE ONLY caja.cliente DROP CONSTRAINT cliente_usuario_usuario_cod_fkey;
       caja       postgres    false    203    3016    222            m           2606    17124 &   caja_arqueo_doc_det cod_docu_arqueo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT cod_docu_arqueo_fk FOREIGN KEY (cod_docu_arqueo) REFERENCES caja.caja_documento_arqueo(cod_docu_arqueo);
 N   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT cod_docu_arqueo_fk;
       caja       postgres    false    271    270    3089            f           2606    17063    caja_mov_formas cod_moneda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_mov_formas
    ADD CONSTRAINT cod_moneda_fk FOREIGN KEY (moneda_cod) REFERENCES caja.moneda(moneda_cod);
 E   ALTER TABLE ONLY caja.caja_mov_formas DROP CONSTRAINT cod_moneda_fk;
       caja       postgres    false    3059    243    265            Z           2606    16959    detalle_compras compracodfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.detalle_compras
    ADD CONSTRAINT compracodfk FOREIGN KEY (cabecera_compras_compra_nro) REFERENCES caja.cabecera_compras1(compra_nro);
 C   ALTER TABLE ONLY caja.detalle_compras DROP CONSTRAINT compracodfk;
       caja       postgres    false    255    3069    253            R           2606    16902    cabecera_compras cond_codfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT cond_codfkey FOREIGN KEY (cond_cod) REFERENCES caja.condicion(cond_cod);
 E   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT cond_codfkey;
       caja       postgres    false    234    3051    251            C           2606    16765    cabecera_venta condcodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT condcodfkey FOREIGN KEY (condicion_cond_cod) REFERENCES caja.condicion(cond_cod);
 B   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT condcodfkey;
       caja       postgres    false    3051    234    238            [           2606    16964 6   detalle_compras detalle_compras_producto_prod_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.detalle_compras
    ADD CONSTRAINT detalle_compras_producto_prod_cod_fkey FOREIGN KEY (producto_prod_cod) REFERENCES caja.producto(prod_cod);
 ^   ALTER TABLE ONLY caja.detalle_compras DROP CONSTRAINT detalle_compras_producto_prod_cod_fkey;
       caja       postgres    false    228    255    3045            G           2606    16800    detalle_venta dventa_codfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.detalle_venta
    ADD CONSTRAINT dventa_codfkey FOREIGN KEY (cabecera_venta_venta_cod) REFERENCES caja.cabecera_venta(venta_cod);
 D   ALTER TABLE ONLY caja.detalle_venta DROP CONSTRAINT dventa_codfkey;
       caja       postgres    false    241    238    3055            S           2606    16907    cabecera_compras empresa_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT empresa_codfk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 F   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT empresa_codfk;
       caja       postgres    false    3012    251    200            _           2606    17006    caja_apertu empresas_codigo_emp    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_apertu
    ADD CONSTRAINT empresas_codigo_emp FOREIGN KEY (empresas_codigo_emp) REFERENCES public.empresas(codigo_emp) MATCH FULL;
 G   ALTER TABLE ONLY caja.caja_apertu DROP CONSTRAINT empresas_codigo_emp;
       caja       postgres    false    260    199    3010            i           2606    17091 &   caja_arqueo_cab empresas_codigo_emp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_cab
    ADD CONSTRAINT empresas_codigo_emp_fk FOREIGN KEY (empresas_codigo_emp) REFERENCES public.empresas(codigo_emp);
 N   ALTER TABLE ONLY caja.caja_arqueo_cab DROP CONSTRAINT empresas_codigo_emp_fk;
       caja       postgres    false    199    3010    268            n           2606    17129 *   caja_arqueo_doc_det empresas_codigo_emp_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT empresas_codigo_emp_fk FOREIGN KEY (empresas_codigo_emp) REFERENCES public.empresas(codigo_emp);
 R   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT empresas_codigo_emp_fk;
       caja       postgres    false    271    3010    199            D           2606    16770    cabecera_venta factcodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT factcodfkey FOREIGN KEY (facturador_fact_cod) REFERENCES caja.facturador(fact_cod);
 B   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT factcodfkey;
       caja       postgres    false    3053    236    238            <           2606    16700    servicio imp_cod_fk    FK CONSTRAINT     v   ALTER TABLE ONLY caja.servicio
    ADD CONSTRAINT imp_cod_fk FOREIGN KEY (imp_cod) REFERENCES caja.impuesto(imp_cod);
 ;   ALTER TABLE ONLY caja.servicio DROP CONSTRAINT imp_cod_fk;
       caja       postgres    false    3041    225    232            9           2606    16676 2   maestro_stock maestro_stock_producto_prod_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.maestro_stock
    ADD CONSTRAINT maestro_stock_producto_prod_cod_fkey FOREIGN KEY (producto_prod_cod) REFERENCES caja.producto(prod_cod);
 Z   ALTER TABLE ONLY caja.maestro_stock DROP CONSTRAINT maestro_stock_producto_prod_cod_fkey;
       caja       postgres    false    230    3045    228            o           2606    17134 !   caja_arqueo_doc_det moneda_cod_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT moneda_cod_fk FOREIGN KEY (moneda_cod) REFERENCES caja.moneda(moneda_cod);
 I   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT moneda_cod_fk;
       caja       postgres    false    243    271    3059            r           2606    17154 $   caja_arqueo_formas_det moneda_cod_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_formas_det
    ADD CONSTRAINT moneda_cod_fk FOREIGN KEY (moneda_cod) REFERENCES caja.moneda(moneda_cod);
 L   ALTER TABLE ONLY caja.caja_arqueo_formas_det DROP CONSTRAINT moneda_cod_fk;
       caja       postgres    false    3059    272    243            I           2606    16826    detalle_venta_caja moneda_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.detalle_venta_caja
    ADD CONSTRAINT moneda_codfk FOREIGN KEY (moneda_cod) REFERENCES caja.moneda(moneda_cod);
 G   ALTER TABLE ONLY caja.detalle_venta_caja DROP CONSTRAINT moneda_codfk;
       caja       postgres    false    245    3059    243            c           2606    17035    caja_movimiento moneda_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_movimiento
    ADD CONSTRAINT moneda_codfk FOREIGN KEY (moneda_cod) REFERENCES caja.moneda(moneda_cod);
 D   ALTER TABLE ONLY caja.caja_movimiento DROP CONSTRAINT moneda_codfk;
       caja       postgres    false    262    243    3059            4           2606    16643 '   producto producto_activador_ac_cod_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT producto_activador_ac_cod_pkey FOREIGN KEY (activador_ac_cod) REFERENCES public.activador(ac_cod);
 O   ALTER TABLE ONLY caja.producto DROP CONSTRAINT producto_activador_ac_cod_pkey;
       caja       postgres    false    201    3014    228            5           2606    16648 '   producto producto_impuesto_imp_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT producto_impuesto_imp_cod_fkey FOREIGN KEY (impuesto_imp_cod) REFERENCES caja.impuesto(imp_cod);
 O   ALTER TABLE ONLY caja.producto DROP CONSTRAINT producto_impuesto_imp_cod_fkey;
       caja       postgres    false    3041    225    228            6           2606    16653 &   producto producto_linea_linea_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT producto_linea_linea_cod_fkey FOREIGN KEY (linea_linea_cod) REFERENCES caja.linea(linea_cod);
 N   ALTER TABLE ONLY caja.producto DROP CONSTRAINT producto_linea_linea_cod_fkey;
       caja       postgres    false    226    3043    228            7           2606    16658 *   producto producto_usuario_usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT producto_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 R   ALTER TABLE ONLY caja.producto DROP CONSTRAINT producto_usuario_usuario_cod_fkey;
       caja       postgres    false    203    3016    228            T           2606    16912    cabecera_compras prov_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT prov_cod_fkey FOREIGN KEY (prov_cod) REFERENCES caja.proveedor(prov_cod);
 F   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT prov_cod_fkey;
       caja       postgres    false    3039    251    224            U           2606    16917    cabecera_compras rub_codfk    FK CONSTRAINT     z   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT rub_codfk FOREIGN KEY (rub_cod) REFERENCES caja.rubro(rub_cod);
 B   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT rub_codfk;
       caja       postgres    false    249    251    3065            O           2606    16872    rubro rubc_codfk    FK CONSTRAINT        ALTER TABLE ONLY caja.rubro
    ADD CONSTRAINT rubc_codfk FOREIGN KEY (rubc_cod) REFERENCES caja.rubroclasificacion(rubc_cod);
 8   ALTER TABLE ONLY caja.rubro DROP CONSTRAINT rubc_codfk;
       caja       postgres    false    247    3063    249            g           2606    17068 &   caja_mov_formas tipos_formas_cobros_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_mov_formas
    ADD CONSTRAINT tipos_formas_cobros_fk FOREIGN KEY (cod_tipo_forma) REFERENCES caja.caja_tipos_formas_cobros(cod_tipo_forma);
 N   ALTER TABLE ONLY caja.caja_mov_formas DROP CONSTRAINT tipos_formas_cobros_fk;
       caja       postgres    false    264    265    3081            0           2606    16596    cliente union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cliente
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 B   ALTER TABLE ONLY caja.cliente DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    222    3012    200            8           2606    16663    producto union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.producto
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 C   ALTER TABLE ONLY caja.producto DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    228    200    3012            :           2606    16681     maestro_stock union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.maestro_stock
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 H   ALTER TABLE ONLY caja.maestro_stock DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    3012    230    200            A           2606    16741    facturador union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.facturador
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 E   ALTER TABLE ONLY caja.facturador DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    3012    200    236            F           2606    16780 !   cabecera_venta union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 I   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    200    3012    238            ^           2606    16992    ajuste union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.ajuste
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 A   ALTER TABLE ONLY caja.ajuste DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    258    200    3012            `           2606    17011    caja_apertu union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_apertu
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 F   ALTER TABLE ONLY caja.caja_apertu DROP CONSTRAINT union_emp_id_union;
       caja       postgres    false    200    3012    260            2           2606    16615    proveedor union_emp_id_unionfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.proveedor
    ADD CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 F   ALTER TABLE ONLY caja.proveedor DROP CONSTRAINT union_emp_id_unionfk;
       caja       postgres    false    200    3012    224            =           2606    16705    servicio union_emp_id_unionfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.servicio
    ADD CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 E   ALTER TABLE ONLY caja.servicio DROP CONSTRAINT union_emp_id_unionfk;
       caja       postgres    false    3012    232    200            L           2606    16849 '   rubroclasificacion union_emp_id_unionfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.rubroclasificacion
    ADD CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 O   ALTER TABLE ONLY caja.rubroclasificacion DROP CONSTRAINT union_emp_id_unionfk;
       caja       postgres    false    247    3012    200            P           2606    16877    rubro union_emp_id_unionfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.rubro
    ADD CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 B   ALTER TABLE ONLY caja.rubro DROP CONSTRAINT union_emp_id_unionfk;
       caja       postgres    false    3012    200    249            @           2606    16736    facturador usuacod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.facturador
    ADD CONSTRAINT usuacod_fkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 ?   ALTER TABLE ONLY caja.facturador DROP CONSTRAINT usuacod_fkey;
       caja       postgres    false    236    203    3016            E           2606    16775    cabecera_venta usuacodfkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_venta
    ADD CONSTRAINT usuacodfkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 B   ALTER TABLE ONLY caja.cabecera_venta DROP CONSTRAINT usuacodfkey;
       caja       postgres    false    203    238    3016            a           2606    17016    caja_apertu usuario_cod    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_apertu
    ADD CONSTRAINT usuario_cod FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod) MATCH FULL;
 ?   ALTER TABLE ONLY caja.caja_apertu DROP CONSTRAINT usuario_cod;
       caja       postgres    false    203    3016    260            >           2606    16710    servicio usuario_cod_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.servicio
    ADD CONSTRAINT usuario_cod_fk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 ?   ALTER TABLE ONLY caja.servicio DROP CONSTRAINT usuario_cod_fk;
       caja       postgres    false    3016    232    203            p           2606    17139 "   caja_arqueo_doc_det usuario_cod_fk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_doc_det
    ADD CONSTRAINT usuario_cod_fk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 J   ALTER TABLE ONLY caja.caja_arqueo_doc_det DROP CONSTRAINT usuario_cod_fk;
       caja       postgres    false    3016    203    271            3           2606    16620    proveedor usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.proveedor
    ADD CONSTRAINT usuario_cod_fkey FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 B   ALTER TABLE ONLY caja.proveedor DROP CONSTRAINT usuario_cod_fkey;
       caja       postgres    false    224    203    3016            V           2606    16922 !   cabecera_compras usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY caja.cabecera_compras
    ADD CONSTRAINT usuario_cod_fkey FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 I   ALTER TABLE ONLY caja.cabecera_compras DROP CONSTRAINT usuario_cod_fkey;
       caja       postgres    false    203    251    3016            M           2606    16854     rubroclasificacion usuario_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.rubroclasificacion
    ADD CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 H   ALTER TABLE ONLY caja.rubroclasificacion DROP CONSTRAINT usuario_codfk;
       caja       postgres    false    3016    203    247            Q           2606    16882    rubro usuario_codfk    FK CONSTRAINT        ALTER TABLE ONLY caja.rubro
    ADD CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 ;   ALTER TABLE ONLY caja.rubro DROP CONSTRAINT usuario_codfk;
       caja       postgres    false    203    3016    249            d           2606    17040    caja_movimiento usuario_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_movimiento
    ADD CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod) MATCH FULL;
 E   ALTER TABLE ONLY caja.caja_movimiento DROP CONSTRAINT usuario_codfk;
       caja       postgres    false    3016    203    262            j           2606    17096    caja_arqueo_cab usuario_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.caja_arqueo_cab
    ADD CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 E   ALTER TABLE ONLY caja.caja_arqueo_cab DROP CONSTRAINT usuario_codfk;
       caja       postgres    false    268    203    3016            J           2606    16831    detalle_venta_caja ventacodfk    FK CONSTRAINT     �   ALTER TABLE ONLY caja.detalle_venta_caja
    ADD CONSTRAINT ventacodfk FOREIGN KEY (venta_cod) REFERENCES caja.cabecera_venta(venta_cod);
 E   ALTER TABLE ONLY caja.detalle_venta_caja DROP CONSTRAINT ventacodfk;
       caja       postgres    false    245    238    3055            '           2606    16478    impresoras ac_codfk    FK CONSTRAINT     y   ALTER TABLE ONLY public.impresoras
    ADD CONSTRAINT ac_codfk FOREIGN KEY (ac_cod) REFERENCES public.activador(ac_cod);
 =   ALTER TABLE ONLY public.impresoras DROP CONSTRAINT ac_codfk;
       public       postgres    false    201    3014    209            (           2606    16483    impresoras empresafk    FK CONSTRAINT     }   ALTER TABLE ONLY public.impresoras
    ADD CONSTRAINT empresafk FOREIGN KEY (empresa) REFERENCES public.union_emp(id_union);
 >   ALTER TABLE ONLY public.impresoras DROP CONSTRAINT empresafk;
       public       postgres    false    209    200    3012                        2606    16409    union_emp empresas_codigo_emp    FK CONSTRAINT     �   ALTER TABLE ONLY public.union_emp
    ADD CONSTRAINT empresas_codigo_emp FOREIGN KEY (empresas_codigo_emp) REFERENCES public.empresas(codigo_emp);
 G   ALTER TABLE ONLY public.union_emp DROP CONSTRAINT empresas_codigo_emp;
       public       postgres    false    200    3010    199            #           2606    16563    usuario idempfk    FK CONSTRAINT     |   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT idempfk FOREIGN KEY (idemp) REFERENCES public.empleado(idemp) NOT VALID;
 9   ALTER TABLE ONLY public.usuario DROP CONSTRAINT idempfk;
       public       postgres    false    203    3033    218            *           2606    16507    nrofactura impresfk    FK CONSTRAINT     z   ALTER TABLE ONLY public.nrofactura
    ADD CONSTRAINT impresfk FOREIGN KEY (impres) REFERENCES public.impresoras(impres);
 =   ALTER TABLE ONLY public.nrofactura DROP CONSTRAINT impresfk;
       public       postgres    false    209    211    3024            ,           2606    16525    detalle_impresora impresofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_impresora
    ADD CONSTRAINT impresofk FOREIGN KEY (impres) REFERENCES public.impresoras(impres);
 E   ALTER TABLE ONLY public.detalle_impresora DROP CONSTRAINT impresofk;
       public       postgres    false    209    213    3024            !           2606    16427    usuario union_emp_id_union    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 D   ALTER TABLE ONLY public.usuario DROP CONSTRAINT union_emp_id_union;
       public       postgres    false    3012    200    203            "           2606    16432 %   usuario usuario_activador_ac_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_activador_ac_cod_fkey FOREIGN KEY (activador_ac_cod) REFERENCES public.activador(ac_cod);
 O   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_activador_ac_cod_fkey;
       public       postgres    false    203    201    3014            $           2606    16455 >   usuario_asignacion usuario_asignacion_asignar_asignar_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_asignacion
    ADD CONSTRAINT usuario_asignacion_asignar_asignar_cod_fkey FOREIGN KEY (asignar_asignar_cod) REFERENCES public.asignar(asignar_cod);
 h   ALTER TABLE ONLY public.usuario_asignacion DROP CONSTRAINT usuario_asignacion_asignar_asignar_cod_fkey;
       public       postgres    false    3020    205    207            %           2606    16460 B   usuario_asignacion usuario_asignacion_roles_usuario_roles_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_asignacion
    ADD CONSTRAINT usuario_asignacion_roles_usuario_roles_cod_fkey FOREIGN KEY (roles_usuario_roles_cod) REFERENCES public.roles_usuario(roles_cod);
 l   ALTER TABLE ONLY public.usuario_asignacion DROP CONSTRAINT usuario_asignacion_roles_usuario_roles_cod_fkey;
       public       postgres    false    3018    207    204            &           2606    16465 >   usuario_asignacion usuario_asignacion_usuario_usuario_cod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_asignacion
    ADD CONSTRAINT usuario_asignacion_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod) REFERENCES public.usuario(usuario_cod);
 h   ALTER TABLE ONLY public.usuario_asignacion DROP CONSTRAINT usuario_asignacion_usuario_usuario_cod_fkey;
       public       postgres    false    203    3016    207            )           2606    16488    impresoras usuariofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.impresoras
    ADD CONSTRAINT usuariofk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 >   ALTER TABLE ONLY public.impresoras DROP CONSTRAINT usuariofk;
       public       postgres    false    209    203    3016            +           2606    16512    nrofactura usuariofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.nrofactura
    ADD CONSTRAINT usuariofk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 >   ALTER TABLE ONLY public.nrofactura DROP CONSTRAINT usuariofk;
       public       postgres    false    203    3016    211            -           2606    16530    detalle_impresora usuariofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_impresora
    ADD CONSTRAINT usuariofk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 E   ALTER TABLE ONLY public.detalle_impresora DROP CONSTRAINT usuariofk;
       public       postgres    false    203    3016    213            s           2606    17169    cabecera_servicio codcliefk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.cabecera_servicio
    ADD CONSTRAINT codcliefk FOREIGN KEY (codclie) REFERENCES caja.cliente(clie_cod);
 G   ALTER TABLE ONLY servicio.cabecera_servicio DROP CONSTRAINT codcliefk;
       servicio       postgres    false    274    3037    222            t           2606    17174    cabecera_servicio empresafk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.cabecera_servicio
    ADD CONSTRAINT empresafk FOREIGN KEY (union_emp_id_union) REFERENCES public.union_emp(id_union);
 G   ALTER TABLE ONLY servicio.cabecera_servicio DROP CONSTRAINT empresafk;
       servicio       postgres    false    200    274    3012            w           2606    17273    detalle_recepcion idequifk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.detalle_recepcion
    ADD CONSTRAINT idequifk FOREIGN KEY (idrece) REFERENCES servicio.equipo(idequi);
 F   ALTER TABLE ONLY servicio.detalle_recepcion DROP CONSTRAINT idequifk;
       servicio       postgres    false    283    3099    279            x           2606    17278    detalle_recepcion idmarfk    FK CONSTRAINT     }   ALTER TABLE ONLY servicio.detalle_recepcion
    ADD CONSTRAINT idmarfk FOREIGN KEY (idmar) REFERENCES servicio.marca(idmar);
 E   ALTER TABLE ONLY servicio.detalle_recepcion DROP CONSTRAINT idmarfk;
       servicio       postgres    false    3097    283    277            v           2606    17260    detalle_servicio ser_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.detalle_servicio
    ADD CONSTRAINT ser_codfk FOREIGN KEY (ser_cod) REFERENCES caja.servicio(ser_cod);
 F   ALTER TABLE ONLY servicio.detalle_servicio DROP CONSTRAINT ser_codfk;
       servicio       postgres    false    232    3049    281            y           2606    17283    detalle_recepcion servifk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.detalle_recepcion
    ADD CONSTRAINT servifk FOREIGN KEY (servi) REFERENCES servicio.cabecera_servicio(servi);
 E   ALTER TABLE ONLY servicio.detalle_recepcion DROP CONSTRAINT servifk;
       servicio       postgres    false    274    3095    283            u           2606    17179    cabecera_servicio usuario_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY servicio.cabecera_servicio
    ADD CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod) REFERENCES public.usuario(usuario_cod);
 K   ALTER TABLE ONLY servicio.cabecera_servicio DROP CONSTRAINT usuario_codfk;
       servicio       postgres    false    274    203    3016            1      x������ � �      *      x������ � �      ,      x������ � �            x������ � �      3      x������ � �      ;      x������ � �      >      x������ � �      ?      x������ � �      =   �   x�u�=�0�9>EN�T(c0�XjmH�N��9�*ʐ����׸A�Գ0r�}9�w��+�䩋���`�к���C
p\�]��u'	���+X�.��r=zOu�����#m$4m�a$�*~��� >�[?V      9      x������ � �      8      x������ � �      5      x������ � �      7   Z   x�=�]
� ��=E'��}Ӎ�P��'��~�ކ�@�k�!��q
,9(�M�;_$D�p4�.��(K#B޹�4!�|CW%)�%j=]�jf         �   x�E��j�0E���tXN;����h7h_���b�F�~^K7��EH\��i��i��u�Y�'�$/��LR^y�x����J��m8�*y+�Vf���W=��v� 5]�[;���{"Et�Rg{l�{x��9��q*���Z�gx�y��8�~̟=׆���$�ץ�9~/��%o�d��y��h�ڷ�R`<J�����I)��I#         !   x�3�t��qt��2�tru������� I�D      .      x������ � �             x������ � �      $      x������ � �         "   x�3���Wpqu���t��4�?NC�=... V4M            x�3�44�30�2�4QƜ`^� 93�         "   x�3���Wpqu���t��tt������� R��            x������ � �      "   <   x�3�tur��t�4�30�tփ09c���8]�}�8M��@�*@��\:F��� Ɓr      /   D   x�3���Wpqu���t��2�B�|� W�.cNO�0W�� O.N�0�PgO?�=... �E�            x������ � �            x������ � �      (   Z   x�U�A
� ��+|A���h���z���hz�,�a��S�J�f1�p2�Q˓�3�k`�*5�E�I3��T�����][��!�8a$      &   {   x�M�=
�0��Y>�NPp�v�V� �Z�	���爗/ZއO�0�[T�A�M���
y3Gʥ'o���槸bem�h��pMB��)��i��oH�p�P~���C�.���u��Se�v	!�1+            x������ � �         E   x�3�t��tvu	�qT�tq��tqt�2�
u�ru�	�W��t��2�pa� ��W�=... ��      �      x�3�tt���2���2c���� I�U      �      x�3���2�������� Wk         f   x�%˻�0���cPꃱ��ҭ�,n�
#5Fn�_����K��3�%M�͒\*�2Z�E����Q䗸��I���p�����W�O[������� (�!            x�3�4�4����� �X      	   z   x�m̽
�0 ���)���/��$���5H$�AZA�������#�!,�-VV'�;����j�3�����{Zt0�,,��s&����ސ���,KR�ۿ#n�wd�%E���F�}@�/k�*�      �   '   x�3�tvvT�u	��4402700�5�������� l^            x�3�t���r��4�@�=... ]�         A   x�3�4426153��4�@# �FFƺ��F��1~ �����������H�,i����� ��      �   !   x�3�t�t�pTpqUu������� LR�      �      x�3�4�v
��sS pp��qqq ��
      �   M   x�st����4�4202�5��56P02�21�qM� �&���S9��ML!�t�@�M-��A!������ ��E      �      x�3�4D�\1z\\\ !"�      A   [   x�M�1� �����*����Њ��'�.�L1���z��n���TDH	�D���ۮ�5�����	�V�3	Ãd�%��l��\�s?Ӄ �      I   l   x�E�1
�0E��9�J���%���A(�TE���A\�����0��֦�I�!!�}��4��+]k��ڛb;t�3��H�j�
:l�~ؚr�i 9d_ħ7ŹA���      G      x������ � �      E   L   x�3���/IM����2���-(J-�/J�2�I�I-�r�L8]K3�RR���2S�L9�r�JR�b���� #G�      C   n   x�3��/��LJ�2�N�-.�K�2���2�tLN-�2�gW�s�q��s�s��UrY@(KN�Լ��<.C��4�H�K23���9��|�M8�JS����qqq �j"�     