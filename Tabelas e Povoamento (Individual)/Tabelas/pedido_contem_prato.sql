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