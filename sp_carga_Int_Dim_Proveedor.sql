USE [DW_DataShopExt]
GO
/****** Objects StoreProcedure [dbo].[SP_Carga_Int_Dim_Proveedor]	Script Date: 21/11/2024 13:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Int_Dim_Proveedor]
	@Proceso_ID bigint
AS
BEGIN

TRUNCATE TABLE INT_Dim_Proveedor

INSERT INTO [dbo].[INT_Dim_Proveedor]
			(
			 [Id_Proveedor]
			,[Nombre_Proveedor]
			,[Costo_Estimado]
			,[Telefono]
			,[Mail]
			,[Direccion]
			,[Tipo_Proveedor]
			,[CP]
			,[Fecha_Alta]
			,[Ciudad]
			,[Provincia]
			,[Pais]
			,[Activo]
			)

SELECT distinct
		CAST(ID_Proveedor AS int) as [Id_Proveedor]
		,[Nombre_Proveedor] as Nombre_Proveedor
		,CAST(Costo_Estimado AS DECIMAL(18, 2)) as Costo_Estimado
		,[Telefono] as Telefono
		,[Mail] as Mail
		,[Direccion] as Direccion
		,[Tipo_Proveedor] as Tipo_Proveedor
		,[CP] as CP
		,CONVERT(DATETIME, [Fecha_Alta], 120) as [Fecha_Alta]
		,[Ciudad] as Ciudad
		,[Provincia] as Provincia
		,[Pais] as Pais
		,CAST(Activo AS bit) as [Activo]
	FROM STG_Dim_Proveedor

END