--CREATE DATABASE MesaDeAyuda;

--USE MesaDeAyuda;

CREATE TABLE [usuario] (
  [userId] int IDENTITY(1,1) PRIMARY KEY,
  [username] varchar(15) UNIQUE,
  [userNom] varchar(30),
  [userApPat] varchar(30),
  [userApMat] varchar(30),
  [userMail] varchar(50) UNIQUE NOT NULL,
  [userTelMovil] int,
  [userTelFijo] int,
  [departamentoId] int,
  [password] varchar(255) NOT NULL,
  [rolId] int NOT NULL,
  [ActiveFlg] bit NOT NULL DEFAULT (0),
  [fechaCreacion] datetime DEFAULT (GETDATE()),
  [fechaTerminoVig] datetime,
  [changePassFlg] bit NOT NULL DEFAULT (0)
)
GO

CREATE TABLE [rol] (
  [rolId] int PRIMARY KEY,
  [rolGlosa] varchar(20) NOT NULL
)
GO

CREATE TABLE [ticket] (
  [ticketId] int IDENTITY(1,1) PRIMARY KEY,
  [NroTicket] varchar(20) UNIQUE,
  [tituloTicket] varchar(30),
  [ticketDesc] varchar(255),
  [estadoTicket] int,
  [tipoTicket] int,
  [prioridadTicket] int,
  [subcategoriaTicket] int,
  [usuarioSolicitudTicket] int,
  [solicitanteTicket] int,
  [usuarioTicketCreacion] int,
  [usuarioTicketAsignado] int,
  [fechaCreacionTicket] datetime DEFAULT (GETDATE()),
  [fechaActualizacionTicket] datetime
)
GO

CREATE TABLE [prioridadTicket] (
  [idPrioridad] int PRIMARY KEY,
  [prioridadTicket] varchar(10)
)
GO

CREATE TABLE [tipoTicket] (
  [tipoTicketId] int PRIMARY KEY,
  [tipoTicket] varchar(50)
)
GO

CREATE TABLE [estadoTicket] (
  [estadoTicketId] int PRIMARY KEY,
  [estadoTicket] varchar(50)
)
GO

CREATE TABLE [subCategoriaTicket] (
  [subCatId] int PRIMARY KEY,
  [subCat] varchar(50),
  [categoriaId] int
)
GO

CREATE TABLE [categoria] (
  [categoriaId] int PRIMARY KEY,
  [categoria] varchar(50)
)
GO

CREATE TABLE [historialTicket] (
  [historialId] int IDENTITY(1,1) PRIMARY KEY,
  [ticketId] int,
  [campoModificado] varchar(50),
  [tipoDato] varchar(20),
  [valorAnterior] varchar(255),
  [valorNuevo] varchar(255),
  [usuarioCambio] int,
  [fechaCambio] datetime
)
GO

CREATE TABLE [mensajesTicket] (
  [mensajeId] int IDENTITY(1,1) PRIMARY KEY,
  [ticketId] int,
  [mensaje] varchar(255),
  [fechaMensaje] datetime,
  [userMensaje] int
)
GO

CREATE TABLE [adjunto] (
  [adjuntoId] int IDENTITY(1,1) PRIMARY KEY,
  [ticketId] int,
  [mensajeId] int,
  [nomArchivo] varchar(255),
  [tipoArchivo] varchar(8),
  [fechaArchivo] datetime,
  [usuarioAdjunto] int
)
GO

CREATE TABLE [ticketEncuesta] (
  [encuentaId] int IDENTITY(1,1) PRIMARY KEY,
  [ticketId] int,
  [calificacion] int,
  [mensaje] varchar(300)
)
GO

CREATE TABLE [notificacion] (
  [notificacionId] int IDENTITY(1,1) PRIMARY KEY,
  [ticketId] int,
  [tipo] varchar(30),
  [titulo] varchar(100),
  [mensaje] varchar(255),
  [fechaCreacion] datetime
)
GO

CREATE TABLE [usuarioNotificacion] (
  [usuarioNotificacionId] int IDENTITY(1,1) PRIMARY KEY,
  [usuarioId] int,
  [notificacionId] int,
  [leidoFlg] bit DEFAULT (0),
  [fechaLeido] datetime
)
GO

CREATE TABLE [solicitante] (
  [solicitanteId] int IDENTITY(1,1) PRIMARY KEY,
  [correo] varchar(100) UNIQUE,
  [nombre] varchar(100),
  [telefono] varchar(20),
  [fechaCreacion] datetime DEFAULT (getdate())
)
GO

CREATE TABLE [departamento] (
  [departamentoId] int PRIMARY KEY,
  [nombre] varchar(50),
  [tipoDepartamento] varchar(20)
)
GO

CREATE TABLE [permisos] (
  [permisoId] int PRIMARY KEY,
  [nomPermiso] varchar(50) UNIQUE,
  [descripcion] varchar(100)
)
GO

CREATE TABLE [rolPermiso] (
  [id] int PRIMARY KEY,
  [rolId] int,
  [permisoId] int
)
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([rolId]) REFERENCES [rol] ([rolId])
GO

ALTER TABLE [historialTicket] ADD FOREIGN KEY ([ticketId]) REFERENCES [ticket] ([ticketId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([usuarioTicketCreacion]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [historialTicket] ADD FOREIGN KEY ([usuarioCambio]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [mensajesTicket] ADD FOREIGN KEY ([ticketId]) REFERENCES [ticket] ([ticketId])
GO

ALTER TABLE [adjunto] ADD FOREIGN KEY ([ticketId]) REFERENCES [ticket] ([ticketId])
GO

ALTER TABLE [mensajesTicket] ADD FOREIGN KEY ([userMensaje]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [adjunto] ADD FOREIGN KEY ([usuarioAdjunto]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([tipoTicket]) REFERENCES [tipoTicket] ([tipoTicketId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([estadoTicket]) REFERENCES [estadoTicket] ([estadoTicketId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([subcategoriaTicket]) REFERENCES [subCategoriaTicket] ([subCatId])
GO

ALTER TABLE [subCategoriaTicket] ADD FOREIGN KEY ([categoriaId]) REFERENCES [categoria] ([categoriaId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([usuarioTicketAsignado]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([prioridadTicket]) REFERENCES [prioridadTicket] ([idPrioridad])
GO

ALTER TABLE [adjunto] ADD FOREIGN KEY ([mensajeId]) REFERENCES [mensajesTicket] ([mensajeId])
GO

ALTER TABLE [ticketEncuesta] ADD FOREIGN KEY ([ticketId]) REFERENCES [ticket] ([ticketId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([usuarioSolicitudTicket]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [notificacion] ADD FOREIGN KEY ([ticketId]) REFERENCES [ticket] ([ticketId])
GO

ALTER TABLE [usuarioNotificacion] ADD FOREIGN KEY ([notificacionId]) REFERENCES [notificacion] ([notificacionId])
GO

ALTER TABLE [usuarioNotificacion] ADD FOREIGN KEY ([usuarioId]) REFERENCES [usuario] ([userId])
GO

ALTER TABLE [ticket] ADD FOREIGN KEY ([solicitanteTicket]) REFERENCES [solicitante] ([solicitanteId])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([departamentoId]) REFERENCES [departamento] ([departamentoId])
GO

ALTER TABLE [rolPermiso] ADD FOREIGN KEY ([permisoId]) REFERENCES [permisos] ([permisoId])
GO

ALTER TABLE [rolPermiso] ADD FOREIGN KEY ([rolId]) REFERENCES [rol] ([rolId])
GO
