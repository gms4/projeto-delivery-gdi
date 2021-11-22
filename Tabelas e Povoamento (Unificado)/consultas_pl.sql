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
    FOR j in 1..i-1 LOOP
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

/*4. CREATE PROCEDURE*/
/*5. CRATE FUNCTION*/
/*7. %ROWTYPE*/
/*8. IF ELSIF
Descrição: Avaliar as notas dos restaurantes, criando uma média
e deixando uma mensagem para o restaurante de como ele está sendo avaliado no app. */

/*9. CASE WHEN*/
/*10. LOOP EXIT WHEN*/
/*11. WHILE LOOP*/
/*13. SELECT ... INTO*/
/*14. CURSOR (OPEN, FETCH e CLOSE)*/
/*15. EXCEPTION WHEN*/
/*16. USO DE PARÂMETROS (IN, OUT ou IN OUT)*/
/*17. CREATE OR REPLACE PACKAGE*/
/*18. CREATE OR REPLACE PACKAGE BODY*/
/*19. CREATE OR REPLACE TRIGGER (COMANDO​)
Descrição: Trigger ativado quando existe a tentativa de se fazer um pedido fora do horário definido pelo aplicativo. */
CREATE OR REPLACE TRIGGER fora_do_horario
BEFORE INSERT ON Pedido
DECLARE
    pedido_fora_do_horario EXCEPTION;
BEGIN 
    IF TO_(SYSDATE, 'HH24') > 23 OR TO_NUMBER(SYSDATE, 'HH24') < 8
    THEN 
        RAISE pedido_fora_do_horario;
    END IF;
EXCEPTION 
WHEN pedido_fora_do_horario THEN
    Raise_application_error(-20202, 'FORA DO HORARIO-' || 'Restaurantes operam entre 8 e 23h.');
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