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

) NESTED TABLE pratos STORE AS pratos_no_cardápio;

/

CREATE TABLE tb_cupom OF tp_cupom (

    id PRIMARY KEY,
    cliente SCOPE IS tb_cliente, -- RESTRINGE O ESCOPO DE REFERÊNCIAS PARA UMA ÚNICA TABELA --
    descricao NOT NULL

);

/

CREATE TABLE tb_parceria OF tp_parceria (
    contratante NOT NULL,
    contratado NOT NULL
);

/

-- ROWID: IMPORTA O OID E A IDENTIFICAÇÃO FISICA DA LINHA ONDE O OBJETO ESTÁ ARMAZENADO --
-- MANTÉM ACESSO DIRETO --
CREATE TABLE tb_pedido OF tp_pedido (

    cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    restaurante WITH ROWID REFERENCES tb_restaurante NOT NULL,
    data_pedido PRIMARY KEY,
    cupom WITH ROWID REFERENCES tb_cupom,
    entregador WITH ROWID REFERENCES tb_entregador,  
    pagamento NOT NULL
    
);

/

CREATE TABLE tb_detalhamento OF tp_detalhamento (

    pedido WITH ROWID REFERENCES tb_pedido NOT NULL,
    cliente WITH ROWID REFERENCES tb_cliente NOT NULL,
    restaurante WITH ROWID REFERENCES tb_restaurante NOT NULL,
    prato NOT NULL UNIQUE

);

/
