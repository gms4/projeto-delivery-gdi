CREATE TABLE Telefone_restaurante (
    cnpj VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(255) UNIQUE NOT NULL,
    CONSTRAINT telefone_restaurante_pk PRIMARY KEY (cnpj, telefone),
    CONSTRAINT telefone_restaurante_fk FOREIGN KEY (cnpj) REFERENCES Restaurante(cnpj)
);

INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '999840948');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '34287738');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569788', '44448888');

select * from (Telefone_restaurante)