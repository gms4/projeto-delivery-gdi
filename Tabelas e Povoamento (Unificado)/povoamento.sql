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

--sequencia de id para pedido, pratos no pedido e avalia

CREATE SEQUENCE id INCREMENT by 1 START WITH 1;

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
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51900220', 'avenida relâmpago marquinhos', 11, 'caetés 2', 'cabo de santo agostinho', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50670901', 'Avenida Prof Moraes Rego', 1235, 'cidade universitária', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50741200', 'Rua Profa. Argemira Rego Barros', 144, 'várzea', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('51021090', 'Rua Dr. João Guilherme Pontes Sobrinho', 245, 'boa viagem', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('50110727', 'Avenida Recife', 2677, 'ipsep', 'recife', 'PE');
INSERT INTO Cep(cep, rua, numero, bairro, cidade, estado) VALUES ('52070020', 'Rua Raimundo Freixeiras', 175, 'casa amarela', 'recife', 'PE');

--povoamento pessoa

INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('1','uiusu', to_date('18/06/1992', 'dd/mm/yy'), '999182839','uium@mail.com',  '51900210');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('2','tobinho', to_date('11/05/2000', 'dd/mm/yy'), '999998849','tobinho@mail.com',  '51900211');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('3','joao', to_date('16/06/1996', 'dd/mm/yy'), '992314569','joao@mail.com',  '51900212');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('4','matheus', to_date('15/06/1991', 'dd/mm/yy'), '999670955','math@mail.com',  '51900213');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('5','jojo', to_date('14/06/1994', 'dd/mm/yy'), '987786765','jojo@mail.com',  '51900214');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('6','batata', to_date('13/06/1997', 'dd/mm/yy'), '944556677','batata@mail.com',  '51900215');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('7','ygor', to_date('12/06/1993', 'dd/mm/yy'), '990607080','yg@mail.com',  '51900216');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('8','digao', to_date('11/06/1995', 'dd/mm/yy'), '992345567','dig@mail.com',  '51900217');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('9','samuel', to_date('10/06/1997', 'dd/mm/yy'), '998765448','sam@mail.com',  '51900218');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('10','julia', to_date('09/06/1999', 'dd/mm/yy'), '978779907','ju@mail.com',  '51900219');
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep) VALUES ('11','kwai', to_date('15/07/1999', 'dd/mm/yy'), '999093847','kwai@mail.com',  '51900220'); --cliente e entregador

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

INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep) VALUES ('11829348569789', 'Cantina da Area 2', 5, '50670901');
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep) VALUES ('11829348569788', 'Brazzetus', 4, '50741200');
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep) VALUES ('11829348569787', 'Bode do Nô', 3, '51021090');
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep) VALUES ('11829348569786', 'Pizzaria Atlântico', 2, '50110727');
INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep) VALUES ('11829348569785', 'Udon Cozinha Oriental', 1, '52070020');

--povoamento pratos do restaurante

INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Coxinha', '11829348569789', '4.50', 'salgados');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Coca 500 ml', '11829348569789', '3.50', 'bebidas');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Filé com Fritas', '11829348569788', '20.90', 'petisco');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Macaxeira Frita', '11829348569788', '8.90', 'acompanhamento');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Casquinha de Siri', '11829348569787', '9.90', 'petisco');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Picanha Nobre ao Molho Quatro Queijos', '11829348569787', '109.9', 'carnes');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Filé a Parmegiana', '11829348569786', '30.90', 'executivo');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Pizza Grande de Frango Catupiry', '11829348569786', '59.90', 'pizzas');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Rodízio de Sushi Completo', '11829348569785', '74', 'rodízio');
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Temaki Philadelphia', '11829348569785', '18.90', 'temakis');

--povoamente telefones_restaurante

INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '999840948');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569789', '34287738');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569788', '44448888');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569788', '999097768');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569787', '34653051');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569786', '999083746');
INSERT INTO Telefone_restaurante (cnpj, telefone) VALUES ('11829348569785', '33320994');

--povoamento pedido

INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, entregador_cpf, horario_inicio, horario_fim,
                form_pgmt, data_pedido) VALUES (id.NEXTVAL, '1', '11829348569789', '6', 8, 9, 'crédito', to_date('01/12/2020', 'dd/mm/yy'));
INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, entregador_cpf, horario_inicio, horario_fim, 
                form_pgmt, data_pedido) VALUES (id.NEXTVAL, '2', '11829348569788', '7', 18, 19, 'débito', to_date('13/11/2020', 'dd/mm/yy'));  
INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, entregador_cpf, horario_inicio, horario_fim, 
                form_pgmt, data_pedido) VALUES (id.NEXTVAL, '3', '11829348569787', '8', 18, 19, 'débito', to_date('12/10/2020', 'dd/mm/yy'));
INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, entregador_cpf, horario_inicio, horario_fim,
                form_pgmt, data_pedido) VALUES (id.NEXTVAL, '4', '11829348569786', '9', 18, 19, 'pix', to_date('16/10/2021', 'dd/mm/yy'));           
INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, form_pgmt, data_pedido) --pedido que o cliente foi ao local pegar
                VALUES (id.NEXTVAL, '5', '11829348569785', 'crédito', to_date('01/12/2021', 'dd/mm/yy'));
/*INSERT INTO Pedido(id, cliente_cpf, restaurante_cnpj, entregador_cpf, horario_inicio, horario_fim, --testando erro
                form_pgmt, data_pedido) VALUES (id.NEXTVAL, '11', '11829348569786', '11', 18, 19, 'pix', to_date('16/10/2021', 'dd/mm/yy'));*/

--povoamento parceria

INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('11829348569789', '');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('11829348569788', '11829348569787');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('11829348569788', '11829348569786');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('11829348569785', '11829348569786');
INSERT INTO Parceria(cnpj_contratante, cnpj_contratado) VALUES ('11829348569787', '11829348569788');

--povoamento pratos_do_pedido

INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (1, 11829348569789, 'Coxinha');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (1, 11829348569789, 'Coca 500 ml');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (2, 11829348569788, 'Filé com Fritas');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (2, 11829348569788, 'Macaxeira Frita');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (3, 11829348569787, 'Casquinha de Siri');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (3, 11829348569787, 'Picanha Nobre ao Molho Quatro Queijos');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (4, 11829348569786, 'Pizza Grande de Frango Catupiry');
INSERT INTO Pratos_do_pedido(id_pedido, restaurante_cnpj, prato_nome) VALUES (5, 11829348569785, 'Rodízio de Sushi Completo');

--povoamento avalia

INSERT INTO Avalia(id_pedido, nota_c_e, nota_c_r, nota_r_e) VALUES (1, 5, 5, 5);
INSERT INTO Avalia(id_pedido, nota_c_e, nota_c_r, nota_r_e) VALUES (2, 4, 5, 3);
INSERT INTO Avalia(id_pedido, nota_c_e, nota_c_r, nota_r_e) VALUES (3, 5, 2, 5);
INSERT INTO Avalia(id_pedido, nota_c_e, nota_c_r, nota_r_e) VALUES (4, 3, 2, 1);
INSERT INTO Avalia(id_pedido, nota_c_r) VALUES (5, 4);

select * from (Cep);
select * from (Pessoa);
select * from (Cliente);
select * from (Entregador);
select * from (Restaurante);
select * from (Pratos_do_restaurante);
select * from (Telefone_restaurante);
select * from (Pedido);
select * from (Parceria);
select * from (Pratos_do_pedido);
select * from (Avalia);