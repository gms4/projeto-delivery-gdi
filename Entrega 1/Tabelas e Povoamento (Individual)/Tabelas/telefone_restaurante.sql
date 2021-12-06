CREATE TABLE Telefone_restaurante ( --tabela para telefones (multi) do restaurante 
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);