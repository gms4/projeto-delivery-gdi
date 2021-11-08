CREATE TABLE Prato(
    nome VARCHAR(255),
    cnpj VARCHAR(14),
    preco NUMBER,
    categoria VARCHAR(255),
    CONSTRAINT prato_pk PRIMARY KEY (nome, cnpj) 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCE Restaurante(cnpj) 
);