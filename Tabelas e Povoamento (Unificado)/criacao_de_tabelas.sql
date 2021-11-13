CREATE TABLE Cep(
    cep VARCHAR2(255) NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    numero NUMBER NOT NULL,
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

CREATE TABLE Cliente( --herda de pessoa
	dt_criacao_conta DATE NOT NULL,
	cpf VARCHAR2(11) NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (cpf),
	CONSTRAINT cliente_fk1 FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Entregador ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL, 
    data_admissao DATE NOT NULL, 
    renda NUMBER NOT NULL CHECK (renda >= 1100.00), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR2(255) NOT NULL, 
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Restaurante(
    cnpj VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    cep VARCHAR2(255) NOT NULL,
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk2 FOREIGN KEY (cep) REFERENCES Cep(cep)
);

CREATE TABLE Prato( --entidade fraca de restaurante
    nome VARCHAR2(255) NOT NULL,
    cnpj VARCHAR2(14) NOT NULL,
    preco NUMBER NOT NULL, --n existe almoço de graça
    categoria VARCHAR2(255) NOT NULL,
    CONSTRAINT prato_pk PRIMARY KEY (nome, cnpj), 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj) 
);

CREATE TABLE Telefone_restaurante ( --tabela para telefones (multi) do restaurante 
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);

/*CREATE TABLE Pedido_entregue( --entidade associativa
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    prato_nome VARCHAR2(255) NOT NULL,
    entregador_cpf VARCHAR2(11) NOT NULL,
    horario_inicio NUMBER NOT NULL,
    horario_fim NUMBER NOT NULL,
    frete NUMBER NOT NULL,
    form_pgmt VARCHAR2(255) NOT NULL,
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf),
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj),
    CONSTRAINT pedido_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf)
);

CREATE TABLE Pedido( --relacao
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    prato_nome VARCHAR2(255) NOT NULL,
    frete NUMBER,
    form_pgmt VARCHAR2(255),
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido__pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome),
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj)
);*/

CREATE TABLE Parceria( --auto relacionamento
    cnpj_contratante VARCHAR2(14) NOT NULL,
    cnpj_contratado VARCHAR2(14),
    CONSTRAINT parceria_fk1 FOREIGN KEY (cnpj_contratante) REFERENCES Restaurante(cnpj),
    CONSTRAINT parceria_fk2 FOREIGN KEY (cnpj_contratado) REFERENCES Restaurante(cnpj)
);

CREATE TABLE Pedido( --entidade associativa
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    prato_nome VARCHAR2(255) NOT NULL,
    entregador_cpf VARCHAR2(11),
    horario_inicio NUMBER,
    horario_fim NUMBER,
    frete NUMBER NOT NULL,
    form_pgmt VARCHAR2(255) NOT NULL,
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome),
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj),
    CONSTRAINT pedido_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf)
);

CREATE TABLE Avalia(--relacao tripla
    entregador_cpf VARCHAR2(11),
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    nota_c_e NUMBER CHECK (nota_c_e >= 1 AND nota_c_e <= 5), --nota do cliente para o entregador
    nota_c_r NUMBER NOT NULL CHECK (nota_c_r >= 1 AND nota_c_r <= 5), --nota do cliente para o restaurante
    nota_r_e NUMBER CHECK (nota_r_e >= 1 AND nota_r_e <= 5), --nota do restaurante para o entregador
    CONSTRAINT avalia_fk1 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf),
    CONSTRAINT avalia_fk2 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT avalia_fk3 FOREIGN KEY (restaurante_cnpj) REFERENCES Restaurante(cnpj)
);

