USE TalentBridge;
-- Selecionar todos os dados da tabela Endereco
SELECT * FROM Endereco;

-- Selecionar todos os dados da tabela Contato
SELECT * FROM Contato;

-- Selecionar todos os dados da tabela Usuario
SELECT * FROM Usuario;

-- Selecionar todos os dados da tabela Candidato
SELECT * FROM Candidato;

-- Selecionar todos os dados da tabela Empresa
SELECT * FROM Empresa;

-- Selecionar todos os dados da tabela Escolaridade
SELECT * FROM Escolaridade;

-- Selecionar todos os dados da tabela Experiencia
SELECT * FROM Experiencia;

-- Selecionar todos os dados da tabela Skills
SELECT * FROM Skills;

-- Selecionar todos os dados da tabela Projeto
SELECT * FROM Projeto;

-- Selecionar todos os dados da tabela Certificacao
SELECT * FROM Certificacao;

-- Selecionar todos os dados da tabela Idioma
SELECT * FROM Idioma;

-- Selecionar todos os dados da tabela Vagas
SELECT * FROM Vagas;

-- Selecionar todos os dados da tabela Requisitos
SELECT * FROM Requisitos;

-- Selecionar todos os dados da tabela Aplicacoes
SELECT * FROM Aplicacoes;

--Mostre todos os candidatos que sejam de cursos relacionados a sistemas, computação, desenvolvimento ou computadores
SELECT nome, email, dataNascimento, E.titulo as Escolaridades, E.descricao as Descricao FROM Usuario U
JOIN Candidato C ON U.idUsuario = C.idUsuario
JOIN Escolaridade E ON E.CPF = C.CPF
WHERE titulo LIKE '%Sistemas%' OR titulo LIKE '%Computação%' OR titulo LIKE'%Desenvolvimento%' OR titulo LIKE'%Computadores%'	

-- Mostre todas as empresas do estado de São Paulo
SELECT nome, email, CNPJ, cidade, estado FROM Usuario U
JOIN Empresa E ON U.idUsuario = E.idUsuario
JOIN Endereco ED ON U.idUsuario = ED.idEndereco
WHERE estado = 'SP'

-- Mostre todos os candidatos que falem francês
SELECT nome, email, dataNascimento, I.idIdioma FROM Usuario U
JOIN Candidato C ON U.idUsuario = C.idUsuario
JOIN Idioma I ON I.CPF = C.CPF
WHERE idioma = 'Francês'

-- Mostre todos as vagas indisponíveis
SELECT * FROM Vagas
WHERE disponivel = 0
