CREATE TABLE Pratos_do_restaurante( --entidade fraca de restaurante
    nome_prato VARCHAR2(255) NOT NULL,
    cnpj VARCHAR2(14) NOT NULL,
    preco NUMBER NOT NULL, --n existe almoço de graça
    categoria VARCHAR2(255) NOT NULL,
    CONSTRAINT prato_pk PRIMARY KEY (nome_prato, cnpj), 
    CONSTRAINT prato_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);