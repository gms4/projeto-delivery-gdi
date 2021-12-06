CREATE TABLE Pessoa (
    cpf VARCHAR2(11) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    nascimento DATE NOT NULL,
    telefone VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL,
    cep_endereco VARCHAR2(255) NOT NULL,
    num_endereco NUMBER NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY (cep_endereco, num_endereco) REFERENCES Endereco(cep, numero)
);
