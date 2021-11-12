CREATE TABLE Prato(
    nome VARCHAR2(255),
    cnpj VARCHAR2(14),
    preco NUMBER NOT NULL, --n existe almoço de graça
    categoria VARCHAR2(255),
    CONSTRAINT prato_pk PRIMARY KEY (nome, cnpj), 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj) 
);