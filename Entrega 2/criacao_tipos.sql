----- ENDEREÇO -----
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (

    cep VARCHAR2 (8),
    rua VARCHAR2 (40),
    numero NUMBER,
    bairro VARCHAR2 (30),
    cidade VARCHAR2 (30),
    estado VARCHAR2 (2)

);

/

------ TELEFONES RESTAURANTE (USANDO VARRAY) ------
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    num VARCHAR2 (14)

);

/

CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) OF tp_telefone;

/

----- NOTAS -----
CREATE OR REPLACE TYPE tp_notas AS OBJECT (

    nota_c_e NUMBER,
    nota_c_r NUMBER,
    nota_r_e NUMBER

);

/

CREATE OR REPLACE TYPE tp_arr_notas AS VARRAY (3) OF tp_notas;

/

------ PESSOA ------
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (

    cpf VARCHAR2 (11),
    nome VARCHAR2 (40),
    data_nasc DATE,
    fone VARCHAR2 (14),
    endereco tp_endereco,
    MEMBER PROCEDURE print_info

) NOT FINAL NOT INSTANTIABLE;

/

----- ENTREGADOR -----
CREATE OR REPLACE TYPE tp_entregador UNDER tp_pessoa (

    data_admissao DATE,
    renda NUMBER,
    veiculo VARCHAR2 (100),
    MEMBER PROCEDURE variacao_renda(SELF IN OUT NOCOPY tp_entregador, input NUMBER),
    MEMBER FUNCTION renda_anual RETURN NUMBER,
    OVERRIDING MEMBER PROCEDURE print_info,
    CONSTRUCTOR FUNCTION tp_entregador (x1 tp_entregador) RETURN SELF AS RESULT

);

/

CREATE OR REPLACE TYPE BODY tp_entregador AS
MEMBER PROCEDURE variacao_renda (SELF IN OUT NOCOPY tp_entregador, input NUMBER) IS
    BEGIN
        SELF.renda := input*1.1;
        DBMS_OUTPUT.PUT_LINE(SELF.renda);
    END;
MEMBER FUNCTION renda_anual RETURN NUMBER IS
    BEGIN
        RETURN renda*12;
    END;
OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(renda);
    END;
CONSTRUCTOR FUNCTION tp_entregador (x1 tp_entregador) RETURN SELF AS RESULT IS
    BEGIN
        cpf := x1.cpf; 
        nome := x1.nome; 
        data_nasc := x1.data_nasc; 
        fone := x1.fone;
        endereco := x1.endereco; 
        data_admissao := x1.data_admissao; 
        renda := x1.renda; 
        veiculo := x1.veiculo; 
        RETURN; 
    END;
END;

/

----- CLIENTE -----
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (

    data_criacao DATE

);

/

----- ADICIONANDO EMAIL EM PESSOA -----
ALTER TYPE tp_pessoa ADD ATTRIBUTE (email VARCHAR2(100)) CASCADE;

/

----- PRATO -----
CREATE OR REPLACE TYPE tp_prato AS OBJECT (

    nome_prato VARCHAR2 (50),
    preco NUMBER,
    categoria VARCHAR2 (30),
    codigo NUMBER

);

/

CREATE OR REPLACE TYPE tp_nt_pratos AS TABLE OF tp_prato;

/

----- RESTAURANTE -----
CREATE OR REPLACE TYPE tp_restaurante AS OBJECT (

    cnpj VARCHAR2(14),
    nome VARCHAR2(30),
    frete NUMBER,
    endereco tp_endereco,
    telefones tp_arr_telefone,
    pratos tp_nt_pratos,
    MAP MEMBER FUNCTION qntd_telefones return NUMBER

);

/

CREATE OR REPLACE TYPE BODY tp_restaurante AS 
MAP MEMBER FUNCTION qntd_telefones return NUMBER IS
    BEGIN  
        RETURN COUNT_ELEMENTS(telefones);
    END;
END;

/

----- PARCERIA -----
CREATE OR REPLACE TYPE tp_parceria AS OBJECT (

    contratante REF tp_restaurante,
    contratado REF tp_restaurante

);

/

----- CUPOM -----
CREATE OR REPLACE TYPE tp_cupom AS OBJECT (

    id INTEGER,
    cliente REF tp_cliente,
    descricao VARCHAR2(50),
    desconto NUMBER,
    ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_cupom, c tp_cupom) RETURN NUMBER

);

/
CREATE OR REPLACE TYPE BODY tp_cupom AS
ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_cupom, c tp_cupom) RETURN NUMBER IS
    desconto1 NUMBER;
    desconto2 NUMBER;
    BEGIN
        SELECT desconto INTO desconto1
        FROM TABLE(SELF.desconto);
        SELECT desconto INTO desconto2
        FROM TABLE(c.desconto);
        IF desconto1 < desconto2 THEN 
            RETURN -1;
        ELSIF desconto1 > desconto2 THEN 
            RETURN 1;
        ELSE 
            RETURN 0;
        END IF;
    END;
END;
/

----- PEDIDO -----
CREATE OR REPLACE TYPE tp_pedido AS OBJECT (

    cliente REF tp_cliente,
    restaurante REF tp_restaurante,
    data_pedido TIMESTAMP,
    cupom REF tp_cupom,
    entregador REF tp_entregador,
    inicio TIMESTAMP,
    fim TIMESTAMP,
    pagamento VARCHAR2(30),
    notas tp_arr_notas

);

/

----- DETALHAMENTO DO PEDIDO -----
CREATE OR REPLACE TYPE tp_detalhamento AS OBJECT (

    pedido REF tp_pedido,
    cliente REF tp_cliente,
    restaurante REF tp_restaurante,
    prato VARCHAR2(50)

);

/

/*

1. CREATE OR REPLACE TYPE ✅
2. CREATE OR REPLACE TYPE BODY ✅
3. MEMBER PROCEDURE ✅
4. MEMBER FUNCTION ✅
5. ORDER MEMBER FUNCTION ✅
6. MAP MEMBER FUNCTION ✅
7. CONSTRUCTOR FUNCTION ✅
8. OVERRIDING MEMBER ✅
9. FINAL MEMBER ✅
10. NOT INSTANTIABLE TYPE/MEMBER ✅
11. HERANÇA DE TIPOS (UNDER/NOT FINAL) ✅
12. ALTER TYPE ✅
13. CREATE TABLE OF ✅
14. WITH ROWID REFERENCES ✅
15. REF ✅
16. SCOPE IS ✅
17. INSERT INTO ✅
18. SELECT REF ✅
19. SELECT DEREF ✅
20. VALUE ✅
21. VARRAY ✅
22. CONSULTA A VARRAY ✅
23. NESTED TABLE ✅
24. CONSULTA A NESTED TABLE ✅

*/