/* 1. ALTER TABLE 
Descrição: Diminuir o tamanho do campo telefone VARCHAR2(255) de 255 para 11, diminuindo assim o uso de memória. */
ALTER TABLE Telefone_restaurante 
MODIFY (telefone VARCHAR2(11));

/* 2. CREATE INDEX 
Descrição: Colocar um índice nos atributos cliente e prato do respectivo pedido, para agilizar a busca e facilitar a produção. */
CREATE INDEX indice_pedido ON Pedido_contem_prato(cliente_cpf, nome_prato);

/* 3. INSERT INTO 
Descrição: Restaurante adicionou um novo prato ao seu cardápio, vamos colocá-lo na tabela. */
INSERT INTO Pratos_do_restaurante(nome_prato, cnpj, preco, categoria) VALUES ('Tortinha de Limão Siciliano', '9', 5.00, 'doces');

/* 4. UPDATE 
Descrição: Inflação chegou, vamos atualizar o valor de um prato no restaurante. */
UPDATE Pratos_do_restaurante
SET preco = 80
WHERE nome_prato = 'Rodízio de Sushi Completo';

/* 5. DELETE 
Descrição: a parceria entre dois restaurantes acabou, vamos tirá-la da tabela. */
DELETE FROM Parceria
WHERE (cnpj_contratante = '5' AND cnpj_contratado = '6');

/* 6 E 7. SELECT FROM WHERE & BETWEEN 
Descrição: Selecionar o cpf do cliente e a data do pedido de todos os pedidos feitos em 2021. */
SELECT cliente_cpf, data_pedido FROM Pedido
WHERE data_pedido
BETWEEN ('01-JAN-2021 00:00') AND ('31-DEC-2021 23:59');

/* 8. IN 
Descrição: Mostrar os pratos que foram solicitados pelos restaurantes de cnpj '7' ou '8' e suas respectivas datas. */
SELECT restaurante_cnpj, nome_prato, data_pedido FROM Pedido_contem_prato
WHERE restaurante_cnpj IN ('7', '8');

/* 9. LIKE 
Descrição: Juntar todas as pessoas cadastradas que tem nome começando com a letra J. */
SELECT nome, cpf FROM Pessoa
WHERE nome LIKE 'j%';

/* 10. IS NULL OR IS NOT NULL 
Descrição: Analisar cupons que não estão ligados com nenhum usuário. */
SELECT descricao, desconto FROM Cupom
WHERE cliente_cpf IS NULL;

/* 11. INNER JOIN 
Descrição: Buscar o nome, cpf e renda das pessoas cadastradas que são entregadores. */
SELECT DISTINCT P.nome, P.cpf, E.renda FROM Pessoa P
INNER JOIN Entregador E
ON P.cpf = E.cpf;

/* 12, 13, 14. MIN, MAX, AVG 
Descrição: Listar as menores e maiores rendas dos entregadores, além de listar a média de renda dos entregadores cadastrados. */
SELECT MAX(renda), MIN(renda), AVG(renda)
FROM Entregador;

/* 15. COUNT 
Descrição: Contabilizar os entregadores que tem renda abaixo da média de renda dos entregadores cadastrados no app. */
SELECT COUNT(*)
FROM Entregador
WHERE (renda < (SELECT AVG(renda) FROM Entregador));

/* 16. LEFT/RIGHT/FULL OUTER JOIN 
Descrição: Detalhamento dos pratos no pedido, com o id do cupom aplicado ao cliente e sua descrição. */
SELECT P.nome_prato, C.descricao, C.desconto
FROM Pedido_contem_prato P FULL OUTER JOIN Cupom C
ON P.cliente_cpf = C.cliente_cpf;

/* 17 E 18. SUBCONSULTA COM OPERADOR RELACIONAL E SUBCONSULTA COM IN 
Descrição: Buscar o cpf de todos os entregadores que estarão em atividade em 2021-05-06 18:00:00 ou 2021-07-09 18:00:00. */
SELECT E.cpf FROM Entregador E
WHERE E.cpf IN (SELECT entregador_cpf 
FROM PEDIDO WHERE data_pedido = '06-MAY-21 18:00' OR data_pedido = '12-OCT-21 15:00');

/* 19. SUBCONSULTA COM ANY
Descrição: Listar entregadores que tem renda maior que a renda de pelo menos um entregador que usa patinete. */
SELECT cpf, renda, veiculo FROM Entregador 
WHERE renda > ANY (SELECT renda FROM Entregador WHERE veiculo = 'patinete');

/* 20. SUBCONSULTA COM ALL 
Descrição: Listar entregadores que tem renda menor que a renda de cada entregador que usa fiat strada. */
SELECT cpf, renda, veiculo FROM Entregador 
WHERE renda < ANY (SELECT renda FROM Entregador WHERE veiculo = 'fiat strada');

/* 21. ORDER BY 
Descrição: Ordenar os pratos dos restaurantes em ordem crescente. */
SELECT nome_prato, preco FROM Pratos_do_restaurante
ORDER BY preco;

/* 22. GROUP BY 
Descrição: Mostrar quantos pratos possuem preço menor do que a média de preço os pratos cadastrados pelos restaurantes, agrupando por categoria. */
SELECT COUNT (preco), categoria FROM Pratos_do_restaurante P
WHERE P.preco < (SELECT AVG (preco) FROM Pratos_do_restaurante)
GROUP BY P.categoria;

/* 23. HAVING 
Descrição: Mostrar quantos pratos possuem preço menor do que a média de preço os pratos cadastrados pelos restaurantes, 
agrupando por categoria, com a condição que o count depois do agrupamento seja maior que 1. */
SELECT COUNT (preco), categoria FROM Pratos_do_restaurante P
WHERE P.preco < (SELECT AVG (preco) FROM Pratos_do_restaurante)
GROUP BY P.categoria
HAVING COUNT (preco) > 1;

/* 24. UNION, INTERSECT OU MINUS 
Descrição: Encontrar todas as pessoas cadastradas que que são clientes e entregadores ao mesmo tempo e mostrar seus nomes e cpf's. */
SELECT nome, cpf FROM Pessoa
WHERE cpf IN (SELECT cpf FROM Entregador INTERSECT SELECT cpf FROM Cliente);

/* 25. CREATE VIEW 
Descrição: Criar visualização de pedidos que não tiveram participação de entregador (cliente foi pegar no estabelecimento). */
CREATE VIEW visao_buscados AS 
SELECT * FROM Pedido
WHERE entregador_cpf IS NULL;

/* 26. GRANT/REVOKE (deixando só de exemplo pois o oracle não deixa a gente fazer isso rs)
Descrição: Dar ao usuário a capacidade de inserir e deletar restaurantes do banco de dados,
além de ter acesso à todos os restaurantes cadastradas. Depois, vamos impedir que deletem-se restaurantes. */
GRANT DELETE, INSERT ON Pessoa TO PUBLIC;
REVOKE DELETE ON Pessoa FROM PUBLIC;