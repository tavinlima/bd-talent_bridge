USE TalentBridge

-- Inserir dados na tabela Endereco
INSERT INTO Endereco (logradouro, numero, complemento, bairro, cidade, estado, cep, pais, tipoEndereco)
VALUES 
('Rua das Palmeiras', '789', 'Casa 302', 'Jardim São Paulo', 'São Paulo', 'SP', '01002000', 'Brasil', 'Residencial'),
('Rua do Comércio', '101', 'Apto 501', 'Vila Progredior', 'São Paulo', 'SP', '02001000', 'Brasil', 'Comercial'),
('Avenida dos Bandeirantes', '890', 'Loja 305', 'Bairro das Indústrias', 'São Paulo', 'SP', '03001000', 'Brasil', 'Comercial'),
('Rua Rio Branco', '500', 'Bloco C', 'Centro', 'Rio de Janeiro', 'RJ', '20040000', 'Brasil', 'Residencial'),
('Avenida Paulista', '1000', 'Sala 1204', 'Bela Vista', 'São Paulo', 'SP', '01310100', 'Brasil', 'Comercial'), 
('Avenida Paulista', '1578', 'Apartamento 32', 'Bela Vista', 'São Paulo', 'SP', '01310200', 'Brasil', 'Residencial'), 
('Rua das Flores', '320', 'Sala 45', 'Centro', 'Curitiba', 'PR', '80010150', 'Brasil', 'Comercial'), ('Praça da Liberdade', '101', NULL, 'Savassi', 'Belo Horizonte', 'MG', '30140010', 'Brasil', 'Residencial'), 
('Rua XV de Novembro', '456', 'Cobertura', 'Centro Histórico', 'Porto Alegre', 'RS', '90020090', 'Brasil', 'Residencial'), 
('Alameda Santos', '1254', 'Conjunto 701', 'Jardins', 'São Paulo', 'SP', '01418200', 'Brasil', 'Comercial');

-- Inserir dados na tabela Contato
INSERT INTO Contato (tipoContato, numero)
VALUES 
('Telefone principal', '+5511976543210'),
('Telefone secundário', '+5511999999999'),
('WhatsApp', '+5511900000000'),
('Telegram', '+5521999999999'),
('Residencial', '+5528999999999'),
('Telefone principal', '+5511975543210'),
('Telefone principal', '+5511970543210'),
('Telefone principal', '+5511979543210'),
('Telefone principal', '+5511976543290'),
('Telefone principal', '+5511976543880'),
('Telefone principal', '+5511976555210');

-- Inserir dados na tabela Usuario
INSERT INTO Usuario (idEndereco, idContato, nome, email, fotoPerfil)
VALUES 
(1, 1, 'Carlos Souza', 'carlos.souza@email.com', NULL),
(2, 2, 'Ana Lima', 'ana.lima@email.com', NULL),
(3, 3, 'Paulo Oliveira', 'paulo.oliveira@email.com', NULL),
(4, 4, 'Maria Santos', 'maria.santos@email.com', NULL),
(5, 5, 'Roberto Costa', 'roberto.costa@email.com', NULL),
(6, 6, 'Tech Inovations', 'recrutamento@techinovations.com', NULL),
(7, 7, 'Jet Air', 'rh@jetair.com', NULL),
(8, 8, 'Green Tech', 'recrutamento@greentech.com', NULL),
(9, 9, 'Mambo Ideias', 'recursoshumanos@mamboideias.com', NULL),
(10, 10, 'TXT Criações', 'recrutamento@txtc.com', NULL);

-- Inserir dados na tabela Candidato
INSERT INTO Candidato (idUsuario, CPF, dataNascimento)
VALUES 
(1, '23456789012', '1992-04-10'),
(2, '34567890123', '1987-11-30'),
(3, '45678901234', '1983-06-25'),
(4, '56789012345', '1990-01-15'),
(5, '67890123456', '1985-12-20');

-- Inserir dados na tabela Empresa
INSERT INTO Empresa (CNPJ, idUsuario, descricao, avaliacao)
VALUES 
('12345678000195', 6, 'Empresa de Tecnologia', 4.5),
('23456789000123', 7, 'Consultoria Empresarial', 3.8),
('34567890100189', 8, 'Agência de Marketing', 4.2),
('45678901234567', 9, 'E-commerce', 4.7),
('56789012345678', 10, 'Serviços de TI', 2.9);

-- Inserir dados na tabela Escolaridade
INSERT INTO Escolaridade (CPF, titulo, descricao, dataInicio, dataConclusao)
VALUES 
('23456789012', 'Bacharel em Sistemas de Informação', 'Universidade de São Paulo', '2010-02-01', '2014-12-15'),
('34567890123', 'Mestrado em Administração', 'Universidade Federal do Rio de Janeiro', '2013-03-01', '2015-12-15'),
('45678901234', 'Bacharel em Design Gráfico', 'Faculdade de Belas Artes', '2008-02-01', '2012-12-15'),
('56789012345', 'Bacharel em Ciências Contábeis', 'Universidade Estadual de Campinas', '2007-03-01', '2011-12-15'),
('67890123456', 'Tecnólogo em Redes de Computadores', 'Instituto Federal de São Paulo', '2012-02-01', '2014-12-15');

-- Inserir dados na tabela Experiencia
INSERT INTO Experiencia (CPF, titulo, descricao, dataInicio, dataConclusao)
VALUES 
('23456789012', 'Desenvolvedor Full Stack', 'Desenvolvimento de sistemas web', '2014-01-01', '2018-12-31'),
('34567890123', 'Gerente de Projetos', 'Gestão de equipes e projetos', '2015-06-01', '2020-06-30'),
('45678901234', 'Designer Gráfico', 'Criação de material gráfico e digital', '2010-01-01', '2014-12-31'),
('56789012345', 'Contador', 'Gestão fiscal e contábil', '2012-01-01', '2016-12-31'),
('67890123456', 'Administrador de Redes', 'Gestão de servidores e redes', '2015-01-01', '2020-12-31');

-- Inserir dados na tabela Projeto
INSERT INTO Projeto (CPF, titulo, descricao, dataInicio, dataConclusao)
VALUES 
('23456789012', 'Sistema de E-commerce', 'Desenvolvimento de plataforma de vendas online', '2018-01-01', '2020-01-01'),
('34567890123', 'Gestão de Projetos de TI', 'Implantação de sistema ERP para pequenas empresas', '2017-06-01', '2019-06-01'),
('45678901234', 'Aplicativo de Design Gráfico', 'Criação de aplicativo para edição de imagens', '2016-05-01', '2018-05-01'),
('56789012345', 'Auditoria Contábil', 'Auditoria de processos contábeis para empresas de grande porte', '2014-07-01', '2016-07-01'),
('67890123456', 'Infraestrutura de TI', 'Implantação de servidores e infraestrutura de rede', '2015-09-01', '2017-09-01');

-- Inserir dados na tabela Certificacao
INSERT INTO Certificacao (CPF, titulo, descricao, dataConclusao)
VALUES 
('23456789012', 'Certificação em Scrum', 'Certificação no framework ágil Scrum Master', '2019-12-15'),
('34567890123', 'PMP', 'Certificação em Gerenciamento de Projetos', '2018-11-10'),
('45678901234', 'Adobe Certified Expert', 'Certificação em softwares Adobe', '2017-10-05'),
('56789012345', 'Contador Certificado', 'Certificação no Conselho Regional de Contabilidade', '2016-12-20'),
('67890123456', 'CCNA', 'Certificação em Redes Cisco', '2019-05-14');

-- Inserir dados na tabela Idioma
INSERT INTO Idioma (CPF, idioma, fluencia)
VALUES 
('23456789012', 'Inglês', 'Intermediário'),
('34567890123', 'Espanhol', 'Básico'),
('45678901234', 'Inglês', 'Fluente'),
('56789012345', 'Português', 'Intermediário'),
('67890123456', 'Inglês', 'Fluente');

-- Inserir dados na tabela Vagas
INSERT INTO Vagas (CNPJ, dataInicio, DataFim, descricao, disponivel, titulo, modeloTrabalho, senioridade)
VALUES 
('12345678000195', '2024-01-01 12:00', '2024-06-01 23:59', 'Vaga para atuar na sede, desenvolvendo aplicações para a área de negócios', 1, 'Desenvolvedor back-end', 'presencial', 'jr'),
('23456789000123', '2024-02-01 13:00', '2024-07-01 23:59', 'Vaga para atuar na área de cargo', 1, 'Product Owner', 'remoto','sr'),
('34567890100189', '2024-03-01 12:00', '2024-08-01 23:59', 'Vaga para atuar na área de cargo', 1, 'Designer gráfico', 'híbrido', 'pl'),
('45678901234567', '2024-04-01 14:00', '2024-09-02 23:59', 'Vaga para atuar na sede', 1, 'Contador sênior', 'presencial', 'sr'),
('56789012345678', '2024-05-01 12:00', '2024-10-03 23:59', 'Vaga para atuar em modelo híbrido', 1, 'Administrador de redes','remoto','sr');

-- Inserir dados na tabela Requisitos
INSERT INTO Requisitos (idVaga, requisito)
VALUES 
(1, 'Experiência em desenvolvimento backend'),
(2, 'Gestão de equipes e recursos em TI'),
(3, 'Conhecimento em design gráfico e ferramentas Adobe'),
(4, 'Conhecimento em contabilidade e impostos'),
(5, 'Conhecimento em redes e servidores');

-- Inserir dados na tabela Aplicacoes
INSERT INTO Aplicacoes (idVaga, CPF, avaliacao, feedback, situacao, dataCandidatura, observacoes)
VALUES 
(1, '23456789012', 'Entrevista técnica fácil', 'Excelente desenvolvedor, boa comunicação.', 'Aprovado', '2024-01-01', 'Candidatou passou para fase 2'),
(2, '34567890123', 'Entrevista durou 4 horas no total', 'Falta de experiência em gestão de TI.', 'Reprovado', '2024-02-02', 'Candidato chamado para entrevista'),
(3, '45678901234', 'Não tente aparecer mais que todo mundo na dinâmica', 'Ótimo portfólio de design gráfico.', 'Aprovado', '2024-03-03', 'Candidato passou para fase 3'),
(4, '56789012345', 'Dinâmica para resolução de case', 'Boa experiência em contabilidade.', 'Aprovado', '2024-20-12', 'Candidato chamado para entrevista'),
(5, '67890123456', 'Apenas entrevista com RH e com gestor', 'Excelente conhecimento de infraestrutura de TI.', 'Aprovado', '2024-12-01', 'Candidato passou para fase 2');  
