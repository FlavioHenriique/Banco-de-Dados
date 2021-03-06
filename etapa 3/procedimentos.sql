1- Retornar a quantidade de funcion�rios que tem sal�rio maior do que um valor determinado.

CREATE FUNCTION SalarioFuncionarios(Real) 
   	RETURNS int AS $$ 	
   	DECLARE Sal Alias FOR $1; 
            cont INTEGER:=0; 
		Resultado Supervisor%RowType; 
	BEGIN 
		FOR Resultado IN SELECT * FROM SUPERVISOR WHERE Salario>Sal 
		LOOP 
            	Cont:=cont+1; 
		END LOOP;

		FOR Resultado IN SELECT * FROM VENDEDOR WHERE Salario>Sal 
		LOOP 
            	Cont:=cont+1; 
		END LOOP;

		FOR Resultado IN SELECT * FROM SECRETARIO WHERE Salario>Sal 
		LOOP 
        	Cont:=cont+1; 
		END LOOP;

		FOR Resultado IN SELECT * FROM ESTOQUISTA WHERE Salario>Sal 
		LOOP 
        	Cont:=cont+1; 
		END LOOP;

		FOR Resultado IN SELECT * FROM ENTREGADOR WHERE Salario>Sal 
		LOOP 
        	Cont:=cont+1; 
		END LOOP;
	RETURN cont; 
	END;$$ 
LANGUAGE PLPGSQL

2- Recuperar o c�digo da mercadoria mais requisitada em uma venda determinada.

CREATE FUNCTION MercadoriaAdquirida(INTEGER)
RETURNS VARCHAR(3) AS $$
DECLARE
	Codigo ALIAS FOR $1;
    	quant integer :=0;
    	resultado TEM_MERCADORIA%rowtype;
    	merc varchar(3);
    
BEGIN
	FOR Resultado IN SELECT * FROM TEM_MERCADORIA WHERE CodVenda=Codigo
        LOOP
    	IF resultado.quantidade>quant then begin 
        					quant:=resultado.quantidade;
                                                merc:=resultado.codmercadoria;
                                            end;
        END IF;
    	END LOOP;
    	RETURN merc;
END;$$
LANGUAGE PLPGSQL

3- Retornar o valor adquirido por uma mercadoria em uma determinada venda.

CREATE FUNCTION LUCRO(VARCHAR,INTEGER) 
RETURNS NUMERIC AS $$ 
DECLARE 
codigomerc alias for $1; 
codigovenda alias for $2;
Valor Numeric; 
BEGIN 
    SELECT INTO Valor cast(quantidade*pre�ounitario as numeric(12,2)) 
    FROM TEM_MERCADORIA 
    WHERE codigomerc=CodMercadoria AND codigovenda=codvenda; 
    RETURN Valor; 
END;$$ 
LANGUAGE PLPGSQL

