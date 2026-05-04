SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[solicitante] ON;

INSERT INTO [MesaDeAyuda].[dbo].[solicitante]
(
    [solicitanteId],
    [correo],
    [nombre],
    [telefono],
    [fechaCreacion]
)
VALUES
(1, 'juan.perez@empresaexterna.cl', 'Juan Pérez', '+56911111111', GETDATE()),
(2, 'maria.gonzalez@cliente.cl', 'María González', '+56922222222', GETDATE()),
(3, 'carlos.rojas@proveedor.cl', 'Carlos Rojas', '+56933333333', GETDATE()),
(4, 'ana.morales@outsourcing.cl', 'Ana Morales', '+56944444444', GETDATE()),
(5, 'soporte@sucursal.cl', 'Sucursal Regional Norte', '+56955555555', GETDATE());

SET IDENTITY_INSERT [MesaDeAyuda].[dbo].[solicitante] OFF;

INSERT INTO [MesaDeAyuda].[dbo].[ticket]
(
    [NroTicket],
    [tituloTicket],
    [ticketDesc],
    [estadoTicket],
    [tipoTicket],
    [prioridadTicket],
    [subcategoriaTicket],
    [usuarioSolicitudTicket],
    [solicitanteTicket],
    [usuarioTicketCreacion],
    [usuarioTicketAsignado],
    [fechaCreacionTicket],
    [fechaActualizacionTicket]
)
VALUES


('EXT-000011',
'No acceso a portal proveedores',
'Proveedor externo reporta error de autenticación al ingresar al portal.',
1, 1, 3, 31,
NULL, 1, 1, 1,
GETDATE(), GETDATE()),


('EXT-000012',
'Problemas con VPN externa',
'Consultor externo no logra establecer conexión VPN.',
2, 1, 4, 19,
NULL, 2, 1, 1,
DATEADD(HOUR,-3,GETDATE()), GETDATE()),


('EXT-000013',
'Solicitud de nueva cuenta',
'Cliente solicita creación de cuenta para nuevo colaborador.',
1, 2, 2, 37,
NULL, 3, 1, 1,
DATEADD(DAY,-1,GETDATE()), GETDATE()),


('EXT-000014',
'Correo externo no recibe mensajes',
'Sucursal regional reporta problemas de recepción de correo.',
3, 1, 3, 35,
NULL, 5, 1, 1,
DATEADD(DAY,-2,GETDATE()), GETDATE()),


('EXT-000015',
'Restablecimiento de acceso',
'Usuario externo olvidó contraseña de plataforma.',
4, 2, 1, 29,
NULL, 4, 1, 1,
DATEADD(DAY,-4,GETDATE()), GETDATE()),


('EXT-000016',
'Equipo remoto sin conexión',
'Proveedor indica que equipo remoto perdió acceso.',
2, 1, 3, 34,
NULL, 3, 1, 1,
DATEADD(HOUR,-10,GETDATE()), GETDATE()),


('EXT-000017',
'Sospecha de phishing',
'Cliente reenvía correo sospechoso para análisis.',
4, 1, 4, 27,
NULL, 2, 1, 1,
DATEADD(DAY,-6,GETDATE()), GETDATE()),


('EXT-000018',
'Solicitud de instalación de software',
'Consultor requiere software autorizado para proyecto.',
5, 2, 2, 14,
NULL, 1, 1, 1,
DATEADD(DAY,-8,GETDATE()), GETDATE());