USE [DW_DataShopExt]
GO
/****** Objects StoreProcedure [dbo].[SP_Carga_Int_Dim_Estado]	Script Date: 21/11/2024 13:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Carga_Int_Dim_Estado]
	@Proceso_ID bigint
AS
BEGIN

TRUNCATE TABLE INT_Dim_Estado

INSERT INTO [dbo].[INT_Dim_Estado]
			(
			 [Id_Estado] -- INT NOT NULL,
			,[Descripcion] --NVARCHAR(35) NOT NULL,
			)

SELECT distinct
		CAST(ID_Estado AS int) AS [Id_Estado]
		,[Descripcion] as Descripcion
	FROM STG_Dim_Estado

END