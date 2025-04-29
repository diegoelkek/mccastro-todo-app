-- Esquema para o banco de dados Vercel Postgres (Multiusuário)

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL, -- Armazenar hash da senha, nunca a senha em texto plano
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clients (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de categorias
CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  color TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de tarefas/eventos
CREATE TABLE IF NOT EXISTS tasks (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  owner_user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- Quem criou a tarefa
  client_id INTEGER REFERENCES clients(id) ON DELETE SET NULL,
  category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
  priority TEXT NOT NULL,
  date DATE,
  start_time TIME,
  end_time TIME,
  completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de associação para participantes de tarefas/eventos (Muitos-para-Muitos)
CREATE TABLE IF NOT EXISTS task_participants (
  task_id INTEGER NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  PRIMARY KEY (task_id, user_id) -- Chave primária composta
);

-- Inserir categoria padrão "Tarefa" com cor azul
INSERT INTO categories (name, color) VALUES ("Tarefa", "#3b82f6") ON CONFLICT DO NOTHING;
