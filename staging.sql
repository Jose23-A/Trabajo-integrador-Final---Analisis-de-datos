-- Staging

CREATE TABLE [dbo].[STG_Dim_Producto](
	[CodigoProducto] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Categoria] [nvarchar](255) NULL,
	[Marca] [nvarchar](255) NULL,
	[PrecioCosto] [nvarchar](255) NULL,
	[PrecioVentaSugerido] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Dim_Tienda](
	[CodigoTienda] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Localidad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[TipoTienda] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Dim_Cliente](
	[CodCliente] [nvarchar](255) NULL,
	[RazonSocial] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Localidad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Fact_Ventas](
	[Id_Venta] [nvarchar](255) NULL,
	[FechaVenta] [nvarchar](255) NULL,
	[CodigoProducto] [nvarchar](255) NULL,
	[Producto] [nvarchar](255) NULL,
	[Cantidad] [nvarchar](255) NULL,
	[PrecioVenta] [nvarchar](255) NULL,
	[CodigoCliente] [nvarchar](255) NULL,
	[Cliente] [nvarchar](255) NULL,
	[CodigoTienda] [nvarchar](255) NULL,
	[Tienda] [nvarchar](255) NULL,
	[ID_Entrega] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Dim_Tiempo] (
    [Tiempo_Key] [nvarchar](255) NULL,
    [Anio] [nvarchar](255) NULL,
    [Mes] [nvarchar](255) NULL,
    [Mes_Nombre] [nvarchar](255) NULL,
    [Semestre] [nvarchar](255) NULL,
    [Trimestre] [nvarchar](255) NULL,
    [Semana_Anio] [nvarchar](255) NULL,
    [Semana_Nro_Mes] [nvarchar](255) NULL,
    [Dia] [nvarchar](255) NULL,
    [Dia_Nombre] [nvarchar](255) NULL,
    [Dia_Semana_Nro] [nvarchar](255) NULL,
)ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Fact_Entrega](
	[ID_Entrega] [nvarchar](255) NULL,
	[ID_Proveedor] [nvarchar](255) NULL,
	[ID_Almacen] [nvarchar](255) NULL,
	[ID_Estado] [nvarchar](255) NULL,
	[Fecha_Envio] [nvarchar](255) NULL,
	[Fecha_Entrega] [nvarchar](255) NULL,
	[Tiempo_Entrega] [nvarchar](255) NULL,
	[Costo_Entrega] [nvarchar](255) NULL,
	[Entregado_Tiempo] [nvarchar](255) NULL,
	[Costo_Km] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Km] [nvarchar](255) NULL
)ON [PRIMARY]

GO

CREATE TABLE[dbo].[STG_Dim_Proveedor](
	[ID_Proveedor] [nvarchar](255) NULL,
	[Nombre_Proveedor] [nvarchar](255) NULL,
	[Costo_Estimado] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Tipo_Proveedor] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[Fecha_Alta] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[STG_Dim_Almacen](
	[ID_Almacen] [nvarchar](255) NULL,
	[Nombre_Almacen] [nvarchar](255) NULL,
	[Ubicacion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[Capacidad_Max] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[STG_Dim_Estado](
	[ID_Estado] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
)ON [PRIMARY]
GO


CREATE TABLE [dbo].[STG_Dim_Producto_Datos_Faltantes](
	[CodigoProducto] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Categoria] [nvarchar](255) NULL,
	[Marca] [nvarchar](255) NULL,
	[PrecioCosto] [nvarchar](255) NULL,
	[PrecioVetnaSugerido] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Dim_Tienda_Datos_Faltantes](
	[CodigoTienda] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Localidad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[TipoTienda] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Dim_Cliente_Datos_Faltantes](
	[CodCliente] [nvarchar](255) NULL,
	[RazonSocial] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Localidad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Fact_Ventas_Datos_Faltantes](
	[Id_Venta] [nvarchar](255) NULL,
	[FechaVenta] [nvarchar](255) NULL,
	[CodigoProducto] [nvarchar](255) NULL,
	[Producto] [nvarchar](255) NULL,
	[Cantidad] [nvarchar](255) NULL,
	[PrecioVenta] [nvarchar](255) NULL,
	[CodigoCliente] [nvarchar](255) NULL,
	[Cliente] [nvarchar](255) NULL,
	[CodigoTienda] [nvarchar](255) NULL,
	[Tienda] [nvarchar](255) NULL,
	[ID_Entrega] [nvarchar](255) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[STG_Fact_Entrega_Datos_Faltantes](
	[ID_Entrega] [nvarchar](255) NULL,
	[ID_Proveedor] [nvarchar](255) NULL,
	[ID_Almacen] [nvarchar](255) NULL,
	[ID_Estado] [nvarchar](255) NULL,
	[Fecha_Envio] [nvarchar](255) NULL,
	[Fecha_Entrega] [nvarchar](255) NULL,
	[Tiempo_Entrega] [nvarchar](255) NULL,
	[Costo_Entrega] [nvarchar](255) NULL,
	[Entregado_Tiempo] [nvarchar](255) NULL,
	[Costo_Km] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Km] [nvarchar](255) NULL
)ON [PRIMARY]

GO

CREATE TABLE[dbo].[STG_Dim_Proveedor_Datos_Faltantes](
	[ID_Proveedor] [nvarchar](255) NULL,
	[Nombre_Proveedor] [nvarchar](255) NULL,
	[Costo_Estimado] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Tipo_Proveedor] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[Fecha_Alta] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[STG_Dim_Almacen_Datos_Faltantes](
	[ID_Almacen] [nvarchar](255) NULL,
	[Nombre_Almacen] [nvarchar](255) NULL,
	[Ubicacion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[CP] [nvarchar](255) NULL,
	[Capacidad_Max] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL
)ON [PRIMARY]
GO

CREATE TABLE[dbo].[STG_Dim_Estado_Datos_Faltantes](
	[ID_Estado] [nvarchar](255) NULL,
	[Descripcion] [nvarchar](255) NULL,
)ON [PRIMARY]
GO