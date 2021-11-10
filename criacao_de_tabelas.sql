CREATE TABLE Cep(
    cep VARCHAR2(255) NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    numero NUMBER,
    bairro VARCHAR2(255) NOT NULL,
    cidade VARCHAR2(255) NOT NULL,
    estado VARCHAR2(255) NOT NULL, 
    CONSTRAINT cep_pk PRIMARY KEY (cep)
);

CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    nascimento DATE NOT NULL,
    telefone VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL UNIQUE,
    cep VARCHAR2(255) NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep) REFERENCES Cep(cep)
);

CREATE TABLE Cliente(
	dt_criacao_conta DATE NOT NULL,
	cpf VARCHAR2(11) NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (cpf),
	CONSTRAINT cliente_fk1 FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Entregador ( 
    cpf VARCHAR2(11) NOT NULL, 
    data_admissao DATE NOT NULL, 
    renda NUMBER CHECK (renda >= 1100.00), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR2(255), 
    horario_inicio NUMBER,
    horario_fim NUMBER,
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Restaurante(
    cnpj VARCHAR2(14) NOT NULL,
    parceiro_cnpj VARCHAR2(14),
    nome VARCHAR2(255) NOT NULL,
    cep VARCHAR2(255),
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk1 FOREIGN KEY (parceiro_cnpj) REFERENCES Restaurante(cnpj), --auto relacionamento parceiro
    CONSTRAINT restaurante_fk2 FOREIGN KEY (cep) REFERENCES Cep(cep)
);

CREATE TABLE Prato(
    nome VARCHAR2(255),
    cnpj VARCHAR2(14),
    preco NUMBER NOT NULL, --n existe almoço de graça
    categoria VARCHAR2(255),
    CONSTRAINT prato_pk PRIMARY KEY (nome, cnpj), 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj) 
);

CREATE TABLE Telefone_restaurante (
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) UNIQUE NOT NULL,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);