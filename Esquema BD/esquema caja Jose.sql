
CREATE TABLE caja.tipo_ide
(
  tipoide serial NOT NULL,
  codigo character varying(3) NOT NULL,
  nombre character varying(20) NOT NULL,
  CONSTRAINT tipoidepk PRIMARY KEY (tipoide)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.cliente
(
  clie_cod serial NOT NULL,
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
  tipoiden integer DEFAULT 11,
  CONSTRAINT cliente_pkey PRIMARY KEY (clie_cod),
  CONSTRAINT cliente_activador_ac_cod FOREIGN KEY (activador_ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT cliente_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE caja.proveedor
(
  prov_nom character varying(60) NOT NULL,
  prov_ruc character varying(13),
  prov_tel character varying(15),
  ac_cod integer NOT NULL,
  prov_cod serial NOT NULL,
  usuario_cod integer NOT NULL,
  usuario_m integer,
  union_emp_id_union integer NOT NULL,
  timbrado integer,
  vtotim date,
  unionpago integer DEFAULT 0,
  CONSTRAINT proveedor_prov_cod_pkey PRIMARY KEY (prov_cod),
  CONSTRAINT ac_cod_fkey FOREIGN KEY (ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_cod_fkey FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.impuesto
(
  imp_cod numeric(2,0) NOT NULL,
  imp_des numeric(4,2) NOT NULL,
  CONSTRAINT impuesto_pkey PRIMARY KEY (imp_cod)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.linea
(
  linea_cod numeric(1,0) NOT NULL,
  linea_nom character varying(30) NOT NULL,
  estado character varying(11),
  CONSTRAINT linea_pkey PRIMARY KEY (linea_cod)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.producto
(
  prod_cod serial NOT NULL,
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
  barras character varying(13),
  CONSTRAINT producto_pkey PRIMARY KEY (prod_cod),
  CONSTRAINT producto_activador_ac_cod_pkey FOREIGN KEY (activador_ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT producto_impuesto_imp_cod_fkey FOREIGN KEY (impuesto_imp_cod)
      REFERENCES caja.impuesto (imp_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT producto_linea_linea_cod_fkey FOREIGN KEY (linea_linea_cod)
      REFERENCES caja.linea (linea_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT producto_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.maestro_stock
(
  maestro_cod serial NOT NULL,
  producto_prod_cod integer NOT NULL,
  saldo_stock numeric(8,2) NOT NULL,
  union_emp_id_union integer,
  CONSTRAINT maestro_stock_maestro_cod_pkey PRIMARY KEY (maestro_cod),
  CONSTRAINT maestro_stock_producto_prod_cod_fkey FOREIGN KEY (producto_prod_cod)
      REFERENCES caja.producto (prod_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.servicio
(
  ser_cod serial NOT NULL,
  descripcion character varying(180) NOT NULL,
  imp_cod numeric(2,0) NOT NULL,
  ac_cod numeric(2,0),
  precio numeric(12,2),
  usuario_cod integer NOT NULL,
  usuario_m integer,
  union_emp_id_union integer,
  descuenmax numeric(12,2) DEFAULT 0,
  CONSTRAINT ser_codpkey PRIMARY KEY (ser_cod),
  CONSTRAINT ac_codfk FOREIGN KEY (ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT imp_cod_fk FOREIGN KEY (imp_cod)
      REFERENCES caja.impuesto (imp_cod) MATCH SIMPLE,
  CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_cod_fk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.condicion
(
  cond_cod serial NOT NULL,
  nombre character varying(50),
  CONSTRAINT cond_codpk PRIMARY KEY (cond_cod)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.facturador
(
  fact_cod serial NOT NULL,
  nombre character varying(80) NOT NULL,
  activador_ac_cod numeric(1,0),
  usuario_usuario_cod integer,
  m_usuario integer,
  union_emp_id_union integer,
  CONSTRAINT factcod_pkey PRIMARY KEY (fact_cod),
  CONSTRAINT accod_fkey FOREIGN KEY (activador_ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuacod_fkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.cabecera_venta
(
  venta_cod serial NOT NULL,
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
  facturacion numeric(1,0) DEFAULT 0,
  CONSTRAINT cabecera_venta_pkey PRIMARY KEY (venta_cod),
  CONSTRAINT cliecodfkey FOREIGN KEY (cliente_clie_cod)
      REFERENCES caja.cliente (clie_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT condcodfkey FOREIGN KEY (condicion_cond_cod)
      REFERENCES caja.condicion (cond_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT factcodfkey FOREIGN KEY (facturador_fact_cod)
      REFERENCES caja.facturador (fact_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuacodfkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE caja.detalle_venta
(
  cabecera_venta_venta_cod integer NOT NULL,
  producto_prod_cod integer default 0,
  prod_cant numeric(8,2) NOT NULL,
  prod_precio numeric(10,2) NOT NULL,
  prod_iva numeric(4,2) NOT NULL,
  descuento numeric(10,2) NOT NULL,
  gravada5 numeric(30,2),
  gravada10 numeric(30,2),
  exenta numeric(30,2),
  idventa serial NOT NULL,
  costoventa numeric(10,2),
  id serial NOT NULL,
  concepto character varying(200),
  ser_cod integer default 0,
  servicio integer DEFAULT 0,
  idservi integer DEFAULT 0, 
  CONSTRAINT detventapkey PRIMARY KEY (idventa),
  CONSTRAINT dventa_codfkey FOREIGN KEY (cabecera_venta_venta_cod)
      REFERENCES caja.cabecera_venta (venta_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE caja.moneda
(
  moneda_cod serial NOT NULL,
  moneda_descri character varying(40),
  moneda_cambio numeric(30,2),
  moneda_simbol character varying(20),
  moneda_calcul numeric(30,2),
  activador_ac_cod numeric(1,0),
  convertir numeric(30,7),
  CONSTRAINT moneda_cod PRIMARY KEY (moneda_cod),
  CONSTRAINT activador_ac_cod FOREIGN KEY (activador_ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.detalle_venta_caja
(
  venta_cod integer,
  efectivo numeric(30,2),
  cheque numeric(30,2),
  tarjeta numeric(30,2),
  documento numeric(30,2),
  chequenro integer,
  fechacheque date,
  codbanco integer,
  idcaja serial NOT NULL,
  docunro integer,
  chequecta integer,
  moneda_cod integer,
  coti numeric(12,0),
  boleta character varying(50),
  trasferencia character varying(80),
  CONSTRAINT idcajapk PRIMARY KEY (idcaja),
  CONSTRAINT moneda_codfk FOREIGN KEY (moneda_cod)
      REFERENCES caja.moneda (moneda_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ventacodfk FOREIGN KEY (venta_cod)
      REFERENCES caja.cabecera_venta (venta_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.rubroclasificacion
(
  rubc_cod serial NOT NULL,
  nombre character varying(100) NOT NULL,
  usuario_cod integer,
  usuario_m integer,
  ac_cod integer NOT NULL,
  union_emp_id_union integer NOT NULL,
  CONSTRAINT rubc_codpk PRIMARY KEY (rubc_cod),
  CONSTRAINT ac_codfk FOREIGN KEY (ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.rubro
(
  rub_cod serial NOT NULL,
  nombre character varying(100) NOT NULL,
  usuario_cod integer,
  usuario_m integer,
  ac_cod integer NOT NULL,
  union_emp_id_union integer NOT NULL,
  rubc_cod integer,
  CONSTRAINT rub_codpk PRIMARY KEY (rub_cod),
  CONSTRAINT ac_codfk FOREIGN KEY (ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT rubc_codfk FOREIGN KEY (rubc_cod)
      REFERENCES caja.rubroclasificacion (rubc_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_unionfk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.cabecera_compras
(
  compra_nro serial NOT NULL,
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
  tipo character varying(10),
  CONSTRAINT cabecera_compras_pkey PRIMARY KEY (compra_nro),
  CONSTRAINT cond_codfkey FOREIGN KEY (cond_cod)
      REFERENCES caja.condicion (cond_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empresa_codfk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT prov_cod_fkey FOREIGN KEY (prov_cod)
      REFERENCES caja.proveedor (prov_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT rub_codfk FOREIGN KEY (rub_cod)
      REFERENCES caja.rubro (rub_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_cod_fkey FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.cabecera_compras1
(
  compra_nro serial NOT NULL,
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
  sfac integer DEFAULT 0,
  CONSTRAINT cabeceracompraspkey PRIMARY KEY (compra_nro),
  CONSTRAINT cabecera_compras_condicion_condcodfkey FOREIGN KEY (condicion_cond_cod)
      REFERENCES caja.condicion (cond_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT cabecera_compras_proveedorprovcodfkey FOREIGN KEY (proveedor_prov_cod)
      REFERENCES caja.proveedor (prov_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT cabecera_compras_usuariousuariocodfkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.detalle_compras
(
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
  id serial NOT NULL,
  cant_boni numeric(8,2),
  CONSTRAINT detalle_compras_id_pkey PRIMARY KEY (id),
  CONSTRAINT compracodfk FOREIGN KEY (cabecera_compras_compra_nro)
      REFERENCES caja.cabecera_compras1 (compra_nro) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT detalle_compras_producto_prod_cod_fkey FOREIGN KEY (producto_prod_cod)
      REFERENCES caja.producto (prod_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.motivo
(
  mo_cod numeric(3,0) NOT NULL,
  mo_nom character varying(35),
  CONSTRAINT mo_cod PRIMARY KEY (mo_cod)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.ajuste
(
  maestro_stock_producto_prod_cod integer NOT NULL,
  ajus_cant numeric(8,2) NOT NULL,
  fecha date NOT NULL,
  fecha_grabacion time without time zone NOT NULL,
  motivo_mo_cod numeric(3,0),
  canti_anterior numeric(8,2),
  ajus_cod serial NOT NULL,
  usuario_usuario_cod integer,
  union_emp_id_union integer,
  CONSTRAINT ajuste_cod_pkey PRIMARY KEY (ajus_cod),
  CONSTRAINT ajuste_motivo_mo_cod FOREIGN KEY (motivo_mo_cod)
      REFERENCES caja.motivo (mo_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ajuste_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_apertu
(
  nro_apertura serial NOT NULL,
  usuario_cod integer NOT NULL,
  empresas_codigo_emp integer NOT NULL,
  fecha_aper date,
  hora_aper timestamp with time zone,
  fecha_cierre date,
  hora_cierre timestamp with time zone,
  anulado character(10),
  union_emp_id_union integer,
  importe numeric(12,0) DEFAULT 0,
  CONSTRAINT nro_apertu PRIMARY KEY (nro_apertura, usuario_cod, empresas_codigo_emp),
  CONSTRAINT empresas_codigo_emp FOREIGN KEY (empresas_codigo_emp)
      REFERENCES public.empresas (codigo_emp) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_cod FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_movimiento
(
  empresas_codigo_emp integer NOT NULL,
  nro_movimiento serial NOT NULL,
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
  moneda_cod integer,
  CONSTRAINT pk PRIMARY KEY (empresas_codigo_emp, nro_movimiento),
  CONSTRAINT caja_apertufk FOREIGN KEY (caja_apertu_nro_apertura, usuario_cod, empresas_codigo_emp)
      REFERENCES caja.caja_apertu (nro_apertura, usuario_cod, empresas_codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moneda_codfk FOREIGN KEY (moneda_cod)
      REFERENCES caja.moneda (moneda_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_tipos_formas_cobros
(
  cod_tipo_forma serial NOT NULL,
  forma_descripcion character varying(50),
  vuelto numeric(5,0),
  CONSTRAINT cod_tipo_forma_pk PRIMARY KEY (cod_tipo_forma)
)
WITH (
  OIDS=FALSE
);



CREATE TABLE caja.caja_mov_formas
(
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
  nro_cta numeric(30,0),
  CONSTRAINT caja_mov_formas_pk PRIMARY KEY (empresas_codigo_emp, nro_movimiento, cod_tipo_forma, moneda_cod),
  CONSTRAINT caja_mov_caja_fk FOREIGN KEY (empresas_codigo_emp, nro_movimiento)
      REFERENCES caja.caja_movimiento (empresas_codigo_emp, nro_movimiento) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT cod_moneda_fk FOREIGN KEY (moneda_cod)
      REFERENCES caja.moneda (moneda_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tipos_formas_cobros_fk FOREIGN KEY (cod_tipo_forma)
      REFERENCES caja.caja_tipos_formas_cobros (cod_tipo_forma) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_mov_factura
(
  empresas_codigo_emp integer NOT NULL,
  caja_movimiento_nro_movimiento integer NOT NULL,
  importe numeric(30,2),
  nro_documento integer NOT NULL,
  nro_serie integer NOT NULL,
  CONSTRAINT factura_pk PRIMARY KEY (empresas_codigo_emp, caja_movimiento_nro_movimiento, nro_serie, nro_documento)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_arqueo_cab
(
  nro_arqueo serial NOT NULL,
  empresas_codigo_emp integer NOT NULL,
  usuario_cod integer NOT NULL,
  nro_apertura integer NOT NULL,
  fecha_arqueo date,
  anulado character(10),
  CONSTRAINT caja_arqueo_cab_pk PRIMARY KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp),
  CONSTRAINT caja_apertu_fk FOREIGN KEY (nro_apertura, usuario_cod, empresas_codigo_emp)
      REFERENCES caja.caja_apertu (nro_apertura, usuario_cod, empresas_codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empresas_codigo_emp_fk FOREIGN KEY (empresas_codigo_emp)
      REFERENCES public.empresas (codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE caja.caja_documento_arqueo
(
  cod_docu_arqueo serial NOT NULL,
  docu_arqueo_descri character(30),
  CONSTRAINT cpd_docu_arqueo PRIMARY KEY (cod_docu_arqueo)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_arqueo_doc_det
(
  empresas_codigo_emp integer NOT NULL,
  nro_arqueo integer NOT NULL,
  usuario_cod integer NOT NULL,
  nro_apertura integer NOT NULL,
  cod_docu_arqueo integer NOT NULL,
  moneda_cod integer NOT NULL,
  monto_doc numeric(30,2),
  CONSTRAINT caja_arqueo_doc_det_fk PRIMARY KEY (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_docu_arqueo, moneda_cod),
  CONSTRAINT caja_apertu_fk FOREIGN KEY (nro_apertura, usuario_cod, empresas_codigo_emp)
      REFERENCES caja.caja_apertu (nro_apertura, usuario_cod, empresas_codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT caja_arqueo_cab_fk FOREIGN KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp)
      REFERENCES caja.caja_arqueo_cab (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT cod_docu_arqueo_fk FOREIGN KEY (cod_docu_arqueo)
      REFERENCES caja.caja_documento_arqueo (cod_docu_arqueo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empresas_codigo_emp_fk FOREIGN KEY (empresas_codigo_emp)
      REFERENCES public.empresas (codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moneda_cod_fk FOREIGN KEY (moneda_cod)
      REFERENCES caja.moneda (moneda_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_cod_fk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE caja.caja_arqueo_formas_det
(
  empresas_codigo_emp integer NOT NULL,
  nro_arqueo integer NOT NULL,
  usuario_cod integer NOT NULL,
  nro_apertura integer NOT NULL,
  cod_tipo_forma integer NOT NULL,
  moneda_cod integer NOT NULL,
  monto_form numeric(30,2),
  cotitipo numeric(30,2),
  monto_cob numeric(30,2),
  CONSTRAINT caja_arqueo_formas_det_pk PRIMARY KEY (empresas_codigo_emp, nro_arqueo, usuario_cod, nro_apertura, cod_tipo_forma, moneda_cod),
  CONSTRAINT caja_arqueo_cab_fk FOREIGN KEY (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp)
      REFERENCES caja.caja_arqueo_cab (nro_arqueo, usuario_cod, nro_apertura, empresas_codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moneda_cod_fk FOREIGN KEY (moneda_cod)
      REFERENCES caja.moneda (moneda_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE OR REPLACE VIEW caja.clientebuscar AS 
 SELECT c.clie_cod,
    c.clie_nom,
    c.clie_ruc,
    c.clie_ci,
    c.denominacion,
    a.ac_nom,
    c.activador_ac_cod,
    c.union_emp_id_union
   FROM caja.cliente c
     LEFT JOIN activador a ON a.ac_cod = c.activador_ac_cod
  WHERE c.activador_ac_cod = 1::numeric;
