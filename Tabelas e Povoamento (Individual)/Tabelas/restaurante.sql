CREATE TABLE Restaurante(
    cnpj VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    frete_fixo NUMBER NOT NULL,
    cep_endereco VARCHAR2(255) NOT NULL,
    num_endereco NUMBER NOT NULL,
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk FOREIGN KEY (cep_endereco, num_endereco) REFERENCES Endereco(cep, numero)
);