-- Exibe quantidade de idiomas que os candidatos falam
CREATE VIEW VW_Qtd_Idioma_Falado_Por_Candidato AS
	SELECT idioma, COUNT(I.idioma) AS 'qtd_falantes' FROM Idioma I
	GROUP BY idioma
GO

SELECT * FROM VW_Qtd_Idioma_Falado_Por_Candidato ORDER BY qtd_falantes DESC

-- Exibe as vagas disponíveis com o número total de candidatos aplicados.
GO
CREATE VIEW VW_Resumo_Vagas_Candidatos AS
SELECT 
    V.descricao,
    V.dataInicio AS 'Data_abertura',
	V.DataFim AS 'Data_Final',
    V.disponivel,
    COUNT(A.idAplicacao) AS TotalCandidatos
FROM 
    Vagas V
LEFT JOIN 
    Aplicacoes A ON V.idVaga = A.idVaga
GROUP BY 
     V.descricao, V.dataInicio, V.DataFim, V.disponivel;
GO

SELECT * FROM VW_Resumo_Vagas_Candidatos

-- Consolida informações dos candidatos, incluindo dados de contato.
GO
CREATE VIEW VW_Detalhes_Candidatos AS
SELECT 
	U.nome,
	U.email,
    CO.numero,
    E.Cidade,
    E.Estado,
    V.descricao AS VagaCandidatada,
    A.feedback AS Feedback
FROM 
    Candidato C
LEFT JOIN 
	Usuario U ON C.idUsuario = U.idUsuario
LEFT JOIN
	Contato CO ON U.idContato = CO.idContato
LEFT JOIN
	Endereco E ON U.idEndereco = E.idEndereco
LEFT JOIN
    Aplicacoes A ON C.CPF = A.CPF
LEFT JOIN 
    Vagas V ON A.idVaga = V.idVaga;
GO

SELECT * FROM VW_Detalhes_Candidatos

GO
-- Vagas anunciadas há 30 dias
CREATE VIEW VW_Vagas_Anunciadas_Ha_30d AS
SELECT 
	U.nome,
	U.email,
	E.CNPJ,
    V.descricao,
	v.dataInicio,
	V.DataFim
FROM 
    Vagas V
JOIN 
    Empresa E ON V.CNPJ = E.CNPJ
JOIN 
	Usuario U ON E.idUsuario = U.idUsuario
WHERE 
    V.dataInicio >= DATEADD(DAY, -30, GETDATE());
GO

SELECT * FROM VW_Vagas_Anunciadas_Ha_30d

GO
-- Exibe e agrupa usuários com base no estado em que residem.
CREATE VIEW VW_Usuarios_Por_Regiao AS
SELECT 
    Estado,
    COUNT(*) AS TotalUsuarios
FROM 
    Candidato C
JOIN 
	Usuario U ON C.idUsuario = U.idUsuario
JOIN
	Endereco E ON U.idEndereco = E.idEndereco
GROUP BY 
    Estado;
GO

SELECT * FROM VW_Usuarios_Por_Regiao ORDER BY TotalUsuarios DESC;
