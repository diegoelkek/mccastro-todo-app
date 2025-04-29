# MC Castro To Do

Este é um aplicativo de gerenciamento de tarefas desenvolvido com Next.js e Vercel Postgres.

## Funcionalidades

- Gerenciamento de tarefas com prioridades (A, B, C)
- Categorização de tarefas (Tarefas, Reuniões, etc.)
- Associação de tarefas a clientes
- Visualização em lista e calendário
- Datas e horários para tarefas e eventos
- Interface responsiva e amigável

## Tecnologias

- Next.js 15
- React 19
- Vercel Postgres
- Tailwind CSS
- TypeScript

## Configuração do Banco de Dados

Este aplicativo utiliza o Vercel Postgres. Ao implantar no Vercel, você precisará:

1. Criar um banco de dados Postgres no Vercel
2. Configurar as variáveis de ambiente conforme o arquivo `.env.example`
3. Executar o script de migração em `.vercel/postgres/schema.sql`

## Desenvolvimento Local

```bash
# Instalar dependências
npm install

# Configurar variáveis de ambiente
cp .env.example .env.local
# Editar .env.local com suas credenciais

# Iniciar servidor de desenvolvimento
npm run dev
```

## Implantação

Este projeto está configurado para implantação no Vercel. Consulte as instruções de implantação fornecidas para mais detalhes.
