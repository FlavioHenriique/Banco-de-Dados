1) O nome do estabelecimento do cliente e o valor de todas as 
vendas realizadas na cidade Cajazeiras, ordenados pelo valor
total da venda.

CREATE VIEW VendaClientes AS 
SELECT V.Cidade AS Cidade, C.NomeEstabelecimento AS Estabelecimento,V.ValorTotal AS Valor 
FROM CLIENTE C, VENDA V 
WHERE C.Cpf=V.CpfCliente AND V.Cidade LIKE 'Cajazeiras%'
ORDER BY V.ValorTotal DESC

2) O nome, o c�digo e a quantidade de cada mercadoria em estoque na empresa.

CREATE VIEW Estoque AS 
SELECT M.Nome, M.Codigo, SUM(CM.Quantidade) AS Quantidade
FROM MERCADORIA M, CONTROLA_MERCADORIA CM
WHERE M.Codigo=CM.CodMercadoria
GROUP BY M.Codigo
ORDER BY SUM(CM.Quantidade) DESC


3) O nome do entregador e a quantidade de vezes em que cada caminh�o foi usado por ele.

CREATE VIEW ENTREGAS AS
SELECT E.Nome, COUNT(*) AS Quantidade
FROM USA_CAMINHAO UC, ENTREGADOR E
WHERE E.CPF=UC.CPFEntregador
GROUP BY E.CPF
