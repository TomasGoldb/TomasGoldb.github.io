USE [Juntify]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 28/11/2024 08:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Calle] [varchar](150) NOT NULL,
	[Altura] [int] NOT NULL,
	[Coordenada] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Direcciones] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[IdEstado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialUsuario]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialUsuario](
	[IdHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Nombre] [varchar](150) NULL,
	[Mail] [varchar](150) NULL,
	[Edad] [int] NULL,
	[FotoPerfil] [varchar](150) NULL,
	[Constrasena] [varchar](150) NULL,
	[Nick] [varchar](150) NULL,
	[Biografía] [varchar](1000) NULL,
	[FechaCambio] [date] NULL,
 CONSTRAINT [PK_HistorialUsuario] PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lugares]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lugares](
	[IdLugar] [varchar](150) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Coordenada] [decimal](18, 2) NOT NULL,
	[Calle] [varchar](150) NOT NULL,
	[Altura] [int] NOT NULL,
	[TipoLugar] [varchar](100) NULL,
 CONSTRAINT [PK_Lugares] PRIMARY KEY CLUSTERED 
(
	[IdLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificaciones]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[idNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Texto] [varchar](500) NULL,
	[Foto] [varchar](300) NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcionesVotacion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcionesVotacion](
	[idPlan] [int] NULL,
	[idLugar] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipantePlan]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantePlan](
	[IdUsuario] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[SeUnio] [int] NULL,
	[IdDireccion] [int] NULL,
	[EsHost] [int] NULL,
 CONSTRAINT [PK_ParticipantePlan] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[IdPlan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[IdLugar] [varchar](150) NULL,
	[FechaYHora] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
	[TipoLugar] [varchar](100) NOT NULL,
	[Link] [varchar](150) NULL,
	[QR] [varchar](150) NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resenas]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resenas](
	[IdLugar] [varchar](150) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Resenas] PRIMARY KEY CLUSTERED 
(
	[IdLugar] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoLugar]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoLugar](
	[IdTipoLugar] [varchar](100) NOT NULL,
	[ContenidoTipo] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TipoLugar] PRIMARY KEY CLUSTERED 
(
	[IdTipoLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSubOpcion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSubOpcion](
	[IdTipoSubOpcion] [int] NOT NULL,
	[ContenidoSub] [varchar](150) NOT NULL,
 CONSTRAINT [PK_IdTipoSubOpcion] PRIMARY KEY CLUSTERED 
(
	[IdTipoSubOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSubOpcionXLugares]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSubOpcionXLugares](
	[IdTipoSubOpcion] [varchar](150) NOT NULL,
	[IdLugar] [int] NOT NULL,
 CONSTRAINT [PK_TipoSubOpcionXLugares] PRIMARY KEY CLUSTERED 
(
	[IdTipoSubOpcion] ASC,
	[IdLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSubOpcionXPlanes]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSubOpcionXPlanes](
	[IdTipoSubOpcion] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
 CONSTRAINT [PK_TipoSubOpcionXPlanes] PRIMARY KEY CLUSTERED 
(
	[IdTipoSubOpcion] ASC,
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Mail] [varchar](150) NOT NULL,
	[Edad] [int] NULL,
	[FotoPerfil] [varchar](150) NOT NULL,
	[Contrasena] [varchar](150) NOT NULL,
	[Nick] [varchar](150) NOT NULL,
	[Biografia] [varchar](1000) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioXAmigos]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXAmigos](
	[IdUsuario1] [int] NOT NULL,
	[IdUsuario2] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votacion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votacion](
	[idUsuario] [int] NOT NULL,
	[idPlan] [int] NOT NULL,
	[idLugar] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Votacion] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPlan] ASC,
	[idLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Direcciones] ON 

INSERT [dbo].[Direcciones] ([IdDireccion], [IdUsuario], [Calle], [Altura], [Coordenada]) VALUES (1, 2, N'Federico Lacroze', 344, CAST(646.00 AS Decimal(18, 2)))
INSERT [dbo].[Direcciones] ([IdDireccion], [IdUsuario], [Calle], [Altura], [Coordenada]) VALUES (2, 2, N'Camargo', 333, CAST(54.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Direcciones] OFF
GO
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (1, N'Creado')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (2, N'Votacion Lugar')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (3, N'Votacion Hora')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (4, N'En progreso')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (5, N'Finalizado')
GO
SET IDENTITY_INSERT [dbo].[Notificaciones] ON 

INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (38, 5, N'¡julian te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=51''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (39, 2, N'¡julian te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=52''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (40, 2, N'¡julian te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=53''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (41, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=54''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (42, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=54''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (43, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=55''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (44, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=55''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (45, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=56''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (46, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=56''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (47, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=57''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (48, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=57''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (49, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=58''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (50, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=58''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (51, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=59''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (52, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=59''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (53, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=60''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (54, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=60''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (55, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=61''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (56, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=61''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (57, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=62''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (58, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=62''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (59, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=63''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (60, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=63''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (61, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=64''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (62, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=64''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (63, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=65''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (64, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=65''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (65, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=66''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (66, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=66''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (67, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=67''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (68, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=67''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (69, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=68''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (70, 3, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=69''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (71, 5, N'¡ii te ha invitado a unite a su plan! <a href=''/Plan/AceptarPlan?idPlan=69''>Ver plan</a>', NULL)
SET IDENTITY_INSERT [dbo].[Notificaciones] OFF
GO
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 54, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 55, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 56, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 57, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 58, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 59, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 60, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 61, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 62, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 63, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 64, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 65, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 66, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 67, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 68, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (2, 69, 1, NULL, 1)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 54, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 55, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 56, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 57, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 58, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 59, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 60, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 61, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 62, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 63, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 64, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 65, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 66, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 67, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 68, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (3, 69, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 54, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 55, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 56, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 57, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 58, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 59, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 60, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 61, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 62, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 63, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 64, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 65, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 66, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 67, 0, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion], [EsHost]) VALUES (5, 69, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Planes] ON 

INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (13, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (14, N'a', NULL, NULL, 1, N'atm', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (15, N'a', NULL, NULL, 1, N'atm', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (16, N'a', NULL, NULL, 1, N'atm', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (17, N'a', NULL, NULL, 1, N'atm', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (18, N'a', NULL, NULL, 1, N'funeral_home', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (19, N'a', NULL, NULL, 1, N'airport', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (20, N'a', NULL, NULL, 1, N'amusement_park', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (21, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (22, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (23, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (24, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (25, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (26, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (27, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (28, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (29, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (30, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (31, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (32, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (33, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (34, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (35, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (36, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (37, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (38, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (39, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (40, N'a', NULL, NULL, 1, N'restaurant', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (41, N'a', NULL, NULL, 1, N'amusement_park', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (42, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (43, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (44, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (45, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (46, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (47, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (48, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (49, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (50, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (51, N'a', NULL, NULL, 1, N'amusement_park', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (52, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (53, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (54, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (55, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (56, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (57, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (58, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (59, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (60, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (61, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (62, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (63, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (64, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (65, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (66, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (67, N'a', NULL, NULL, 1, N'jewelry_store', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (68, N'a', NULL, NULL, 1, N'aquarium', NULL, NULL)
INSERT [dbo].[Planes] ([IdPlan], [Nombre], [IdLugar], [FechaYHora], [IdEstado], [TipoLugar], [Link], [QR]) VALUES (69, N'a', NULL, NULL, 1, N'car_repair', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Planes] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (2, N'ii', N'chau@gmail.com', NULL, N'\fotosPerfil\rostro.png', N'i', N'ii', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (3, N'Ian', N'hola@gmail.com', NULL, N'/fotosPerfil/fotoDefault.png', N'SkibidiTOILET', N'Marmota', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (4, N'skibidi', N'sigma@gmail.com', NULL, N'/fotosPerfil/fotoDefault.png', N'12345', N'sigma', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (5, N'julian', N'julian.medina@ort.edu.ar', NULL, N'/fotosPerfil/fotoDefault.png', N'TODOSREPROBADOS', N'julian', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (6, N'Abril', N'abrilvs08@gmail.com', NULL, N'/fotosPerfil/fotoDefault.png', N'12345678', N'AbrilVS', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[UsuarioXAmigos] ([IdUsuario1], [IdUsuario2]) VALUES (2, 3)
INSERT [dbo].[UsuarioXAmigos] ([IdUsuario1], [IdUsuario2]) VALUES (5, 2)
INSERT [dbo].[UsuarioXAmigos] ([IdUsuario1], [IdUsuario2]) VALUES (6, 2)
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Usuario]
GO
ALTER TABLE [dbo].[HistorialUsuario]  WITH CHECK ADD  CONSTRAINT [FK_HistorialUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[HistorialUsuario] CHECK CONSTRAINT [FK_HistorialUsuario_Usuario]
GO
ALTER TABLE [dbo].[Notificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Notificaciones_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Notificaciones] CHECK CONSTRAINT [FK_Notificaciones_Usuario]
GO
ALTER TABLE [dbo].[OpcionesVotacion]  WITH CHECK ADD  CONSTRAINT [FK_OpcionesVotacion_Lugares] FOREIGN KEY([idLugar])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[OpcionesVotacion] CHECK CONSTRAINT [FK_OpcionesVotacion_Lugares]
GO
ALTER TABLE [dbo].[OpcionesVotacion]  WITH CHECK ADD  CONSTRAINT [FK_OpcionesVotacion_Planes] FOREIGN KEY([idPlan])
REFERENCES [dbo].[Planes] ([IdPlan])
GO
ALTER TABLE [dbo].[OpcionesVotacion] CHECK CONSTRAINT [FK_OpcionesVotacion_Planes]
GO
ALTER TABLE [dbo].[ParticipantePlan]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantePlan_Direcciones] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direcciones] ([IdDireccion])
GO
ALTER TABLE [dbo].[ParticipantePlan] CHECK CONSTRAINT [FK_ParticipantePlan_Direcciones]
GO
ALTER TABLE [dbo].[ParticipantePlan]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantePlan_Planes] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Planes] ([IdPlan])
GO
ALTER TABLE [dbo].[ParticipantePlan] CHECK CONSTRAINT [FK_ParticipantePlan_Planes]
GO
ALTER TABLE [dbo].[ParticipantePlan]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantePlan_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ParticipantePlan] CHECK CONSTRAINT [FK_ParticipantePlan_Usuario]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_Estados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_Estados]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_Lugares] FOREIGN KEY([IdLugar])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_Lugares]
GO
ALTER TABLE [dbo].[Resenas]  WITH CHECK ADD  CONSTRAINT [FK_Resenas_Lugares] FOREIGN KEY([IdLugar])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[Resenas] CHECK CONSTRAINT [FK_Resenas_Lugares]
GO
ALTER TABLE [dbo].[Resenas]  WITH CHECK ADD  CONSTRAINT [FK_Resenas_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Resenas] CHECK CONSTRAINT [FK_Resenas_Usuario]
GO
ALTER TABLE [dbo].[TipoSubOpcionXLugares]  WITH CHECK ADD  CONSTRAINT [FK_TipoSubOpcionXLugares_IdTipoSubOpcion] FOREIGN KEY([IdLugar])
REFERENCES [dbo].[TipoSubOpcion] ([IdTipoSubOpcion])
GO
ALTER TABLE [dbo].[TipoSubOpcionXLugares] CHECK CONSTRAINT [FK_TipoSubOpcionXLugares_IdTipoSubOpcion]
GO
ALTER TABLE [dbo].[TipoSubOpcionXLugares]  WITH CHECK ADD  CONSTRAINT [FK_TipoSubOpcionXLugares_Lugares] FOREIGN KEY([IdTipoSubOpcion])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[TipoSubOpcionXLugares] CHECK CONSTRAINT [FK_TipoSubOpcionXLugares_Lugares]
GO
ALTER TABLE [dbo].[TipoSubOpcionXPlanes]  WITH CHECK ADD  CONSTRAINT [FK_TipoSubOpcionXPlanes_IdTipoSubOpcion] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[TipoSubOpcion] ([IdTipoSubOpcion])
GO
ALTER TABLE [dbo].[TipoSubOpcionXPlanes] CHECK CONSTRAINT [FK_TipoSubOpcionXPlanes_IdTipoSubOpcion]
GO
ALTER TABLE [dbo].[TipoSubOpcionXPlanes]  WITH CHECK ADD  CONSTRAINT [FK_TipoSubOpcionXPlanes_Planes] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Planes] ([IdPlan])
GO
ALTER TABLE [dbo].[TipoSubOpcionXPlanes] CHECK CONSTRAINT [FK_TipoSubOpcionXPlanes_Planes]
GO
ALTER TABLE [dbo].[UsuarioXAmigos]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXAmigos_Usuario] FOREIGN KEY([IdUsuario1])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioXAmigos] CHECK CONSTRAINT [FK_UsuarioXAmigos_Usuario]
GO
ALTER TABLE [dbo].[UsuarioXAmigos]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioXAmigos_Usuario1] FOREIGN KEY([IdUsuario2])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioXAmigos] CHECK CONSTRAINT [FK_UsuarioXAmigos_Usuario1]
GO
ALTER TABLE [dbo].[Votacion]  WITH CHECK ADD  CONSTRAINT [FK_Votacion_Lugares] FOREIGN KEY([idLugar])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[Votacion] CHECK CONSTRAINT [FK_Votacion_Lugares]
GO
ALTER TABLE [dbo].[Votacion]  WITH CHECK ADD  CONSTRAINT [FK_Votacion_Planes] FOREIGN KEY([idPlan])
REFERENCES [dbo].[Planes] ([IdPlan])
GO
ALTER TABLE [dbo].[Votacion] CHECK CONSTRAINT [FK_Votacion_Planes]
GO
ALTER TABLE [dbo].[Votacion]  WITH CHECK ADD  CONSTRAINT [FK_Votacion_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Votacion] CHECK CONSTRAINT [FK_Votacion_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_AceptarInvitacion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_AceptarInvitacion]
@idPlan int,
@idUsuario int
as begin
update ParticipantePlan set seUnio=1 where IdUsuario=@idUsuario and IdPlan=@idPlan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarAmigo]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarAmigo]
@idUsuario1 int,
@idUsuario2 int
as 
begin
insert into UsuarioXAmigos(IdUsuario1,IdUsuario2) values(@idUsuario1,@idUsuario2)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarDireccion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarDireccion]
@idUsuario int,
@calle varchar(300),
@altura int,
@coordenada decimal(10,2)
as 
begin
insert into Direcciones (IdUsuario,Calle,Altura,Coordenada) values(@idUsuario, @calle, @altura, @coordenada)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarDireccionParticipante]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_AgregarDireccionParticipante]
@idUsuario int,
@idDireccion int,
@idPlan int
as begin
update ParticipantePlan set IdDireccion = @idDireccion where IdUsuario=@idUsuario and IdPlan=@idPlan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarNotificacion]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_AgregarNotificacion]
@idUsuario int
as begin


    -- Declare a table variable to capture the inserted idPlan
    DECLARE @outputTable TABLE (idNoti INT);

    -- Insert the new plan, and capture the inserted idPlan in the table variable
    INSERT INTO notificaciones(idUsuario)
    OUTPUT inserted.idNotificacion INTO @outputTable(idNoti) -- Store the inserted idPlan in the table variable
    values(@idUsuario)

    -- Retrieve the idPlan from the table variable
    SELECT idNoti FROM @outputTable;

	DECLARE @idNoti INT;
    SELECT @idNoti = idNoti FROM @outputTable;

	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarParticipantePlan]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_AgregarParticipantePlan]
@idUsuario int,
@idPlan int
as 
begin
insert into ParticipantePlan(IdUsuario,IdPlan, SeUnio) values(@idUsuario, @idPlan, 0)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarTextoNoti]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarTextoNoti]
@idNoti int,
@txt varchar(400)
as begin
update Notificaciones set Texto=@txt where idNotificacion=@idNoti
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoPlan]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CambiarEstadoPlan]
@idPlan int,
@idEstado int
as 
begin
update planes set IdEstado =@idEstado where IdPlan=@idPlan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearPlan]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearPlan]
    @tipoLugar VARCHAR(150),
	@idUsuario int
AS
BEGIN
    -- Declare a table variable to capture the inserted idPlan
    DECLARE @outputTable TABLE (idPlan INT);

    -- Insert the new plan, and capture the inserted idPlan in the table variable
    INSERT INTO Planes (Nombre, IdEstado, TipoLugar)
    OUTPUT inserted.idPlan INTO @outputTable(idPlan) -- Store the inserted idPlan in the table variable
    VALUES ('a', 1, @tipoLugar);

    -- Retrieve the idPlan from the table variable
    SELECT idPlan FROM @outputTable;

	DECLARE @idPlan INT;
    SELECT @idPlan = idPlan FROM @outputTable;

	insert into ParticipantePlan(IdUsuario,IdPlan, SeUnio, EsHost) values(@idUsuario, @idPlan, 1, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearUsuario]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CrearUsuario]
@contra varchar(100),
@nick varchar(100),
@nombre varchar(100),
@mail varchar(100)
as
begin
insert into Usuario(nombre, nick, contrasena, mail,  FotoPerfil) values(@nombre, @nick,@contra,@mail, '/fotosPerfil/fotoDefault.png')
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarAmigo]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_EliminarAmigo]
@idUsuario1 int,
@idUsuario2 int
as 
begin
delete from UsuarioXAmigos where IdUsuario1=@idUsuario1 AND IdUsuario2=@idUsuario2
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarAmigos]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarAmigos]
    @idUsuario INT
AS
BEGIN
    SELECT DISTINCT u.*
    FROM Usuario u
    INNER JOIN UsuarioXAmigos uxa
        ON u.IdUsuario = uxa.IdUsuario1 OR u.IdUsuario = uxa.IdUsuario2
    WHERE uxa.IdUsuario1 = @idUsuario OR uxa.IdUsuario2 = @idUsuario
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ListarDirecciones]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarDirecciones]
@idUsuario int
as begin
select * from Direcciones where IdUsuario=@idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarNotificaciones]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarNotificaciones]
@idUsuario int
as begin
select * from notificaciones where idusuario=@idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarParticipantesPlan]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarParticipantesPlan]
@idPlan int
as begin
select IdUsuario from ParticipantePlan where IdPlan=@idPlan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarResenasXLugar]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ListarResenasXLugar]
@idlugar int
as begin
select u.Nombre, R.Puntaje, r.Descripcion, l.IdLugar from Lugares l
inner join Resenas r on l.IdLugar=r.IdLugar
inner join usuario u on u.IdUsuario=r.IdUsuario
where l.IdLugar=@idlugar
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuarios]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuarios]
AS BEGIN
select * from Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuariosXMail]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuariosXMail]
@Mail VARCHAR(320)
AS BEGIN
select * from Usuario where mail= @Mail;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerIdUsuario]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ObtenerIdUsuario]
AS
BEGIN
SELECT TOP 1 IdUsuario FROM Usuario ORDER BY IdUsuario DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerUsuario]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ObtenerUsuario]
@idUsuario int
as begin
select * from usuario where IdUsuario=@idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_PlanXID]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_PlanXID]
@idPlan int
as begin
select * from planes where IdPlan=@idPlan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_SacarNoti]    Script Date: 28/11/2024 08:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_SacarNoti]
@idNoti int
as begin
delete from Notificaciones where idNotificacion=@idNoti
end
GO
