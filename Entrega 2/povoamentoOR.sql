----- SETANDO O HORÁRIO CORRETINHO -----
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';
/
----- CRIANDO SEQUÊNCIA PRA ID DE CUPOM -----
CREATE SEQUENCE id INCREMENT by 1 START WITH 1;
/
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
        tp_arr_telefone(tp_telefone('26'), tp_telefone('27')),
        tp_nt_pratos(tp_prato('chã de bode', 149.9, 'para até 4 pessoas', 110))
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
        tp_arr_telefone(tp_telefone('28'), tp_telefone('29')),
        tp_nt_pratos(tp_prato('hamburguer de siri', 25, 'burgers', 220))
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
        tp_arr_telefone(tp_telefone('30')),
        tp_nt_pratos(tp_prato('kebab de frango', 21, 'cozinha grega', 330))
    )
);
/
----- INSERINDO NA NESTED TABLE PRATOS EM RESTAURANTE -----
INSERT INTO TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '90')
    VALUES (tp_prato('casquinha de siri', 9.9, 'petiscos', 111));
/
INSERT INTO TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '91')
    VALUES (tp_prato('açaí com mel de engenho', 15, 'açaí', 221));
/
INSERT INTO TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '92')
    VALUES (tp_prato('kibe de carne de sol (8 unidades)', 24, 'petiscos', 331));
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
                NULL,
                3,
                NULL
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
----- POVOAMENTO DETALHAMENTO -----
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2020 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '1'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90'),
        (SELECT nome_prato FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '90') WHERE codigo = 110)
    )
);
/
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2021 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '2'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91'),
        (SELECT nome_prato FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '91') WHERE codigo = 220)
    )
);
/
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2020 18:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '3'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '92'),
        (SELECT nome_prato FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '92') WHERE codigo = 330)
    )
);
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


