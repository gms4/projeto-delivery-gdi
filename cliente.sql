CREATE TABLE Cliente(
    cpf VARCHAR(11) NOT NULL,
    data_criacao DATE NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cpf),
    CONSTRAINT cliente_fk FOREIGN KEY (cpf) REFERENCE Pessoa(cpf),
);