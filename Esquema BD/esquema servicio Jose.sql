CREATE TABLE servicio.cabecera_servicio
(
  servi serial NOT NULL,
  fecha date,
  fechahora timestamp without time zone,
  usuario_cod integer,
  union_emp_id_union integer,
  codclie integer,
  estado character varying(20),
  CONSTRAINT servipk PRIMARY KEY (servi),
  CONSTRAINT codcliefk FOREIGN KEY (codclie)
      REFERENCES caja.cliente (clie_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT empresafk FOREIGN KEY (union_emp_id_union)
      REFERENCES public.union_emp (id_union) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT usuario_codfk FOREIGN KEY (usuario_cod)
      REFERENCES public.usuario (usuario_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE servicio.marca
(
  idmar serial NOT NULL,
  marcanom character varying(60) NOT NULL,
  CONSTRAINT idmarpk PRIMARY KEY (idmar)
)
WITH (
  OIDS=FALSE
);
CREATE TABLE servicio.equipo
(
  idequi serial NOT NULL,
  equiponom character varying(60) NOT NULL,
  CONSTRAINT idequipk PRIMARY KEY (idequi)
)
WITH (
  OIDS=FALSE
);
CREATE TABLE servicio.detalle_servicio
(
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
  detide serial NOT NULL,
  pagado numeric(12,0) DEFAULT 0,
  situacion character varying(5),
  usuario_cod integer,
  usuario_m integer,
  CONSTRAINT detidepk1 PRIMARY KEY (detide),
  CONSTRAINT ser_codfk FOREIGN KEY (ser_cod)
      REFERENCES caja.servicio (ser_cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE servicio.detalle_recepcion
(
  idrece serial NOT NULL,
  servi integer,
  fecha date,
  comentario character varying(300),
  idequi integer NOT NULL,
  idmar integer,
  CONSTRAINT idrecepk PRIMARY KEY (idrece),
  CONSTRAINT idequifk FOREIGN KEY (idrece)
      REFERENCES servicio.equipo (idequi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT idmarfk FOREIGN KEY (idmar)
      REFERENCES servicio.marca (idmar) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT servifk FOREIGN KEY (servi)
      REFERENCES servicio.cabecera_servicio (servi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);
