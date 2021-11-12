--povoamento Pessoa

INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('703','uiusu', to_date('18/06/1997', 'dd/mm/yy'), '40028922','uium@mail.com',  '5021', 'fulano de tal', 1);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('4','bruna', to_date('17/06/1997', 'dd/mm/yy'), '40028922','bru@mail.com',  '50321', 'fulano de tal', 2);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('52','joao', to_date('16/06/1997', 'dd/mm/yy'), '40028922','joao@mail.com',  '50321', 'fulano de tal', 3);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('68','matheus', to_date('15/06/1997', 'dd/mm/yy'), '40028922','math@mail.com',  '50321', 'fulano de tal', 4);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('77','jojo', to_date('14/06/1997', 'dd/mm/yy'), '40028922','jojo@mail.com',  '50321', 'fulano de tal', 5);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('8','batata', to_date('13/06/1997', 'dd/mm/yy'), '40028922','batata@mail.com',  '50321', 'fulano de tal', 6);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('98','ygor', to_date('12/06/1997', 'dd/mm/yy'), '40028922','yg@mail.com',  '50321', 'fulano de tal', 7);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('23','digao', to_date('11/06/1997', 'dd/mm/yy'), '40028922','dig@mail.com',  '50321', 'fulano de tal', 8);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('45','samuel', to_date('10/06/1997', 'dd/mm/yy'), '40028922','sam@mail.com',  '50321', 'fulano de tal', 9);
INSERT INTO Pessoa(cpf, nome, nascimento, telefone, email, cep, rua, numero_casa) VALUES ('73','julia', to_date('09/06/1997', 'dd/mm/yy'), '40028922','ju@mail.com',  '50321', 'fulano de tal', 10);

select * from (Pessoa)