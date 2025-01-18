-- Impede que vagas com candidaturas sejam excluídas
CREATE TRIGGER TGR_Block_Delete_Vaga
ON Vagas
INSTEAD OF DELETE AS
BEGIN
	IF EXISTS (SELECT * FROM Aplicacoes A WHERE A.idVaga = (SELECT IdVaga FROM deleted))
		BEGIN
			RAISERROR('Não é permitido excluir vagas com candidaturas feitas.', 16, 1);
			ROLLBACK;
		END
	ELSE
		BEGIN 
			DELETE FROM Vagas
			WHERE idVaga = (SELECT IdVaga FROM deleted)
		END
END;
GO

DELETE FROM Vagas WHERE idVaga = 1

GO
-- Notificar candidato que receber feedback
CREATE TRIGGER TGR_Notify_Candidato
ON Aplicacoes
AFTER UPDATE
AS
BEGIN
    DECLARE @EntrevistadorId INT, @CPF CHAR(11), @feedback varchar(500), @nome VARCHAR(100), @email VARCHAR(100), @descricao VARCHAR(500);

    SELECT 
        @CPF = I.CPF,
        @feedback = feedback, 
		@nome = nome,
		@email = email,
		@descricao = V.descricao
    FROM 
        inserted I
	JOIN Candidato C ON C.CPF = I.CPF
	JOIN Usuario U ON C.idUsuario = U.idUsuario
	JOIN Vagas V ON I.idVaga = V.idVaga;

    PRINT 'Nova atualização para o e-mail: ' + @email + '! Candidato nome: ' + @nome +
          ' você recebeu um novo feedback referente a sua candidatura para: ' + @descricao +
          '. Mensagem ' + @feedback;
END;

SELECT * FROM Aplicacoes

UPDATE Aplicacoes
SET feedback = 'Excelente desenvolvedor e uma boa comunicação.'
WHERE idAplicacao = 1
GO

-- Notifica quando houver um novo usuário no sistema
GO
CREATE TRIGGER TGR_Notificar_Novos_Usuarios 
ON Usuario
AFTER INSERT
AS
BEGIN
	DECLARE @id INT, @nome VARCHAR(100), @email VARCHAR(100);

	SELECT @id = idUsuario, @nome = nome,@email = email FROM inserted;

	PRINT 'Novo usuário cadastrado na plataforma id: ' + CAST(@id AS VARCHAR) + ', nome: '+ @nome + ', email: '+ @email;
END
GO

-- Inserir dados na tabela Endereco
INSERT INTO Endereco (logradouro, numero, complemento, bairro, cidade, estado, cep, pais, tipoEndereco)
VALUES 
('Avenida Paulista', '1000', 'Sala 1504', 'Bela Vista', 'São Paulo', 'SP', '01310100', 'Brasil', 'Comercial');

-- Inserir dados na tabela Contato
INSERT INTO Contato (tipoContato, numero)
VALUES 
('Telefone principal', '+5510975543210')

-- Inserir dados na tabela Usuario
INSERT INTO Usuario (idEndereco, idContato, nome, email, fotoPerfil)
VALUES 
(11, 12, 'NewTech', 'recrutamento@newtech.com', NULL);

-- Adicionar nova observacao a candidatura
GO
CREATE TRIGGER TGR_ADD_OBS_CANDIDATURA
ON Aplicacoes
AFTER UPDATE
AS BEGIN
	DECLARE @log VARCHAR(100), @id INT;
	SELECT @log = i.observacoes, @id = idAplicacao FROM inserted i;

	SELECT * FROM inserted;

	SELECT observacoes FROM Aplicacoes WHERE idAplicacao = @id;

	
	IF EXISTS (SELECT 1 FROM inserted i
				INNER JOIN deleted d ON i.idAplicacao = d.idAplicacao
				WHERE i.observacoes <> d.observacoes)
	BEGIN
		UPDATE Aplicacoes
		SET observacoes = observacoes + ' - ' + @log
		WHERE idAplicacao = @id;
	END

	SELECT * FROM Aplicacoes;
END

DROP TRIGGER TGR_ADD_OBS_CANDIDATURA

UPDATE Aplicacoes
SET observacoes = 'Candidato passou para fase 3'
WHERE idAplicacao = 1;

-- Avisar candidatos aprovados ou reprovados na candidatura
GO
CREATE TRIGGER TGR_Avisar_Candidatos_Situacao
ON Aplicacoes
AFTER UPDATE
AS BEGIN
	DECLARE @situacao VARCHAR(10);
	SELECT @situacao = situacao FROM inserted;
	SELECT situacao FROM inserted;
	IF (@situacao IS NOT NULL)
		BEGIN
		IF (@situacao = 'Aprovado')
			BEGIN
			PRINT 'Parabéns!!! Situação da candidatura: ' + @situacao + ' no processo seletivo';
			END
		ELSE 
			PRINT 'Situação da candidatura: ' + @situacao + ' no processo seletivo';
		END
	END
GO

UPDATE Aplicacoes
SET situacao = 'Aprovado'
WHERE idAplicacao = 5
