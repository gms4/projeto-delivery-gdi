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



CREATE TABLE tb_endereco OF tp_endereco(
	cep NOT NULL,
    rua NOT NULL,
    numero NOT NULL,
    bairro NOT NULL,
    cidade NOT NULL,
    estado NOT NULL, 
	PRIMARY KEY cep, numero  
);


CREATE TABLE tb_parceria OF tp_parceria(
	cnpj_contratante NOT NULL,
    cnpj_contratado NOT NULL,
    FOREIGN KEY cnpj_contratante REFERENCES tp_restaurante(cnpj),
    FOREIGN KEY cnpj_contratado REFERENCES tp_restaurante(cnpj)

);



CREATE TABLE tb_pedido_contem_prato OF tp_pedido_contem_prato(
	data_pedido NOT NULL,
    cliente_cpf NOT NULL,
    restaurante_cnpj NOT NULL,
    nome_prato NOT NULL,
	PRIMARY KEY (data_pedido, cliente_cpf, restaurante_cnpj, nome_prato),
    FOREIGN KEY (data_pedido) REFERENCES tp_pedido(data_pedido),
    FOREIGN KEY (cliente_cpf) REFERENCES tp_cliente(cpf),
    FOREIGN KEY (nome_prato, restaurante_cnpj) REFERENCES tp_pratos_do_restaurante(nome_prato, cnpj)
);

CREATE TABLE tb_pessoa OF tp_pessoa(
	cpf NOT NULL,
    nome NOT NULL,
    nascimento NOT NULL,
    telefone NOT NULL,
    email NOT NULL,
    cep_endereco NOT NULL,
    num_endereco NOT NULL,
    PRIMARY KEY (cpf),
    FOREIGN KEY (cep_endereco, num_endereco) REFERENCES tp_endereco(cep, numero)
);


CREATE TABLE tb_telefone_restaurante OF tb_telefone_restaurante(
	cnpj NOT NULL,
    telefone NOT NULL UNIQUE,
    PRIMARY KEY (cnpj, telefone),
    FOREIGN KEY (cnpj) REFERENCES tp_restaurante(cnpj)
);
