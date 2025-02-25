CREATE DATABASE TalentBridge

USE TalentBridge

-- Tabela Usuário
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
	biografia VARCHAR(500),
    senha VARCHAR(MAX) NOT NULL,
	ativado bit NOT NULL,
);

-- Tabela Endereco
CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY IDENTITY(1,1),
	idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario) ON DELETE CASCADE,
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
	idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario) ON DELETE CASCADE,
    tipoContato VARCHAR(50)
);

CREATE TABLE Email (
	idEmail INT PRIMARY KEY IDENTITY(1,1),
	idContato INT FOREIGN KEY REFERENCES Contato(idContato) ON DELETE CASCADE,
	email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE Telefone (
	idTelefone INT PRIMARY KEY IDENTITY(1,1),
	idContato INT FOREIGN KEY REFERENCES Contato(idContato) ON DELETE CASCADE,
	telefone VARCHAR(14)
)

CREATE TABLE Website (
	idSite INT PRIMARY KEY IDENTITY(1,1),
	idContato INT FOREIGN KEY REFERENCES Contato(idContato) ON DELETE CASCADE,
	website VARCHAR(100)
)

CREATE TABLE Documento (
	idDocumento INT PRIMARY KEY IDENTITY(1,1),
	tipoDocumento VARCHAR(100) NOT NULL,
	valor VARCHAR(15) UNIQUE
);

-- Tabela Candidato
CREATE TABLE Candidato (
	idCandidato INT PRIMARY KEY IDENTITY(1,1),
    idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario) ON DELETE CASCADE,
    dataNascimento DATE NOT NULL,
);

-- Tabela Empresa
CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY IDENTITY(1,1),
	idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario) ON DELETE CASCADE,
    CNPJ CHAR(14) UNIQUE NOT NULL,
	setor VARCHAR(50)
);

-- Tabela Escolaridade
CREATE TABLE Escolaridade (
    idEscolaridade INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Experiencia
CREATE TABLE Experiencia (
    idExperiencia INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
	atual bit,
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Skills
CREATE TABLE Skills (
    idSkill INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
    titulo VARCHAR(100),
    descricao VARCHAR(100),
);

-- Tabela Projeto
CREATE TABLE Projeto (
    idProjeto INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataInicio DATE,
    dataConclusao DATE
);

-- Tabela Certificacao
CREATE TABLE Certificacao (
    idCertificacao INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    dataConclusao DATE
);

-- Tabela Idioma
CREATE TABLE Idioma (
    idIdioma INT PRIMARY KEY IDENTITY(1,1),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF) ON DELETE CASCADE,
	fluencia VARCHAR(50) NOT NULL,
    idioma VARCHAR(50)
);

-- Tabela Vagas
CREATE TABLE Vagas (
    idVaga INT PRIMARY KEY IDENTITY(1,1),
    CNPJ CHAR(14) FOREIGN KEY REFERENCES Empresa(CNPJ) ON DELETE CASCADE,
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
CREATE TABLE Candidatura (
    idCandidatura INT PRIMARY KEY IDENTITY(1,1),
    idVaga INT FOREIGN KEY REFERENCES Vagas(idVaga),
    CPF CHAR(11) FOREIGN KEY REFERENCES Candidato(CPF),
	dataCandidatura SMALLDATETIME NOT NULL,
	observacoes VARCHAR(500),
	avaliacao VARCHAR(500),
	feedback VARCHAR(500),
	situacao VARCHAR(10)
)
