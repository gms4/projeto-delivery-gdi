CREATE TABLE Restaurante(
    cnpj VARCHAR2(14) NOT NULL,
    parceiro_cnpj VARCHAR2(14),
    nome VARCHAR2(255) NOT NULL,
    cep VARCHAR2(255),
    rua VARCHAR2(255),
    numero_rest VARCHAR2(255),
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk FOREIGN KEY (parceiro_cnpj) REFERENCES Restaurante(cnpj) --auto relacionamento parceiro
);