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

/* 11. INNER JOIN */
/* 12, 13, 14. MIN, MAX, AVG */
/* 15. COUNT */
/* 16. LEFT/RIGHT/FULL OUTER JOIN */
/* 17 E 18. SUBCONSULTA COM OPERADOR RELACIONAL E SUBCONSULTA COM IN */
/* 19. SUBCONSULTA COM ANY */
/* 20. SUBCONSULTA COM ALL */
/* 21. ORDER BY */
/* 22. GROUP BY */
/* 23. HAVING */
/* 24. UNION, INTERSECT OU MINUS */
/* 25. CREATE VIEW */
/* 26. GRANT/REVOKE */