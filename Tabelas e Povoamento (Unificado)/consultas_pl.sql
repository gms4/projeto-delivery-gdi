/*1. USO DE RECORD
Descrição: Criando uma pessoa nova e inserindo no banco de dados, usando RECORD.
Mesmos campos serão nomeados, preenchidos em, finalmente, inseridos na tabela de Pessoa. */
<<record_block>>
DECLARE 
    TYPE d_pessoa IS RECORD (
        cpf VARCHAR2(11),
        nome VARCHAR2(255),
        nascimento DATE,
        telefone VARCHAR2(255),
        email VARCHAR2(255),
        cep_endereco VARCHAR2(255),
        num_endereco NUMBER);
        new_pessoa d_pessoa;
BEGIN 
    new_pessoa.cpf := '13';
    new_pessoa.nome := 'casimiro miguel';
    new_pessoa.nascimento := to_date('27/09/1993', 'dd/mm/yy');
    new_pessoa.telefone := '9994850493';
    new_pessoa.email := 'vasco@gmail.com';
    new_pessoa.cep_endereco := '51900210';
    new_pessoa.num_endereco := 1;
    INSERT INTO Pessoa VALUES new_pessoa;
END record_block;

/*2, 6 E 12. USO DE ESTRUTURA DE DADOS DO TIPO TABLE, %TYPE, FOR IN LOOP 
Descrição: Faremos uma lista de coluna única dos nomes dos pratos cadastrados nos restaurantes do nosso app. 
Aproveitaremos pra usar o %TYPE para fazer referência, 
e o FOR IN LOOP para listar (e de certa forma comprovar existência no banco de dados) os pratos. */
<<nome_pratos_block>>
DECLARE 
    TYPE nome_pratos_type IS TABLE OF Pratos_do_restaurante.nome_prato%TYPE
    INDEX BY BINARY_INTEGER;
    nome_pratos_table nome_pratos_type;
    i BINARY_INTEGER;
BEGIN   
    i := 1;
    FOR current_row IN (SELECT nome_prato FROM Pratos_do_restaurante) LOOP
        nome_pratos_table(i) := current_row.nome_prato;
        i := i + 1;
    END LOOP;
    FOR j IN 1..i-1 LOOP
        DBMS_OUTPUT.PUT_LINE(nome_pratos_table(j));
    END LOOP;
END nome_pratos_block;

/*3. BLOCO ANÔNIMO
Descrição: Criando um bloco anônimo com um record de restaurante e printando o nome. */
DECLARE 
    TYPE type_restaurante IS RECORD (
        cnpj VARCHAR2(14),
        nome VARCHAR2(255));
        restaurante_01 type_restaurante; 
BEGIN 
    restaurante_01.cnpj := '10';
    restaurante_01.nome := 'Kebabado';
    DBMS_OUTPUT.PUT_LINE(restaurante_01.nome);
END;

/*4 E 7 E 17 E 18. CREATE PROCEDURE, ROWTYPE, CREATE OR REPLACE PACKAGE/BODY. 
Descrição: Packages com procedures para inserção de elementos do tipo RESTAURANTE E PRATOS na tabela. */
CREATE OR REPLACE PACKAGE cadastros AS
PROCEDURE new_rest(aux Restaurante%ROWTYPE);
PROCEDURE new_prato(
    p_nome_prato Pratos_do_restaurante.nome_prato%TYPE,
    p_cnpj Pratos_do_restaurante.cnpj%TYPE,
    p_preco Pratos_do_restaurante.preco%TYPE,
    p_categoria Pratos_do_restaurante.categoria%TYPE
);
END cadastros;

CREATE OR REPLACE PACKAGE BODY cadastros AS
PROCEDURE new_rest(aux Restaurante%ROWTYPE) IS
BEGIN
    INSERT INTO Restaurante(cnpj, nome, frete_fixo, cep_endereco, num_endereco)
            VALUES (aux.cnpj, aux.nome, aux.frete_fixo, aux.cep_endereco, aux.num_endereco);
END new_rest;

PROCEDURE new_prato(
    p_nome_prato Pratos_do_restaurante.nome_prato%TYPE,
    p_cnpj Pratos_do_restaurante.cnpj%TYPE,
    p_preco Pratos_do_restaurante.preco%TYPE,
    p_categoria Pratos_do_restaurante.categoria%TYPE
) IS
    BEGIN
        INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria)
                VALUES (p_nome_prato, p_cnpj, p_preco, p_categoria);
    END new_prato;

END cadastros;
BEGIN
    cadastros.new_prato()
END;
/*5 E 8 E 13. CREATE FUNCTION, IF/ELSIF E SELECT ... INTO
Descrição: Função que pega o nome do restaurante e o horário de um pedido feito,
pega a nota que o cliente atribuiu pra esse pedido e printa mensagens de acordo com a nota. 
n = 5 -> "Parabéns, mais um pedido muito bem executado!"
n >= 4 && n < 5 -> "O cliente gostou, mas existe sempre espaço para melhora!" 
n < 4 -> "Reavalie suas estratégias, a nota não foi boa!" */
CREATE OR REPLACE FUNCTION avaliacaoPedido (cpf Pedido.cliente_cpf%TYPE, cnpj Pedido.restaurante_cnpj%TYPE, data Pedido.data_pedido%TYPE)
RETURN VARCHAR2
IS 
        nota Pedido.nota_c_r%TYPE;
        func_out VARCHAR2(255);
BEGIN 
        SELECT p.nota_c_r INTO nota
        FROM Pedido p
        WHERE p.cliente_cpf = cpf AND p.restaurante_cnpj = cnpj AND p.data_pedido = data;

        IF nota = 5 THEN 
            func_out := 'Parabéns, mais um pedido muito bem executado!';
        ELSIF nota >= 4 AND nota < 5 THEN
            func_out := 'O cliente gostou, mas existe sempre espaço para melhora!';
        ELSE 
            func_out := 'Reavalie suas estratégias, a nota não foi boa!';
        END IF;
        RETURN func_out;
END avaliacaoPedido;
SELECT avaliacaoPedido('4', '6', TIMESTAMP '2021-05-06 18:00:00') FROM DUAL;

/*16. USO DE PARÂMETROS (IN, OUT OU IN OUT)
Descrição: Atribuir variação à renda dos entregadores de acordo com a inflação. 
Em 2021 a variação dos salários de acordo com a inflação tá uns 3%. */
CREATE OR REPLACE FUNCTION variacao_renda (cpf Entregador.cpf%TYPE) 
RETURN NUMBER
IS
    aux_renda NUMBER;
    result NUMBER;
BEGIN 
    SELECT E.renda INTO aux_renda
    FROM Entregador E
    WHERE E.cpf = cpf;
    result := aux_renda * 1.03;
    RETURN result;
END;
SELECT variacao_renda ('12') FROM DUAL;

/* backup de uso de parâmetros visto que eu não consegui testar isso aqui de cima
CREATE OR REPLACE PROCEDURE cadastroPrato (aux IN Pratos_do_restaurante%ROWTYPE) IS
BEGIN
    INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria)
            VALUES (aux.nome_prato, aux.cnpj, aux.preco, aux.categoria);
END; */

/* 9 E 10 E 11 E 14. CASE WHEN, LOOP EXIT WHEN, CURSOR (OPEN, FETCH, CLOSE) E WHILE LOOP
Descrição: loop que analisa os endereços das pessoas cadastradas, contabilizando de acordo com a cidade.
Cursor foi usado para pegar a cidade na tabela endereço; */
DECLARE 
    count_recife BINARY_INTEGER;
    count_jaboatao BINARY_INTEGER;
    count_cabo BINARY_INTEGER;
    count_outros BINARY_INTEGER;
    i BINARY_INTEGER;
    q BINARY_INTEGER;
    aux_cidade Endereco.cidade%TYPE;

    CURSOR c_endereco IS
        SELECT E.cidade
        FROM Endereco E;
BEGIN
    OPEN c_endereco;
    count_recife := 0;
    count_jaboatao := 0;
    count_cabo := 0;
    count_outros := 0;
    i := 0;
    SELECT COUNT(*) INTO q FROM Endereco;
    WHILE i < q LOOP
        FETCH c_endereco INTO aux_cidade;
        EXIT WHEN c_endereco%NOTFOUND;
        CASE aux_cidade
            WHEN 'recife' THEN
                count_recife := count_recife + 1;
            WHEN 'jaboatão dos guararapes' THEN
                count_jaboatao := count_jaboatao + 1;
            WHEN 'cabo de santo agostinho' THEN
                count_cabo := count_cabo + 1;
            ELSE
                count_outros := count_outros + 1;
        END CASE;
        i := i + 1;
    END LOOP;
    CLOSE c_endereco;
    DBMS_OUTPUT.PUT_LINE('Recife: ' || count_recife || ', Jaboatão: ' || count_jaboatao || ', Cabo: ' || count_cabo || ', Outros: ' || count_outros);
END;

/*15 E 19. EXCEPTION WHEN E CREATE OR REPLACE TRIGGER (COMANDO​)
Descrição: Trigger ativado quando existe a tentativa de se fazer um pedido fora do horário definido pelo aplicativo. */
CREATE OR REPLACE TRIGGER fora_do_horario
BEFORE INSERT ON Pedido
DECLARE
    pedido_fora_do_horario EXCEPTION;
BEGIN 
    IF TO_NUMBER(SYSDATE, 'HH24') > 23 OR TO_NUMBER(SYSDATE, 'HH24') < 8
    THEN 
        RAISE pedido_fora_do_horario;
    END IF;
EXCEPTION 
WHEN pedido_fora_do_horario THEN
    Raise_application_error(-20202, 'FORA DO HORARIO-' || 'Restaurantes operam entre 8 e 23h. Tente novamente em outro horário.');
END;

/*20. CREATE OR REPLACE TRIGGER (LINHA​)
Descrição: Trigger ativado quando se tenta inserir um cupom de valor de desconto negativo. */
CREATE OR REPLACE TRIGGER desconto_negativo
BEFORE INSERT ON Cupom
FOR EACH ROW
DECLARE
    desconto_negativo EXCEPTION;
BEGIN 
    IF :NEW.desconto < 0 THEN
        DBMS_OUTPUT.PUT_LINE('CUPOM COM DESCONTO NEGATIVO');
        RAISE desconto_negativo;
    END IF;
EXCEPTION
    WHEN desconto_negativo THEN
    Raise_application_error(-20202, 'Valor do desconto negativo-' || 'Não é possível inserir um valor negativo ao desconto do cupom.');
END;