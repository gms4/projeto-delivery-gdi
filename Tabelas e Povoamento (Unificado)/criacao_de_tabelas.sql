CREATE TABLE Endereco(
    cep VARCHAR2(255) NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    numero NUMBER NOT NULL,
    bairro VARCHAR2(255) NOT NULL,
    cidade VARCHAR2(255) NOT NULL,
    estado VARCHAR2(255) NOT NULL, 
    CONSTRAINT endereco_pk PRIMARY KEY (cep, numero)
);

CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    nascimento DATE NOT NULL,
    telefone VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL,
    cep_endereco VARCHAR2(255) NOT NULL,
    num_endereco NUMBER NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep_endereco, num_endereco) REFERENCES Endereco(cep, numero)
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
--frete > 0 -> pedido entregue
--frete = 0 -> pedido pego no local
CREATE TABLE Restaurante(
    cnpj VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    frete_fixo NUMBER NOT NULL,
    cep_endereco VARCHAR2(255) NOT NULL,
    num_endereco NUMBER NOT NULL,
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk FOREIGN KEY (cep_endereco, num_endereco) REFERENCES Endereco(cep, numero)
);

CREATE TABLE Pratos_do_restaurante( --entidade fraca de restaurante
    nome_prato VARCHAR2(255) NOT NULL,
    cnpj VARCHAR2(14) NOT NULL,
    preco NUMBER NOT NULL, --n existe almoço de graça
    categoria VARCHAR2(255) NOT NULL,
    CONSTRAINT prato_pk PRIMARY KEY (nome_prato, cnpj), 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);

CREATE TABLE Telefone_restaurante ( --tabela para telefones (multi) do restaurante 
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);

CREATE TABLE Cupom (
    id INTEGER,
    cliente_cpf VARCHAR2(11),
    descricao VARCHAR2(255),
    desconto NUMBER, 
    CONSTRAINT cupom_pk PRIMARY KEY (id),
    CONSTRAINT cupom_fk FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf)
);

CREATE TABLE Parceria( --auto relacionamento
    cnpj_contratante VARCHAR2(14) NOT NULL,
    cnpj_contratado VARCHAR2(14),
    CONSTRAINT parceria_fk1 FOREIGN KEY (cnpj_contratante) REFERENCES Restaurante(cnpj),
    CONSTRAINT parceria_fk2 FOREIGN KEY (cnpj_contratado) REFERENCES Restaurante(cnpj)
);

CREATE TABLE Pedido( --entidade associativa
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    data_pedido TIMESTAMP NOT NULL UNIQUE,
    id_cupom INTEGER,
    entregador_cpf VARCHAR2(11),
    horario_inicio TIMESTAMP,
    horario_fim TIMESTAMP,
    form_pgmt VARCHAR2(255) NOT NULL,
    nota_c_e NUMBER CHECK (nota_c_e >= 1 AND nota_c_e <= 5),
    nota_c_r NUMBER CHECK (nota_c_r >= 1 AND nota_c_r <= 5),
    nota_r_e NUMBER CHECK (nota_r_e >= 1 AND nota_r_e <= 5),
    CONSTRAINT pedido_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, data_pedido), 
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (restaurante_cnpj) REFERENCES Restaurante(cnpj),
    CONSTRAINT pedido_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf),
    CONSTRAINT pedido_fk4 FOREIGN KEY (id_cupom) REFERENCES Cupom(id)
);

CREATE TABLE Pedido_contem_prato(
    data_pedido TIMESTAMP NOT NULL,
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    nome_prato VARCHAR2(255) NOT NULL,
    CONSTRAINT pedido_contem_prato_pk PRIMARY KEY (data_pedido, cliente_cpf, restaurante_cnpj, nome_prato),
    CONSTRAINT pedido_contem_prato_fk1 FOREIGN KEY (data_pedido) REFERENCES Pedido(data_pedido),
    CONSTRAINT pedido_contem_prato_fk2 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_contem_prato_fk3 FOREIGN KEY (nome_prato, restaurante_cnpj) REFERENCES Pratos_do_restaurante(nome_prato, cnpj)
);