--povoamento pessoa

INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('1','uiusu', to_date('18/06/1992', 'dd/mm/yy'), '999182839','uium@mail.com',  '51900210', 'rua cachorro nogueira', 1);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('2','bruna', to_date('17/06/1995', 'dd/mm/yy'), '993847390','bru@mail.com',  '51900211', 'rua gato sampaio', 2);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('3','joao', to_date('16/06/1996', 'dd/mm/yy'), '992314569','joao@mail.com',  '51900212', 'avenida pelicano de arruda matos', 3);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('4','matheus', to_date('15/06/1991', 'dd/mm/yy'), '999670955','math@mail.com',  '51900213', 'rua siri cascudo', 4);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('5','jojo', to_date('14/06/1994', 'dd/mm/yy'), '987786765','jojo@mail.com',  '51900214', 'avenida capivara do capibaribe', 5);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('6','batata', to_date('13/06/1997', 'dd/mm/yy'), '944556677','batata@mail.com',  '51900215', 'avenida castor madeireiro', 6);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('7','ygor', to_date('12/06/1993', 'dd/mm/yy'), '990607080','yg@mail.com',  '51900216', 'rua guaxinim roxo', 7);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('8','digao', to_date('11/06/1995', 'dd/mm/yy'), '992345567','dig@mail.com',  '51900217', 'rua porquinho do quirquistão', 8);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('9','samuel', to_date('10/06/1997', 'dd/mm/yy'), '998765448','sam@mail.com',  '51900218', 'rua marreco da silva', 9);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('10','julia', to_date('09/06/1999', 'dd/mm/yy'), '978779907','ju@mail.com',  '51900219', 'avenida pônei veloz', 10);

--select * from (Pessoa)

--povoamento cliente

INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('22/08/2018', 'dd/mm/yy'), '1');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('17/06/2017', 'dd/mm/yy'), '2');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('16/06/2015', 'dd/mm/yy'), '3');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('15/06/2020', 'dd/mm/yy'), '4');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('14/06/2021', 'dd/mm/yy'), '5');

--povoamento restaurante

INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep, rua, numero_rest) VALUES ('11829348569789', '', 'Cantina da Area 2', '50670901', 'Avenida Prof Moraes Rego', '1235');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep, rua, numero_rest) VALUES ('11829348569788', '11829348569789', 'Brazzetus', '50741200', 'Rua Profa. Argemira Rego Barros'. '144');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep, rua, numero_rest) VALUES ('11829348569787', '11829348569788', 'Bode do Nô', '51021090', 'Rua Dr. João Guilherme Pontes Sobrinho', '245');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep, rua, numero_rest) VALUES ('11829348569786', '', 'Pizzaria Atlântico', '50110727', 'Avenida Recife', '2677');
INSERT INTO Restaurante(cnpj, parceiro_cnpj, nome, cep, rua, numero_rest) VALUES ('11829348569785', '', 'Udon Cozinha Oriental', '52070020', 'Rua Raimundo Freixeiras', '175');