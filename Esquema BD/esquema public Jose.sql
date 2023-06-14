CREATE TABLE public.empresas
(
  codigo_emp serial NOT NULL,
  nombre character varying(70),
  ruc character varying(13),
  direccion character varying(160),
  CONSTRAINT codigo_emp_pkey PRIMARY KEY (codigo_emp)
)
WITH (
  OIDS=FALSE
);
CREATE TABLE public.union_emp
(
  id_union integer NOT NULL,
  empresas_codigo_emp integer,
  nombre_suc character(60),
  estado integer DEFAULT 0,
  CONSTRAINT id_union PRIMARY KEY (id_union),
  CONSTRAINT empresas_codigo_emp FOREIGN KEY (empresas_codigo_emp)
      REFERENCES public.empresas (codigo_emp) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
CREATE TABLE public.activador
(
  ac_cod numeric(1,0) NOT NULL,
  ac_nom character varying(8) NOT NULL,
  CONSTRAINT activador_pkey PRIMARY KEY (ac_cod)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE public.usuario
(
  usuario_nom character varying(45) NOT NULL,
  usuario_password character varying(25) NOT NULL,
  fecha_creacion timestamp with time zone NOT NULL,
  activador_ac_cod numeric(1,0),
  usuario_cod serial NOT NULL,
  usuario integer,
  m_usuario integer,
  union_emp_id_union integer,
  CONSTRAINT usuario_usuario_cod_pkey PRIMARY KEY (usuario_cod),
  CONSTRAINT union_emp_id_union FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_activador_ac_cod_fkey FOREIGN KEY (activador_ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
CREATE TABLE public.roles_usuario
(
  roles_cod numeric(3,0) NOT NULL,
  roles_nom character varying(40) NOT NULL,
  CONSTRAINT roles_usuario_pkey PRIMARY KEY (roles_cod)
)
WITH (
  OIDS=FALSE
);
CREATE TABLE public.asignar
(
  asignar_cod numeric(1,0) NOT NULL,
  asignar_nom character varying(2),
  CONSTRAINT asignar_cod_pkey PRIMARY KEY (asignar_cod)
)
WITH (
  OIDS=FALSE
);
CREATE TABLE public.usuario_asignacion
(
  usuario_usuario_cod integer NOT NULL,
  roles_usuario_roles_cod numeric(3,0) NOT NULL,
  asignar_asignar_cod numeric(1,0),
  id serial NOT NULL,
  operador integer,
  insertar numeric(2,0),
  modificar numeric(2,0),
  consultar numeric(2,0),
  borrar numeric(2,0),
  CONSTRAINT usuario_asignacion_id_pkey PRIMARY KEY (id),
  CONSTRAINT usuario_asignacion_asignar_asignar_cod_fkey FOREIGN KEY (asignar_asignar_cod)
      REFERENCES public.asignar (asignar_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_asignacion_roles_usuario_roles_cod_fkey FOREIGN KEY (roles_usuario_roles_cod)
      REFERENCES public.roles_usuario (roles_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_asignacion_usuario_usuario_cod_fkey FOREIGN KEY (usuario_usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE public.impresoras
(
  impres serial NOT NULL,
  nombre character varying(30) NOT NULL,
  ac_cod numeric(1,0) NOT NULL,
  usuario_cod integer NOT NULL,
  empresa integer NOT NULL,
  autoimpresor integer NOT NULL DEFAULT 0,
  CONSTRAINT imprpk PRIMARY KEY (impres),
  CONSTRAINT ac_codfk FOREIGN KEY (ac_cod)
      REFERENCES public.activador (ac_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empresafk FOREIGN KEY (empresa)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuariofk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE public.nrofactura
(
  nrofac serial NOT NULL,
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
  fechasoli date,
  CONSTRAINT nrofacpk PRIMARY KEY (nrofac),
  CONSTRAINT impresfk FOREIGN KEY (impres)
      REFERENCES public.impresoras (impres) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuariofk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE public.detalle_impresora
(
  impres integer,
  usuario_cod integer,
  usuimpre serial NOT NULL ,
  CONSTRAINT usuimprepk PRIMARY KEY (usuimpre),
  CONSTRAINT impresofk FOREIGN KEY (impres)
      REFERENCES public.impresoras (impres) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuariofk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

------------------------------------------------------------------------otro esquema caja
