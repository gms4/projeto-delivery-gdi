CREATE TABLE Pedido( --entidade associativa
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    data_pedido TIMESTAMP NOT NULL UNIQUE,
    id_cupom INTEGER,
    entregador_cpf VARCHAR2(11),
    horario_inicio TIMESTAMP,
    horario_fim TIMESTAMP,
    form_pgmt VARCHAR2(255) NOT NULL,
    nota_c_e NUMBER CHECK (nota_c_e >= 1 AND nota_c_e <= 5),
    nota_c_r NUMBER CHECK (nota_c_r >= 1 AND nota_c_r <= 5),
    nota_r_e NUMBER CHECK (nota_r_e >= 1 AND nota_r_e <= 5),
    CONSTRAINT pedido_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, data_pedido), 
    CONSTRAINT pedido_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_fk2 FOREIGN KEY (restaurante_cnpj) REFERENCES Restaurante(cnpj),
    CONSTRAINT pedido_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf),
    CONSTRAINT pedido_fk4 FOREIGN KEY (id_cupom) REFERENCES Cupom(id)
);