# Projeto: Segurança em Banco de Dados

Projeto acadêmico de Segurança em Banco de Dados, desenvolvido com PostgreSQL no Neon.

## Autor

- **Aluno:** Samuel Carlos Correia
- **Curso:** Análise e Desenvolvimento de Sistemas — 5º semestre
- **Turma:** ADS — Noite
- **Banco utilizado:** Neon PostgreSQL

## Objetivos

- Impedir transações com valores menores ou iguais a zero usando `CHECK CONSTRAINT`.
- Impedir que a conta de origem seja igual à conta de destino.
- Ocultar dados sensíveis por meio de uma `VIEW`.
- Aplicar o princípio do menor privilégio usando `REVOKE` e `GRANT`.

## Estrutura

- `seguranca_banco_dados.sql`: comandos SQL usados no Neon.
- `projeto_seguranca_banco_dados.pdf`: relatório final em PDF.
- `projeto_seguranca_banco_dados.docx`: relatório final editável em Word.

## Segurança

Não incluir neste repositório:

- Senha do Neon;
- String de conexão (`DATABASE_URL`);
- Tokens de acesso;
- Arquivos `.env`;
- Dados reais de usuários.

Os dados de funcionários usados no exercício são fictícios.
