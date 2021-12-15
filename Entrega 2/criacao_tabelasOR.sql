CREATE TABLE tb_cliente OF tp_cliente (
    
    cpf PRIMARY KEY,
    data_criacao NOT NULL

);

/

CREATE TABLE tb_entregador OF tp_entregador(

    cpf PRIMARY KEY,
    data_admissao NOT NULL,
    renda NOT NULL CHECK (renda >= 1100.00),
    veiculo NOT NULL

);

/

CREATE TABLE tb_restaurante OF tp_restaurante (

    cnpj PRIMARY KEY,
    nome NOT NULL,
    frete NOT NULL,
    endereco NOT NULL,
    telefones NOT NULL

);

/

CREATE TABLE tb_cupom OF tp_cupom (

    id PRIMARY KEY,
    cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    descricao NOT NULL

);

/

CREATE TABLE tb_parceria OF tp_parceria (
    contratante NOT NULL,
    contratado NOT NULL
);

/

CREATE TABLE tb_prato OF tp_prato (

    nome PRIMARY KEY NOT NULL,
    preco NOT NULL,
    categoria NOT NULL,
    restaurante WITH ROWID REFERENCES tb_restaurante NOT NULL

);

/

CREATE TABLE tb_pedido OF tp_pedido (

    cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    restaurante WITH ROWID REFERENCES tb_restaurante NOT NULL,
    data_pedido PRIMARY KEY,
    cupom WITH ROWID REFERENCES tb_cupom,
    entregador WITH ROWID REFERENCES tb_entregador,  
    pagamento NOT NULL
    
);

/

CREATE TABLE tb_endereco OF tp_endereco(

    cep NOT NULL,
    rua NOT NULL,
    numero NOT NULL,
    bairro NOT NULL,
    cidade NOT NULL,
    estado NOT NULL, 
    PRIMARY KEY (cep, numero)  
    
);

/

CREATE TABLE tb_detalhamento OF tp_detalhamento (

    id_detalhamento PRIMARY KEY,
    pedido WITH ROWID REFERENCES tb_pedido NOT NULL,
    cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    restaurante WITH ROWID REFERENCES tb_restaurante NOT NULL,
    prato WITH ROWID REFERENCES tb_prato NOT NULL

);

/
