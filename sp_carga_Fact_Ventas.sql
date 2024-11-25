USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Fact_Ventas]	Script Date: 28/10/2024 15:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Fact_Ventas]
    @Proceso_ID bigint
as
BEGIN

    -- Se limpian los clientes con NULL en el ID.
    DELETE 
	FROM INT_Fact_Ventas
    WHERE Id_Venta IS NULL;

    -- Actualizo campos del Producto si existe
    UPDATE C
		SET FechaVenta = D.FechaVenta,
        IdProducto = D.CodigoProducto,  -- Obtener IdProducto de Dim_Producto
        Producto = D.Producto,
        Cantidad = D.Cantidad,
        PrecioVenta = D.PrecioVenta,
        IdCliente = D.CodigoCliente,  -- Obtener IdCliente de Dim_Cliente
        Cliente = D.Cliente,
        IdTienda = D.CodigoTienda,  -- Obtener IdTienda de Dim_Tienda
        Tienda = D.Tienda,
        FechaRegistro = D.FechaRegistro,
		ID_Entrega = D.ID_Entrega
    FROM Fact_Ventas C
		INNER JOIN INT_Fact_Ventas D 
		ON C.IdVenta = D.Id_Venta

    -- Inserto los nuevos Registros
    INSERT INTO Fact_Ventas
    (
		[IdVenta],
        [FechaVenta],
        [IdProducto],
        [Producto],
        [Cantidad],
        [PrecioVenta],
        [IdCliente],
        [Cliente],
        [IdTienda],
        [Tienda],
        [FechaRegistro],
		[ID_Entrega]
    )
    SELECT DISTINCT
		I.Id_Venta,
        I.FechaVenta,
        I.CodigoProducto,  -- Obtener IdProducto de Dim_Producto
        I.Producto,
        I.Cantidad,
        I.PrecioVenta,
        I.CodigoCliente,  -- Obtener IdCliente de Dim_Cliente
        I.Cliente,
        I.CodigoTienda,  -- Obtener IdTienda de Dim_Tienda
        I.Tienda,
        I.FechaRegistro,
		I.ID_Entrega
    FROM [INT_Fact_Ventas] I
    LEFT JOIN [Fact_Ventas] D ON I.Id_Venta = D.IdVenta
	WHERE D.IdVenta IS NULL;
END
