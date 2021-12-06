CREATE TABLE Parceria( --auto relacionamento
    cnpj_contratante VARCHAR2(14) NOT NULL,
    cnpj_contratado VARCHAR2(14),
    CONSTRAINT parceria_fk1 FOREIGN KEY (cnpj_contratante) REFERENCES Restaurante(cnpj),
    CONSTRAINT parceria_fk2 FOREIGN KEY (cnpj_contratado) REFERENCES Restaurante(cnpj)
);