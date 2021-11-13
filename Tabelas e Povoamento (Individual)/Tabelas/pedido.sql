CREATE TABLE Pedido(
    cliente_cpf VARCHAR2(11),
    restaurante_cnpj VARCHAR2(14),
    prato_nome VARCHAR2(255),
    frete NUMBER,
    form_pgmt VARCHAR2(255),
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido__pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome),
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj)
);