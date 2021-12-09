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

CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) of tp_telefone;

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
    ORDER MEMBER FUNCTION renda_comparacao(SELF IN OUT NOCOPY tp_entregador, e tp_entregador) RETURN DECIMAL,
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
    ORDER MEMBER FUNCTION renda_comparacao (SELF IN OUT NOCOPY tp_entregador, e tp_entregador) RETURN NUMBER IS
    BEGIN 
        IF SELF.renda < e.renda THEN
            RETURN -1;
        ELSIF SELF.renda > e.renda THEN
            RETURN 1;
        ELSE 
            RETURN 0;
        END IF;
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
    endereco tp_endereco,
    frete NUMBER,
    telefones tp_arr_telefone,
    FINAL MAP MEMBER FUNCTION qntd_telefones return NUMBER

) NOT FINAL NOT INSTANTIABLE;

/

CREATE OR REPLACE TYPE BODY tp_restaurante AS 
FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
    BEGIN  
        RETURN COUNT_ELEMENTS(telefones)
    END;
END;

/

----- PRATO -----
CREATE OR REPLACE TYPE tp_prato AS OBJECT (

    nome VARCHAR2 (30),
    preco NUMBER,
    categoria VARCHAR2 (30)
    CONSTRUCTOR FUNCTION tp_prato (SELF IN OUT NOCOPY 
                    tp_prato, inome VARCHAR2, ipreco NUMBER, icategoria VARCHAR2)
                        RETURN SELF AS RESULT

);

/

CREATE OR REPLACE TYPE BODY tp_prato AS 
    CONSTRUCTOR FUNCTION tp_prato ((SELF IN OUT NOCOPY 
                    tp_prato, inome VARCHAR2, ipreco NUMBER, icategoria VARCHAR2)
                        RETURN SELF AS RESULT IS
    BEGIN 
        SELF.nome := inome;
        SELF.preco := ipreco;
        SELF.categoria := icategoria;
        RETURN;
    END;
END;

/

----- PEDIDO -----
CREATE OR REPLACE TYPE tp_pedido AS OBJECT (

    data_pedido TIMESTAMP,
    



);