SQL e Funções Criadas

Este repositório tem como objetivo apresentar o uso de SQL (Structured Query Language) em projetos de banco de dados, destacando o uso de funções personalizadas para manipulação, análise e transformação de dados.
Sumário

    Introdução
    Requisitos
    Instalação e Configuração
    Funções SQL Criadas
    Exemplos de Consultas
    Considerações Finais
    Licença

Introdução

O SQL é uma linguagem padrão utilizada para gerenciar dados em sistemas de gerenciamento de banco de dados relacionais (RDBMS). Ao longo de projetos de análise de dados ou sistemas, frequentemente é necessário criar funções personalizadas em SQL para resolver problemas específicos ou otimizar consultas complexas.

Este repositório reúne exemplos de funções SQL criadas para ajudar na manipulação de dados e otimizar a performance das consultas.
Requisitos

    Banco de Dados Relacional: Este repositório pressupõe que você tenha acesso a um banco de dados relacional como MySQL, PostgreSQL, ou SQL Server.
    Ambiente SQL: Você pode utilizar qualquer cliente de banco de dados (como DBeaver, PgAdmin, MySQL Workbench, etc.) para executar as consultas.

Instalação e Configuração

    Instale um banco de dados SQL (MySQL, PostgreSQL, etc.).
    Crie um banco de dados e tabelas conforme a estrutura proposta ou de acordo com suas necessidades.
    Importe os dados de exemplo para realizar os testes.

Exemplo de criação de banco de dados e tabelas em MySQL:

CREATE DATABASE exemplo_db;

USE exemplo_db;

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    valor DECIMAL(10, 2),
    categoria VARCHAR(100)
);

INSERT INTO vendas (data_venda, valor, categoria)
VALUES
('2025-01-01', 150.00, 'Eletrônicos'),
('2025-01-02', 200.00, 'Roupas'),
('2025-01-02', 50.00, 'Livros');

Funções SQL Criadas
1. Função para calcular o total de vendas por categoria

Essa função calcula o total de vendas para uma determinada categoria em um período específico.

CREATE FUNCTION total_vendas_categoria(categoria_input VARCHAR(100), data_inicio DATE, data_fim DATE)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(valor) INTO total
    FROM vendas
    WHERE categoria = categoria_input
      AND data_venda BETWEEN data_inicio AND data_fim;
      
    RETURN total;
END;

Exemplo de uso:

SELECT total_vendas_categoria('Eletrônicos', '2025-01-01', '2025-01-31');

2. Função para calcular o valor médio das vendas por mês

Essa função calcula o valor médio das vendas em um mês específico.

CREATE FUNCTION media_vendas_mes(mes INT, ano INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10, 2);
    
    SELECT AVG(valor) INTO media
    FROM vendas
    WHERE MONTH(data_venda) = mes
      AND YEAR(data_venda) = ano;
      
    RETURN media;
END;

Exemplo de uso:

SELECT media_vendas_mes(1, 2025);

3. Função para retornar o maior valor de venda em um período

Essa função retorna o maior valor de venda registrado em um intervalo de datas.

CREATE FUNCTION maior_venda_periodo(data_inicio DATE, data_fim DATE)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE maior_valor DECIMAL(10, 2);
    
    SELECT MAX(valor) INTO maior_valor
    FROM vendas
    WHERE data_venda BETWEEN data_inicio AND data_fim;
    
    RETURN maior_valor;
END;

Exemplo de uso:

SELECT maior_venda_periodo('2025-01-01', '2025-01-31');

4. Função para contar o número de vendas por categoria

Essa função retorna o número total de vendas realizadas em uma categoria específica.

CREATE FUNCTION contar_vendas_categoria(categoria_input VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE contagem INT;
    
    SELECT COUNT(*) INTO contagem
    FROM vendas
    WHERE categoria = categoria_input;
    
    RETURN contagem;
END;

Exemplo de uso:

SELECT contar_vendas_categoria('Eletrônicos');

Exemplos de Consultas

Aqui estão algumas consultas práticas que podem ser feitas utilizando as funções criadas:

    Total de vendas para a categoria 'Eletrônicos' em Janeiro de 2025:

SELECT total_vendas_categoria('Eletrônicos', '2025-01-01', '2025-01-31');

Média das vendas realizadas no mês de Janeiro de 2025:

SELECT media_vendas_mes(1, 2025);

Maior valor de venda no período de 01 a 15 de Janeiro de 2025:

SELECT maior_venda_periodo('2025-01-01', '2025-01-15');

Número de vendas na categoria 'Roupas':

    SELECT contar_vendas_categoria('Roupas');

Considerações Finais

O uso de funções SQL personalizadas permite automatizar cálculos e análises repetitivas, o que pode melhorar a eficiência de consultas complexas e reduzir a carga no banco de dados. Além disso, estas funções ajudam a manter a consistência e a legibilidade do código SQL em projetos de maior escala.

Se você estiver criando funções SQL para uso em produção, é importante também considerar:

    Performance: Teste as funções em grandes volumes de dados para garantir que o desempenho esteja dentro do esperado.
    Segurança: Utilize boas práticas de segurança ao trabalhar com dados sensíveis, como SQL Injection.
    Manutenção: Mantenha as funções bem documentadas e reutilizáveis para facilitar a manutenção do código no futuro.

Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo LICENSE para mais detalhes.

Este README oferece uma introdução ao uso de SQL e funções criadas para resolver problemas comuns de manipulação e análise de dados, proporcionando soluções eficientes e reutilizáveis em ambientes de banco de dados.
