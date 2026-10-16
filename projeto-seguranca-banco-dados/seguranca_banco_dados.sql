-- Projeto: Segurança em Banco de Dados
-- Autor: Samuel Carlos Correia
-- Turma: ADS - Noite
-- Banco: PostgreSQL no Neon

-- =====================================================
-- EXERCÍCIO 1: RESTRIÇÕES DE VALIDAÇÃO
-- =====================================================

CREATE TABLE transacoes (
    id INT PRIMARY KEY,
    conta_origem INT,
    conta_destino INT,
    valor DECIMAL(10,2)
);

ALTER TABLE transacoes
ADD CONSTRAINT chk_transacoes_valor_positivo
CHECK (valor > 0);

ALTER TABLE transacoes
ADD CONSTRAINT chk_contas_diferentes
CHECK (conta_origem <> conta_destino);

-- Teste válido
INSERT INTO transacoes
    (id, conta_origem, conta_destino, valor)
VALUES
    (2, 300, 400, 75.00);

-- Teste bloqueado: valor negativo
-- INSERT INTO transacoes
--     (id, conta_origem, conta_destino, valor)
-- VALUES
--     (3, 100, 200, -50.00);

-- Teste bloqueado: valor zero
-- INSERT INTO transacoes
--     (id, conta_origem, conta_destino, valor)
-- VALUES
--     (3, 100, 200, 0.00);

-- Teste bloqueado: contas iguais
-- INSERT INTO transacoes
--     (id, conta_origem, conta_destino, valor)
-- VALUES
--     (3, 100, 100, 80.00);

SELECT * FROM transacoes;

-- =====================================================
-- EXERCÍCIO 2: VIEW E CONTROLE DE ACESSO
-- =====================================================

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    departamento VARCHAR(50),
    cpf VARCHAR(11),
    salario DECIMAL(10,2)
);

CREATE VIEW vw_funcionarios_publico AS
SELECT
    nome,
    departamento
FROM funcionarios;

-- A role atendimento já existia no Neon.
-- Em um banco novo, poderia ser criada com:
-- CREATE ROLE atendimento NOLOGIN;

REVOKE ALL PRIVILEGES
ON funcionarios
FROM atendimento;

GRANT SELECT
ON vw_funcionarios_publico
TO atendimento;

-- Dados fictícios para teste
INSERT INTO funcionarios
    (id, nome, departamento, cpf, salario)
VALUES
    (1, 'Ana Souza', 'Atendimento', '12345678901', 2500.00),
    (2, 'Carlos Lima', 'Tecnologia', '98765432100', 5000.00);

-- Consulta pública: não exibe CPF nem salário
SELECT * FROM vw_funcionarios_publico;

-- =====================================================
-- CONSULTAS DE VERIFICAÇÃO
-- =====================================================

SELECT table_name
FROM information_schema.views
WHERE table_schema = 'public'
  AND table_name = 'vw_funcionarios_publico';

SELECT
    grantee,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'atendimento';
