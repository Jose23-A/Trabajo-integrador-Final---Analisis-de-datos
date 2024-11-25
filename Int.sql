-- INT

CREATE TABLE [dbo].[INT_Dim_Producto](
	[CodigoProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[PrecioCosto] [decimal](18 ,2) NOT NULL,
	[PrecioVentaSugerido] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[INT_Dim_Tienda](
	[CodigoTienda] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[TipoTienda] [nvarchar](255) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[INT_Dim_Cliente](
	[CodCliente] [int] NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[INT_Fact_Ventas](
	[Id_Venta] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[Producto] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[Cliente] [nvarchar](50) NOT NULL,
	[CodigoTienda] [int] NOT NULL,
	[Tienda] [nvarchar](50) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[ID_Entrega] [int] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[INT_Fact_Entrega](
	[Id_Entrega] [int] NOT NULL,
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
)ON [PRIMARY]

GO

CREATE TABLE[dbo].[INT_Dim_Proveedor](
	[Id_Proveedor] [int] NOT NULL,
	[Nombre_Proveedor] [nvarchar](20) NOT NULL,
	[Costo_Estimado] [decimal](18 ,2) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](20) NOT NULL,
	[Tipo_Proveedor] [nvarchar](15) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[Fecha_Alta] [datetime] NOT NULL,
	[Ciudad] [nvarchar](20) NOT NULL,
	[Provincia] [nvarchar](20) NOT NULL,
	[Pais] [nvarchar](20) NOT NULL,
	[Activo] [bit] NOT NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[INT_Dim_Almacen](
	[Id_Almacen] [int] NOT NULL,
	[Nombre_Almacen] [nvarchar](25) NOT NULL,
	[Ubicacion] [nvarchar](25) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[Capacidad_Max] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Ciudad] [nvarchar](25) NOT NULL,
	[Provincia] [nvarchar](25) NOT NULL,
	[Pais] [nvarchar](25) NOT NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[INT_Dim_Estado](
	[Id_Estado] [int] NOT NULL,
	[Descripcion] [nvarchar](35) NOT NULL,
)ON [PRIMARY]
GO