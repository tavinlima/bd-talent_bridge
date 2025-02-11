GO
CREATE FUNCTION fn_candidatos_maiores_idade()
RETURNS INT
AS BEGIN
	DECLARE @total INT
	SELECT @total = COUNT(cpf) FROM Candidato C WHERE DATEDIFF(YEAR, dataNascimento, GETDATE()) >= 18
	RETURN @total
END

GO
SELECT dbo.fn_candidatos_maiores_idade() AS QTD

SELECT * FROM Candidato
GO

GO
CREATE FUNCTION fn_candidatos_maiores_idade_na_vaga(@idVaga INT)
RETURNS INT
AS BEGIN
	DECLARE @total INT
	SELECT @total = COUNT(C.cpf) FROM Candidato C 
	JOIN Aplicacoes A ON C.CPF = A.CPF
	WHERE DATEDIFF(YEAR, dataNascimento, GETDATE()) >= 18
	AND A.idVaga = @idVaga
	RETURN @total
END

GO
SELECT dbo.fn_candidatos_maiores_idade_na_vaga(1) AS QTD

SELECT * FROM Vagas
GO

CREATE FUNCTION fn_vagas_por_titulo(@titulo VARCHAR(100))
RETURNS TABLE AS 
RETURN
(
	SELECT * FROM Vagas V WHERE V.titulo = @titulo
)
GO

SELECT * FROM dbo.fn_vagas_por_titulo('Product Owner')