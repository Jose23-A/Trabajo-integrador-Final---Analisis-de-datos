USE [DW_DataShopExt]
GO
/****** Objects StoreProcedure [dbo].[SP_Carga_Int_Dim_Almacen]	Script Date: 21/11/2024 13:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Int_Dim_Almacen]
	@Proceso_ID bigint
AS
BEGIN

TRUNCATE TABLE INT_Dim_Almacen

INSERT INTO [dbo].[INT_Dim_Almacen]
			(
			 [Id_Almacen] -- INT NOT NULL,
			,[Nombre_Almacen] --NVARCHAR(25) NOT NULL,
			,[Ubicacion] --NVARCHAR(200) NOT NULL,
			,[Telefono]
			,[Mail] --NVARCHAR(30) NOT NULL,
			,[CP] --NVARCHAR(10) NOT NULL,
			,[Capacidad_Max] --INT NOT NULL,
			,[Activo] --Bit NOT NULL
			,[Ciudad] --nvarchar(25) NOT NULL,
			,[Provincia] --nvarchar(25) NOT NULL,
			,[Pais] --nvarchar(25) NOT NULL,
			)

SELECT distinct
		CAST(Id_Almacen AS int) AS [Id_Almacen]
		,[Nombre_Almacen] as Nombre_Almacen
		,[Ubicacion] as Ubicacion
		,[Telefono] as Telefono
		,[Mail] as Mail
		,[CP] as CP
		,CAST(Capacidad_Max AS int) as Capacidad_Max
		,CAST(Activo AS bit) as Activo
		,[Ciudad] as Ciudad
		,[Provincia] Provincia
		,[Pais] as pais
	FROM STG_Dim_Almacen

END