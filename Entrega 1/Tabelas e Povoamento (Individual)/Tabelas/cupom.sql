CREATE TABLE Cupom (
    id INTEGER,
    cliente_cpf VARCHAR2(11),
    descricao VARCHAR2(255),
    desconto NUMBER, 
    CONSTRAINT cupom_pk PRIMARY KEY (id),
    CONSTRAINT cupom_fk FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf)
);