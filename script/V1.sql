USE [Juntify]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  Table [dbo].[Estados]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  Table [dbo].[Lugares]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lugares](
	[IdLugar] [int] NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Coordenada] [decimal](18, 2) NOT NULL,
	[Calle] [varchar](150) NOT NULL,
	[Altura] [int] NOT NULL,
	[IdTipoLugar] [int] NULL,
 CONSTRAINT [PK_Lugares] PRIMARY KEY CLUSTERED 
(
	[IdLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParticipantePlan]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantePlan](
	[IdUsuario] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
 CONSTRAINT [PK_ParticipantePlan] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[IdPlan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[IdLugar] [int] NULL,
	[FechaYHora] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
	[IdTipoLugar] [int] NOT NULL,
	[IdTipoSubOpcion] [int] NOT NULL,
	[Link] [varchar](150) NULL,
	[QR] [varchar](150) NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resenas]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resenas](
	[IdLugar] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Puntaje] [int] NOT NULL,
 CONSTRAINT [PK_Resenas] PRIMARY KEY CLUSTERED 
(
	[IdLugar] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoLugar]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoLugar](
	[IdTipoLugar] [int] NOT NULL,
	[ContenidoTipo] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TipoLugar] PRIMARY KEY CLUSTERED 
(
	[IdTipoLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSubOpcion]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  Table [dbo].[TipoSubOpcionXLugares]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSubOpcionXLugares](
	[IdTipoSubOpcion] [int] NOT NULL,
	[IdLugar] [int] NOT NULL,
 CONSTRAINT [PK_TipoSubOpcionXLugares] PRIMARY KEY CLUSTERED 
(
	[IdTipoSubOpcion] ASC,
	[IdLugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSubOpcionXPlanes]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  Table [dbo].[UsuarioXAmigos]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioXAmigos](
	[IdUsuario1] [int] NOT NULL,
	[IdUsuario2] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (1, N'Creado')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (2, N'Votacion Lugar')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (3, N'Votacion Hora')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (4, N'En progreso')
INSERT [dbo].[Estados] ([IdEstado], [Nombre]) VALUES (5, N'Finalizado')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Mail], [Edad], [FotoPerfil], [Contrasena], [Nick], [Biografia]) VALUES (2, N'ii', N'ii@i', NULL, N'/fotosPerfil/fotoDefault.png', N'i', N'ii', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Usuario]
GO
ALTER TABLE [dbo].[Lugares]  WITH CHECK ADD  CONSTRAINT [FK_Lugares_TipoLugar] FOREIGN KEY([IdTipoLugar])
REFERENCES [dbo].[TipoLugar] ([IdTipoLugar])
GO
ALTER TABLE [dbo].[Lugares] CHECK CONSTRAINT [FK_Lugares_TipoLugar]
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
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_IdTipoSubOpcion] FOREIGN KEY([IdTipoSubOpcion])
REFERENCES [dbo].[TipoSubOpcion] ([IdTipoSubOpcion])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_IdTipoSubOpcion]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_Lugares] FOREIGN KEY([IdLugar])
REFERENCES [dbo].[Lugares] ([IdLugar])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_Lugares]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_TipoLugar] FOREIGN KEY([IdTipoLugar])
REFERENCES [dbo].[TipoLugar] ([IdTipoLugar])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_TipoLugar]
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
/****** Object:  StoredProcedure [dbo].[SP_ActualizarPerfil]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ActualizarPerfil]
@idUsuario int,
@apellido varchar(500),
@nick varchar(100),
@nombre varchar(100),
@edad int,
@biografia varchar(3000)
as 
begin
update usuario set nombre=@nombre,apellido=@apellido,edad=@edad,nick=@nick,Biografia=@biografia where IdUsuario=@idUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarAmigo]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarDireccion]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AgregarParticipantePlan]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarParticipantePlan]
@idUsuario int,
@idPlan int
as 
begin
insert into ParticipantePlan(IdUsuario,IdPlan) values(@idUsuario, @idPlan)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoPlan]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CrearPlan]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CrearPlan]
@nombre varchar(200),
@idEstado int,
@idTipoLugar int,
@idTipoSubOpcion int
as 
begin
insert into Planes(Nombre, IdEstado,IdTipoLugar,IdTipoSubOpcion) values(@nombre, @idEstado, @idTipoLugar, @idTipoSubOpcion)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearUsuario]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_EliminarAmigo]    Script Date: 21/10/2024 15:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuarios]    Script Date: 21/10/2024 15:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuarios]
AS BEGIN
select * from Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerIdUsuario]    Script Date: 21/10/2024 15:45:00 ******/
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
