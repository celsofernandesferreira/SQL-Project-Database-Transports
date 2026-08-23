# 🚌 Public Transport Management System (Ticketing) / Sistema de Gestão de Transportes Públicos 

*Choose your language / Escolha o seu idioma:*
* 🇬🇧 [English Version](#-english-version)
* 🇵🇹 [Versão em Português](#-versão-em-português)

---

## 🇬🇧 English Version

### 📌 About the Project
This project consists of the design and implementation of a relational database in SQLite, simulating the ticketing ecosystem of a public transport company. The main goal was to apply real-world business logic to solve daily operational problems, extract complex financial reports, and ensure data quality.

### 🗂️ Database Structure (ERD)
The system is composed of 5 interconnected tables that mirror the company's daily operations: `Clientes` (Customers), `Cartoes` (Cards), `Carregamentos` (Top-ups), `GuimaFlex` (Virtual Wallet), and `Bilhetes` (Tickets).

> **[DRAG AND DROP YOUR ERD IMAGE HERE]**

### 💼 Business Cases Solved (Business Queries)
During development, several SQL queries were created to answer the real-world needs of various company departments:

#### 1. Finance Department: Revenue Consolidation
To prevent the financial board from manually summing values, a permanent **VIEW** was created to calculate the absolute global revenue. This query sums onboard ticket revenue, the value paid by customers and entities (State/City Hall) for transit passes, and virtual wallet (GuimaFlex) top-ups.
> **[<img width="1035" height="654" alt="Total Faturado" src="https://github.com/user-attachments/assets/f4efc834-2834-4016-8e61-ed2c04adcc4b" />
]**

Strict mathematical date filtering (`>=` and `<`) was also implemented to audit specific billing months (e.g., January 2026), avoiding common timezone errors associated with the `BETWEEN` command.
> **[DRAG AND DROP THE "Carregamentos mes de janeiro.png" IMAGE HERE]**

#### 2. Customer Support & Operations (Helpdesk)
The system anticipates operational needs, such as identifying customers transitioning age brackets (from Under-18 to University/Under-23), by cross-referencing their birth date with the card typology using a `JOIN`.
> **[DRAG AND DROP THE "passar de um sub 18 para um sub 23.png" IMAGE HERE]**

Using advanced `LEFT JOIN` operations, the database can be audited to find structural anomalies, such as registered passengers who do not have any associated card or whose card is currently inactive.
> **[DRAG AND DROP THE "Descobrir Passageiro com cartao inativo.png" IMAGE HERE]**

For marketing campaigns or quick auditing, a Top 10 analysis of the largest top-ups in the GuimaFlex virtual wallet was created using descending order and result limits.
> **[DRAG AND DROP THE "Descobrir guimaflex com mais valor.png" IMAGE HERE]**

#### 3. Data Quality
To combat manual data entry errors by operators, string normalization functions (such as `UPPER()`) were applied alongside aggregation functions. This ensures that metrics like ticket types are grouped correctly regardless of case sensitivity issues during manual input.
> **[DRAG AND DROP THE "Correcão dos bilhetes.png" IMAGE HERE]**

### 🛠️ Technologies Used
* **Database:** SQLite
* **Language:** SQL (DDL, DML, DQL)
* **Applied Concepts:** Views, Joins (Inner/Left), Aggregation Functions, Null Handling, String Normalization, Date Operations.

**Author:** Celso Fernandes Ferreira  
*Project developed to demonstrate analytical skills and IT systems support capabilities.*

---

## 🇵🇹 Versão em Português

### 📌 Sobre o Projeto
Este projeto consiste no desenho e implementação de uma base de dados relacional em SQLite, simulando o ecossistema de bilhética de uma empresa de transportes públicos. O objetivo foi aplicar lógica de negócio real para resolver problemas de operação diária, extrair relatórios financeiros complexos e garantir a qualidade dos dados.

### 🗂️ Estrutura da Base de Dados (ERD)
O sistema é composto por 5 tabelas interligadas que espelham a operação da empresa: `Clientes`, `Cartoes`, `Carregamentos`, `GuimaFlex` e `Bilhetes`.

> **[ARRASTA PARA AQUI A IMAGEM DO TEU DIAGRAMA ERD]**

### 💼 Casos de Negócio Resolvidos (Business Queries)
Durante o desenvolvimento, foram criadas consultas SQL para responder a necessidades reais de vários departamentos da empresa:

#### 1. Departamento Financeiro: Consolidação de Receitas
Para evitar que a direção financeira tenha de somar valores manualmente, foi criada uma **VIEW** permanente que calcula a faturação global absoluta. Esta consulta soma a receita dos bilhetes de bordo, o valor pago por clientes e entidades (Estado/Câmara) nos passes, e os carregamentos de saldo avulso (GuimaFlex).
> **[ARRASTA PARA AQUI O PRINT "Total Faturado.png" ou "A Criar uma view..."]**

Também foi implementada a filtragem matemática rigorosa por datas (`>=` e `<`) para auditar meses específicos de faturação (ex: Janeiro 2026), evitando erros de fuso horário comuns no comando `BETWEEN`.
> **[ARRASTA PARA AQUI O PRINT "Carregamentos mes de janeiro.png"]**
<img width="1035" height="654" alt="Total Faturado" src="https://github.com/user-attachments/assets/7ac06f70-ee6f-4b0b-8705-aef30249ca52" />

#### 2. Apoio ao Cliente & Operações (Helpdesk)
O sistema permite antecipar necessidades operacionais, como a identificação de clientes a transitar de escalão etário (de Sub-18 para Universitário/Sub-23), cruzando a data de nascimento com a tipologia do cartão através de um `JOIN`.
> **[ARRASTA PARA AQUI O PRINT "passar de um sub 18 para um sub 23.png"]**

Através da utilização avançada de `LEFT JOIN`, é possível auditar a base de dados para encontrar anomalias estruturais, como passageiros registados no sistema que não possuem qualquer cartão associado ou cujo cartão se encontra inativo.
> **[ARRASTA PARA AQUI O PRINT "Descobrir Passageiro com cartao inativo.png"]**

Para campanhas de marketing ou auditoria rápida, foi criada uma análise dos Top 10 maiores carregamentos da carteira virtual GuimaFlex utilizando ordenação descendente e limite de resultados.
> **[ARRASTA PARA AQUI O PRINT "Descobrir guimaflex com mais valor.png"]**

#### 3. Qualidade de Dados (Data Quality)
Para combater erros de introdução manual de dados pelos operadores, foram aplicadas funções de normalização de texto (como o `UPPER()`) acompanhadas de funções de agregação, garantindo que métricas como o tipo de bilhete são agrupadas corretamente independentemente de terem sido escritas em maiúsculas ou minúsculas.
> **[ARRASTA PARA AQUI O PRINT "Correcão dos bilhetes.png"]**

### 🛠️ Tecnologias Utilizadas
* **Base de Dados:** SQLite
* **Linguagem:** SQL (DDL, DML, DQL)
* **Conceitos Aplicados:** Views, Joins (Inner/Left), Funções de Agregação, Tratamento de Nulos, Normalização de Strings, Operações com Datas.

**Autor:** Celso Fernandes Ferreira  
*Projeto desenvolvido para demonstração de competências analíticas e suporte de sistemas.*
