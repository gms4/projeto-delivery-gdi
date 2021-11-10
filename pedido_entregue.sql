CREATE TABLE Pedido_entregue(
    cliente_cpf VARCHAR2(11) NOT NULL,
    restaurante_cnpj VARCHAR2(14) NOT NULL,
    prato_nome VARCHAR2(255) NOT NULL,
    entregador_cpf VARCHAR2(11) NOT NULL,
    frete NUMBER NOT NULL,
    form_pgmt VARCHAR2(255) NOT NULL,
    data_pedido DATE NOT NULL,
    CONSTRAINT pedido_entregue_pk PRIMARY KEY (cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf),
    CONSTRAINT pedido_entregue_fk1 FOREIGN KEY (cliente_cpf) REFERENCES Cliente(cpf),
    CONSTRAINT pedido_entregue_fk2 FOREIGN KEY (prato_nome, restaurante_cnpj) REFERENCES Prato(nome, cnpj),
    CONSTRAINT pedido_entregue_fk3 FOREIGN KEY (entregador_cpf) REFERENCES Entregador(cpf)
);

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569789', 'Azedinho', '6', 4.9, 'crédito', to_date('01/12/2020', 'dd/mm/yy')); 

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('3', '11829348569785', 'Temaki Philadelphia', '7', 5.9, 'débito', to_date('12/10/2020', 'dd/mm/yy'));
            
INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('4', '11829348569787', 'Casquinha de Siri', '8', 0, 'pix', to_date('12/10/2021', 'dd/mm/yy'));

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569786', 'Filé a Parmegiana', '6', 4.9, 'dinheiro', to_date('01/12/2021', 'dd/mm/yy')); 