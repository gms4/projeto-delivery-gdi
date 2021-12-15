ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';
/
CREATE SEQUENCE id INCREMENT by 1 START WITH 1;
/ 
CREATE SEQUENCE id_detalhamento INCREMENT by 1 START WITH 1;
----- POVOAMENTO CLIENTE -----
INSERT INTO tb_cliente VALUES ( 
    tp_cliente( 
        '1', 
        'Guigs', 
        to_date('11/08/1995', 'dd/mm/yy'), 
        '20', 
        tp_endereco( 
            '50', 
            'rua carlos pereira falquinho', 
            70, 
            'boa viagem', 
            'recife', 
            'PE' 
            ), 
        'guigs@cin', 
        to_date('11/08/2020', 'dd/mm;yy') 
        ) 
    );
/
INSERT INTO tb_cliente VALUES ( 
    tp_cliente( 
        '2', 
        'Dedezinho', 
        to_date('15/08/2001', 'dd/mm/yy'), 
        '21', 
        tp_endereco( 
            '51', 
            'rua megamente almeida', 
            71, 
            'madalena', 
            'recife', 
            'PE' 
            ), 
        'dedezinho@cin', 
        to_date('11/08/2021', 'dd/mm;yy') 
        ) 
    );
/
INSERT INTO tb_cliente VALUES ( 
    tp_cliente( 
        '3', 
        'Eattron', 
        to_date('11/07/2001', 'dd/mm/yy'), 
        '22', 
        tp_endereco( 
            '52', 
            'rua league of legends', 
            72, 
            'prado', 
            'recife', 
            'PE' 
            ), 
        'eattron@cin', 
        to_date('11/08/2019', 'dd/mm;yy') 
        ) 
    );
/
SELECT nome, cpf, email, C.endereco.rua FROM tb_cliente C;
/
----- POVOAMENTO ENTREGADOR -----
INSERT INTO tb_entregador VALUES (
    tp_entregador( 
        '4', 
        'batman', 
        to_date('11/02/2001', 'dd/mm/yy'), 
        '23', 
        tp_endereco( 
            '53', 
            'rua cavaleiro das trevas', 
            73, 
            'poço da panela', 
            'recife', 
            'PE' 
            ), 
        'batman@cin',
        to_date('05/02/2020', 'dd/mm/yy'),
        1500,
        'patinete'
        )
);
/
INSERT INTO tb_entregador VALUES (
    tp_entregador( 
        '5', 
        'biel', 
        to_date('11/01/2000', 'dd/mm/yy'), 
        '24', 
        tp_endereco( 
            '54', 
            'rua liamba', 
            74, 
            'graças', 
            'recife', 
            'PE' 
            ), 
        'biel@cin',
        to_date('05/05/2020', 'dd/mm/yy'),
        1800,
        'bicicleta'
        )
);
/
INSERT INTO tb_entregador VALUES (
    tp_entregador( 
        '6', 
        'trajano', 
        to_date('11/07/1995', 'dd/mm/yy'), 
        '25', 
        tp_endereco( 
            '55', 
            'rua porquinho paquistanês', 
            75, 
            'aflitos', 
            'recife', 
            'PE' 
            ), 
        'trajano@cin',
        to_date('05/12/2020', 'dd/mm/yy'),
        2000,
        'moto'
        )
);
/
SELECT nome, cpf, email, renda, veiculo, E.endereco.rua FROM tb_entregador E;
/
----- POVOAMENTO RESTAURANTE -----
INSERT INTO tb_restaurante VALUES (
    tp_restaurante(
        '90',
        'bode do nô',
        5,
        tp_endereco(
            '56', 
            'rua guilherme de pontes sobrinho', 
            76, 
            'boa viagem', 
            'recife', 
            'PE' 
        ),
        tp_arr_telefone(tp_telefone('26'), tp_telefone('27'))
    )
);
/
INSERT INTO tb_restaurante VALUES (
    tp_restaurante(
        '91',
        'burgaçaí',
        0,
        tp_endereco(
            '57', 
            'rua carlos pereira falcao', 
            77, 
            'boa viagem', 
            'recife', 
            'PE' 
        ),
        tp_arr_telefone(tp_telefone('28'), tp_telefone('29'))
    )
);
/
INSERT INTO tb_restaurante VALUES (
    tp_restaurante(
        '92',
        'kebabado',
        2,
        tp_endereco(
            '58', 
            'rua guilherme de pontes sobrinho', 
            77, 
            'boa viagem', 
            'recife', 
            'PE' 
        ),
        tp_arr_telefone(tp_telefone('30'))
    )
);
/
SELECT cnpj, nome, frete, R.endereco.rua, R.telefones FROM tb_restaurante R;
/
----- POVOAMENTO CUPOM -----
INSERT INTO tb_cupom VALUES (
    tp_cupom(
        id.NEXTVAL,
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '1'),
        '7 reais para novos usuários',
        7
    )
);
/
INSERT INTO tb_cupom VALUES (
    tp_cupom(
        id.NEXTVAL,
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '2'),
        '10 reais para conhecer novos restaurantes',
        10
    )
);
/
INSERT INTO tb_cupom VALUES (
    
        id.NEXTVAL,
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '3'),
        '5 reais em produtos Ambev',
        5
    
);
/
SELECT id, descricao, desconto, DEREF(CP.cliente).cpf FROM tb_cupom CP;
/
----- POVOAMENTO PRATO -----
INSERT INTO tb_prato VALUES (
    tp_prato(
        'Chã de Bode',
        149.9,
        'para até 4 pessoas',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90')
    )
);
/
INSERT INTO tb_prato VALUES (
    tp_prato(
        'Casquinha de Siri',
        9.9,
        'petiscos',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90')
    )
);
/
INSERT INTO tb_prato VALUES (
    tp_prato(
        'hamburguer de siri',
        25,
        'burgers',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91')
    )
);
/
INSERT INTO tb_prato VALUES (
    tp_prato(
        'açaí com mel de engenho',
        15,
        'açaí',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91')
    )
);
/
INSERT INTO tb_prato VALUES (
    tp_prato(
        'kebab de frango',
        21,
        'cozinha grega',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '92')
    )
);
/
INSERT INTO tb_prato VALUES (
    tp_prato(
        'kibe de carne de sol (8 unidades)',
        24,
        'petiscos',
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '92')
    )
);
/
SELECT nome, preco, categoria, DEREF(P.restaurante).nome FROM tb_prato P;
/
----- POVOAMENTO PEDIDO -----
INSERT INTO tb_pedido VALUES (
    tp_pedido(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '1'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90'),
        TIMESTAMP '2020-01-01 17:00:00',
        (SELECT REF(CP) FROM tb_cupom CP WHERE CP.id = '3'),
        (SELECT REF(E) FROM tb_entregador E WHERE E.cpf = '4'),
        TIMESTAMP '2020-01-01 18:00:00',
        TIMESTAMP '2020-01-01 19:00:00',
        'crédito',
            tp_arr_notas(tp_notas(
                5,
                5,
                5
            )
        )
    )
);
/
INSERT INTO tb_pedido VALUES (
    tp_pedido(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '2'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91'),
        TIMESTAMP '2021-01-01 17:00:00',
        NULL,
        NULL,
        TIMESTAMP '2021-01-01 18:00:00',
        TIMESTAMP '2021-01-01 19:00:00',
        'dinheiro',
            tp_arr_notas(tp_notas(
                3,
                3,
                4
            )
        )
    )
);
/
INSERT INTO tb_pedido VALUES (
    tp_pedido(
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '3'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '92'),
        TIMESTAMP '2020-01-01 18:00:00',
        (SELECT REF(CP) FROM tb_cupom CP WHERE CP.id = '1'),
        (SELECT REF(E) FROM tb_entregador E WHERE E.cpf = '5'),
        TIMESTAMP '2020-01-01 19:00:00',
        TIMESTAMP '2020-01-01 20:00:00',
        'pix',
            tp_arr_notas(tp_notas(
                5,
                4,
                3
            )
        )
    )
);
/
SELECT DEREF(P.cliente).cpf, DEREF(P.restaurante).cnpj, data_pedido, DEREF(P.cupom).desconto, DEREF(P.entregador).cpf, inicio, fim, pagamento, notas FROM tb_pedido P
/

----- POVOAMENTO DETALHAMENTO -----
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        id_detalhamento.NEXTVAL,
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2020 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '1'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90'),
        (SELECT REF(PR) FROM tb_prato PR WHERE PR.nome = 'Chã de Bode')
    )
);
/
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        id_detalhamento.NEXTVAL,
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2021 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '2'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91'),
        (SELECT REF(PR) FROM tb_prato PR WHERE PR.nome = 'hamburguer de siri')
    )
);
/
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        id_detalhamento.NEXTVAL,
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2020 18:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '3'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '92'),
        (SELECT REF(PR) FROM tb_prato PR WHERE PR.nome = 'kebab de frango')
    )
);
/
SELECT id_detalhamento, DEREF(D.pedido).data_pedido, DEREF(D.cliente).cpf, DEREF(D.restaurante).nome, DEREF(D.prato).nome FROM tb_detalhamento D;
/

----- POVOAMENTO PARCERIA -----
INSERT INTO tb_parceria VALUES (
    tp_parceria(
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'kebabado'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'bode do nô')
    )
);
/
INSERT INTO tb_parceria VALUES (
    tp_parceria(
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'kebabado'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'burgaçaí')
    )
);
/
INSERT INTO tb_parceria VALUES (
    tp_parceria(
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'burgaçaí'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.nome = 'bode do nô')
    )
);
/
SELECT DEREF(PC.contratante).nome, (PC.contratado).nome FROM tb_parceria PC;