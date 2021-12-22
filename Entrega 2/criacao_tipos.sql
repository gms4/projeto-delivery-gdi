-- ENDEREÇO --
-- TIPO QUE ESTARÁ EM PESSOA (QUE CLIENTE E PESSOA HERDAM) E RESTAURANTE --
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (

    cep VARCHAR2 (8),
    rua VARCHAR2 (40),
    numero NUMBER,
    bairro VARCHAR2 (30),
    cidade VARCHAR2 (30),
    estado VARCHAR2 (2)

);

/

-- TELEFONES RESTAURANTE (USANDO VARRAY) --
-- TIPO VARRAY QUE POSSIBILITA INSERÇÃO E ARMAZENAMENTO DE MÚLTIPLOS TELEFONES NOS RESTAURANTES --
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    num VARCHAR2 (14)

);

/
-- CRIANDO TIPO ARRAY DE TELEFONES --
CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) OF tp_telefone;

/

-- NOTAS --
-- COLEÇÃO DE NOTAS ATRIBUÍDAS QUANDO O PEDIDO É FINALIZADO (SUGESTÃO DE VALÉRIA) --
CREATE OR REPLACE TYPE tp_notas AS OBJECT (

    nota_c_e NUMBER,
    nota_c_r NUMBER,
    nota_r_e NUMBER

);

/
-- CRIANDO TIPO ARRAY DE NOTAS --
CREATE OR REPLACE TYPE tp_arr_notas AS VARRAY (3) OF tp_notas;

/

-- PESSOA --
-- TIPO NOT FINAL (PERMITE CRIAÇÃO DE SUBTIPO E NÃO É POSSÍVEL INSERIR DADOS, POIS É APENAS UM MOLDE) -- 
-- E NOT INSTANTIABLE (TIPOS ABSTRADOS: NÃO PODEM TER INSTÂNCIAS DE OBJETOS CRIADAS EM TABELAS) --
-- CLIENTE E ENTREGADOR HERDAM DE PESSOA --
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (

    cpf VARCHAR2 (11),
    nome VARCHAR2 (40),
    data_nasc DATE,
    fone VARCHAR2 (14),
    endereco tp_endereco,
    MEMBER PROCEDURE print_info

) NOT FINAL NOT INSTANTIABLE;

/

-- ENTREGADOR --
-- HERDA DE PESSOA --
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
-- VARIAÇÃO_RENDA: MEMBER PROCEDURE QUE CALCULA UMA VARIAÇÃO DE RENDA PAUTADA EM UM MULTIPLICADOR (INFLAÇÃO, POR EXEMPLO) --
-- RENDA_ANUAL: MEMBER FUNCTION QUE CALCULA A RENDA ANUAL DO ENTREGADOR --
-- PRINT_INFO: OVERRIDING MEMBER FUNCTION QUE IMPRIME AS INFORMAÇÕES DO ENTREGADOR --
-- CONSTRUCTOR: PADRÃO --
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
        DBMS_OUTPUT.PUT_LINE(veiculo);
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

-- CLIENTE --
-- HERDA DE PESSOA --
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (

    data_criacao DATE

);

/

-- ADICIONANDO EMAIL EM PESSOA --
-- CASCADE: PROPAGA A MUDANÇA PARA TIPOS DEPENDENTES -- 
ALTER TYPE tp_pessoa ADD ATTRIBUTE (email VARCHAR2(100)) CASCADE;

/

-- PRATO --
-- TERÁ APENAS SEU TIPO CRIADO, POIS É UMA NESTED TABLE DE RESTAURANTE --
CREATE OR REPLACE TYPE tp_prato AS OBJECT (

    nome_prato VARCHAR2 (50),
    preco NUMBER,
    categoria VARCHAR2 (30),
    codigo NUMBER

);

/
-- TIPO NT (NESTED TABLE) DE PRATO --
CREATE OR REPLACE TYPE tp_nt_pratos AS TABLE OF tp_prato;

/

-- RESTAURANTE --
-- TERÁ PRATO COMO NESTED TABLE, ALÉM DE TELEFONES COMO VARRAY --
CREATE OR REPLACE TYPE tp_restaurante AS OBJECT (

    cnpj VARCHAR2(14),
    nome VARCHAR2(30),
    frete NUMBER,
    endereco tp_endereco,
    telefones tp_arr_telefone,
    pratos tp_nt_pratos,
    FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER

);

/
-- QNTD_TELEFONES: FINAL MAP MEMBER QUE RETORNA A QUANTIDADE DE TELEFONES CADASTRADOS NO RESTAURANTE --
CREATE OR REPLACE TYPE BODY tp_restaurante AS 
FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
selfCnt NUMBER;
    BEGIN
        SELECT COUNT(*) INTO selfCnt
        FROM TABLE(SELF.telefones);
        RETURN selfCnt;
    END;
END;
/

-- PARCERIA --
-- AUTORELACIONAMENTO QUE REFERENCIA RESTAURANTES --
-- REF: REFERENCIA OBJETOS ARMAZENADOS EM TABELAS -- 
CREATE OR REPLACE TYPE tp_parceria AS OBJECT (

    contratante REF tp_restaurante,
    contratado REF tp_restaurante

);

/

-- CUPOM --
-- PODE OU NÃO PERTENCER (REFERENCIAR) A UM CLIENTE --
CREATE OR REPLACE TYPE tp_cupom AS OBJECT (

    id INTEGER,
    cliente REF tp_cliente,
    descricao VARCHAR2(50),
    desconto NUMBER,
    ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_cupom, c tp_cupom) RETURN NUMBER

);

/
-- COMPARA_DESCONTO: ORDER MEMBER FUNCTION QUE COMPARA DESCONTOS E RETORNA UM TEXTINHO --
/* 
   MAP VS ORDER:
   ORDER NÃO PODE SER DEFINIDO EM SUBTIPOS
   ORDER É MENOS EFICIENTE   
   MAP NÃO EXIGE PARÂMETRO
   COMPARA VÁRIOS OBJETOS  
*/
CREATE OR REPLACE TYPE BODY tp_cupom AS
ORDER MEMBER FUNCTION comparaDesconto (SELF IN OUT NOCOPY tp_cupom, c tp_cupom) RETURN NUMBER IS
    BEGIN
        IF SELF.desconto < c.desconto THEN 
            RETURN -1;
        ELSIF SELF.desconto > c.desconto THEN 
            RETURN 1;
        ELSE 
            RETURN 0;
        END IF;
    END;
END;
/

-- PEDIDO --
-- ENTIDADE ASSOCIATIVA --
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

-- DETALHAMENTO DO PEDIDO --
-- RELACIONAMENTO QUE DETALHA O PEDIDO --
CREATE OR REPLACE TYPE tp_detalhamento AS OBJECT (

    pedido REF tp_pedido, --data--
    cliente REF tp_cliente, --cpf--
    restaurante REF tp_restaurante, --cnpj--
    prato VARCHAR2(50) --referenciar pelo codigo--

);

/

/* CHECKLIST

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