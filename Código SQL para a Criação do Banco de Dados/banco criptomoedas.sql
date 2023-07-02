
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

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comando para adicionar a coluna descricao, que irá conter informações descritivas das criptomoedas.
ALTER TABLE criptomoedas ADD COLUMN descricao VARCHAR(700);

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Esta, é uma série de comandos UPDATE para inserir dados na coluna "descricao" da tabela "criptomoedas".
UPDATE criptomoedas
SET descricao = 'Cardano é uma plataforma de computação distribuída que executa o blockchain para a criptomoeda ADA. A Cardano foi criada pela empresa de desenvolvimento de blockchain Input Output Hong Kong (IOHK) e liderado pelo CEO Charles Hoskinson. A plataforma começou a ser desenvolvida em 2015 e foi lançada em 2017. A cardano estreou em 2017 com uma capitalização de mercado de US $600 milhões, em abril de 2021, a capitalização da criptomoeda somou US$ 39,8 bilhões. A cardano é chamada de ADA em homenagem a Ada Lovelace, a plataforma foi nomeada em homenagem a Gerolamo Cardano, e é uma das dez maiores criptomoedas por capitalização no mundo.'
WHERE nome = 'Cardano';

UPDATE criptomoedas
SET descricao = 'A criptomoeda Ripple (XRP) é um ativo digital descentralizado que foi lançado em 2012 pela Ripple Labs Inc. O objetivo principal da Ripple é facilitar pagamentos rápidos e de baixo custo em todo o mundo, bem como permitir a transferência de qualquer tipo de moeda ou ativo. Diferente de outras criptomoedas, a Ripple não utiliza uma blockchain tradicional, mas sim um protocolo chamado RippleNet, que é um sistema de liquidação bruta em tempo real (RTGS) baseado em um registro distribuído.'
WHERE nome = 'Ripple';

UPDATE criptomoedas
SET descricao = 'A Bitcoin é a primeira criptomoeda descentralizada, lançada em 2009 por um indivíduo ou grupo de pessoas sob o pseudônimo de Satoshi Nakamoto. Ela opera em uma rede peer-to-peer sem a necessidade de intermediários, como bancos, e é baseada em uma tecnologia chamada blockchain. O Bitcoin permite transações financeiras diretas e seguras, sem a necessidade de divulgar informações pessoais. Sua oferta é limitada a 21 milhões de moedas, o que contribui para sua economia e preservação ao longo do tempo.'
WHERE nome = 'Bitcoin';

UPDATE criptomoedas
SET descricao = 'A Dash é uma criptomoeda descentralizada que foi lançada em 2014. Ela é baseada na tecnologia blockchain e tem como objetivo fornecer transações rápidas e privadas. O Dash implementa um sistema de dois níveis, composto por masternodes e nós normais, para melhorar a velocidade das transações e a governança da rede. Além disso, o Dash oferece recursos como PrivateSend, que aumenta a privacidade das transações, e InstantSend, que permite a confirmação rápida das transações.'
WHERE nome = 'Dash';

UPDATE criptomoedas
SET descricao = 'EOS é uma criptomoeda lançada em 2018 e desenvolvida pela Block.one. Ela é baseada na tecnologia blockchain e tem como objetivo fornecer uma plataforma escalável para a criação e execução de aplicativos descentralizados (DApps). A EOS oferece recursos como escalabilidade horizontal, alta velocidade de transações e contratos inteligentes. Seu sistema utiliza um mecanismo de consenso conhecido como Delegated Proof of Stake (DPoS), onde um grupo seleto de nós (produtores de bloco) é eleito para validar as transações e manter a rede. Além disso, o EOS tem um modelo de governança que permite que os detentores de tokens participem das decisões da rede.'
WHERE nome = 'EOS';

UPDATE criptomoedas
SET descricao = 'A Stellar é uma criptomoeda e plataforma de pagamentos que visa facilitar transações rápidas e de baixo custo em escala global. Utiliza o protocolo Stellar Consensus Protocol (SCP) para validar as transações de forma descentralizada. A moeda nativa é o Lumens (XLM) e a plataforma permite a criação e transferência de tokens representando diversos ativos. A Stellar é amplamente adotada por instituições financeiras e empresas para transações eficientes e seguras.'
WHERE nome = 'Stellar';

UPDATE criptomoedas
SET descricao = 'IOTA é uma criptomoeda e plataforma de código aberto que foi lançada em 2015. A IOTA é uma criptomoeda e plataforma de código aberto que utiliza a tecnologia Tangle em vez de blockchain. Ela foi projetada para facilitar transações rápidas e escaláveis, especialmente para dispositivos da Internet das Coisas (IoT). A IOTA não tem taxas de transação e permite o compartilhamento seguro de dados entre dispositivos conectados. Seu objetivo é fornecer uma infraestrutura confiável para a economia da IoT e tem ganhado interesse de empresas e parcerias.'
WHERE nome = 'IOTA';

UPDATE criptomoedas
SET descricao = 'O Bitcoin Cash é uma criptomoeda que surgiu em 2017 como um resultado de uma divisão (hard fork) da rede do Bitcoin original. Ele foi criado para abordar as preocupações de escalabilidade do Bitcoin, oferecendo blocos maiores e taxas de transação mais baixas. O Bitcoin Cash compartilha muitos recursos com o Bitcoin, como a oferta limitada de moedas e a capacidade de realizar transações ponto a ponto. No entanto, ele tem como objetivo se tornar uma forma mais eficiente de pagamento digital, promovendo transações rápidas e baratas. O Bitcoin Cash tem sido adotado por algumas empresas e usuários como uma alternativa ao Bitcoin, embora seu uso ainda seja menor em comparação com o Bitcoin.'
WHERE nome = 'Bitcoin Cash';

UPDATE criptomoedas
SET descricao = 'O Litecoin é uma criptomoeda criada em 2011 como uma bifurcação do Bitcoin. Foi desenvolvido para ser mais rápido e eficiente, utilizando uma blockchain similar ao Bitcoin, mas com tempos de bloco mais rápidos e um algoritmo de mineração diferente. O Litecoin tem sido amplamente adotado como uma criptomoeda de pagamento, oferecendo transações rápidas e de baixo custo. Com uma oferta total maior que o Bitcoin, o Litecoin tem seu próprio ecossistema e comunidade dedicada.'
WHERE nome = 'Litecoin';

UPDATE criptomoedas
SET descricao = 'O Ethereum é uma criptomoeda e plataforma descentralizada que permite a criação e execução de aplicativos descentralizados e contratos inteligentes. Lançado em 2015, o Ethereum introduziu a ideia de contratos inteligentes e é conhecido por sua criptomoeda Ether (ETH). A plataforma é amplamente usada para desenvolver aplicativos em várias áreas, como finanças descentralizadas e tokens não fungíveis. O Ethereum se tornou uma das principais plataformas blockchain do mundo devido à sua tecnologia flexível e recursos avançados.'
WHERE nome = 'Ethereum';

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comando para selecionar e exibir a coluna "nome" e "descricao" da tabela "criptomoedas". 
-- Utilizando o DISTINCT Os nomes das criptomoedas não serão repetidos, e cada nome será acompanhado pela sua respectiva descrição.
SELECT DISTINCT nome, descricao
FROM criptomoedas;
