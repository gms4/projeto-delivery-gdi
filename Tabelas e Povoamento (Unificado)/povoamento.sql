--povoamento cep

INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900210', 'rua cachorro nogueira', 1, 'tamarineira', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900211', 'rua gato sampaio', 2, 'tejipió', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900212', 'avenida pelicano de arruda matos', 3, 'casa forte', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900213', 'rua siri cascudo', 4, 'prado', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900214', 'avenida capivara do capibaribe', 5, 'zumbi', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900215', 'avenida castor madeireiro', 6, 'madalena', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900216', 'rua guaxinim roxo', 7, 'casa amarela', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900217', 'rua porquinho do quirquistão', 8, 'boa viagem', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900218', 'rua marreco da silva', 9, 'setubal', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900219', 'avenida pônei veloz', 10, 'piedade', 'jaboatão dos guararapes', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50670901', 'Avenida Prof Moraes Rego', 1235, 'cidade universitária', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50741200', 'Rua Profa. Argemira Rego Barros', 144, 'várzea', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51021090', 'Rua Dr. João Guilherme Pontes Sobrinho', 245, 'boa viagem', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50110727', 'Avenida Recife', 2677, 'ipsep', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('52070020', 'Rua Raimundo Freixeiras', 175, 'casa amarela', 'recife', 'PE');

--povoamento pessoa

INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('1','uiusu', to_date('18/06/1992', 'dd/mm/yy'), '999182839','uium@mail.com',  '51900210');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('3','joao', to_date('16/06/1996', 'dd/mm/yy'), '992314569','joao@mail.com',  '51900212');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('4','matheus', to_date('15/06/1991', 'dd/mm/yy'), '999670955','math@mail.com',  '51900213');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('5','jojo', to_date('14/06/1994', 'dd/mm/yy'), '987786765','jojo@mail.com',  '51900214');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('6','batata', to_date('13/06/1997', 'dd/mm/yy'), '944556677','batata@mail.com',  '51900215');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('7','ygor', to_date('12/06/1993', 'dd/mm/yy'), '990607080','yg@mail.com',  '51900216');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('8','digao', to_date('11/06/1995', 'dd/mm/yy'), '992345567','dig@mail.com',  '51900217');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('9','samuel', to_date('10/06/1997', 'dd/mm/yy'), '998765448','sam@mail.com',  '51900218');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('10','julia', to_date('09/06/1999', 'dd/mm/yy'), '978779907','ju@mail.com',  '51900219');

--povoamento cliente

INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('22/08/2018', 'dd/mm/yy'), '1');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('16/06/2015', 'dd/mm/yy'), '3');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('15/06/2020', 'dd/mm/yy'), '4');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('14/06/2021', 'dd/mm/yy'), '5');

--povoamento entregador

INSERT INTO Entregador (cpf, data_admissao, renda, veiculo, horario_inicio, horario_fim) VALUES ('6', to_date('01/12/2020', 'dd/mm/yy'), '1600', 'moto', 8, 18);
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo, horario_inicio, horario_fim) VALUES ('7', to_date('12/10/2020', 'dd/mm/yy'), '1700', 'bicicleta', 8, 18);
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo, horario_inicio, horario_fim) VALUES ('8', to_date('30/03/2021', 'dd/mm/yy'), '1800', 'skate', 8, 18);
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo, horario_inicio, horario_fim) VALUES ('9', to_date('21/02/2021', 'dd/mm/yy'), '1900', 'patinete elétrico', 8, 18);
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo, horario_inicio, horario_fim) VALUES ('10', to_date('01/12/2020', 'dd/mm/yy'), '2000', 'patinete', 8, 18);

--povoamento restaurante

INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep) VALUES ('11829348569789', '', 'Cantina da Area 2', '50670901');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep) VALUES ('11829348569788', '11829348569789', 'Brazzetus', '50741200');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep) VALUES ('11829348569787', '11829348569788', 'Bode do Nô', '51021090');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep) VALUES ('11829348569786', '', 'Pizzaria Atlântico', '50110727');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep) VALUES ('11829348569785', '', 'Udon Cozinha Oriental', '52070020');

--povoamento prato

INSERT INTO Prato(nome, cnpj, preco, categoria) VALUES ('Filé a Parmegiana', '11829348569786', '30.90', 'prato executivo');
INSERT INTO Prato(nome, cnpj, preco, categoria) VALUES ('Casquinha de Siri', '11829348569787', '9.90', 'petisco');
INSERT INTO Prato(nome, cnpj, preco, categoria) VALUES ('Temaki Philadelphia', '11829348569785', '18.90', 'temakis');
INSERT INTO Prato(nome, cnpj, preco, categoria) VALUES ('Azedinho', '11829348569789', '0.15', 'doces');

--povoamente telefones_restaurante

INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '999840948');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '34287738');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569788', '44448888');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569788', '999097768');

--povoamento pedido_entregue

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569789', 'Azedinho', '6', 4.9, 'crédito', to_date('01/12/2020', 'dd/mm/yy')); 

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('3', '11829348569785', 'Temaki Philadelphia', '7', 5.9, 'débito', to_date('12/10/2020', 'dd/mm/yy'));
            
INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('4', '11829348569787', 'Casquinha de Siri', '8', 0, 'pix', to_date('12/10/2021', 'dd/mm/yy'));

INSERT INTO Pedido_entregue(cliente_cpf, restaurante_cnpj, prato_nome, entregador_cpf, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569786', 'Filé a Parmegiana', '6', 4.9, 'dinheiro', to_date('01/12/2021', 'dd/mm/yy')); 

--povoamento pedido

INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, prato_nome, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569789', 'Azedinho', 0, 'crédito', to_date('01/12/2020', 'dd/mm/yy')); 

INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, prato_nome, 
                frete, form_pgmt, data_pedido) VALUES ('3', '11829348569785', 'Temaki Philadelphia', 0, 'débito', to_date('12/10/2020', 'dd/mm/yy'));
            
INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, prato_nome, 
                frete, form_pgmt, data_pedido) VALUES ('4', '11829348569787', 'Casquinha de Siri', 0, 'pix', to_date('12/10/2021', 'dd/mm/yy'));

INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, prato_nome, 
                frete, form_pgmt, data_pedido) VALUES ('1', '11829348569786', 'Filé a Parmegiana', 0, 'dinheiro', to_date('01/12/2021', 'dd/mm/yy')); 

--povoamento avalia

INSERT INTO Avalia(entregador_cpf, cliente_cpf, restaurante_cnpj, 
        nota_c_e, nota_c_r, nota_e_c, nota_r_e) VALUES ('6', '1', '11829348569789', 5, 5, 5, 5);
INSERT INTO Avalia(entregador_cpf, cliente_cpf, restaurante_cnpj, 
        nota_c_e, nota_c_r, nota_e_c, nota_r_e) VALUES ('', '3', '11829348569785', '', 5, '', '');
INSERT INTO Avalia(entregador_cpf, cliente_cpf, restaurante_cnpj, 
        nota_c_e, nota_c_r, nota_e_c, nota_r_e) VALUES ('8', '4', '11829348569787', 5, 2, 5, 5);
INSERT INTO Avalia(entregador_cpf, cliente_cpf, restaurante_cnpj, 
        nota_c_e, nota_c_r, nota_e_c, nota_r_e) VALUES ('6', '1', '11829348569786', 3, 2, 4, 1);