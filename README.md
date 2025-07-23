# 🚴‍♂️ Projeto Adventure Works - Pipeline de BI Completa

Este projeto demonstra uma pipeline completa de dados construída com foco em análise de vendas, utilizando a base fictícia Adventure Works.

## 🛠 Tecnologias Utilizadas
- **Python** – para ingestão e transformação inicial dos dados
- **DBT (Data Build Tool)** – para modelagem de dados e versionamento de transformações
- **Power BI** – para construção de dashboards interativos

## 📊 Objetivo
Criar um painel de Business Intelligence que forneça insights sobre:
- Faturamento total
- Análise por categoria de produto
- Metas e desempenho de vendas
- Ticket médio
- Produtos mais vendidos

## 📁 Estrutura do Projeto
/adventureworks-pipeline
│
├── python/ # Scripts de ingestão e pré-processamento
├── dbt/ # Projeto DBT com modelos, sources e macros
├── dashboard/ # Arquivo .pbix com o dashboard final
└── README.md # Este arquivo

yaml
Copiar
Editar

## 📎 Arquivo PBIX
O arquivo `AdventureWorks_Final.pbix` está incluído na pasta `/dashboard`.  
Você pode abri-lo no Power BI Desktop para explorar o painel.

## 📌 Observações
Este projeto é totalmente fictício e serve para fins educacionais e de portfólio.  
Sugestões e feedbacks são muito bem-vindos!

---

Feito com 💻, café ☕ e vários `dbt run --full-refresh` ao longo do caminho.
