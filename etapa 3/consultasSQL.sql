1 - O nome, CPF e salário de todos os vendedores que trabalham na cidade Sousa.

SELECT V.Nome, V.Cpf, V.Salario
FROM CIDADES_VENDEDOR CV, VENDEDOR V
WHERE V.CPF=CV.CPFVendedor AND CV.Cidade LIKE 'Sousa%'

2- Todos os dados dos estoquistas que controlam a mercadoria com código '001', 
ordenados pelo salário em ordem decrescente.

SELECT E.*
FROM ESTOQUISTA E, CONTROLA_MERCADORIA CM
WHERE E.CPF=CM.CPFEstoquista AND CM.CodMercadoria='001'
ORDER BY E.Salario DESC

3- A quantidade de vendas com valor total acima de R$ 300,00.

SELECT COUNT(*) AS Quantidade
FROM VENDA
WHERE ValorTotal>300

4- O nome, código e preço de todas as mercadorias do tipo "Cerveja", ordenados em ordem alfabética.

SELECT Nome, Codigo, Preço
FROM MERCADORIA
WHERE Tipo='Cerveja' 
ORDER BY Nome 

5- O telefone dos clientes que estão na cidade Cajazeiras. 

SELECT Telefone
FROM Telefone_Cliente
WHERE CPFCliente IN
(SELECT cpf 
FROM CLIENTE
where cidade like 'Cajazeiras%')

6- O código dos vendedores supervisionados pelo supervisor de RG ‘4132793’.    

SELECT Codigo
FROM Vendedor
WHERE CpfSupervisor IN
(SELECT Cpf
FROM Supervisor
WHERE rg='4132793')

7- O modelo, a montadora e a placa de todos os caminhões de categoria "leve".  

SELECT Placa,Modelo,Montadora
FROM CAMINHAO
WHERE Categoria = 'Leve'

8- O código e valor total de todas as vendas conferidas pelo secretário com CPF '02547274418'.   

SELECT Codigo,ValorTotal
FROM Venda
WHERE CPFSecretario='02547274418'

9- O valor acumulado em todas as vendas registradas.

SELECT SUM(ValorTotal) AS ValorAcumulado
FROM VENDA
WHERE Codigo IS NOT NULL

10- O CPF de todos os clientes com o nome do estabelecimento iniciado pela letra 'F'.

SELECT NomeEstabelecimento, CPF
FROM CLIENTE 
WHERE NomeEstabelecimento LIKE 'F%' 
AND NomeEstabelecimento IS NOT NULL


11- Para cada cidade em que existem clientes, recuperar o nome da cidade e a quantidade de clientes.

SELECT Cidade,COUNT(*) as numDeClientes
FROM Cliente
GROUP BY Cidade

12- Recuperar o nome da cidade, a quantidade de vendas realizadas e a soma dos valores totais das vendas de cada cidade
que tenha mais de uma venda registrada.

SELECT Cidade,count(*) AS Quantidade, SUM(valortotal) AS Valortotal
FROM Venda
GROUP BY Cidade
HAVING COUNT(*)>1



13- O nome e o CPF dos entregadores que utilizaram caminhões.

SELECT E.Nome, E.CPF
FROM ENTREGADOR E
WHERE EXISTS(
SELECT * 
FROM USA_CAMINHAO UC
WHERE UC.CPFEntregador=E.CPF
)


14- O nome e o CPF dos secretários que ainda não informaram nenhum estoquista sobre vendas.

SELECT S.Nome,S.CPF
FROM SECRETARIO S
WHERE NOT EXISTS
(SELECT *
FROM SECRETARIO_ESTOQUISTA_VENDA SEV
WHERE SEV.CPFSecretario=S.CPF
)