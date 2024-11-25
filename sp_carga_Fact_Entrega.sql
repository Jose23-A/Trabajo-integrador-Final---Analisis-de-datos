USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Fact_Entrega]	Script Date: 28/10/2024 15:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Fact_Entrega]
	@Proceso_ID bigint
as
BEGIN

	--Se limpian los clientes con NULL en el ID.
	DELETE
	FROM INT_Fact_Entrega
	WHERE Id_Entrega is null;

	-----Actualizo campos del Producto si existe
	UPDATE C
		SET ID_Entrega=D.Id_Entrega,
		ID_Proveedor=D.ID_Proveedor,
		ID_Almacen=D.ID_Almacen,
		ID_Estado=D.ID_Estado,
		Fecha_Envio = D.Fecha_Envio,
		Fecha_Entrega = D.Fecha_Entrega,
		Tiempo_Entrega = D.Tiempo_Entrega,
		Costo_Entrega = D.Costo_Entrega,
		Entregado_Tiempo = D.Entregado_Tiempo,
		Costo_Km = D.Costo_Km,
		Direccion = D.Direccion,
		Ciudad = D.Ciudad,
		Provincia = D.Provincia,
		Pais = D.Pais,
		Km = D.Km
	FROM Fact_Entrega C
		INNER JOIN INT_Fact_Entrega D
		ON C.ID_Entrega = D.Id_Entrega;

		--Inserto los nuevos Registros

	INSERT INTO Fact_Entrega
	 ([ID_Entrega],
	 [ID_Proveedor],
	 [ID_Almacen],
	 [ID_Estado],
	 [Fecha_Envio],
	 [Fecha_Entrega],
	 [Tiempo_Entrega],
	 [Costo_Entrega],
	 [Entregado_Tiempo],
	 [Costo_Km],
	 [Direccion],
	 [Ciudad],
	 [Provincia],
	 [Pais],
	 [Km])
	SELECT distinct
		I.ID_Entrega
		,I.ID_Proveedor
		,I.ID_Almacen
		,I.ID_Estado
		,I.Fecha_Envio
		,I.Fecha_Entrega
		,I.Tiempo_Entrega
		,I.Costo_Entrega
		,I.Entregado_Tiempo
		,I.Costo_Km
		,I.Direccion
		,I.Ciudad
		,I.Provincia
		,I.Pais
		,I.Km
	FROM [INT_Fact_Entrega] I
	left join [Fact_Entrega] D ON I.Id_Entrega = D.ID_Entrega
	WHERE D.ID_Entrega IS NULL;

END