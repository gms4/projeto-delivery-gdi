CREATE TABLE Telefone_restaurante (
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) UNIQUE NOT NULL,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);