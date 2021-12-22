----- CONSULTA PRIMÁRIA CLIENTE ----- 
SELECT nome, cpf, email, C.endereco.rua FROM tb_cliente C;
/
----- CONSULTA PRIMÁRIA ENTREGADOR ----- 
SELECT nome, cpf, email, renda, veiculo, E.endereco.rua FROM tb_entregador E;
/
----- CONSULTA PRIMÁRIA RESTAURANTE ----- 
SELECT cnpj, nome, frete, R.endereco.rua, T.*, P.* FROM tb_restaurante R, TABLE(pratos) P, TABLE(R.telefones) T;
/
----- CONSULTA PRIMÁRIA CUPOM -----
SELECT id, descricao, desconto, CP.cliente.cpf AS Cliente FROM tb_cupom CP;
/
----- CONSULTA PRIMÁRIA PEDIDO -----
----- DEREF: RETORNA UM OBJETO REFERENCIADO POR UMA COLUNA DO TIPO REF -----
SELECT DEREF(P.cliente).cpf, DEREF(P.restaurante).cnpj, data_pedido, DEREF(P.cupom).desconto, DEREF(P.entregador).cpf, inicio, fim, pagamento, notas FROM tb_pedido P;
SELECT P.cliente.cpf AS cliente, P.restaurante.cnpj AS restaurante, data_pedido, P.cupom.desconto AS desconto, P.entregador.cpf AS entregador, inicio, fim, pagamento, N.* FROM tb_pedido P, TABLE(P.notas) N;
/
----- CONSULTA PRIMÁRIA DETALHAMENTO -----
SELECT D.pedido.data_pedido, D.cliente.cpf, D.restaurante.nome, prato FROM tb_detalhamento D;
/
----- CONSULTA PRIMÁRIA PARCERIA -----
SELECT DEREF(PC.contratante).nome, (PC.contratado).nome FROM tb_parceria PC;
SELECT PC.contratante.nome AS contratante, PC.contratado.nome AS Contratado FROM tb_parceria PC;
/

----- OUTRAS CONSULTAS ------

----- CONSULTA A VARRAY ------
----- VARRAY: COLEÇÃO ORDENADA (IN LINE) DE UMA QUANTIDADE FIXA DE ELEMENTOS -----
SELECT cnpj, nome, frete, R.endereco.rua, T.*
FROM tb_restaurante R, TABLE(R.telefones) T;
/
----- CONSULTA A NESTED TABLE -----
----- NESTED TABLE: COLEÇÃO NÃO ORDENADA (OUT LINE) DE UMA QUANTIDADE ARBITRÁRIA DE ELEMENTOS -----
SELECT * FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '90');
SELECT * FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '91');
SELECT * FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '92');
/
----- MEMBER FUNCTION -----
SELECT E.renda_anual() FROM tb_entregador E WHERE E.cpf = '4';
/
----- MEMBER PROCEDURE e VALUE -----
----- VALUE: EXIBE OS DADOS DAS INSTÂNCIAS DO OBJETO -----
DECLARE
    entregador tp_entregador;
BEGIN
    SELECT VALUE(E) INTO entregador FROM tb_entregador E WHERE E.cpf = '4';
    entregador.variacao_renda(entregador.renda);
END;
/
----- OVERRIDING MEMBER PROCEDURE -----
DECLARE 
    entregador tp_entregador;
BEGIN   
    SELECT VALUE(E) INTO entregador FROM tb_entregador E WHERE E.cpf = '4';
    entregador.print_info();
END;
/
----- MAP MEMBER FUNCTION -----
SELECT R.qntd_telefones() FROM tb_restaurante R WHERE R.cnpj = '90';
/
----- ORDER MEMBER FUNCTION -----
DECLARE 
    aux NUMBER;
    cupom1 tp_cupom;
    cupom2 tp_cupom;
BEGIN
    SELECT VALUE(C) INTO cupom1 FROM tb_cupom C WHERE id = 1;
    SELECT VALUE(C) INTO cupom2 FROM tb_cupom C WHERE id = 2;
    aux := cupom1.comparaDesconto(cupom2);
    IF aux = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Desconto do cupom ' || TO_CHAR(cupom1.id) 
                    || ' é maior que o desconto do cupom ' || TO_CHAR(cupom2.id));
        DBMS_OUTPUT.PUT_LINE('Cupom de id ' || TO_CHAR(cupom1.id) || ' possui desconto de ' 
                    || TO_CHAR(cupom1.desconto) || ' reais, enquanto '
                    || TO_CHAR(cupom2.id) || ' tem desconto de ' || TO_CHAR(cupom2.desconto) || ' reais.');
    ELSIF aux = -1 THEN 
        DBMS_OUTPUT.PUT_LINE('Desconto do cupom ' || TO_CHAR(cupom2.id) 
                    || ' é maior que o desconto do cupom ' || TO_CHAR(cupom1.id));
        DBMS_OUTPUT.PUT_LINE('Cupom de id ' || TO_CHAR(cupom2.id) || ' possui desconto de ' 
                    || TO_CHAR(cupom2.desconto) || ' reais, enquanto o cupom de id '
                    || TO_CHAR(cupom1.id) || ' tem desconto de ' || TO_CHAR(cupom1.desconto) || ' reais.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ambos possuem o mesmo desconto.');
        DBMS_OUTPUT.PUT_LINE('O desconto é de: ' || TO_CHAR(cupom1.desconto) || ' reais');
    END IF;
END;