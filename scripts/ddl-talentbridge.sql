CREATE DATABASE TalentBridge

USE TalentBridge

-- Tabela Endereco
CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY IDENTITY(1,1),
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8),
    pais VARCHAR(50),
    tipoEndereco VARCHAR(20)
);

-- Tabela Contato
CREATE TABLE Contato (
    idContato INT PRIMARY KEY IDENTITY(1,1),
    tipoContato VARCHAR(50),
    numero VARCHAR(14)
);

-- Tabela Usuário
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    idEndereco INT FOREIGN KEY REFERENCES Endereco(idEndereco),
    idContato INT FOREIGN KEY REFERENCES Contato(idContato),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fotoPerfil VARBINARY(MAX)
);

-- Tabela Candidato
CREATE TABLE Candidato (
    idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario),
    CPF CHAR(11) PRIMARY KEY NOT NULL,
    dataNascimento DATE NOT NULL,
);

-- Tabela Empresa
CREATE TABLE Empresa (
    CNPJ CHAR(14) PRIMARY KEY,
    idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario),
    descricao VARCHAR(500),
    avaliacao DECIMAL(3, 2) CHECK (avaliacao BETWEEN 0 AND 5)
);

-- Tabela Escolaridade
CREATE TABLE Escolaridade (
    idEscolaridade INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Experiencia
CREATE TABLE Experiencia (
    idExperiencia INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Skills
CREATE TABLE Skills (
    idSkill INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
    titulo VARCHAR(100),
    descricao VARCHAR(100),
);

-- Tabela Projeto
CREATE TABLE Projeto (
    idProjeto INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Certificacao
CREATE TABLE Certificacao (
    idCertificacao INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataConclusao DATE
);

-- Tabela Idioma
CREATE TABLE Idioma (
    idIdioma INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
	fluencia VARCHAR(50) NOT NULL,
    idioma VARCHAR(50)
);

-- Tabela Vagas
CREATE TABLE Vagas (
    idVaga INT PRIMARY KEY IDENTITY(1,1),
    CNPJ CHAR(14) FOREIGN KEY REFERENCES Empresa(CNPJ),
	dataInicio SMALLDATETIME NOT NULL,
	DataFim SMALLDATETIME NOT NULL,
    descricao VARCHAR(500),
	titulo VARCHAR(100) NOT NULL,
    disponivel BIT NOT NULL,
	modeloTrabalho VARCHAR(10) NOT NULL,
	senioridade VARCHAR(2) NOT NULL
);

-- Tabela Requisitos
CREATE TABLE Requisitos (
    idRequisitos INT PRIMARY KEY IDENTITY(1,1),
    idVaga INT FOREIGN KEY REFERENCES Vagas(idVaga),
    requisito VARCHAR(50)
);

-- Tabela Aplicações
CREATE TABLE Aplicacoes (
    idAplicacao INT PRIMARY KEY IDENTITY(1,1),
    idVaga INT FOREIGN KEY REFERENCES Vagas(idVaga),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
	dataCandidatura SMALLDATETIME NOT NULL,
	observacoes VARCHAR(500),
	avaliacao VARCHAR(500),
	feedback VARCHAR(500),
	situacao VARCHAR(10)
)