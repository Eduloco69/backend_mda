/*Roles iniciales*/
INSERT INTO [MesaDeAyuda].[dbo].[rol] VALUES (1, 'Administrador' )
INSERT INTO [MesaDeAyuda].[dbo].[rol] VALUES (2, 'Supervisor' )
INSERT INTO [MesaDeAyuda].[dbo].[rol] VALUES (3, 'Tecnico' )
INSERT INTO [MesaDeAyuda].[dbo].[rol] VALUES (4, 'Usuario' )

/*Tipos de ticket iniciales*/
INSERT INTO [MesaDeAyuda].[dbo].[tipoTicket] VALUES (1, 'Incidencia' )
INSERT INTO [MesaDeAyuda].[dbo].[tipoTicket] VALUES (2, 'Solicitud de Servicio' )
INSERT INTO [MesaDeAyuda].[dbo].[tipoTicket] VALUES (3, 'Problemas' )
INSERT INTO [MesaDeAyuda].[dbo].[tipoTicket] VALUES (4, 'Solicitud de cambio' )

/*Estado de Tickets*/
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (1, 'Abierto')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (2, 'En proceso')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (3, 'Pendiente')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (4, 'Resuelto')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (5, 'Cerrado')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (6, 'Reabierto')
INSERT INTO [MesaDeAyuda].[dbo].[estadoTicket] VALUES (7, 'Cancelado')

/*Categor�as Iniciales*/
SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[categoria] ON;

INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (1, 'Hardware' )
INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (2, 'Software' )
INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (3, 'Red' )
INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (4, 'Seguridad' )
INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (5, 'Acceso' )
INSERT INTO [MesaDeAyuda].[dbo].[categoria] (categoriaId,categoria) VALUES (6, 'Servicios' )

SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[categoria] OFF;

/*Subcategorias iniciales*/
SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[subCategoriaTicket] ON;

INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (1, 'Ordenadores de sobremesa y port�tiles', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (2, 'Impresoras y esc�neres', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (3, 'Dispositivos m�viles', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (4, 'Servidores', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (5, 'Equipos de Red', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (6, 'Perif�ricos', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (7, 'Dispositivos de almacenamiento', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (8, 'Equipos de videoconferencia', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (9, 'Problemas de energ�a', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (10, 'Docking stations', 1)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (11, 'Aplicaciones de S.O.', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (12, 'Correo Electr�nico', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (13, 'Base de datos', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (14, 'Instalaci�n / actualizaci�n de software', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (15, 'Licenciamiento', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (16, 'Errores de sistema operativo', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (17, 'Aplicaciones corporativas internas', 2)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (18, 'Problemas de conectividad', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (19, 'Problemas de VPN', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (20, 'Rendimiento lento de Internet/Red', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (21, 'Acceso Wifi', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (22, 'Problemas de LAN cableada', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (23, 'Ca�das de red general', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (24, 'Problemas con proxy/firewall', 3)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (25, 'Virus y Malware', 4)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (26, 'Acceso no autorizado', 4)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (27, 'Intentos de Phishing', 4)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (28, 'Gesti�n de antivirus/EDR', 4)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (29, 'Restablecimiento de contrase�as', 5)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (30, 'Bloqueo de cuentas', 5)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (31, 'Problemas de permiso', 5)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (32, 'Baja de usuarios', 5)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (33, 'Modificaci�n de accesos/roles', 5)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (34, 'Acceso remoto', 6)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (35, 'Interrupci�n del servicio de correo electr�nico', 6)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (36, 'Fallos en la copia de seguridad y recuperaci�n', 6)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (37, 'Configuracion de usuarios', 6)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (38, 'Solicitud de nuevos servicios TI', 6)
INSERT INTO [MesaDeAyuda].[dbo].[subCategoriaTicket] (subCatId, subCat, categoriaId) VALUES (39, 'Gesti�n de respaldos (restore)', 6)

SET IDENTITY_INSERT [subCategoriaTicket] OFF;

/*Departamento inicial*/
SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[departamento] ON;

INSERT INTO [MesaDeAyuda].[dbo].[departamento] (departamentoId, nombre, tipoDepartamento) VALUES (1, 'Administrador', 'tecnico')
SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[departamento] OFF;
