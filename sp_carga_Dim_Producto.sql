USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Dim_Producto]	Script Date: 25/10/2024 21:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Carga_Dim_Producto]
	@Proceso_ID bigint
as
BEGIN

	--Se limpian los clientes con NULL en el ID.
	DELETE
	FROM INT_Dim_Producto
	WHERE CodigoProducto is null;

	-----Actualizo campos del Producto si existe
	UPDATE C
		SET IdProducto=D.CodigoProducto,
		Descripcion=D.Descripcion,
		Categoria=D.Categoria,
		Marca=D.Marca,
		PrecioCosto = D.PrecioCosto,
		PrecioVentaSugerido = D.PrecioVentaSugerido,
		FechaActualizacion = GETDATE()
	FROM Dim_Producto C
		INNER JOIN INT_Dim_Producto D
		ON C.IdProducto=D.CodigoProducto;

		--Inserto los nuevos Registros

	INSERT INTO Dim_Producto
	 ([IdProducto],
	 [Descripcion],
	 [Categoria],
	 [Marca],
	 [PrecioCosto],
	 [PrecioVentaSugerido],
	 [FechaCreacion],
	 [FechaActualizacion])
	SELECT distinct
		I.CodigoProducto
		,I.Descripcion
		,I.Categoria
		,I.Marca
		,I.PrecioCosto
		,I.PrecioVentaSugerido
		,Getdate() as FechaCreacion
		, null as FechaActualizacion
	FROM [INT_Dim_Producto] I
		left join [Dim_Producto] D
			ON I.CodigoProducto=D.IdProducto
	WHERE D.IdProducto IS NULL;

END