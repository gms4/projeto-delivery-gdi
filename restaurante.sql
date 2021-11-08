CREATE TABLE Restaurante(
    cnpj VARCHAR(11),
    parceiro_cnpj VARCHAR(14),
    nome VARCHAR(255),
    telefone VARCHAR(255),
    cep VARCHAR(255),
    numero VARCHAR(255),
    rua VARCHAR(255),
    CONSTRAINT telefone_fk FOREIGN KEY (
    CONSTRAINT restaurante_pk PRIMARY KEY (cnpj),
    CONSTRAINT restaurante_fk FOREIGN KEY (parceiro_cnpj) REFERENCE Restaurante(cnpj)
);