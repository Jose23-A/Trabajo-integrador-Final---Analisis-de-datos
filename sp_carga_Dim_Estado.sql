USE [DW_DataShopExt]
GO
/****** Objects: StoreProcedure [dbo].[SP_Carga_Dim_Estado]	Script Date: 28/10/2024 15:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Carga_Dim_Estado]
	@Proceso_ID bigint
as
BEGIN

	--Se limpian los clientes con NULL en el ID.
	DELETE
	FROM INT_Dim_Estado
	WHERE Id_Estado is null;

	-----Actualizo campos del Producto si existe
	UPDATE C
		SET C.ID_Estado = D.Id_Estado,
		C.Descripcion = D.Descripcion
	FROM Dim_Estado C
		INNER JOIN INT_Dim_Estado D
		ON C.ID_Estado = D.Id_Estado;

		--Inserto los nuevos Registros

	INSERT INTO Dim_Estado
	 ([ID_Estado],
	 [Descripcion])
	SELECT distinct
		I.ID_Estado
		,I.Descripcion
	FROM [INT_Dim_Estado] I
		left join [Dim_Estado] D
			ON I.Id_Estado=D.ID_Estado
	WHERE D.ID_Estado IS NULL;

END