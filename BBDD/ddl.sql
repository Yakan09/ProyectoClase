-- Tabla: paciente (debe ir primero porque otras dependen de ella)
CREATE TABLE IF NOT EXISTS public.paciente (
    id_paciente integer NOT NULL,
    nombre varchar(50),
    apellidos varchar(50),
    fecha_nacimiento date,
    genero varchar(10),
    direccion text,
    telefono varchar(20),
    correo_electronico varchar(100),
    tipo_paciente varchar(10),
    tutor_nombre varchar(50),
    tutor_telefono varchar(20),
    tutor_relacion varchar(50),
    diagnostico_inicial text,
    historial_clinico text,
    CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente)
);

-- Tabla: profesional
CREATE TABLE IF NOT EXISTS public.profesional (
    id_profesional integer NOT NULL,
    nombre varchar(50),
    apellidos varchar(50),
    numero_colegiado varchar(20),
    especialidad varchar(100),
    telefono varchar(20),
    correo_electronico varchar(100),
    disponibilidad text,
    CONSTRAINT profesional_pkey PRIMARY KEY (id_profesional),
    CONSTRAINT profesional_numero_colegiado_key UNIQUE (numero_colegiado)
);

-- Tabla: diagnostico
CREATE TABLE IF NOT EXISTS public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_paciente integer,
    fecha_diagnostico date,
    descripcion text,
    recomendaciones text,
    CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico),
    CONSTRAINT diagnostico_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente)
);

-- Secuencia necesaria para encuesta_satisfactoria
CREATE SEQUENCE IF NOT EXISTS encuesta_satisfactoria_id_encuesta_seq;

-- Tabla: encuesta_satisfactoria
CREATE TABLE IF NOT EXISTS public.encuesta_satisfactoria (
    id_encuesta integer NOT NULL DEFAULT nextval('encuesta_satisfactoria_id_encuesta_seq'),
    id_paciente integer,
    fecha_realizacion date,
    CONSTRAINT encuesta_satisfactoria_pkey PRIMARY KEY (id_encuesta),
    CONSTRAINT encuesta_satisfactoria_id_paciente_key UNIQUE (id_paciente),
    CONSTRAINT encuesta_satisfactoria_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente)
);

-- Tabla: facturacion
CREATE TABLE IF NOT EXISTS public.facturacion (
    id_factura integer NOT NULL,
    id_paciente integer,
    fecha_emision date,
    importe numeric(10,2),
    estado_pago varchar(20),
    CONSTRAINT facturacion_pkey PRIMARY KEY (id_factura),
    CONSTRAINT facturacion_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente)
);

-- Secuencia para historial_comunicaciones
CREATE SEQUENCE IF NOT EXISTS historial_comunicaciones_id_comunicacion_seq;

-- Tabla: historial_comunicaciones
CREATE TABLE IF NOT EXISTS public.historial_comunicaciones (
    id_comunicacion integer NOT NULL DEFAULT nextval('historial_comunicaciones_id_comunicacion_seq'),
    id_paciente integer,
    fecha_hora timestamp,
    CONSTRAINT historial_comunicaciones_pkey PRIMARY KEY (id_comunicacion),
    CONSTRAINT historial_comunicaciones_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente)
);

-- Secuencia para opinion_mejora
CREATE SEQUENCE IF NOT EXISTS opinion_mejora_id_opinion_seq;

-- Tabla: opinion_mejora
CREATE TABLE IF NOT EXISTS public.opinion_mejora (
    id_opinion integer NOT NULL DEFAULT nextval('opinion_mejora_id_opinion_seq'),
    descripcion text,
    mejora text,
    mensaje_final text,
    nombre text,
    apellido text,
    CONSTRAINT opinion_mejora_pkey PRIMARY KEY (id_opinion)
);

-- Secuencia para recursos_adicionales
CREATE SEQUENCE IF NOT EXISTS recursos_adicionales_id_recursos_seq;

-- Tabla: recursos_adicionales
CREATE TABLE IF NOT EXISTS public.recursos_adicionales (
    id_recursos integer NOT NULL DEFAULT nextval('recursos_adicionales_id_recursos_seq'),
    tipo_recurso varchar(255) NOT NULL,
    id_paciente integer,
    CONSTRAINT recursos_adicionales_pkey PRIMARY KEY (id_recursos),
    CONSTRAINT recursos_adicionales_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente)
);

-- Tabla: sesion
CREATE TABLE IF NOT EXISTS public.sesion (
    id_sesion integer NOT NULL,
    fecha_hora timestamp,
    id_paciente integer,
    id_profesional integer,
    tipo_sesion varchar(20),
    notas text,
    CONSTRAINT sesion_pkey PRIMARY KEY (id_sesion),
    CONSTRAINT sesion_id_paciente_fkey FOREIGN KEY (id_paciente)
        REFERENCES public.paciente (id_paciente),
    CONSTRAINT sesion_id_profesional_fkey FOREIGN KEY (id_profesional)
        REFERENCES public.profesional (id_profesional)
);
