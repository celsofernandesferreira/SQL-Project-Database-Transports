-- 1. Faturação global absoluta
SELECT sum(
    (SELECT sum(valor) From Bilhetes) +
    (Select Sum(Valor_cliente+Valor_entidade) From Carregamentos) +
    (SELECT sum(valor) From GuimaFlex)
) As Total_Faturado;


-- 2. Filtragem de datas para fecho de mês de Bilhetes
SELECT Sum(Valor) as 'Total Faturado em Janeiro'
From Bilhetes
Where dia >= '2026-01-01' AND Dia < '2026-02-01';


-- 3. Auditoria de idades com cruzamento de dados
Select Name,Telefone,Tipologia
From Clientes
Join Cartoes
on Clientes.Id_clientes = Cartoes.Id_clientes
where Estado = 'Ativo'
AND Tipologia = 'Sub-18'
AND Data_Nascimento BETWEEN '1995-05-01' AND '1995-05-30';


-- 4. Deteção de anomalias (clientes sem cartão ou com cartão não ativo)
SELECT Clientes.Name, Clientes.Nif, Cartoes.Estado
FROM Clientes
LEFT JOIN Cartoes 
ON Clientes.Id_clientes = Cartoes.Id_Clientes
WHERE Cartoes.Id_Cartao IS NULL OR Cartoes.Estado != 'Ativo';


-- 5. Top 10 de maiores carregamentos (GuimaFlex)
SELECT Id_Cartao, Data_Carregamento, Valor, Operador
FROM GuimaFlex
ORDER BY Valor DESC
LIMIT 10;


-- 6. Correção segura de tipologias 
UPDATE Cartoes
SET Tipologia = "Sub-18"
Where Id_Cartao = "5015";


-- 7. Normalização de strings devido a existir um inteiro em vez de Inteiro
SELECT UPPER(Desconto) AS Bilhete_Normalizado, SUM(Valor) as Faturacao
FROM Bilhetes
GROUP BY UPPER(Desconto);


-- 8. Cartões ativos por tipologia
SELECT Tipologia, Count('Estado') as "Quantidade"
From Cartoes
Where estado = 'Ativo'
Group By Tipologia
Order By quantidade;

--8.1. Assim Seria mais correcto para apanhar os inativos por tipologia Em estado ativo
SELECT Tipologia, COUNT(Clientes.Id_clientes) as "Quantidade"
FROM Clientes
LEFT JOIN Cartoes 
ON Clientes.Id_clientes = Cartoes.Id_clientes AND Cartoes.Estado = 'Ativo'
GROUP BY Tipologia 
ORDER BY Tipologia is NULL, quantidade DESC


-- 9. Cartões emitidos por cliente
SELECT "Name", Count('Id_Clientes') AS 'Numero_De_Cartoes'
From Clientes
JOIN Cartoes
ON Clientes.Id_Clientes = cartoes.Id_clientes
Group By Name
Order by Numero_de_cartoes;
