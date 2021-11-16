/* 1. ALTER TABLE */

ALTER TABLE Pedido 
ADD CHECK (horario_fim > horario_inicio); --não existem entregas de um dia pro outro

ALTER TABLE Pedido
ADD CHECK (entregador_cpf != cliente_cpf);
/* 2. CREATE INDEX */
/* 3. INSERT INTO */
/* 4. UPDATE */
/* 5. DELETE */
/* 6 E 7. SELECT FROM WHERE & BETWEEN */
/* 8. IN */
/* 9. LIKE */
/* 10. IS NULL OR IS NOT NULL */
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