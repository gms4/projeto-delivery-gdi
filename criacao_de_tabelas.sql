DROP TABLE Pessoa;
DROP TABLE Entregador;

CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    nascimento DATE NOT NULL,
    telefone VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL UNIQUE,
    cep VARCHAR2(255) NOT NULL,
    rua VARCHAR2(255) NOT NULL,
    numero_casa INTEGER NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE Entregador ( 
    cpf VARCHAR(11) NOT NULL, 
    
    data_admissao DATE NOT NULL, 
    renda NUMBER CHECK (renda >= 1100), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR(255), 
    horario_inicio TIME (0),
    horario_fim TIME(0),
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCE Pessoa(cpf)
);

--tabela pedido_entregue (só um template, depende de outras tabelas ainda)

CREATE TABLE Pedido_Entregue (

    cpf_cliente VARCHAR2(11) NOT NULL,
    cnpj_restaurante VARCHAR2(14) NOT NULL,
    nome_prato VARCHAR2(255) NOT NULL,
    cpf_entregador VARCHAR2(11) NOT NULL,
    frete NUMBER NOT NULL,
    form_pgmt VARCHAR2(255) NOT NULL,
    data_hora DATE NOT NULL,

    CONSTRAINT Pedido_Entregue_pk  PRIMARY KEY (data_hora, cnpj_restaurante, cpf_cliente, nome_prato, cpf_entregador),
    CONSTRAINT Pedido_Entregue_fk1 FOREIGN KEY (cnpj_restaurante) REFERENCES Restaurante(cnpj),
    CONSTRAINT Pedido_Entregue_fk2 FOREIGN KEY (cpf_cliente) REFERENCES Cliente (cpf),
    CONSTRAINT Pedido_Entregue_fk3 FOREIGN KEY (nome_prato) REFERENCES Prato (nome, cnpj),
    CONSTRAINT Pedido_Entregue_fk4 FOREIGN KEY (cpf_entregador) REFERENCES Entregador (cpf)

);