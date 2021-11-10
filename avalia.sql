CREATE TABLE Avalia(
    entregador_cpf VARCHAR2(11),
    cliente_cpf VARCHAR2(11),
    restaurante_cnpj VARCHAR2(14),
    nota_c_e NUMBER CHECK (nota_c_e >= 1 AND nota_c_e <= 5), 
    nota_c_r NUMBER NOT NULL CHECK (nota_c_r >= 1 AND nota_c_r <= 5),
    nota_e_c NUMBER CHECK (nota_e_c >= 1 AND nota_e_c <= 5),
    nota_r_e NUMBER CHECK (nota_r_e >= 1 AND nota_r_e <= 5),
    --CONSTRAINT avalia_pk PRIMARY KEY (entregador_cpf, cliente_cpf, restaurante_cnpj),
    CONSTRAINT avalia_fk1 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf),
    CONSTRAINT avalia_fk2 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT avalia_fk3 FOREIGN KEY (restaurante_cnpj) REFERENCES Restaurante(cnpj)
);