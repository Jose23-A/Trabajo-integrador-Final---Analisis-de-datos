USE [DW_DataShopExt]
GO
/****** Objects StoreProcedure [dbo].[SP_Carga_Int_Dim_Entrega]	Script Date: 21/11/2024 13:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Int_Fact_Entrega]
	@Proceso_ID bigint
AS
BEGIN

TRUNCATE TABLE INT_Fact_Entrega

INSERT INTO [dbo].[INT_Fact_Entrega]
			(
			 [Id_Entrega]
			,[ID_Proveedor]
			,[ID_Almacen]
			,[ID_Estado]
			,[Fecha_Envio]
			,[Fecha_Entrega]
			,[Tiempo_Entrega]
			,[Costo_Entrega]
			,[Entregado_Tiempo]
			,[Costo_Km]
			,[Direccion]
			,[Ciudad]
			,[Provincia]
			,[Pais]
			,[Km]
			)

SELECT distinct
		CAST(ID_Entrega AS int) as [Id_Entrega]
		,CAST(ID_Proveedor AS int) as [ID_Proveedor]
		,CAST(ID_Almacen AS int) as [ID_Almacen]
		,CAST(ID_Estado AS int) as [ID_Estado]
		,CONVERT (DATETIME, [Fecha_Envio], 120) as [Fechas_Envio]
		,CONVERT (DATETIME, [Fecha_Entrega], 120) as [Fecha_Entrega]
		,CAST(Tiempo_Entrega AS DECIMAL(18, 2)) as [Tiempo_Entrega]
		,CAST(Costo_Entrega AS DECIMAL(18, 2)) as Costo_Entrega
		,CAST(Entregado_Tiempo AS BIT) AS Entregado_Tiempo
		,CAST(Costo_Km AS DECIMAL(18, 2)) as Casto_Km
		,[Direccion] as  Direccion
		,[Ciudad] as Ciudad
		,[Provincia] as Provincia
		,[Pais] as Pais
		,CAST(Km AS DECIMAL(18, 2)) as KM
	FROM STG_Fact_Entrega

END