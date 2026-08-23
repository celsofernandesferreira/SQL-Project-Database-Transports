# SQL-Project-Database-Transports
🚌 Sistema de Gestão de Transportes Públicos (Bilhética)
📌 Sobre o Projeto
Este projeto consiste no desenho e implementação de uma base de dados relacional em SQLite, simulando o ecossistema de bilhética de uma empresa de transportes públicos. O objetivo foi aplicar lógica de negócio real para resolver problemas de operação diária, extrair relatórios financeiros complexos e garantir a qualidade dos dados.

🗂️ Estrutura da Base de Dados (ERD)
O sistema é composto por 5 tabelas interligadas que espelham a operação da empresa: Clientes, Cartoes, Carregamentos, GuimaFlex e Bilhetes.

[ARRASTA PARA AQUI A IMAGEM DO TEU DIAGRAMA ERD]

💼 Casos de Negócio Resolvidos (Business Queries)
Durante o desenvolvimento, foram criadas consultas SQL para responder a necessidades reais de vários departamentos da empresa:

1. Departamento Financeiro: Consolidação de Receitas
Para evitar que a direção financeira tenha de somar valores manualmente, foi criada uma VIEW permanente que calcula a faturação global absoluta. Esta consulta soma a receita dos bilhetes de bordo, o valor pago por clientes e entidades (Estado/Câmara) nos passes, e os carregamentos de saldo avulso (GuimaFlex).

[ARRASTA PARA AQUI O PRINT "Total Faturado.png" ou "A Criar uma view..."]

Também foi implementada a filtragem matemática rigorosa por datas (>= e <) para auditar meses específicos de faturação (ex: Janeiro de 2026), evitando erros de fuso horário comuns no comando BETWEEN.

[ARRASTA PARA AQUI O PRINT "Carregamentos mes de janeiro.png" ou o print 143605]

2. Apoio ao Cliente & Operações (Helpdesk)
O sistema permite antecipar necessidades operacionais, como a identificação de clientes a transitar de escalão etário (de Sub-18 para Universitário/Sub-23), cruzando a data de nascimento com a tipologia do cartão através de um JOIN.

[ARRASTA PARA AQUI O PRINT "passar de um sub 18 para um sub 23.png"]

Através da utilização avançada de LEFT JOIN, é possível auditar a base de dados para encontrar anomalias estruturais, como passageiros registados no sistema que não possuem qualquer cartão associado ou cujo cartão se encontra inativo.

[ARRASTA PARA AQUI O PRINT "Descobrir Passageiro com cartao inativo.png"]

Para campanhas de marketing ou auditoria rápida, foi criada uma análise dos Top 10 maiores carregamentos da carteira virtual GuimaFlex utilizando ordenação descendente e limite de resultados.

[ARRASTA PARA AQUI O PRINT "Descobrir guimaflex com mais valor.png"]

3. Qualidade de Dados (Data Quality)
Para combater erros de introdução manual de dados pelos operadores, foram aplicadas funções de normalização de texto (como o UPPER()) acompanhadas de funções de agregação, garantindo que métricas como o tipo de bilhete são agrupadas corretamente independentemente de terem sido escritas em maiúsculas ou minúsculas.

[ARRASTA PARA AQUI O PRINT "Correcão dos bilhetes.png"]

🛠️ Tecnologias Utilizadas
Base de Dados: SQLite

Linguagem: SQL (DDL, DML, DQL)

Conceitos Aplicados: Views, Joins (Inner/Left), Funções de Agregação, Tratamento de Nulos, Normalização de Strings, Operações com Datas.

Autor: Celso Fernandes Ferreira

Projeto desenvolvido para demonstração de competências analíticas e suporte de sistemas.
