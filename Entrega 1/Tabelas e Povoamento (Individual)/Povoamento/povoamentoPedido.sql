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