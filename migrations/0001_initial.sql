-- Inicialização do banco de dados para o MC Castro To Do

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de categorias
CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    color TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de tarefas
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL,
    client_id INTEGER,
    category_id INTEGER,
    due_date TEXT,
    start_time TEXT,
    end_time TEXT,
    priority TEXT DEFAULT 'C',
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Inserir categorias padrão
INSERT OR IGNORE INTO categories (name, color) VALUES 
('Tarefa', '#3498db'),
('Reunião', '#e74c3c'),
('Evento', '#2ecc71');
