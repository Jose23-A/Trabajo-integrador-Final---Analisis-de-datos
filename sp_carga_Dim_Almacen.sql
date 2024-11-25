USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Dim_Almacen]	Script Date: 28/10/2024 15:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Dim_Almacen]
	@Proceso_ID bigint
as
BEGIN

	--Se limpian los clientes con NULL en el ID.
	DELETE
	FROM INT_Dim_Almacen
	WHERE Id_Almacen is null;

	-----Actualizo campos del Producto si existe
	UPDATE C
		SET ID_Almacen = D.Id_Almacen,
		Nombre_Almacen = D.Nombre_Almacen,
		Ubicacion = D.Ubicacion,
		Telefono = D.Telefono,
		Mail = D.Mail,
		CP = D.CP,
		Capacidad_Max = D.Capacidad_Max,
		Activo = D.Activo,
		Ciudad = D.Ciudad,
		Provincia = D.Provincia,
		Pais = D.Pais
	FROM Dim_Almacen C
		INNER JOIN INT_Dim_Almacen D
		ON C.ID_Almacen = D.Id_Almacen;

		--Inserto los nuevos Registros

	INSERT INTO Dim_Almacen
	 ([ID_Almacen],
	 [Nombre_Almacen],
	 [Ubicacion],
	 [Telefono],
	 [Mail],
	 [CP],
	 [Capacidad_Max],
	 [Activo],
	 [Ciudad],
	 [Provincia],
	 [Pais])
	SELECT distinct
		I.Id_Almacen
		,I.Nombre_Almacen
		,I.Ubicacion
		,I.Telefono
		,I.Mail
		,I.CP
		,I.Capacidad_Max
		,I.Activo
		,I.Ciudad
		,I.Provincia
		,I.Pais
	FROM [INT_Dim_Almacen] I
		left join [Dim_Almacen] D
			ON I.Id_Almacen=D.ID_Almacen
	WHERE D.ID_Almacen IS NULL;

END