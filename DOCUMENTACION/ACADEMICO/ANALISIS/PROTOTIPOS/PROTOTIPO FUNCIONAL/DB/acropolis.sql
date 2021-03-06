USE [master]
GO
/****** Object:  Database [acropolis]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE DATABASE [acropolis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'acropolis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\acropolis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'acropolis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\acropolis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [acropolis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [acropolis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [acropolis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [acropolis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [acropolis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [acropolis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [acropolis] SET ARITHABORT OFF 
GO
ALTER DATABASE [acropolis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [acropolis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [acropolis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [acropolis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [acropolis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [acropolis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [acropolis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [acropolis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [acropolis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [acropolis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [acropolis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [acropolis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [acropolis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [acropolis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [acropolis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [acropolis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [acropolis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [acropolis] SET RECOVERY FULL 
GO
ALTER DATABASE [acropolis] SET  MULTI_USER 
GO
ALTER DATABASE [acropolis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [acropolis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [acropolis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [acropolis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [acropolis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [acropolis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'acropolis', N'ON'
GO
ALTER DATABASE [acropolis] SET QUERY_STORE = OFF
GO
USE [acropolis]
GO
/****** Object:  Table [dbo].[alumno]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[postulante_id] [int] NOT NULL,
	[proceso_admision_id] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[programa_sede_id] [int] NOT NULL,
	[categroria_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calendario]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calendario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[instancia_curso_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora_inicio] [datetime] NOT NULL,
	[hora_fin] [datetime] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [calendario_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [categoria_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[horas_teoria] [int] NOT NULL,
	[horas_practica] [int] NOT NULL,
	[creditos] [int] NOT NULL,
	[tipo] [varchar](100) NOT NULL,
	[ciclo] [varchar](10) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[plan_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [curso_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso_equivalencia]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso_equivalencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[curso_id] [int] NOT NULL,
	[equivalencia_id] [int] NOT NULL,
	[estado] [varchar](1) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [curso_equivalencia_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso_requerimiento]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso_requerimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[curso_id] [int] NOT NULL,
	[requerimiento_id] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [curso_requerimiento_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docente]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[persona_id] [int] NOT NULL,
	[categoria] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [docente_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documento]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[url] [varchar](200) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[usuario_id] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[persona_id] [int] NULL,
	[tipo_documento] [varchar](20) NOT NULL,
 CONSTRAINT [documento_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[escuela]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[escuela](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[facultad_id] [int] NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [escuela_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facultad]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facultad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [facultad_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instancia_curso]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instancia_curso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[curso_id] [int] NOT NULL,
	[sede_programa_id] [int] NOT NULL,
	[matricula_Id] [int] NOT NULL,
	[aforo_minimo] [int] NOT NULL,
	[aforo_maximo] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[fecha_examen_1] [date] NOT NULL,
	[fecha_examen_2] [date] NULL,
	[fecha_examen_3] [date] NULL,
 CONSTRAINT [instancia_curso_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instancia_curso_alumno]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instancia_curso_alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[instancia_curso_id] [int] NOT NULL,
	[matricula_alumno_id] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[nota_01] [int] NULL,
	[nota_02] [int] NULL,
	[nota_final] [int] NULL,
 CONSTRAINT [instancia_curso_alumno_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instancia_curso_alumno_asistencia]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instancia_curso_alumno_asistencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[instancia_curso_alumno_id] [int] NOT NULL,
	[calendario_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora_inicio] [datetime] NOT NULL,
	[hora_fin] [datetime] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [instancia_curso_alumno_asistencia_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instancia_curso_docente]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instancia_curso_docente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matricula_alumno_id] [int] NOT NULL,
	[docente_id] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [instancia_curso_docente_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instancia_curso_docente_asistencia]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instancia_curso_docente_asistencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[instancia_curso_docente_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_fin] [datetime] NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [instancia_curso_docente_asistencia_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maestro]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maestro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](100) NOT NULL,
	[texto] [varchar](100) NOT NULL,
	[valor] [varchar](100) NOT NULL,
	[tipo_valor] [varchar](20) NOT NULL,
 CONSTRAINT [maestro_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[isbn] [varchar](25) NULL,
	[autor] [varchar](255) NOT NULL,
	[editorial] [varchar](255) NOT NULL,
	[edicion] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[sede_programa_id] [int] NOT NULL,
 CONSTRAINT [material_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_alumno]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[material_id] [int] NOT NULL,
	[alumno_id] [int] NULL,
	[fecha_salida] [date] NULL,
	[fecha_retorno] [date] NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[docente_id] [int] NULL,
 CONSTRAINT [material_alumno_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_tag]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[material_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [material_tag_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matricula]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[periodo_id] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [matricula_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matricula_alumno]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula_alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alumno_id] [int] NOT NULL,
	[matricula_id] [int] NOT NULL,
	[fecha] [date] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [matricula_alumno_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notificacion]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notificacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[tipo] [varchar](40) NOT NULL,
	[texto] [varchar](500) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[usuario_id] [int] NOT NULL,
 CONSTRAINT [notificacion_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matricula_alumno_id] [int] NOT NULL,
	[categoria_id] [int] NOT NULL,
	[tarifario_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [datetime] NOT NULL,
	[monto] [float] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[documento_id] [int] NULL,
	[codigo_pago] [varchar](20) NOT NULL,
 CONSTRAINT [pago_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periodo]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[periodo_id] [int] NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [periodo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[rol_id] [int] NOT NULL,
	[recurso_id] [int] NOT NULL,
	[regla] [varchar](500) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [permiso_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellido_paterno] [varchar](100) NOT NULL,
	[apellido_materno] [varchar](100) NOT NULL,
	[documento_tipo] [varchar](40) NOT NULL,
	[documento_codigo] [varchar](20) NOT NULL,
	[correo_electronico_1] [varchar](100) NOT NULL,
	[correo_electronico_2] [varchar](100) NULL,
	[telefono_1] [varchar](20) NOT NULL,
	[telefono_2] [varchar](20) NULL,
	[direccion_1] [varchar](255) NOT NULL,
	[direccion_2] [varchar](255) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[nacionalidad] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [persona_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[periodo_id] [int] NOT NULL,
	[programa_id] [int] NOT NULL,
	[estado] [varchar](1) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [plan_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postulante]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postulante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[persona_id] [int] NOT NULL,
	[proceso_admision_id] [int] NOT NULL,
	[postulante_categoria] [varchar](20) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[calificacion] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[programa_sede_id] [int] NOT NULL,
 CONSTRAINT [postulante_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proceso_admision]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proceso_admision](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [proceso_admision_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programa]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[escuela_id] [int] NOT NULL,
 CONSTRAINT [programa_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recurso]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recurso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[recurso_id] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
 CONSTRAINT [recurso_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[rol_id] [int] NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [rol_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sede]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sede](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [sede_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sede_programa]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sede_programa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sede_id] [int] NOT NULL,
	[programa_id] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [sede_programa_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [varchar](100) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [tag_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarifario]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarifario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[categoria_id] [int] NOT NULL,
	[sede_programa_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[monto] [float] NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [tarifario_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](12) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[contrasena] [varchar](255) NOT NULL,
	[persona_id] [int] NOT NULL,
	[estado] [varchar](1) NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[token] [varchar](255) NULL,
 CONSTRAINT [usuario_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_rol]    Script Date: 4/24/2022 10:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NOT NULL,
	[rol_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_at] [datetime] NULL,
	[modified_by] [int] NULL,
 CONSTRAINT [usuario_rol_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [alumno_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [alumno_codigo_uindex] ON [dbo].[alumno]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [alumno_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [alumno_id_uindex] ON [dbo].[alumno]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [calendario_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [calendario_id_uindex] ON [dbo].[calendario]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [categoria_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [categoria_codigo_uindex] ON [dbo].[categoria]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [categoria_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [categoria_id_uindex] ON [dbo].[categoria]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [categoria_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [categoria_nombre_uindex] ON [dbo].[categoria]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [curso_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [curso_codigo_uindex] ON [dbo].[curso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [curso_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [curso_id_uindex] ON [dbo].[curso]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [curso_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [curso_nombre_uindex] ON [dbo].[curso]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [curso_equivalencia_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [curso_equivalencia_id_uindex] ON [dbo].[curso_equivalencia]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [curso_requerimiento_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [curso_requerimiento_id_uindex] ON [dbo].[curso_requerimiento]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [docente_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [docente_codigo_uindex] ON [dbo].[docente]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [docente_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [docente_id_uindex] ON [dbo].[docente]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [documento_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [documento_codigo_uindex] ON [dbo].[documento]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [documento_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [documento_id_uindex] ON [dbo].[documento]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [documento_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [documento_nombre_uindex] ON [dbo].[documento]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [documento_url_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [documento_url_uindex] ON [dbo].[documento]
(
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [escuela_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [escuela_codigo_uindex] ON [dbo].[escuela]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [escuela_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [escuela_id_uindex] ON [dbo].[escuela]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [escuela_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [escuela_nombre_uindex] ON [dbo].[escuela]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [facultad_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [facultad_codigo_uindex] ON [dbo].[facultad]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [facultad_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [facultad_id_uindex] ON [dbo].[facultad]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [facultad_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [facultad_nombre_uindex] ON [dbo].[facultad]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [instancia_curso_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_codigo_uindex] ON [dbo].[instancia_curso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instancia_curso_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_id_uindex] ON [dbo].[instancia_curso]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instancia_curso_alumno_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_alumno_id_uindex] ON [dbo].[instancia_curso_alumno]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instancia_curso_alumno_asistencia_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_alumno_asistencia_id_uindex] ON [dbo].[instancia_curso_alumno_asistencia]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instancia_curso_docente_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_docente_id_uindex] ON [dbo].[instancia_curso_docente]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instancia_curso_docente_asistencia_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [instancia_curso_docente_asistencia_id_uindex] ON [dbo].[instancia_curso_docente_asistencia]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [maestro_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [maestro_id_uindex] ON [dbo].[maestro]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [material_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [material_codigo_uindex] ON [dbo].[material]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [material_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [material_id_uindex] ON [dbo].[material]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [material_alumno_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [material_alumno_id_uindex] ON [dbo].[material_alumno]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [material_tag_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [material_tag_id_uindex] ON [dbo].[material_tag]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [matricula_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [matricula_id_uindex] ON [dbo].[matricula]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [matricula_alumno_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [matricula_alumno_id_uindex] ON [dbo].[matricula_alumno]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [notificacion_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [notificacion_codigo_uindex] ON [dbo].[notificacion]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [notificacion_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [notificacion_id_uindex] ON [dbo].[notificacion]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pago_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pago_id_uindex] ON [dbo].[pago]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [periodo_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [periodo_codigo_uindex] ON [dbo].[periodo]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [periodo_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [periodo_id_uindex] ON [dbo].[periodo]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [periodo_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [periodo_nombre_uindex] ON [dbo].[periodo]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permiso_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [permiso_codigo_uindex] ON [dbo].[permiso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [permiso_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [permiso_id_uindex] ON [dbo].[permiso]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permiso_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [permiso_nombre_uindex] ON [dbo].[permiso]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [persona_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [persona_codigo_uindex] ON [dbo].[persona]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [persona_correo_electronico_1_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [persona_correo_electronico_1_uindex] ON [dbo].[persona]
(
	[correo_electronico_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [persona_documento_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [persona_documento_codigo_uindex] ON [dbo].[persona]
(
	[documento_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [persona_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [persona_id_uindex] ON [dbo].[persona]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [persona_telefono_1_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [persona_telefono_1_uindex] ON [dbo].[persona]
(
	[telefono_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [plan_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [plan_codigo_uindex] ON [dbo].[plan]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [plan_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [plan_id_uindex] ON [dbo].[plan]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [plan_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [plan_nombre_uindex] ON [dbo].[plan]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [postulante_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [postulante_codigo_uindex] ON [dbo].[postulante]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [postulante_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [postulante_id_uindex] ON [dbo].[postulante]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [proceso_admision_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [proceso_admision_codigo_uindex] ON [dbo].[proceso_admision]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [proceso_admision_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [proceso_admision_id_uindex] ON [dbo].[proceso_admision]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [proceso_admision_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [proceso_admision_nombre_uindex] ON [dbo].[proceso_admision]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [programa_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [programa_codigo_uindex] ON [dbo].[programa]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [programa_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [programa_id_uindex] ON [dbo].[programa]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [programa_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [programa_nombre_uindex] ON [dbo].[programa]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [recurso_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [recurso_codigo_uindex] ON [dbo].[recurso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [recurso_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [recurso_id_uindex] ON [dbo].[recurso]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [recurso_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [recurso_nombre_uindex] ON [dbo].[recurso]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [rol_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [rol_codigo_uindex] ON [dbo].[rol]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [rol_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [rol_id_uindex] ON [dbo].[rol]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [rol_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [rol_nombre_uindex] ON [dbo].[rol]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sede_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sede_codigo_uindex] ON [dbo].[sede]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [sede_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sede_id_uindex] ON [dbo].[sede]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sede_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sede_nombre_uindex] ON [dbo].[sede]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [sede_programa_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sede_programa_id_uindex] ON [dbo].[sede_programa]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [tag_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [tag_id_uindex] ON [dbo].[tag]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [tag_tag_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [tag_tag_uindex] ON [dbo].[tag]
(
	[tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [tarifario_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [tarifario_codigo_uindex] ON [dbo].[tarifario]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [tarifario_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [tarifario_id_uindex] ON [dbo].[tarifario]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [usuario_codigo_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [usuario_codigo_uindex] ON [dbo].[usuario]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [usuario_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [usuario_id_uindex] ON [dbo].[usuario]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [usuario_nombre_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [usuario_nombre_uindex] ON [dbo].[usuario]
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [usuario_rol_id_uindex]    Script Date: 4/24/2022 10:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [usuario_rol_id_uindex] ON [dbo].[usuario_rol]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [acropolis] SET  READ_WRITE 
GO
