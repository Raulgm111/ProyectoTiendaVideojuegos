CREATE PROCEDURE SP_PRODUCTOS_PS4
AS
    select top 4 * from Productos where Productos.IdCategoria=1
	ORDER BY NEWID()
GO

CREATE PROCEDURE SP_CATEGORIAS_PRODUCTOS_CONSOLAS
AS
    SELECT * FROM SubCategorias
	WHERE IdCategoria=1
GO

select * from categorias
