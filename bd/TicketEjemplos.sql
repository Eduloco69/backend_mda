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

('INC-000001',
'No enciende notebook corporativo',
'El usuario reporta que su notebook no enciende luego de una actualización eléctrica.',
1, 1, 4, 1,
2, NULL, 2, 1,
GETDATE(), GETDATE()),


('INC-000002',
'Impresora no responde',
'La impresora del área administrativa no recibe trabajos de impresión.',
2, 1, 2, 2,
2, NULL, 2, 1,
DATEADD(HOUR,-4,GETDATE()), GETDATE()),


('REQ-000003',
'Solicitud instalación de software',
'Usuario requiere instalación de software de diseño autorizado.',
1, 2, 2, 14,
2, NULL, 2, 1,
DATEADD(DAY,-1,GETDATE()), GETDATE()),


('INC-000004',
'No puede acceder al correo',
'Credenciales correctas pero el sistema rechaza el acceso.',
3, 1, 3, 12,
2, NULL, 2, 1,
DATEADD(DAY,-2,GETDATE()), GETDATE()),


('INC-000005',
'VPN corporativa desconecta constantemente',
'Durante trabajo remoto la VPN pierde conectividad cada 10 minutos.',
2, 1, 3, 19,
2, NULL, 2, 1,
DATEADD(DAY,-3,GETDATE()), GETDATE()),


('SEC-000006',
'Correo sospechoso recibido',
'Usuario reporta posible intento de phishing con archivo adjunto.',
4, 1, 4, 27,
2, NULL, 2, 1,
DATEADD(DAY,-5,GETDATE()), GETDATE()),


('ACC-000007',
'Cuenta bloqueada por intentos fallidos',
'Usuario no puede iniciar sesión luego de múltiples intentos.',
1, 1, 2, 30,
2, NULL, 2, 1,
DATEADD(HOUR,-12,GETDATE()), GETDATE()),


('REQ-000008',
'Solicitud de acceso remoto',
'Usuario solicita habilitación de acceso remoto para teletrabajo.',
5, 2, 1, 34,
2, NULL, 2, 1,
DATEADD(DAY,-8,GETDATE()), GETDATE()),


('INC-000009',
'Internet lento en oficina',
'Conectividad degradada en puesto de trabajo del usuario.',
2, 1, 2, 20,
2, NULL, 2, 1,
DATEADD(HOUR,-8,GETDATE()), GETDATE()),


('INC-000010',
'Restablecimiento de contraseña',
'Usuario solicita cambio de contraseña por olvido.',
4, 2, 1, 29,
2, NULL, 2, 1,
DATEADD(DAY,-1,GETDATE()), GETDATE());