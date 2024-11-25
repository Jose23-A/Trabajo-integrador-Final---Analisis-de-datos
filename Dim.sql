---

CREATE TABLE [dbo].[Dim_Producto](
	[IdProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[PrecioCosto] [decimal](18, 2) NOT NULL,
	[PrecioVentaSugerido] [decimal](18, 2) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Dim_Tienda](
	[IdTienda] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[TipoTienda] [nvarchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Dim_Cliente](
	[IdCliente] [int] NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Fact_Ventas](
	[IdVenta] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Producto] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Cliente] [nvarchar](50) NOT NULL,
	[IdTienda] [int] NOT NULL,
	[Tienda] [nvarchar](50) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[ID_Entrega] [int] NOT NULL
PRIMARY KEY CLUSTERED
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Dim_Tiempo (
    Tiempo_Key datetime PRIMARY KEY,
    Anio int,
    Mes int,
    Mes_Nombre varchar(20),
    Semestre int,
    Trimestre int,
    Semana_Anio int,
    Semana_Nro_Mes int,
    Dia int,
    Dia_Nombre varchar(20),
    Dia_Semana_Nro int
);

CREATE TABLE [dbo].[Fact_Entrega](
	[ID_Entrega] [int] NOT NULL,
	[ID_Proveedor] [int] NOT NULL,
	[ID_Almacen] [int] NOT NULL,
	[ID_Estado] [int] NOT NULL,
	[Fecha_Envio] [datetime] NOT NULL,
	[Fecha_Entrega] [datetime] NOT NULL,
	[Tiempo_Entrega] [decimal](18, 2) NOT NULL,
	[Costo_Entrega] [decimal](18, 2) NOT NULL,
	[Entregado_Tiempo] [bit] NOT NULL,
	[Costo_Km] [decimal](18 ,2) NOT NULL,
	[Direccion] [nvarchar](20) NOT NULL,
	[Ciudad] [nvarchar](20) NOT NULL,
	[Provincia] [nvarchar](20) NOT NULL,
	[Pais] [nvarchar](20) NOT NULL,
	[Km] [decimal](18 ,2) NOT NULL
PRIMARY KEY CLUSTERED
(
	[ID_Entrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE[dbo].[Dim_Proveedor](
	[ID_Proveedor] [int] NOT NULL,
	[Nombre_Proveedor] [nvarchar](20) NOT NULL,
	[Costo_Estimado] [decimal](18 ,2) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](20) NOT NULL,
	[Tipo_Proveedor] [nvarchar](15) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Ciudad] [nvarchar](20) NOT NULL,
	[Provincia] [nvarchar](20) NOT NULL,
	[Pais] [nvarchar](20) NOT NULL,
	[Activo] [bit] NOT NULL
PRIMARY KEY CLUSTERED
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[Dim_Almacen](
	[ID_Almacen] [int] NOT NULL,
	[Nombre_Almacen] [nvarchar](25) NOT NULL,
	[Ubicacion] [nvarchar](25) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[Capacidad_Max] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Ciudad] [nvarchar](25) NOT NULL,
	[Provincia] [nvarchar](25) NOT NULL,
	[Pais] [nvarchar](25) NOT NULL
PRIMARY KEY CLUSTERED
(
	[ID_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[Dim_Estado](
	[ID_Estado] [int] NOT NULL,
	[Descripcion] [nvarchar](35) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fact_Ventas] WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Dim_Cliente] ([IdCliente])
GO

ALTER TABLE [dbo].[Fact_Ventas] WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Dim_Producto] ([IdProducto])
GO

ALTER TABLE [dbo].[Fact_Ventas] WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Dim_Tienda] ([IdTienda])
GO

ALTER TABLE [dbo].[Fact_Ventas] WITH CHECK ADD FOREIGN KEY([FechaVenta])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Key])
GO

ALTER TABLE [dbo].[Fact_Ventas] WITH CHECK ADD FOREIGN KEY([ID_Entrega])
REFERENCES [dbo].[Fact_Entrega] ([ID_Entrega])
GO

ALTER TABLE [dbo].[Fact_Entrega] WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Dim_Proveedor] ([Id_Proveedor])
GO

ALTER TABLE [dbo].[Fact_Entrega] WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Dim_Almacen] ([Id_Almacen])
GO

ALTER TABLE [dbo].[Fact_Entrega] WITH CHECK ADD FOREIGN KEY([ID_Estado])
REFERENCES [dbo].[Dim_Estado] ([ID_Estado])
GO