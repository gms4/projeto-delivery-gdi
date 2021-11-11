CREATE TABLE Pedido_entregue(
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    prato_nome VARCHAR2(255) NOT NULL,
    entregador_cpf VARCHAR2(11) NOT NULL,
    frete NUMBER NOT NULL,
    form_pgmt VARCHAR2(255) NOT NULL,
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido_entregue_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf),
    CONSTRAINT pedido_entregue_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_entregue_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj),
    CONSTRAINT pedido_entregue_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf)
);