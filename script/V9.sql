USE [Juntify]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[Estados]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[HistorialUsuario]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[Lugares]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[Notificaciones]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[idNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Texto] [varchar](500) NOT NULL,
	[Foto] [varchar](300) NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[idNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpcionesVotacion]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpcionesVotacion](
	[idPlan] [int] NULL,
	[idLugar] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipantePlan]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantePlan](
	[IdUsuario] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[SeUnio] [int] NULL,
	[IdDireccion] [int] NULL,
 CONSTRAINT [PK_ParticipantePlan] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[Resenas]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[TipoLugar]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[TipoSubOpcion]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[TipoSubOpcionXLugares]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[TipoSubOpcionXPlanes]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  Table [dbo].[UsuarioXAmigos]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXAmigos](
	[IdUsuario1] [int] NOT NULL,
	[IdUsuario2] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votacion]    Script Date: 27/11/2024 20:39:04 ******/
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

INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (1, 3, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (2, 6, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (3, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (4, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (5, 3, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (6, 2, N'¡Ian te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (7, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (8, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (9, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (10, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (11, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (12, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (13, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (14, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (15, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (16, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (17, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (18, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (19, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (20, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (21, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (22, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (23, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (24, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (25, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (26, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (27, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (28, 6, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (29, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (30, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (31, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (32, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (33, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (34, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (35, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (36, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
INSERT [dbo].[Notificaciones] ([idNotificacion], [idUsuario], [Texto], [Foto]) VALUES (37, 5, N'¡ii te ha invitado a unite a su plan! <a href=''''>Ver plan</a>', NULL)
SET IDENTITY_INSERT [dbo].[Notificaciones] OFF
GO
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (2, 20, 0, 2)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 13, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 14, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 15, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 16, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 17, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 18, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (3, 19, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 13, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 14, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 15, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 16, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 17, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 18, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 19, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 21, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 22, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 23, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 24, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 25, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 26, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 27, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 28, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 29, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 30, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 31, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 32, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 33, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 34, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 35, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 36, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 37, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 38, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 39, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 40, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 41, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 42, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 43, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 44, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 45, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 46, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 47, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 48, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 49, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (5, 50, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 13, NULL, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 14, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 15, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 16, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 17, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 18, 0, NULL)
INSERT [dbo].[ParticipantePlan] ([IdUsuario], [IdPlan], [SeUnio], [IdDireccion]) VALUES (6, 41, 0, NULL)
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
/****** Object:  StoredProcedure [dbo].[SP_AceptarInvitacion]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarAmigo]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarDireccion]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarDireccionParticipante]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarNotificacion]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarNotificacion]
@idUsuario int,
@texto varchar(500)
as begin
insert into notificaciones(idUsuario, texto) values(@idUsuario, @texto)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarParticipantePlan]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoPlan]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CrearPlan]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearPlan]
    @tipoLugar VARCHAR(150)
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
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearUsuario]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_EliminarAmigo]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarAmigos]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarDirecciones]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarNotificaciones]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarParticipantesPlan]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarResenasXLugar]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuarios]    Script Date: 27/11/2024 20:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuarios]
AS BEGIN
select * from Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuariosXMail]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ObtenerIdUsuario]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ObtenerUsuario]    Script Date: 27/11/2024 20:39:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_PlanXID]    Script Date: 27/11/2024 20:39:04 ******/
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
