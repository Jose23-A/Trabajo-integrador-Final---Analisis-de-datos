USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Dim_Proveedor]	Script Date: 28/10/2024 15:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Carga_Dim_Proveedor]
	@Proceso_ID bigint
as
BEGIN

	--Se limpian los clientes con NULL en el ID.
	DELETE
	FROM INT_Dim_Proveedor
	WHERE Id_Proveedor is null;

	-----Actualizo campos del Producto si existe
	UPDATE C
		SET ID_Proveedor = D.Id_Proveedor,
		Nombre_Proveedor = D.Nombre_Proveedor,
		Costo_Estimado = D.Costo_Estimado,
		Telefono = D.Telefono,
		Mail = D.Mail,
		Direccion = D.Direccion,
		Tipo_Proveedor = D.Tipo_Proveedor,
		CP = D.CP,
		Fecha_Alta = D.Fecha_Alta,
		Ciudad = D.Ciudad,
		Provincia = D.Provincia,
		Pais = D.Pais,
		Activo = D.Activo
	FROM Dim_Proveedor C
		INNER JOIN INT_Dim_Proveedor D
		ON C.ID_Proveedor = D.Id_Proveedor;

		--Inserto los nuevos Registros

	INSERT INTO Dim_Proveedor
	 ([ID_Proveedor],
	 [Nombre_Proveedor],
	 [Costo_Estimado],
	 [Telefono],
	 [Mail],
	 [Direccion],
	 [Tipo_Proveedor],
	 [CP],
	 [Fecha_Alta],
	 [Ciudad],
	 [Provincia],
	 [Pais],
	 [Activo])
	SELECT distinct
		I.ID_Proveedor
		,I.Nombre_Proveedor
		,I.Costo_Estimado
		,I.Telefono
		,I.Mail
		,I.Direccion
		,I.Tipo_Proveedor
		,I.CP
		,I.Fecha_Alta
		,I.Ciudad
		,I.Provincia
		,I.Pais
		,I.Activo
	FROM [INT_Dim_Proveedor] I
		left join [Dim_Proveedor] D
			ON I.Id_Proveedor=D.ID_Proveedor
	WHERE D.ID_Proveedor IS NULL;

END