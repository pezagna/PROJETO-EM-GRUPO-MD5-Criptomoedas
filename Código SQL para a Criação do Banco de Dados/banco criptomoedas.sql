
-- Criando a tabela criptomoedas, onde será inserida as informações de ID, nome e símbolo.
CREATE TABLE criptomoedas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    simbolo VARCHAR(20)

	);
	
-- Criando a tabela precos_historicos onde será inserida as informações de data e valores numéricos. Também será inserida todas as Foreign Key de relacionamento da tabela criptomoedas
CREATE TABLE precos_historicos (
    id SERIAL PRIMARY KEY,
    criptomoeda_id INT,
    data TIMESTAMP,
	abertura NUMERIC,
    alta NUMERIC,
    baixa NUMERIC,
    fechamento NUMERIC,
    volume NUMERIC,
    marketcap NUMERIC,
	
    FOREIGN KEY (criptomoeda_id) REFERENCES criptomoedas (id)
	);
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comando para copiar do diretório e inserir informações do arquivo csv que contém dados de id,nome e símbolo
COPY criptomoedas (id,nome, simbolo) FROM 'C:\criptomoedas.csv' DELIMITER ',' CSV HEADER;

-- Comando para copiar do diretório e inserir informações do arquivo csv que contém dados de id,data , abertura, alta, baixa , fechamento, volume, marketcap.
COPY precos_historicos (criptomoeda_id, data , abertura, alta, baixa , fechamento, volume, marketcap) FROM 'C:\precos_historicos.csv' DELIMITER ',' CSV HEADER;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comando para selecionar e exibir os dados da tabela precos_historicos
select * from precos_historicos

-- Comando para selecionar e exibir os dados da tabela criptomoedas
select * from criptomoedas

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comando para realizar uma query de teste para verificar o relacionamento das tabelas, será selecionado e exibido a data e os valores da criptomoeda bitcoin.
SELECT c.nome, ph.data, ph.alta
FROM criptomoedas c
JOIN precos_historicos ph ON c.id = ph.criptomoeda_id
WHERE c.nome = 'Bitcoin';
---------------------------------------------------------------------------------------------------------------------------------------------------------------

