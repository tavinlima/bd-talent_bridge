-- Buscar todos os candidatos que aplicaram para uma vaga
GO
CREATE PROCEDURE SP_Candidatos_para_vaga (@IDVaga INT) AS
BEGIN
	SELECT U.nome, U.email, V.descricao FROM Aplicacoes A
	JOIN Candidato C ON A.CPF = C.CPF
	JOIN Usuario U ON C.idUsuario = U.idUsuario
	JOIN Vagas V ON A.idVaga = V.idVaga
	WHERE V.idVaga = @IDVaga;
END
GO

EXEC SP_Candidatos_para_vaga 1

-- Busca todas as vagas com status disponivel no sistema
GO
CREATE PROCEDURE SP_Vagas_Disponiveis AS
BEGIN
	SELECT dataInicio, DataFim, V.descricao AS 'Descricao_Vaga', U.nome AS 'Empresa', V.CNPJ, U.email, E.descricao AS 'Descricao_Empresa' FROM Vagas V
	JOIN Empresa E ON E.CNPJ = V.CNPJ
	JOIN Usuario U ON E.idUsuario = U.idUsuario
	WHERE V.disponivel = 1;
END
GO

EXEC SP_Vagas_Disponiveis

-- Busca todas as vagas com status disponivel no sistema de uma empresa específica
GO
CREATE PROCEDURE SP_Vagas_Disponiveis_Por_Empresa (@CNPJ CHAR(14)) AS
BEGIN
	SELECT dataInicio, DataFim, V.descricao, V.CNPJ, U.nome, U.email, E.descricao FROM Vagas V
	JOIN Empresa E ON E.CNPJ = V.CNPJ
	JOIN Usuario U ON E.idUsuario = U.idUsuario
	WHERE V.disponivel = 1
	AND E.CNPJ = @CNPJ;
END
GO

EXEC SP_Vagas_Disponiveis_Por_Empresa '34567890100189'

-- Verifica quais vagas estão com processo seletivo fechado e atualiza o status para indisponível
GO
CREATE PROCEDURE SP_Atualizar_Status_Vagas_Indisponiveis AS
BEGIN
	UPDATE Vagas
	SET disponivel = 0
	WHERE DataFim <= GETDATE()
END
GO

SELECT * FROM Vagas

EXEC SP_Atualizar_Status_Vagas_Indisponiveis

SELECT * FROM Vagas

-- Mostra se o usuario informado é recrutador ou candidato
GO
CREATE PROCEDURE SP_Mostrar_TipoUsuario (@idUsuario	INT)AS
BEGIN
	IF(@idUsuario = (SELECT IdUsuario FROM Empresa E WHERE idUsuario = @idUsuario))
		BEGIN
			SELECT 'Usuário do tipo recrutador' AS Mensagem
		END
	ELSE 
		BEGIN 
			SELECT 'Usuário do tipo candidato' AS Mensagem
		END
END
GO

EXEC SP_Mostrar_TipoUsuario 1

GO
-- Mostra as empresas com as melhores classificações e separa entre >3 boa =3 média e <3 ruim
CREATE PROCEDURE SP_Classificao_Empresa AS
BEGIN 
	SELECT U.nome AS 'Nome_Empresa',  E.CNPJ, E.avaliacao,
	CASE 
		WHEN E.avaliacao < 3 THEN 'RUIM'
		WHEN E.avaliacao = 3 THEN 'MÉDIA'
		WHEN E.avaliacao > 3 THEN 'BOA'
	ELSE 'SEM AVALIAÇÃO'
	END AS Avaliacao_Empresa
	FROM Empresa E
	JOIN Usuario U  ON E.idUsuario = U.idUsuario
	ORDER BY E.avaliacao DESC
END

EXEC SP_Classificao_Empresa