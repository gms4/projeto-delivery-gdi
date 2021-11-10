CREATE TABLE Entregador ( 
    cpf VARCHAR2(11) NOT NULL, 
    data_admissao DATE NOT NULL, 
    renda NUMBER CHECK (renda >= 1100.00), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR2(255), 
    horario_inicio NUMBER,
    horario_fim NUMBER,
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);