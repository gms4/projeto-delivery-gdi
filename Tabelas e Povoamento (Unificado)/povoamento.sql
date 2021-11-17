/*

CHECKLIST PRIMEIRA ENTREGA

create table (done)
alter table (done)
constraint (done)
create sequence (done)
check (done)
create index (done)
insert into (done)

*/

--sequence para id do cupom
CREATE SEQUENCE id INCREMENT by 1 START WITH 1;

--formatando data e hora
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';

--diminuindo o tamanho do varchar2 de telefone pra poupar espaço
ALTER TABLE Telefone_restaurante MODIFY (telefone VARCHAR2(11));

--facilitando o acesso ao pedido
CREATE INDEX indice_pedido ON Pedido(cliente_cpf, nome_prato);

--povoamento cep

INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900210', 'rua cachorro nogueira', 1, 'tamarineira', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900211', 'rua gato sampaio', 2, 'tejipió', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900212', 'avenida pelicano de arruda matos', 3, 'casa forte', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900213', 'rua siri cascudo', 4, 'prado', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900214', 'avenida capivara do capibaribe', 5, 'zumbi', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900215', 'avenida castor madeireiro', 6, 'madalena', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900216', 'rua guaxinim roxo', 7, 'casa amarela', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900217', 'rua porquinho do quirquistão', 8, 'boa viagem', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900218', 'rua marreco da silva', 9, 'setubal', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900219', 'avenida pônei veloz', 10, 'piedade', 'jaboatão dos guararapes', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51900220', 'avenida relâmpago marquinhos', 11, 'caetés 2', 'cabo de santo agostinho', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('50670901', 'Avenida Prof Moraes Rego', 1235, 'cidade universitária', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('50741200', 'Rua Profa. Argemira Rego Barros', 144, 'várzea', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('51021090', 'Rua Dr. João Guilherme Pontes Sobrinho', 245, 'boa viagem', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('50110727', 'Avenida Recife', 2677, 'ipsep', 'recife', 'PE');
INSERT INTO Endereco(cep, rua, numero, bairro, cidade, estado) VALUES ('52070020', 'Rua Raimundo Freixeiras', 175, 'casa amarela', 'recife', 'PE');

--povoamento pessoa

INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('1','uiusu', to_date('18/06/1992', 'dd/mm/yy'), '999182839','uium@mail.com',  '51900210', 1);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('2','tobinho', to_date('11/05/2000', 'dd/mm/yy'), '999998849','tobinho@mail.com',  '51900211', 2);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('3','joao', to_date('16/06/1996', 'dd/mm/yy'), '992314569','joao@mail.com',  '51900212', 3);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('4','matheus', to_date('15/06/1991', 'dd/mm/yy'), '999670955','math@mail.com',  '51900213', 4);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('5','jojo', to_date('14/06/1994', 'dd/mm/yy'), '987786765','jojo@mail.com',  '51900214', 5);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('6','batata', to_date('13/06/1997', 'dd/mm/yy'), '944556677','batata@mail.com',  '51900215', 6);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('7','ygor', to_date('12/06/1993', 'dd/mm/yy'), '990607080','yg@mail.com',  '51900216', 7);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('8','digao', to_date('11/06/1995', 'dd/mm/yy'), '992345567','dig@mail.com',  '51900217', 8);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('9','samuel', to_date('10/06/1997', 'dd/mm/yy'), '998765448','sam@mail.com',  '51900218', 9);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('10','julia', to_date('09/06/1999', 'dd/mm/yy'), '978779907','ju@mail.com',  '51900219', 10);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep_endereco, num_endereco) VALUES ('11','kwai', to_date('15/07/1999', 'dd/mm/yy'), '999093847','kwai@mail.com',  '51900220', 11);

--povoamento cliente

INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('22/08/2018', 'dd/mm/yy'), '1');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('20/07/2017', 'dd/mm/yy'), '2');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('16/06/2015', 'dd/mm/yy'), '3');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('15/06/2020', 'dd/mm/yy'), '4');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('14/06/2021', 'dd/mm/yy'), '5');
INSERT INTO Cliente(dt_criacao_conta, cpf) VALUES (to_date('15/05/2018', 'dd/mm/yy'), '11');

--povoamento entregador

INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('6', to_date('01/12/2020', 'dd/mm/yy'), '1600', 'moto');
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('7', to_date('12/10/2020', 'dd/mm/yy'), '1700', 'bicicleta');
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('8', to_date('30/03/2021', 'dd/mm/yy'), '1800', 'skate');
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('9', to_date('21/02/2021', 'dd/mm/yy'), '1900', 'patinete elétrico');
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('10', to_date('01/12/2020', 'dd/mm/yy'), '2000', 'patinete');
INSERT INTO Entregador (cpf, data_admissao, renda, veiculo) VALUES ('11', to_date('14/05/2019', 'dd/mm/yy'), '2100', 'mobilete');

--povoamento restaurante

INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco) VALUES ('9', 'Cantina da Area 2', 5, '50670901', 1235);
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco) VALUES ('8', 'Brazzetus', 4, '50741200', 144);
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco) VALUES ('7', 'Bode do Nô', 3, '51021090', 245);
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco) VALUES ('6', 'Pizzaria Atlântico', 2, '50110727', 2677);
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco) VALUES ('5', 'Udon Cozinha Oriental', 1, '52070020', 175);

--povoamento pratos do restaurante

INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Coxinha', '9', '4.50', 'salgados');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Coca 500 ml', '9', '3.50', 'bebidas');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Filé com Fritas', '8', '20.90', 'petisco');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Macaxeira Frita', '8', '8.90', 'acompanhamento');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Casquinha de Siri', '7', '9.90', 'petisco');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Picanha Nobre ao Molho Quatro Queijos', '7', '109.9', 'carnes');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Filé a Parmegiana', '6', '30.90', 'executivo');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Pizza Grande de Frango Catupiry', '6', '59.90', 'pizzas');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Rodízio de Sushi Completo', '5', '74', 'rodízio');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Temaki Philadelphia', '5', '18.90', 'temakis');

--povoamente telefones_restaurante

INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('9', '999840948');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('9', '34287738');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('8', '44448888');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('8', '999097768');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('7', '34653051');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('6', '999083746');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('5', '33320994');

--povoamento parceria

INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('9', '');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('8', '7');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('8', '6');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('5', '6');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('7', '8');

--povoamento cupom

INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '1', '12 reais para conhecer novos restaurantes', 12);
INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '2', '5 reais para compras no débito', 5);
INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '3', 'promoção em comemoração ao aniversário de annalu', 15);
INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '4', '10 reais de desconto usando pix', 10);
INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '5', '8 reais para pedidos pegos no local', 8);
INSERT INTO Cupom(id, cliente_cpf, descricao, desconto) VALUES (id.NEXTVAL, '', '7 reais para novos usuários', 7);

--povoamento pedido

INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, entregador_cpf, horario_inicio, horario_fim,
                form_pgmt, nota_c_e, nota_c_r, nota_r_e) VALUES ('1', '9', TIMESTAMP '2020-01-01 17:00:00', 2,'6', TIMESTAMP '2020-01-01 18:00:00', TIMESTAMP '2020-01-01 18:30:00', 'débito', 5, 5, 5);
INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, entregador_cpf, horario_inicio, horario_fim, 
                form_pgmt, nota_c_e, nota_c_r, nota_r_e) VALUES ('2', '8', TIMESTAMP '2021-03-10 13:00:00', 1, '7', TIMESTAMP '2021-03-10 13:30:00', TIMESTAMP '2021-03-10 14:00:00', 'crédito', 5, 4, 3);  
INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, entregador_cpf, horario_inicio, horario_fim, 
                form_pgmt, nota_c_e, nota_c_r, nota_r_e) VALUES ('3', '7', TIMESTAMP '2021-10-12 15:00:00', 3, '8', TIMESTAMP '2021-10-12 15:40:00', TIMESTAMP '2021-10-12 16:10:00', 'vale alimentação', 4, 4, 3);
INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, entregador_cpf, horario_inicio, horario_fim,
                form_pgmt, nota_c_e, nota_c_r, nota_r_e) VALUES ('4', '6', TIMESTAMP '2021-05-06 18:00:00', 4, '9', TIMESTAMP '2021-05-06 19:00:00', TIMESTAMP '2021-05-06 20:00:00', 'pix', 4, 3, 2);           
INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, form_pgmt, nota_c_r)
                                                         VALUES ('5', '5', TIMESTAMP '2021-07-09 18:00:00', 5, 'dinheiro', 5);
/*INSERT INTO Pedido(cliente_cpf, restaurante_cnpj, data_pedido, id_cupom, entregador_cpf, horario_inicio, horario_fim, --testando erro de entregador entregando pra si mesmo
                form_pgmt, nota_c_e, nota_c_r, nota_r_e) VALUES ('11', '6', TIMESTAMP '2021-05-06 14:00:00', 6, '11', TIMESTAMP '2021-05-06 15:00:00', TIMESTAMP '2021-05-06 16:00:00', 'pix', 3, 4, 5);*/

--povoamento pedido contém prato

INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2020-01-01 17:00:00', '1', '9', 'Coxinha');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2020-01-01 17:00:00', '1', '9', 'Coca 500 ml');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-03-10 13:00:00', '2', '8', 'Filé com Fritas');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-03-10 13:00:00', '2', '8', 'Macaxeira Frita');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-10-12 15:00:00', '3', '7', 'Casquinha de Siri');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-10-12 15:00:00', '3', '7', 'Picanha Nobre ao Molho Quatro Queijos');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-05-06 18:00:00', '4', '6', 'Filé a Parmegiana');
INSERT INTO Pedido_contem_prato(data_pedido, cliente_cpf, restaurante_cnpj, nome_prato) 
                VALUES (TIMESTAMP '2021-07-09 18:00:00', '5', '5', 'Rodízio de Sushi Completo');

select * from (Endereco);
select * from (Pessoa);
select * from (Cliente);
select * from (Entregador);
select * from (Restaurante);
select * from (Pratos_do_restaurante);
select * from (Telefone_restaurante);
select * from (Cupom);
select * from (Parceria);
select * from (Pedido);
select * from (Pedido_contem_prato);