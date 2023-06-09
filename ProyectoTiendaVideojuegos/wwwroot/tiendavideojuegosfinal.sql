USE [master]
GO
/****** Object:  Database [TIENDAVIDEOJUEGOS]    Script Date: 26/03/2023 19:46:03 ******/
CREATE DATABASE [TIENDAVIDEOJUEGOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TIENDAVIDEOJUEGOS', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TIENDAVIDEOJUEGOS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TIENDAVIDEOJUEGOS_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TIENDAVIDEOJUEGOS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TIENDAVIDEOJUEGOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET  MULTI_USER 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET QUERY_STORE = ON
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TIENDAVIDEOJUEGOS]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] NOT NULL,
	[NombreCategoria] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Contraseña] [varbinary](max) NULL,
	[Role] [nvarchar](50) NULL,
	[Salt] [nvarchar](50) NULL,
	[Imagen] [nvarchar](500) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedido]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedido](
	[IdDetallePedido] [int] NOT NULL,
	[IdPedido] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioTotal] [int] NULL,
 CONSTRAINT [PK_DetallesPedido] PRIMARY KEY CLUSTERED 
(
	[IdDetallePedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] NOT NULL,
	[IdProducto] [int] NULL,
	[IdCliente] [int] NULL,
	[PrecioTotal] [int] NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_CompraAuxiliar] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NULL,
	[IdSubCategoria] [int] NULL,
	[NombreProducto] [nvarchar](50) NULL,
	[Lanzamiento] [date] NULL,
	[Imagen] [nvarchar](250) NULL,
	[Precio] [int] NULL,
	[Descripcion] [nvarchar](4000) NULL,
	[Genero] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategorias]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategorias](
	[IdSubCategoria] [int] NOT NULL,
	[NombreSubCategoria] [nvarchar](50) NULL,
	[IdCategoria] [int] NULL,
 CONSTRAINT [PK_SubCategorias] PRIMARY KEY CLUSTERED 
(
	[IdSubCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (1, N'Consolas')
INSERT [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (2, N'Videojuegos')
INSERT [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (3, N'Merchandasing')
INSERT [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (4, N'PcGaming')
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (1, N'Pepe', N'Luis', N'pepe@gmail.com', 0x005DBC842A31DAB55F80E4C1E0D8B77DE759ABF04ACB4202991D06ABD77FDBBB7F00FDC30BA799C2A2E8E2361D1496A46C58A33FA9CB272150749E5EEB7774D6, NULL, N'N$®É_`LYïmÂÊ6øa2ü@®@çßIlMI "#ô-ùNÃî\ç¦Dùü', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (2, N'Raul', N'Garcia', N'raul@gmail.com', 0x209CEAA3117CD8733E4DF4FC9EC175983963FA64F34353C152F29D215DD98466F5BF3F2DADDFC5C6B556B3D0AFF00A3127574FF5D6096A5F3C6606E744F04367, NULL, N'öÞÀwg¿.«Ö
/6Cþáh.~¾ZÖ¨ÕªF~0,AgÉe!{§óK¦S', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (3, N'pepe', N'lu', N'pepe@gmail.com', 0xD34A4B76EA9B2B24D27FBA68DED8B1A93A88EB490E5D2F884CF163E729AB7D5F0BD92ED50E71CDB61A0673EA3E4CED588ABE60AEA2F37445886FA3C4D581916D, NULL, N'ëömZ]õ@Ík[5×Ð^ò.ñÍÔñµ±eDý(_¿=nàè;H®5e_d', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (4, N'Juan', N'Pedro', N'pp@gmail.com', 0xCDBB1948BB0F860E5896F628B215A5FC679C04DC86C73E9C730B8EFAFE200F352A05DC68914969B2BA2DC9070E69A188D055E8903C6FB0819C27E424C583BC6C, NULL, N'1|A<%¡/ á_óì¦sÁ<¢n]Uá''ÃGõ¨ÁZ;ÇxÓo]´ í', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (5, N'Admin', N'Admin', N'admin@gmail.com', 0x4C0DCFC1DA8C2E408B4CFCCF7378E61C531DA513B349F1EC7F0162F234B983FAFB9BF1FECE3DF7039AEC8EE742F1003B57262B3CF4716C756072884D8BBA3D7F, NULL, N'=LVÐñPÉ=dÞ±{°iO»¾AÖ'';A¿Éýdªâú§ÛÏÝÁlsd¶5Þó¦', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Contraseña], [Role], [Salt], [Imagen]) VALUES (6, N'juan', N'dedios', N'juande@gmail.com', 0x4A18883596A968505A86D49B2D0A30A17E3EBBF3DA23B66583FEA3B30C6E7E6B4AD447B45B35B2711E5FC59C39D83061A4981989C6C8A8A18D1BBB7840570E72, NULL, N'|$,É9yâBfu§.pVLä°Úg·VòÖéÒYÅcº·d¢Õ<.­ºê', N'https://www.adslzone.net/app/uploads-adslzone.net/2019/04/borrar-fondo-imagen.jpg')
GO
INSERT [dbo].[DetallesPedido] ([IdDetallePedido], [IdPedido], [IdProducto], [Cantidad], [PrecioTotal]) VALUES (2, 1, 1, 3, 180)
INSERT [dbo].[DetallesPedido] ([IdDetallePedido], [IdPedido], [IdProducto], [Cantidad], [PrecioTotal]) VALUES (3, 1, 2, 3, 180)
INSERT [dbo].[DetallesPedido] ([IdDetallePedido], [IdPedido], [IdProducto], [Cantidad], [PrecioTotal]) VALUES (4, 1, 4, 6, 360)
INSERT [dbo].[DetallesPedido] ([IdDetallePedido], [IdPedido], [IdProducto], [Cantidad], [PrecioTotal]) VALUES (5, 1, 9, 3, 60)
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdProducto], [IdCliente], [PrecioTotal], [Cantidad]) VALUES (1, 0, 5, 200, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (1, 2, 6, N'God of War: Ragnarök', CAST(N'2022-11-09' AS Date), N'~/Images/Productos/Videojuegos/PS4/god_of_war_ragnarok_ps4.png', 60, N'Compra God of War Ragnarok  para PlayStation 4, vuelve el clásico de acción a tu consola, revive las aventuras junto al Dios de la Guerra y su hijo explorando paisajes mitológicos increíbles, viajando por los nueve reinos y enfrentandose a nuevos desafíos con imponentes enemigos.

Hace un par de años que comenzó el Fimbulvetr; el frío sigue acosando con fuerza al reino de Midgard.

Kratos y Atreus intentan mantenerse ocultos por todos los medios tras haber intentado deshacer la época final que se acerca. Entrenan cada día para lo inevitable mientras buscan cualquier modo de cambiar el curso del destino.

Atreus anhela entender las pistas que dejó su madre y averiguar su profético papel en la guerra que se cierne sobre ellos. Mientras, Kratos no consigue comprender el deseo de su hijo de descubrir más sobre su identidad, que los llevará hacia los vengativos aesir. Si eso ocurre, estarán aún más cerca de repetir los malditos errores del pasado.

Juntos, padre e hijo se aventuran a las profundidades de los Nueve Reinos mientras las fuerzas de Asgard se preparan para la guerra. Por el camino, explorarán paisajes míticos increíbles y se enfrentarán a temibles enemigos, como monstruos y dioses nórdicos. A medida que se avecina la amenaza del Ragnarök, Kratos y Atreus tendrán que elegir entre su seguridad y la de los reinos…', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (2, 2, 6, N'Fifa 23', CAST(N'2022-09-27' AS Date), N'~/Images/Productos/Videojuegos/PS4/fifa23_PS4.png', 60, N'Compra en BETA GAMING el rey de los simuladores de fútbol, FIFA 23, de la mano de la exitosa franquicia deportiva EA Sports que en esta nueva entrega mejora aún más si cabe tu experiencia de juego, ¡jugabilidad total! ¡que nadie te lo cuente!.

Disfruta del mundial de Qatar de 2022 gracias a su actualización gratuita, que ya se encuentra disponible. Un paquete temático con todas las equipaciones, jugadores, comentarios y, por supuesto, las selecciones nacionales que participan en el mayor torneo de la historia del fútbol y modos de juego dedicados.

También podrás vivir la Fifa World Cup: Live, jugando todos los partidos o reescribiendo el resultado de un encuentro anterior de la FIFA World Cup 2022 para cambiar el destino del trofeo más codiciado del futbol, con las fechas, las plantillas, las estadísticas, los resultados y las posiciones en cada grupo auténticos, entre muchas cosas más.

EA SPORTS FIFA 23 nos acerca aún más a la acción y el realismo del juego del mundo gracias a la tecnología HyperMotion 2, con el doble de capturas de movimiento del mundo real y animaciones más auténticas que nunca en cada partido.
', N'Deporte')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (3, 2, 6, N'Grand Theft Auto V', CAST(N'2013-09-07' AS Date), N'~/Images/Productos/Videojuegos/PS4/gta5_PS4.png', 40, N'Grand Theft Auto
Cuando un joven estafador callejero, un ladrón de bancos retirado y un psicópata aterrador se meten en problemas, deberán llevar a cabo una serie de peligrosos atracos para sobrevivir en una ciudad en la que no pueden confiar en nadie. Y mucho menos los unos en los otros.

Grand Theft Auto Online
Descubre un mundo siempre en evolución repleto de opciones y maneras de jugar, mientras asciendes en el escalafón criminal de Los Santos y el condado de Blaine, en la experiencia compartida online definitiva.

Criminal Enterprise Starter Pack
Criminal Enterprise Starter Pack es la forma más rápida para los nuevos jugadores de GTA Online de impulsar sus imperios criminales con el contenido más emocionante y popular, además de un bonus de 1 000 000$ para gastar en GTA Online. Todo el contenido está valorado en más de 10 000 000 de GTA$ si se compra por separado.

Funda tu imperio criminal
Emprende proyectos empresariales desde tu oficina de ejecutivo del Maze Bank Oeste, desarrolla potente armamento en el búnker subterráneo de Tráfico de armas y usa el negocio de falsificación de dinero para comenzar una lucrativa actividad.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (4, 2, 6, N'Elden Ring', CAST(N'2022-02-25' AS Date), N'~/Images/Productos/Videojuegos/PS4/elden_ring_ps4.png', 60, N'Compra Elden Ring, un juego de rol y acción ambientando en un mundo lleno de misterios y peligros que se presenta como el juego más grande de FromSoftware hasta la fecha y en donde tendrás que equiparte, luchar y sobrevivir para encumbrarte como señor del Círculo en las Tierras Intermedias.



Bienvenidos a un nuevo mundo creado por Miyazaki y George R. R. Martin, bienvenidos a Elden Ring, desarrollado por FromSoftware Inc. y producido por BANDAI NAMCO Entertainment Inc.

La Orden Dorada está rota. Álzate, Sinluz, y que la gracia te guíe para abrazar el poder del Círculo de Elden.

Esbozo de la historia
En las Tierras Intermedias gobernadas por la Reina Márika, la Eterna, el Círculo de Elden, origen del Árbol Áureo, ha sido destruido.

Los descendientes de Márika, todos semidioses, reclamaron los fragmentos del Círculo de Elden conocidos como Grandes Runas. Fue entonces cuando la demencial corrupción de su renovada fuerza provocó una guerra: la Devastación. Una guerra que supuso el abandono de la Voluntad Mayor.

Y ahora, la gracia que nos guía recaerá sobre el Sinluz desdeñado por la gracia del oro y exiliado de las Tierras Intermedias.

Tú que has muerto, pero vives, con tu gracia tiempo ha perdida, recorre la senda hacia las Tierras Intermedias más allá del neblinoso mar para postrarte ante el Círculo de Elden.', N'Rol')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (5, 1, 2, N'PlayStation 5', CAST(N'2020-11-19' AS Date), N'~/Images/Productos/Consolas/PS5/PLAYSTATION_5.png', 500, N'Compra la consola PlayStation 5 Stand más un mando inalámbrico DualSense Blanco y descubre por ti mismo que jugar no tiene límites, bienvenido a la nueva generación.

Experimenta cargas superrápidas gracias a una unidad de estado sólido (SSD) de alta velocidad, una inmersión más profunda con retroalimentación háptica, gatillos adaptivos y el nuevo audio 3D, además de una nueva generación de increíbles juegosde PlayStation.

A la velocidad de la luz
Aprovecha la potencia de una unidad de estado sólido con E/S integradas, una CPU y una GPU personalizadas que reinventan las reglas de lo que una consola PlayStation es capaz de hacer.

Juegos alucinantes
Déjate sorprender por unos gráficos increíbles y experimenta nuevas funciones de PS5.

Una inmersión que te dejará sin aliento
Descubre una experiencia de juego más intensa mediante tecnología háptica, gatillos adaptables y audio 3D.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (6, 2, 6, N'Ghost of Tsushima', CAST(N'2020-07-17' AS Date), N'~/Images/Productos/Videojuegos/PS4/ghost_of_tsushima_ps4.png', 20, N'En una Tsushima devastada por la guerra, su antiguo esplendor perdura
Explora regiones meticulosamente recreadas que muestran la diversidad de la vida de la extensa isla, desde ondulantes campos y tranquilos templos hasta antiguos bosques, pueblos e inhóspitas montañas. Encuentra paz en los momentos de silencio y armonía con la naturaleza, y consuelo en los momentos que compartirás con las personas que ayudes por el camino.

Recupera lo que es tuyo
Jin fue criado y entrenado como un samurái. Cuando los mongoles derrotan fácilmente a las fuerzas samuráis, el mundo de Jin salta en pedazos. Entonces se enfrenta a la decisión más difícil de su vida: honrar las tradiciones y las costumbres de su educación como samurái y mantener una lucha que no puede ganar, o desviarse del camino samurái para proteger la isla y a su gente por cualquier medio necesario.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (7, 2, 6, N'Horizon Forbidden West', CAST(N'2022-02-18' AS Date), N'~/Images/Productos/Videojuegos/PS4/horizon_forbidden_west_playstation-4.png', 60, N'Explora páramos remotos, enfréntate a máquinas más grandes e imponentes y descubre increíbles tribus en tu regreso a un futuro lejano en el mundo apocalíptico de Horizon

La tierra se muere. Las rugientes tormentas y una desolación imparable causan estragos entre lo que queda de la humanidad, unas cuantas tribus dispersas, mientras nuevas y temibles máquinas merodean por sus fronteras. La vida en la Tierra se enfrenta a una nueva extinción y nadie sabe por qué.

Solo Aloy es capaz de descubrir los secretos que hay detrás de estas amenazas, y restablecer el orden y el equilibrio en el mundo. Por el camino, se reunirá con viejos amigos, forjará alianzas con nuevas facciones en guerra y descubrirá la herencia de un antiguo pasado, al tiempo que intenta permanecer un paso por delante de un nuevo y aparentemente invencible enemigo.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (8, 2, 6, N'Spider-Man', CAST(N'2018-09-07' AS Date), N'~/Images/Productos/Videojuegos/PS4/marvel_s_spider_man_ps4.png', 40, N'Compra Marvel''s Spider-Man, una historia de acción, mundo abierto y parkour del héroe arácnido de Nueva York, completamente nueva y auténtica.

Este no es el Spider-Man que conocías ni el que has visto en las pelis, el hombre araña, es un Peter Parker experimentado que domina mucho más la lucha contra la delincuencia de Nueva York.

Al mismo tiempo, se debate por equilibrar el caos de su vida personal y de su carrera mientras el destino de nueve millones de neoyorquinos depende de él.

En Marvel''s Spider-Man encarnarás al superhéroe más emblemático del mundo y usarás las habilidades acrobáticas, la improvisación y las telarañas que han hecho famoso al trepamuros.

Además, introduce elementos jamás vistos en un juego de Spider-Man. Desde cruzar la ciudad haciendo parkour y usando el entorno hasta un sistema de combate novedoso y escenas nuevas de superproducción... Este es un Spider-Man como nunca antes habías visto.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (9, 2, 6, N'Red Dead Redemption 2', CAST(N'2018-10-26' AS Date), N'~/Images/Productos/Videojuegos/PS4/red_dead_redemption_2_ps4.png', 20, N'De los creadores de Grand Theft Auto V y Red Dead Redemption, Red Dead Redemption 2 es una historia épica sobre la vida en América en el umbral de una nueva era. Red Dead Redemption 2 es un videojuego de acción-aventura western, en un mundo abierto y en perspectiva de primera y tercera persona, con componentes para un jugador y multijugador.

Ambientado en el lejano oeste estadounidense y desarrollado en un entorno de mundo abierto con una versión ficticia del oeste, el medio oeste y el sur de los Estados Unidos en 1899, durante la segunda mitad de la era del Salvaje Oeste y el final de la era, a comienzos del siglo XX.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (10, 2, 7, N'Dragon Ball Z: Kakarot', CAST(N'2020-01-16' AS Date), N'~/Images/Productos/Videojuegos/PS5/dragon-ball-z-kakarot-playstation-5.png', 30, N'¡Sumérgete en la historia de DRAGON BALL Z, desde la llegada de Raditz, hasta la batalla final contra Buu. Experimenta épicos eventos e increíbles aventuras, incluyendo momentos nunca vistos de la historia, que darán respuesta a algunas de las preguntas más candentes del mundo DRAGON BALL!

Participa en icónicas batallas DRAGON BALL Z a una escala distinta a cualquier otra. Lucha a través de inmensos campos de batalla con entornos destruibles y experimenta batallas épicas contra los jefes más icónicos (Raditz, Freezer, Célula, Buu, etc). Incrementa tu poder a través de mecánicas RPG y enfréntate a los retos!

No luches sólo como Goku. Vive como Goku. Pesca, vuela, come, entrena y lucha a tu manera en las distintas sagas de DRAGON BALL Z haciendo amigos y construyendo relaciones con un gran número de personajes DRAGON BALL', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (11, 2, 7, N'Far Cry 6', CAST(N'2021-10-07' AS Date), N'~/Images/Productos/Videojuegos/PS5/far-cry-6-playstation-5.png', 30, N'Bienvenido a Yara, la joya del Caribe. Hace décadas, cuando yo era niño, Yara era un paraíso próspero; bajo mi liderazgo, volverá a serlo.Bienvendio a Yara, una isla perdida en el tiempo. La visión del paraíso de Antón está anticuada y diseñada para él, no para nosotros. Lucharemos por nuestro propio paraíso.

 

Far Cry 6 nos llevará hasta la isla tropical de Yara, inspirada en Cuba. Allí tiene lugar una revolución militar a cargo del presidente Antón Castillo, encarnado por el actor Giancarlo Esposito (Breaking Bad). Y junto a él le acompaña su hijo Diego. Antón tiene control total sobre la ciudad, para la que fue escogido por votación popular para que retomase sus años de gloria. Y es que en la actualidad, Yara parece una ciudad congelada en el tiempo, como si estuviese en los años 60.

 

La revolución empezará desde abajo, teniendo que buscar aliados que se unan a la causa. Chorizo, el guerrillero: un perrito en silla de ruedas que "podrá matar literalmente con lo bonito que es".

 

Y por supuesto un buen arsenal de armas a tu disposición, entre las que destaca "El Tostador", un lanzallamas casero para achicharrar a los enemigos. Tendrás una enorme variedad de armamento a tu disposición.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (12, 2, 7, N'Gran Turismo 7', CAST(N'2022-03-04' AS Date), N'~/Images/Productos/Videojuegos/PS5/gran-turismo-7-edicion-25-aniversario-playstation-5.png', 70, N'Ya seas un corredor competitivo, un coleccionista, un perfeccionista, un diseñador, un fotógrafo o un entusiasta de los arcades, alimenta tu pasión por los coches con elementos inspirados en el pasado, el presente y el futuro de Gran Turismo.

Desde los vehículos y circuitos más clásicos hasta la reincorporación del legendario modo Simulación GT, disfruta de las mejores funcionalidades de las anteriores entregas de la serie. Y, si te apasiona la velocidad, practica y compite en los Campeonatos FIA y en el modo Sport*.

Pero recuerda que no todo es correr en Gran Turismo 7. Perfecciona y crea en el nuevo modo de diseño y personalización o mejora tus habilidades y estrategias de carrera en la escuela de conducción.', N'Deporte')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (13, 2, 7, N'Hogwarts Legacy', CAST(N'2023-02-07' AS Date), N'~/Images/Productos/Videojuegos/PS5/hogwarts-legacy-standard-playstation-5.png', 70, N'Explora un mundo abierto
El mundo mágico te aguarda. Explora y recorre libremente el Castillo de Hogwarts, Hogsmeade, el Bosque Prohibido y las tierras que lo rodean.

Sé el mago o la bruja que quieras ser
Aprende hechizos, elabora pociones, cultiva plantas y cuida de animales fantásticos a lo largo del viaje. Sé seleccionado para tu casa, forja relaciones y aprende las habilidades que te conducirán a convertirte en el mago o bruja que quieras ser.

Vive una aventura nueva en el mundo mágico
Vive el mundo mágico en una época remota sin explorar y descubre una verdad oculta de ese pasado. Combate contra trols, magos tenebrosos, duendes y más en tu camino hacia la gran batalla contra un peligroso enemigo que amenaza el destino del mundo mágico.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (14, 2, 7, N'Ratchet & Clank: Una dimensión aparte', CAST(N'2021-06-11' AS Date), N'~/Images/Productos/Videojuegos/PS5/ratchet---clank--una-dimension-aparte-ps5.png', 70, N'
Un malvado emperador robótico se ha lanzado a la conquista de mundos interdimensionales, y el universo de Ratchet y Clank es su próximo objetivo. Desempolva el espectacular armamento de este dúo dinámico y lucha para impedir un desastre dimensional.

Ábrete camino hacia tu hogar con un arsenal repleto de nuevas armas explosivas, incluyendo la Burst Pistol, el Topiary Sprinkler y la Shatterbomb. Surca el cielo de ciudades, lánzate al combate y salta de dimensión en dimensión con nuevos artefactos que desafían las leyes de la física.

Caras nuevas

Une a este dúo de ensueño con un reparto de aliados conocidos y de caras nuevas, como una nueva luchadora lombax de la Resistencia, tan decidida como tú a eliminar a la amenaza robótica.

Juega como Ratchet y como la misteriosa nueva lombax procedente de otra dimensión. Descubre las nuevas mecánicas de salto interdimensional de Clank.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (15, 2, 7, N'Resident Evil Village', CAST(N'2021-05-07' AS Date), N'~/Images/Productos/Videojuegos/PS5/resident-evil-village-gold-edition-playstation-5.png', 30, N'Años despues de la pesadilla, Ethan Winters ha conseguido cierta estabilidad y una vida normal con su familia. Una vida que no tardará en ser destruida por un héroe de antaño, Chris Redfield. Ambientado después de los terroríficos eventos del aclamado Resident Evil 7 Biohazard, la historia comienza con Ethan Winters y su mujer Mia viviendo pacíficamente en una nueva localidad, libre de sus pasadas pesadillas. Justo cuando empiezan a construir su nueva vida juntos la tragedia se ceba con ellos de nuevo.

Chris Redfield, el héroe legendario de la saga Resident Evil, vuelve a ponerse en contacto con la pareja y entra abruptamente en sus vidas, sumergiendo a Ethan en el caos absoluto. Devastado, Ethan se encuentra en un remoto pueblo cubierto por la nieve buscando respuestas después de ser arrojado a una pesadilla completamente nueva', N'Terror')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (16, 2, 7, N'Snowrunner', CAST(N'2020-04-28' AS Date), N'~/Images/Productos/Videojuegos/PS5/snowrunner-playstation-5.png', 30, N'¡Prepárate para la nueva generación de esta experiencia campo a través!
SnowRunner te pone al volante de potentes vehículos para que conquistes entornos extremos con el mejor simulador de terreno que existe. Conduce 40 vehículos de marcas como Ford, Chevrolet y Freightliner, y deja tu huella en un mundo abierto y salvaje.
Atraviesa barro, aguas torrenciales, nieve y lagos congelados para llevar a cabo peligrosos contratos y misiones. Amplía y personaliza tu flota con un gran número de mejoras y accesorios, incluyendo un tubo de escape submarino para aguas profundas y cadenas para combatir la nieve.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (17, 2, 7, N'The Last of Us Part I', CAST(N'2022-09-07' AS Date), N'~/Images/Productos/Videojuegos/PS5/the-last-of-us-part-i-ps5.png', 60, N'Revive la historia una vez más con Ellie y Joel, en la nueva serie que se emite en la plataforma de HBO de The Last of Us

En una civilización devastada en la que infectados y supervivientes embrutecidos campan sin control, Joel, nuestro exhausto protagonista, es contratado para sacar a escondidas de una zona militar en cuarentena a Ellie, una chica de 14 años. Pero lo que comienza siendo una simple tarea pronto se transforma en un brutal viaje campo a través.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (18, 2, 8, N'Dragon Ball: The Breakers', CAST(N'2022-10-14' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/dragon-ball--the-breakers-edicion-especial-nintendo-switch.png', 20, N'Atrapados por una oscura falla temporal, siete ciudadanos comunes se verán atrapados en una unión temporal: se verán encarcelados con el asaltante, un amenazador enemigo de otra línea de tiempo que cuenta con un enorme poder.

 

La única esperanza de supervivencia es la rotura de la unión temporal con la supe máquina del tiempo, pero el asaltante les persigue y gana poder cada minuto que pasa. En una carrera contra el tiempo los astutos supervivientes se enfrentarán al poder del asaltante, para conseguir la libertad o a la muerte.

 

¡Escapa con el equipo… o de forma individual!

Coopera con los demás mientras puedas, es posible que las decisiones del asaltante u otros supervivientes te fuercen a seguir solo. ¿Cuál será tu elección?

 

Atrapado en una unión temporal

Huye a lo largo de un gran mapa compuesto por diferentes áreas pero ¡cuidado! El asaltante estará siempre acechando y podría destruir áreas de espacio vital, limitando tus posibilidades de escapatoria…', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (19, 2, 8, N'The Legend of Zelda: Breath of the Wild', CAST(N'2017-03-03' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/legend-of-zelda--breath-of-the-wild-nintendo-switch.png', 60, N'Cinco años después de la última entrega original para sobremesa, el futuro de la serie The Legend of Zelda llega a Nintendo Switch y Wii U replanteando por completo las bases de la saga. Producido por Eiji Aonuma, The Legend of Zelda: Breath of the Wild te sumergirá en un mundo de descubrimiento con un impresionante estilo artístico similar a The Wind Waker o Skyward Sword, una cautivadora banda sonora y una intrigante y melancólica historia. Despierta tras un siglo de letargo, adéntrate en el Hyrule más amplio y abierto jamás creado por las tres grandes Diosas y forja tu propio camino con el orden y aventuras que quieras.

La historia de la familia real de Hyrule es también la historia del cataclismo. Y la historia del cataclismo siempre ha sido la de Ganon. Descubre el enigmático pasado de esta asolada tierra, un mundo entero repleto de aventuras que espera ser explorado, y viaja como Link por bastos campos, espesos bosques y cumbres nevadas bajo el cielo abierto de Hyrule para revelar cómo la oscuridad se impuso sobre la luz.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (20, 2, 8, N'Leyendas Pokémon: Arceus', CAST(N'2022-01-28' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/leyendas-pokemon--arceus-nintendo-switch.png', 50, N'us aventuras se desarrollan en el majestuoso entorno natural de la región de Hisui, donde te encargarás de investigar Pokémon para crear la primera Pokédex de la región.

Tendrás la ayuda de tus Pokémon a la hora de combatir contra los Pokémon salvajes que quieras atrapar. No tienes más que lanzar la Poké Ball que contiene a tu Pokémon cerca de un Pokémon salvaje, y el combate se iniciará automáticamente. Para luchar, elige entre los movimientos que tu aliado conoce.

Esta aventura te llevará a la región de Sinnoh, donde transcurrían Pokémon Diamante y Pokémon Perla. Sin embargo, hay que remontarse muchos años atrás, antes incluso de que se concibiera la idea de ser Entrenador o Entrenadora Pokémon o de la existencia de una Liga Pokémon.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (21, 2, 8, N'Mario Kart 8', CAST(N'2014-05-29' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/mario-kart-8-deluxe-nintendo-switch.png', 50, N'Corre donde quieras, cuando quieras! Calienta motores y prepárate para la versión definitiva de Mario Kart 8. El juego de Mario Kart con más personajes. El juego Mario Kart 8 Deluxe tiene 42 personajes para escoger, ¡La lista de personajes más grande en la historia de la serie!

Montones de circuitos. Compite por la copa en 48 circuitos, incluyendo algunos inspirados en las series Excite Bike™ y The Legend of Zelda™. Míticos circuitos como el Estadio de Mario, el Barranco Goloso, el Parque Acuático, el Puerto Toad, La Mansión Retorcida, Cumbre Wario, el Aeropuerto Soleado o Cala Delfín. ¡Gana en todos!', N'Deporte')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (22, 2, 8, N'Mario + Rabbids Sparks of Hope', CAST(N'2022-10-20' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/mario---rabbids-sparks-of-hope-nintendo-switch.png', 30, N'Tras un inesperado “giro” de su lavadora, los Rabbids se ven teletransportados a un mundo mitológico en el que las oportunidades de causar estragos alcanzan cotas infinitas. ¡Únete a ellos en este desternillante viaje repleto de caos y personajes pizpiretos, y encuentra con ellos el camino de vuelta a casa!

Forma equipo y enfréntate a 50 minijuegos estrepitosamente divertidos: márcate las poses más tontunas, derriba a tus oponentes, trágate pimientos picantes, y demuestra que bailas mejor que nadie en la más grande y épica fiesta Rabbid vista jamás.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (23, 2, 8, N'Splatoon 3', CAST(N'2022-09-08' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/splatoon-3-nintendo-switch.png', 50, N'Te damos la bienvenida a la región de Tintelia, un desierto abrasador habitado por los inkling y octarianos más curtidos. Por otro lado, la urbe de Tintelia, también conocida como "la ciudad caótica", es el corazón de este páramo arenoso.

Hasta en este lugar desolado, los combates territoriales son la estrella y las batallas se desarrollan en nuevos escenarios en plena naturaleza, como el majestuoso Desfiladero Fumarola. Nuevos movimientos dinámicos ayudan a estos luchadores a esquivar ataques y cubrir más terreno; además, ahora también cuentan con un arma en forma de arco para repartir tinta a diestro y siniestro, y nuevas armas especiales, como el cangrejobot.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (24, 2, 8, N'Bowser''s Fury', CAST(N'2021-02-12' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/super-mario-3d-worlds---bowser-s-fury-nintendo-switch.png', 50, N'Un Mario para unirlos a todos… ¡y explorar!
¡Únete a Mario, Luigi, la princesa Peach y Toad en una aventura para salvar el Reino de las hadas en Super Mario 3D World + Bowser’s Fury para Nintendo Switch! Bowser ha secuestrado a la princesa hada… ¡y solo nuestros héroes podrán rescatarla!

Trepa por los muros y dales unos buenos arañazos a tus enemigos gracias a la supercampana, clónate con las duplicerezas o ponte una caja cañón de gorro y fríe a proyectiles a quien se te ponga a tiro. Esta versión mejorada de Super Mario 3D World trae consigo varias novedades en la mecánica de juego.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (25, 2, 8, N'The Legend of Zelda: Skyward Sword', CAST(N'2021-05-24' AS Date), N'~/Images/Productos/Videojuegos/nintendo_switch/the-legend-of-zelda--skyward-sword-hd-nintendo-switch.png', 50, N'En el relato más antiguo de la línea temporal de Zelda, Link debe viajar desde un mundo que se halla por encima de las nubes hasta tierras desconocidas en busca de su amiga de la infancia, Zelda. Armado con su fiel espada y su escudo, Link les plantará cara a enemigos formidables, resolverá puzles enrevesados y surcará los cielos a lomos de un inmenso pájaro conocido como pelícaro.

Si juegas con dos mandos Joy-Con, controlarás con cada uno la espada y el escudo respectivamente. Mueve el Joy-Con derecho para que Link use la espada; por otro lado, con el Joy-Con izquierdo podrás levantar el escudo para protegerte de los ataques enemigos. Estos controles también sirven para usar diferentes herramientas y objetos, como, por ejemplo, el arco y la flecha, o para arrojar bombas.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (26, 2, 9, N'Back 4 Blood', CAST(N'2021-09-08' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/back-4-blood-standard-edition-xbox-series-x.png', 20, N'Los jugadores pueden formar equipo online al que podrán conectarse y abandonar la partida sin que el gameplay se vea afectado ya que el modo cooperativo usa el sistema “Drop-in and Drop-out” para luchar juntos contra la amenaza de Ridden en constante evolución o jugar en solitario con tres compañeros de equipo de IA.

El juego también cuenta con un multijugador competitivo en el que los participantes pueden jugar con o contra amigos PvP en línea que admite hasta ocho jugadores y los equipos se turnan para jugador como Cleaners y como el horrible Ridden.', N'Terror')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (27, 2, 9, N'Disciples', CAST(N'2023-01-24' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/disciples--liberation-xbox-series-x.png', 45, N'Disciples: Liberation es un juego de rol de estrategia de fantasía oscura. Libera la tierra de Nevendaar y descubre las interminables historias que se esconden en un mundo rico en detalles, donde cada decisión tiene una consecuencia y cada movimiento equivocado puede ser mortal.
 
Explora un mundo devastado por la guerra y alíate con diversas facciones del mundo: desde un imperio humano teñido de extremismo religioso hasta las oscuras fuerzas de los muertos vivientes lideradas por una reina poseída. Construye un equipo para reunir valiosos recursos, influir en la posición política y enfrentarte a brutales bestias en un intrincado combate por turnos.', N'Rol')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (28, 2, 9, N'Dungeons & Dragons', CAST(N'2023-03-31' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/dungeons-and-dragons-dark-alliance-day-one-edition-xbox-series-x.png', 70, N'El juego de rol Dungeons & Dragons (D&D) consiste en contar historias en mundos fantásticos de espadas y brujería y un grupo de leales compañeros es esencial para adentrarte en la aventura. Únete a nuestro Grupo Cerrado de Facebook y encuentra un grupo o un Dungeons Master (DM) para jugar de manera presencial o en línea y forma parte de la comunidad de D&D', N'Rol')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (29, 2, 9, N'Forza Horizon 5', CAST(N'2021-11-01' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/forza-horizon-5-xbox-series-x.png', 60, N'Un diverso mundo abierto
Explora un mundo de impresionantes contrastes y belleza. Descubre desiertos vivientes, selvas frondosas, ciudades históricas, ruinas ocultas, playas salvajes, cañones amplios y un enorme volcán de pico nevado.

Un mundo abierto repleto de aventuras
Sumérgete en una profunda campaña con cientos de desafíos que te ofrecen premios por participar en las actividades que te encantan. Conoce nuevos personales y elige los resultados de sus misiones de Horizon Story.', N'Deporte')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (30, 2, 9, N'Just Dance 2023', CAST(N'2022-11-22' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/just-dance-2023--codigo-de-descarga--xbox-series-x.png', 35, N'¡Bailad por primera vez al ritmo de Dynamite de BTS, y otros temazos del momento!
Disfruta de una fiesta sin fin con modo multijugador en línea, personalización, mundos inmersivos en 3D y canciones, y modos nuevos durante todo el año.

Nuevo multijugador online
Ahora pueden jugar Just Dance con quien quieran sin importar dónde se encuentren. Formen un grupo privado e inviten hasta a cinco personas de su lista de amigos a unirse para jugar como si estuvieran juntos.', N'Deporte')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (31, 2, 9, N'Guardianes de la Galaxia', CAST(N'2021-09-26' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/marvel-s-guardians-of-the-galaxy-xbox-series-x.png', 20, N'Dale caña y surca el cosmos con una nueva versión de Marvel’s Guardians of the Galaxy. En esta aventura de acción en tercera persona encarnas a Star-Lord, un cuestionable líder muy echado para adelante que ha conseguido convencer a un estrafalario grupo de insólitos héroes para que se unan a él. Un notas (que no eres tú, clarísimamente) ha desencadenado una serie de catastróficos eventos, y solo tú puedes mantener unidos a los impredecibles Guardianes el tiempo suficiente para evitar el colapso interplanetario.

Desenfunda los blásters elementales, propina palizas en equipo o da patadas voladoras con las botas propulsoras; aquí todo está permitido. Y si crees que el plan está saliendo a pedir de boca, te vas a llevar una buena sorpresa, porque las consecuencias de tus actos no dejarán que los Guardianes se duerman en los laureles.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (32, 2, 9, N'Halo Infinite', CAST(N'2021-11-15' AS Date), N'~/Images/Productos/Videojuegos/XBOX_SERIES_X/xbs-halo-infinite.png', 40, N'La legendaria serie Halo regresa con la campaña Master Chief más amplia hasta la fecha y una innovadora experiencia multijugador. Halo Infinite ofrece una experiencia increíble en Xbox One y la nueva familia de consolas, así como en PC, con impresionantes gráficos 4K y un juego multiplataforma de clase mundial.

Y, tanto en Xbox Series X como en PC compatibles, disfruta de funciones mejoradas como hasta 120 FPS y tiempos de carga muy reducidos para crear un juego perfecto que marca el comienzo de la próxima generación de juegos.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (33, 2, 10, N'Call of Duty: Advanced Warfare', CAST(N'2014-11-03' AS Date), N'~/Images/Productos/Videojuegos/PS3/ps3-call-of-duty--advanced-warfare.png', 30, N'prácticas militares de hoy en día se han unido con poderosas consecuencias. En esta visión del futuro, que ha sido cuidadosamente estudiada y desarrollada, las corporaciones militares privadas se han convertido en las fuerzas armadas predominantes de incontables países que subcontratan sus necesidades militares, redibujando fronteras y cambiando las reglas de la guerra. Y Jonathan Irons (interpretado por el actor ganador de un Oscar, Kevin Spacey), presidente y fundador de Atlas Corporation, la mayor corporación militar privada del mundo, está en el centro de todo.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (34, 2, 10, N'Grand Theft Auto V', CAST(N'2013-09-07' AS Date), N'~/Images/Productos/Videojuegos/PS3/ps3-grand-theft-auto-v--gta-v-.png', 10, N'Grand Theft Auto
Cuando un joven estafador callejero, un ladrón de bancos retirado y un psicópata aterrador se meten en problemas, deberán llevar a cabo una serie de peligrosos atracos para sobrevivir en una ciudad en la que no pueden confiar en nadie. Y mucho menos los unos en los otros.

Grand Theft Auto Online
Descubre un mundo siempre en evolución repleto de opciones y maneras de jugar, mientras asciendes en el escalafón criminal de Los Santos y el condado de Blaine, en la experiencia compartida online definitiva.

Criminal Enterprise Starter Pack
Criminal Enterprise Starter Pack es la forma más rápida para los nuevos jugadores de GTA Online de impulsar sus imperios criminales con el contenido más emocionante y popular, además de un bonus de 1 000 000$ para gastar en GTA Online. Todo el contenido está valorado en más de 10 000 000 de GTA$ si se compra por separado.

Funda tu imperio criminal
Emprende proyectos empresariales desde tu oficina de ejecutivo del Maze Bank Oeste, desarrolla potente armamento en el búnker subterráneo de Tráfico de armas y usa el negocio de falsificación de dinero para comenzar una lucrativa actividad.', N'Accion')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (35, 2, 10, N'Lego Jurassic World', CAST(N'2015-06-11' AS Date), N'~/Images/Productos/Videojuegos/PS3/ps3-lego-jurassic-world.png', 15, N'Siguiendo las historias épicas de Parque Jurásico, El Mundo Perdido: Parque Jurásico y Parque Jurásico III , así como el esperado Jurassic World, LEGO Jurassic World es el primer videojuego en el que podrás revivir y experimentar las cuatro películas jurásicas. Reimaginado en forma de LEGO y contado con el sentido del humor característico de los juegos de TT Games, esta emocionante aventura recreará escenas inolvidables y secuencias de acción de las películas, permitiendote jugar a través de momentos clave y tener la oportunidad de explorar las tierras de Isla Nublar e Isla Sorna.', N'Aventura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (36, 1, 1, N'PlayStation 4', CAST(N'2013-11-15' AS Date), N'~/Images/Productos/Consolas/PS4/consola-ps4-500gb-slim.png', 160, N'Disfruta de una PS4 más estilizada y compacta con la misma potencia de juego.
Como novedad principal tiene un tamaño y peso reducidos. Un 30% más pequeña que la PS4 original y un peso de tan solo 2,1 kg.

Mejoras en el apartado WiFi

Ahora PS4 SLIM soporta WiFi 5Ghz ofreciendo mayor calidad de conexión, mejorando así tu experiencia online tanto en partidas como en contenidos multimedia streaming.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (37, 1, 1, N'PlayStation 4 Pack Fifa 21', CAST(N'2013-11-15' AS Date), N'~/Images/Productos/Consolas/PS4/consola-ps4-500-gb-slim---fifa-21.png', 180, N'Disfruta de una PS4 más estilizada y compacta con la misma potencia de juego.
Como novedad principal tiene un tamaño y peso reducidos. Un 30% más pequeña que la PS4 original y un peso de tan solo 2,1 kg.

Mejoras en el apartado WiFi

Ahora PS4 SLIM soporta WiFi 5Ghz ofreciendo mayor calidad de conexión, mejorando así tu experiencia online tanto en partidas como en contenidos multimedia streaming.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (38, 1, 1, N'PlayStation 4 Pack 3 juegos', CAST(N'2013-11-15' AS Date), N'~/Images/Productos/Consolas/PS4/ps4_consola_rachet.png', 260, N'Disfruta de una PS4 más estilizada y compacta con la misma potencia de juego.
Como novedad principal tiene un tamaño y peso reducidos. Un 30% más pequeña que la PS4 original y un peso de tan solo 2,1 kg.

Mejoras en el apartado WiFi

Ahora PS4 SLIM soporta WiFi 5Ghz ofreciendo mayor calidad de conexión, mejorando así tu experiencia online tanto en partidas como en contenidos multimedia streaming.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (39, 1, 2, N'PlayStation 5 pAck Fifa 23', CAST(N'2020-11-19' AS Date), N'~/Images/Productos/Consolas/PS5/PLAYSTATION_5_fifa.png', 600, N'Compra la consola PlayStation 5 Stand más un mando inalámbrico DualSense Blanco y descubre por ti mismo que jugar no tiene límites, bienvenido a la nueva generación.

Experimenta cargas superrápidas gracias a una unidad de estado sólido (SSD) de alta velocidad, una inmersión más profunda con retroalimentación háptica, gatillos adaptivos y el nuevo audio 3D, además de una nueva generación de increíbles juegosde PlayStation.

A la velocidad de la luz
Aprovecha la potencia de una unidad de estado sólido con E/S integradas, una CPU y una GPU personalizadas que reinventan las reglas de lo que una consola PlayStation es capaz de hacer.

Juegos alucinantes
Déjate sorprender por unos gráficos increíbles y experimenta nuevas funciones de PS5.

Una inmersión que te dejará sin aliento
Descubre una experiencia de juego más intensa mediante tecnología háptica, gatillos adaptables y audio 3D.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (40, 1, 2, N'PlayStation 5 Mega Pack', CAST(N'2020-11-19' AS Date), N'~/Images/Productos/Consolas/PS5/PLAYSTATION_5_packthe.png', 850, N'Compra la consola PlayStation 5 Stand más un mando inalámbrico DualSense Blanco y descubre por ti mismo que jugar no tiene límites, bienvenido a la nueva generación.

Experimenta cargas superrápidas gracias a una unidad de estado sólido (SSD) de alta velocidad, una inmersión más profunda con retroalimentación háptica, gatillos adaptivos y el nuevo audio 3D, además de una nueva generación de increíbles juegosde PlayStation.

A la velocidad de la luz
Aprovecha la potencia de una unidad de estado sólido con E/S integradas, una CPU y una GPU personalizadas que reinventan las reglas de lo que una consola PlayStation es capaz de hacer.

Juegos alucinantes
Déjate sorprender por unos gráficos increíbles y experimenta nuevas funciones de PS5.

Una inmersión que te dejará sin aliento
Descubre una experiencia de juego más intensa mediante tecnología háptica, gatillos adaptables y audio 3D.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (41, 1, 3, N'Nintendo Switch', CAST(N'2017-03-03' AS Date), N'~/Images/Productos/Consolas/NINTENDO_SWITCH/consola-nintendo-switch-gris-v2.png', 300, N'Con Nintendo Switch la experiencia de una consola doméstica va siempre contigo. En casa, Nintendo Switch descansa sobre una base que conecta la consola con el televisor para que juegues con todos tus amigos y familiares. Con sólo retirar la consola Nintendo Switch de su base, pasará automáticamente a modo portátil y el juego que disfrutabas te acompañará a donde quiera que vayas en su pantalla multitáctil capacitiva de 6.2 pulgadas.

La libertad de Nintendo Switch se expande incluso a su control gracias a los mandos Joy-Con, situados a cada lado de la pantalla y que pueden conectarse y desconectarse fácilmente con un simple clic. Juega en solitario con un mando Joy-Con en cada mano; compite o coopera con otro jugador con un mando cada uno; o reúne varios mandos para disfrutar de múltiples opciones de juego.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (42, 1, 3, N'Nintendo Switch OLED', CAST(N'2022-03-12' AS Date), N'~/Images/Productos/Consolas/NINTENDO_SWITCH/consola-nintendo-switch-oled-blanca---metroid-dread.png', 380, N'Con Nintendo Switch la experiencia de una consola doméstica va siempre contigo. En casa, Nintendo Switch descansa sobre una base que conecta la consola con el televisor para que juegues con todos tus amigos y familiares. Con sólo retirar la consola Nintendo Switch de su base, pasará automáticamente a modo portátil y el juego que disfrutabas te acompañará a donde quiera que vayas en su pantalla multitáctil capacitiva de 6.2 pulgadas.

La libertad de Nintendo Switch se expande incluso a su control gracias a los mandos Joy-Con, situados a cada lado de la pantalla y que pueden conectarse y desconectarse fácilmente con un simple clic. Juega en solitario con un mando Joy-Con en cada mano; compite o coopera con otro jugador con un mando cada uno; o reúne varios mandos para disfrutar de múltiples opciones de juego.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (43, 1, 3, N'Nintendo Switch PAck Mario', CAST(N'2017-03-03' AS Date), N'~/Images/Productos/Consolas/NINTENDO_SWITCH/pack-consola-nintendo-switch-gris---super-mario-3d-all-stars.png', 360, N'Con Nintendo Switch la experiencia de una consola doméstica va siempre contigo. En casa, Nintendo Switch descansa sobre una base que conecta la consola con el televisor para que juegues con todos tus amigos y familiares. Con sólo retirar la consola Nintendo Switch de su base, pasará automáticamente a modo portátil y el juego que disfrutabas te acompañará a donde quiera que vayas en su pantalla multitáctil capacitiva de 6.2 pulgadas.

La libertad de Nintendo Switch se expande incluso a su control gracias a los mandos Joy-Con, situados a cada lado de la pantalla y que pueden conectarse y desconectarse fácilmente con un simple clic. Juega en solitario con un mando Joy-Con en cada mano; compite o coopera con otro jugador con un mando cada uno; o reúne varios mandos para disfrutar de múltiples opciones de juego.', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (44, 1, 5, N'PlayStation 3', CAST(N'2006-11-11' AS Date), N'~/Images/Productos/Consolas/PS3/consola_ps3.png', 60, N'La nueva Playstation 3 hace incluso más accesibles el entretenimiento y juego en alta definición.
· La compatibilidad con verdadera alta definición de 1080p proporciona una calidad de imagen imbatible, de una viveza y claridad impecables.
· Capacidad de almacenamiento interno para tus películas, música, juegos y descargas. Gracias a sus 160 GB de disco duro, podrás guardar todos tus archivos en un espacio totalmente personalizable.
· Acceso a un mundo de diversión online desde el salón de tu casa: navega por Internet y experimenta el juego social y multijugador como nunca antes.
· Interconexión única con PSP (PlayStation Portable): comparte contenidos, desbloquea características en casa o en cualquier otra parte.
- No compatible con juegos para PS2', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (45, 1, 5, N'PlayStation 3 Pack Battlefield', CAST(N'2006-11-11' AS Date), N'~/Images/Productos/Consolas/PS3/consola_ps3_btf.png', 80, N'La nueva Playstation 3 hace incluso más accesibles el entretenimiento y juego en alta definición.
· La compatibilidad con verdadera alta definición de 1080p proporciona una calidad de imagen imbatible, de una viveza y claridad impecables.
· Capacidad de almacenamiento interno para tus películas, música, juegos y descargas. Gracias a sus 160 GB de disco duro, podrás guardar todos tus archivos en un espacio totalmente personalizable.
· Acceso a un mundo de diversión online desde el salón de tu casa: navega por Internet y experimenta el juego social y multijugador como nunca antes.
· Interconexión única con PSP (PlayStation Portable): comparte contenidos, desbloquea características en casa o en cualquier otra parte.
- No compatible con juegos para PS2', N'Consola')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (46, 3, 11, N'Camiseta Dragon Ball', NULL, N'~/Images/Productos/Merchandasing/CAMISETAS/camiseta_dragon.png', 15, N'Camiseta', N'Camiseta')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (47, 3, 11, N'Camiseta Fornite', NULL, N'~/Images/Productos/Merchandasing/CAMISETAS/camiseta_fornite.png', 15, N'Camiseta', N'Camiseta')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (48, 3, 11, N'Camiseta Pokemon', NULL, N'~/Images/Productos/Merchandasing/CAMISETAS/camiseta_pokemon.png', 15, N'Camiseta', N'Camiseta')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (49, 3, 12, N'Taza Juego De Tronos', NULL, N'~/Images/Productos/Merchandasing/TAZAS/taza_game.png', 10, N'Taza', N'Taza')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (50, 3, 12, N'Taza Naruto', NULL, N'~/Images/Productos/Merchandasing/TAZAS/taza_naruto.png', 10, N'Taza', N'Taza')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (51, 3, 12, N'Taza Rick Y Morty', NULL, N'~/Images/Productos/Merchandasing/TAZAS/taza_rick.png', 10, N'Taza', N'Taza')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (52, 3, 12, N'Taza Huevo Yoshi', NULL, N'~/Images/Productos/Merchandasing/TAZAS/taza_yoshi.png', 10, N'Taza', N'Taza')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (53, 3, 13, N'Figura Gogeta SSJ4', NULL, N'~/Images/Productos/Merchandasing/FIGURAS/figura_gogeta.png', 200, N'Figura', N'Figura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (54, 3, 13, N'Figura Goku SSJ Blue y Vegeta SSJ Blue', NULL, N'~/Images/Productos/Merchandasing/FIGURAS/figura_goku.png', 150, N'Figura', N'Figura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (55, 3, 13, N'Amibo Link ‎ ‎ ‎ ‎ ‎ ', NULL, N'~/Images/Productos/Merchandasing/FIGURAS/figura_link.png', 20, N'Figura', N'Figura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (56, 3, 13, N'Amibo Mario', NULL, N'~/Images/Productos/Merchandasing/FIGURAS/figura_mario.png', 20, N'Figura', N'Figura')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (57, 3, 14, N'Peluche Boom', NULL, N'~/Images/Productos/Merchandasing/PELUCHES/peluche_boom.png', 15, N'Peluche', N'Peluche')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (58, 3, 14, N'Peluche Boo', NULL, N'~/Images/Productos/Merchandasing/PELUCHES/peluche_buu.png', 15, N'Peluche', N'Peluche')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (59, 3, 14, N'Pelcuhe Kirby', NULL, N'~/Images/Productos/Merchandasing/PELUCHES/peluche_kirby.png', 15, N'Peluche', N'Peluche')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (60, 3, 14, N'Peluche Pikachu', NULL, N'~/Images/Productos/Merchandasing/PELUCHES/peluche_pikachu.png', 15, N'Peluche', N'Peluche')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (61, 4, 15, N'Asus ROG Strix Scar 18', NULL, N'~/Images/Productos/PcGaming/PORTATILES/asus_rog.png', 4000, N'Domina el campo de batalla de Windows 11 Home con el nuevo ROG Strix SCAR 18. Este ordenador introduce una pantalla de 18 pulgadas a la gama SCAR por primera vez para que veas al enemigo más claramente que nunca. Gracias a la potencia del procesador Intel® Core™ i9-13980HX de 13.ª generación y la GPU NVIDIA® GeForce RTX™ 4090 para portátiles con un TGP máximo de 175 W, el SCAR 18 maneja fácilmente incluso los juegos más exigentes. También viene con un MUX Switch dedicado compatible con NVIDIA Advanced Optimus, lo que te permite aprovechar fácilmente la verdadera potencia de tu GPU cuando juegas. El SCAR 18 te permite jugar, hacer stream y crear contenido al mismo tiempo sin ninguna dificultad ya que admite hasta 64 GB de RAM DDR5 y hasta 4 TB de almacenamiento PCIe Gen 4x4. No busques más, el Strix SCAR 18 es el portátil gaming definitivo.', N'Portatil')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (62, 4, 15, N'MSI GP66 Leopard 10UE-484XES', NULL, N'~/Images/Productos/PcGaming/PORTATILES/msi_leopard.png', 1200, N'Prepárate para sentir todo el poder del juego con el potente ordenador portátil de MSI GP66 Leopard. Directamente de la línea de sangre de la legendaria serie GP, llega una bestia rugiente con un diseño deportivo y un potente rendimiento. Con la nueva serie GP, eres el dueño del mundo gaming.', N'Portatil')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (63, 4, 16, N'Gigabyte GeForce RTX 3070', NULL, N'~/Images/Productos/PcGaming/GRAFICAS/grafica_3070.png', 600, N'El sistema de enfriamiento WINDFORCE 3X de la GeForce RTX ™ 3070 GAMING OC cuenta con ventiladores de cuchilla únicos de 3X80 mm, giro alternativo, 5 tubos de calor de cobre compuestos, GPU de contacto directo, ventilador activo 3D y enfriamiento de pantalla, que en conjunto brindan una disipación de calor de alta eficiencia.', N'Grafica')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (64, 4, 16, N'MSI GeForce RTX 3070 Ti', NULL, N'~/Images/Productos/PcGaming/GRAFICAS/grafica_3070ti.png', 660, N'LA VICTORIA SE MIDE EN MILISEGUNDOS: NVIDIA Reflex ofrece la máxima ventaja competitiva. La latencia más baja. La mejor capacidad de respuesta. Gracias a las GPU GeForce RTX serie 30 y los monitores NVIDIA
TU JUEGO CREATIVO:  Lleva tus proyectos creativos a un nuevo nivel con las GPU GeForce RTX serie 30. Ofrece aceleración por IA en las mejores aplicaciones creativas. Con el soporte de la plataforma NVIDIA Studio de controladores dedicados y herramientas exclusivas. Y creado para obtener resultados en un tiempo récord. Tanto si estás renderizando escenas en 3D complejas, editando vídeo de 8K o retransmitiendo con la mejor codificación y calidad de imagen, las GPU GeForce RTX te ofrecen el rendimiento necesario para tus mejores creaciones', N'Grafica')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (65, 4, 16, N'Gigabyte Technology GeForce GTX 1660 ', NULL, N'~/Images/Productos/PcGaming/GRAFICAS/grafica_16060_super.png', 360, N'GIGABYTE ofrece una línea completa de productos que tiene como objetivo "Mejorar su vida". Con experiencia que abarca consumidores, negocios, juegos y sistemas en la nube, GIGABYTE estableció su reputación como uno de los líderes en la industria con productos galardonados que incluyen placas base, tarjetas gráficas, computadoras portátiles, mini PC y otros componentes y accesorios de PC. Como desarrollador perenne en soluciones y hardware de servidores y PC, GIGABYTE está preparado para ampliar nuestro alcance en servidores empresariales y sistemas en la nube con soluciones de hardware y software que integran aplicaciones AI y AloT para permitir a los clientes capturar, analizar y transformar información digital en datos, acelerando el éxito de las empresas desde el borde hasta la nube.', N'Grafica')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (66, 4, 17, N'PcCom Gold Élite Intel Core i5', NULL, N'~/Images/Productos/PcGaming/SOBREMESA/elite_intel_core.png', 950, N'Una vez más Pc Componentes sorprende a la industria de la informática con el lanzamiento de los nuevos PcCom, la nueva línea de Pcs de sobremesa para juegos creada tras un amplio trabajo de investigación para ofrecer el mayor rendimiento y optimización en el juego para nuestros clientes. Ensamblados por nuestros expertos de montaje, los nuevos PcCom ofrecen un rendimiento increíble, con máxima velocidad, capacidad de ampliación y un amplio abanico de posibilidades dentro de la gama, en la que podrá elegir el producto óptimo según las necesidades y el tipo de Pc que está buscando.', N'Sobremesa')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (67, 4, 17, N'MPG B550 GAMING PLUS', NULL, N'~/Images/Productos/PcGaming/SOBREMESA/msi_mpg.png', 400, N'Una vez más Pc Componentes sorprende a la industria de la informática con el lanzamiento de los nuevos PcCom, la nueva línea de Pcs de sobremesa para juegos creada tras un amplio trabajo de investigación para ofrecer el mayor rendimiento y optimización en el juego para nuestros clientes. Ensamblados por nuestros expertos de montaje, los nuevos PcCom ofrecen un rendimiento increíble, con máxima velocidad, capacidad de ampliación y un amplio abanico de posibilidades dentro de la gama, en la que podrá elegir el producto óptimo según las necesidades y el tipo de Pc que está buscando.', N'Sobremesa')
INSERT [dbo].[Productos] ([IdProducto], [IdCategoria], [IdSubCategoria], [NombreProducto], [Lanzamiento], [Imagen], [Precio], [Descripcion], [Genero]) VALUES (68, 4, 17, N'Epical-Q Nighthawk ', NULL, N'~/Images/Productos/PcGaming/SOBREMESA/pcvip.png', 1300, N'Epical-Q es una marca de PC diseñados utilizando los mejores componentes, siempre con el punto de mira puesto en conseguir el mejor rendimiento, tanto a la hora de trabajar como de disfrutar de tus juegos.

Rendimiento superior a un precio realmente competitivo. Epical-Q es una marca creada por usuarios expertos para clientes buscan equipos que destacan por sus altas prestaciones.', N'Sobremesa')
GO
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (1, N'PS4', 1)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (2, N'PS5', 1)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (3, N'NINTENDO SWITCH', 1)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (4, N'XBOX SERIES X', 1)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (5, N'PS3', 1)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (6, N'PS4', 2)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (7, N'PS5', 2)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (8, N'NINTENDO SWITCH', 2)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (9, N'XBOX SERIES X', 2)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (10, N'PS3', 2)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (11, N'CAMISETAS', 3)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (12, N'TAZAS', 3)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (13, N'FIGURAS', 3)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (14, N'PELUCHES', 3)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (15, N'PORTATILES', 4)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (16, N'GRAFICAS', 4)
INSERT [dbo].[SubCategorias] ([IdSubCategoria], [NombreSubCategoria], [IdCategoria]) VALUES (17, N'SOBREMESA', 4)
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPedido_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido])
GO
ALTER TABLE [dbo].[DetallesPedido] CHECK CONSTRAINT [FK_DetallesPedido_Pedidos]
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPedido_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetallesPedido] CHECK CONSTRAINT [FK_DetallesPedido_Productos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Cliente]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_SubCategorias] FOREIGN KEY([IdSubCategoria])
REFERENCES [dbo].[SubCategorias] ([IdSubCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_SubCategorias]
GO
ALTER TABLE [dbo].[SubCategorias]  WITH CHECK ADD  CONSTRAINT [FK_SubCategorias_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[SubCategorias] CHECK CONSTRAINT [FK_SubCategorias_Categorias]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK__USER__ROLE] CHECK  (([ROLE]='ADMIN' OR [ROLE]='USER'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK__USER__ROLE]
GO
/****** Object:  StoredProcedure [dbo].[SP_CATEGORIAS_PRODUCTOS]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CATEGORIAS_PRODUCTOS]
(@IDCATEGORIA INT)
AS
    SELECT * FROM SubCategorias
	WHERE IdCategoria=@IDCATEGORIA
GO
/****** Object:  StoredProcedure [dbo].[SP_CATEGORIAS_PRODUCTOS_CONSOLAS]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CATEGORIAS_PRODUCTOS_CONSOLAS]
AS
    SELECT * FROM SubCategorias
	WHERE IdCategoria=1
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRODUCTOS_CATEGORIAS]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE PROCEDURE [dbo].[SP_GET_PRODUCTOS_CATEGORIAS]
(@ID INT)
    AS
    SELECT * FROM Productos where IdSubCategoria=@ID
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SUBCATEGORIAS_CATEGORIAS]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_SUBCATEGORIAS_CATEGORIAS]
(@NOMBRE NVARCHAR(50))
AS
select SubCategorias.NombreSubCategoria from SubCategorias inner join Categorias
on SubCategorias.IdCategoria=Categorias.IdCategoria where Categorias.NombreCategoria=@NOMBRE
GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUCTOS_PS4]    Script Date: 26/03/2023 19:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE PROCEDURE [dbo].[SP_PRODUCTOS_PS4]
    AS
          select top 4 * from Productos where Productos.IdCategoria=2
    	    ORDER BY NEWID()
GO
USE [master]
GO
ALTER DATABASE [TIENDAVIDEOJUEGOS] SET  READ_WRITE 
GO
