CREATE TABLE ENTREGADOR( 
    cpf VARCHAR(11) NOT NULL, 
    data_admissao DATE NOT NULL, 
    renda NUMBER CHECK (renda >= 1100), --abaixo do salario mínino no nosso app não
    veiculo VARCHAR(255), 
    horario_inicio TIME (0),
    horario_fim TIME(0),
    CONSTRAINT entregador_pk PRIMARY KEY (cpf), 
    CONSTRAINT entregador_fk FOREIGN KEY (cpf) REFERENCE Pessoa(cpf),
     
     
     
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('1', to_date('09/10/2021', 'dd/mm/yy'), '1000', 'moto', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('2', to_date('06/02/2021', 'dd/mm/yy'), '1000', 'patinete', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('3', to_date('27/05/2021', 'dd/mm/yy'), '1000', 'bicicleta', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('4', to_date('13/01/2020', 'dd/mm/yy'), '1000', 'patinete', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('5', to_date('02/05/2021', 'dd/mm/yy'), '1000', 'moto', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('6', to_date('01/12/2020', 'dd/mm/yy'), '1000', 'moto', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('7', to_date('12/10/2020', 'dd/mm/yy'), '1000', 'bicicleta', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('8', to_date('30/03/2021', 'dd/mm/yy'), '1000', 'moto', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('9', to_date('21/02/2021', 'dd/mm/yy'), '1000', 'bicicleta', '08:00:00', '18:00:00')
INSERT INTO ENTREGADOR(CPF, DATA_ADMISSAO, RENDA, VEICULO) VALUES ('10', to_date('01/12/2020', 'dd/mm/yy'), '1000', 'bicicleta', '08:00:00', '18:00:00')