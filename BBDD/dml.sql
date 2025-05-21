-- Primero, insertar pacientes (ya que muchas tablas dependen de esta)
INSERT INTO public.paciente (id_paciente, nombre, apellidos) VALUES
(1, 'Carlos', 'Martínez'),
(2, 'Laura', 'Pérez');

-- Insertar profesionales
INSERT INTO public.profesional (id_profesional, nombre, apellidos, numero_colegiado, especialidad, telefono, correo_electronico, disponibilidad) VALUES
(1, 'Ana', 'López', 'COL001', 'Psicología', '555123456', 'ana@example.com', 'Lunes a Viernes'),
(2, 'Pedro', 'Gómez', 'COL002', 'Psiquiatría', '555654321', 'pedro@example.com', 'Martes y Jueves');

-- Insertar diagnósticos
INSERT INTO public.diagnostico (id_diagnostico, id_paciente, fecha_diagnostico, descripcion) VALUES
(1, 1, '2024-05-12', 'Diagnóstico de ansiedad leve'),
(2, 2, '2024-05-15', 'Evaluación de TDAH');

-- Insertar encuestas satisfactorias
INSERT INTO public.encuesta_satisfactoria (id_encuesta, id_paciente, fecha_realizacion) VALUES
(5, 1, '2024-05-16'),
(6, 2, '2024-05-17');

-- Insertar facturación
INSERT INTO public.facturacion (id_factura, id_paciente, fecha_emision, importe, estado_pago) VALUES
(1001, 1, '2024-05-18', 100.00, 'Tarjeta'),
(1002, 2, '2024-05-19', 80.00, 'Efectivo');

-- Insertar historial de comunicaciones
INSERT INTO public.historial_comunicaciones (id_comunicacion, id_paciente, fecha_hora) VALUES
(1, 1, '2024-05-13 10:00:00'),
(2, 2, '2024-05-14 14:30:00');

-- Insertar opiniones de mejora
INSERT INTO public.opinion_mejora (id_opinion, descripcion, mejora, mensaje_final, nombre, apellido) VALUES
(101, 'Agregar más horarios disponibles', 'Mayor flexibilidad', 'Gracias por la atención', 'Lucía', 'Ramírez'),
(102, 'Mejorar la interfaz de usuario', 'Diseño más intuitivo', 'Gran potencial', 'Jorge', 'Morales');

-- Insertar recursos adicionales
INSERT INTO public.recursos_adicionales (id_recursos, tipo_recurso, id_paciente) VALUES
(1, 'Guía de relajación', 1),
(2, 'Video de mindfulness', 2);

-- Insertar sesiones
INSERT INTO public.sesion (id_sesion, fecha_hora, id_paciente, id_profesional, tipo_sesion, notas) VALUES
(1, '2024-05-18 09:00:00', 1, 1, 'Individual', 'Primera sesión de evaluación'),
(2, '2024-05-19 11:00:00', 2, 2, 'Terapia', 'Sesión de seguimiento');
