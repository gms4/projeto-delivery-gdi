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
    OVERRIDING MEMBER PROCEDURE print_info

);

/

CREATE OR REPLACE TYPE BODY tp_entregador AS
    MEMBER PROCEDURE variacao_renda (SELF IN OUT NOCOPY tp_entregador, input NUMBER) IS
    BEGIN
        self.renda := input;
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

----- RESTAURANTE -----
CREATE OR REPLACE TYPE tp_restaurante AS OBJECT (

    cnpj VARCHAR2(14),
    nome VARCHAR2(30),
    frete NUMBER,
    endereco tp_endereco,
    telefones tp_arr_telefone,
    FINAL MAP MEMBER FUNCTION qntd_telefones return NUMBER

);

/

CREATE OR REPLACE TYPE BODY tp_restaurante AS 
FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
    BEGIN  
        RETURN COUNT_ELEMENTS(telefones)
    END;
END;

/

----- PARCERIA -----
CREATE OR REPLACE TYPE tp_parceria AS OBJECT (

    contratante REF tp_restaurante,
    contratado REF tp_restaurante

);

/

----- PRATO -----
CREATE OR REPLACE TYPE tp_prato AS OBJECT (

    restaurante REF tp_restaurante,
    nome VARCHAR2 (30),
    preco NUMBER,
    categoria VARCHAR2 (30),
    CONSTRUCTOR FUNCTION tp_prato (SELF IN OUT NOCOPY 
                    tp_prato, inome VARCHAR2, ipreco NUMBER, icategoria VARCHAR2)
                        RETURN SELF AS RESULT

);

/

CREATE OR REPLACE TYPE BODY tp_prato AS 
    CONSTRUCTOR FUNCTION tp_prato ((SELF IN OUT NOCOPY 
                    tp_prato, irestaurate VARCHAR2, inome VARCHAR2, ipreco NUMBER, icategoria VARCHAR2)
                        RETURN SELF AS RESULT IS
    BEGIN 
        SELF.restaurante := irestaurate;
        SELF.nome := inome;
        SELF.preco := ipreco;
        SELF.categoria := icategoria;
        RETURN;
    END;
END;

/

----- CUPOM -----
CREATE OR REPLACE TYPE tp_cupom AS OBJECT (

    id INTEGER,
    cliente REF tp_cliente,
    descricao VARCHAR2(50),
    desconto NUMBER

);

/

----- PEDIDO -----
CREATE OR REPLACE TYPE tp_pedido AS OBJECT (

    cliente REF tp_cliente,
    restaurante REF tp_restaurante,
    data_pedido TIMESTAMP,
    id REF tp_cupom,
    entregador REF tp_entregador,
    inicio TIMESTAMP,
    fim TIMESTAMP,
    pagamento VARCHAR2(30),
    notas tp_arr_notas,
    ORDER MEMBER FUNCTION aux (SELF IN OUT NOCOPY tp_pedido, p tp_pedido) RETURN DECIMAL
);

/

CREATE OR REPLACE TYPE BODY tp_pedido AS
    ORDER MEMBER FUNCTION aux(SELF IN OUT NOCOPY tp_pedido, p tp_pedido) RETURN NUMBER IS
    BEGIN
        IF SELF.data_pedido < p.data_pedido THEN
            RETURN -1;               
        ELSIF SELF.data_pedido > p.data_pedido THEN 
            RETURN 1;                
        ELSE 
            RETURN 0;
        END IF;
    END;
END;

/

----- DETALHAMENTO DO PEDIDO -----
CREATE OR REPLACE TYPE tp_detalhamento AS OBJECT (

    id_detalhamento INTEGER,
    data_pedido REF tp_pedido,
    cliente REF tp_cliente,
    restaurante REF tp_restaurante,
    nome REF tp_prato

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
16. SCOPE IS
17. INSERT INTO ✅
18. SELECT REF
19. SELECT DEREF
20. VALUE
21. VARRAY ✅
22. CONSULTA A VARRAY
23. NESTED TABLE (tirei porque não é pra essa entrega)
24. CONSULTA A NESTED TABLE

*/