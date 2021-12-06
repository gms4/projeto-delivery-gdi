CREATE TABLE Entregador ( --herda de pessoa
    cpf VARCHAR2(11) NOT NULL, 
    data_admissao DATE NOT NULL, 
    renda NUMBER NOT NULL CHECK (renda >= 1100.00), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR2(255) NOT NULL, 
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);