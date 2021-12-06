----- ENDEREÇO -----

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (

    cep VARCHAR2 (8),
    rua VARCHAR2 (100),
    bairro VARCHAR2 (100),
    cidade VARCHAR2 (100),
    estado VARCHAR2 (100),
    numero NUMBER

);

------ TELEFONES RESTAURANTE ------

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    num VARCHAR2 (100)

);

CREATE OR REPLACE TYPE tp_arr_telefone AS VARRAY (5) of tp_telefone;

------ PESSOA ------

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (

    nome VARCHAR2 (100),
    cpf VARCHAR2 (11),
    data_nasc DATE,
    endereco tp_endereco,
    telefone VARCHAR2 (100),
    MEMBER PROCEDURE print_info

) NOT FINAL NOT INSTANTIABLE;

----- ENTREGADOR -----

CREATE OR REPLACE TYPE tp_entregador UNDER tp_pessoa (

    renda NUMBER,
    data_admissao DATE,
    veiculo VARCHAR2 (100),
    MEMBER PROCEDURE variacao_renda(SELF IN OUT NOCOPY tp_entregador, input NUMBER),
    MEMBER FUNCTION renda_anual RETURN NUMBER,
    OVERRIDING MEMBER PROCEDURE print_info

);

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

----- CLIENTE -----

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (

    data_criacao DATE

);

ALTER TYPE tp_pessoa ADD ATTRIBUTE (email VARCHAR2(100)) CASCADE;