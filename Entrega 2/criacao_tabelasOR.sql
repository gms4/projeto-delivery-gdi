CREATE TABLE tb_cliente OF tp_cliente (
    
    data_criacao,
    cpf PRIMARY KEY

);

/

CREATE TABLE tb_entregador OF tp_entregador(

    cpf PRIMARY KEY,
    data_admissao NOT NULL,
    renda NOT NULL,
    veiculo NOT NULL

);

/

CREATE TABLE tb_restaurante OF tp_restaurante (

    cnpj PRIMARY KEY,
    nome NOT NULL,
    frete NOT NULL,
    endereco NOT NULL,
    telefones NOT NULL

) NESTED TABLE pratos STORE AS pratos_restaurante;

/

CREATE TABLE tb_cupom OF tp_cupom (

    cpf WITH ROWID REFERENCES tb_cliente,
    desconto NOT NULL,
    descricao NOT NULL,

);

/

CREATE TABLE tb_pedido OF tp_pedido (

    data_pedido PRIMARY KEY,
    forma_pgmt NOT NULL,
    

);

/

CREATE TABLE tb_prato OF tp_prato (

    nome PRIMARY KEY,
    preco NOT NULL,
    categoria NOT NULL,
    cnpj WITH ROWID REFERENCES tb_restaurante NOT NULL

);