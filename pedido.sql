CREATE TABLE Pedido(
    cliente_cpf,
    restaurante_cnpj,
    prato_nome VARCHAR2(255),
    frete NUMBER,
    from_pgmt VARCHAR2(255),
    data_pedido DATE NOT NULL,
);