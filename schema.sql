DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phone_number TEXT,
    email TEXT,
    FIO TEXT,
    address TEXT
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    price REAL NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    total REAL,
    status TEXT DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO users (phone_number, email, FIO, address) VALUES
('+7-900-111-11-11', 'ivan@test.com', 'Иван Иванов', 'Москва, ул. Ленина, 1'),
('+7-900-222-22-22', 'petr@test.com', 'Пётр Петров', 'СПб, Невский пр., 10'),
('+7-900-333-33-33', 'anna@test.com', 'Анна Сидорова', 'Казань, ул. Баумана, 5');

INSERT INTO products (title, price, stock) VALUES
('Ноутбук', 50000, 10),
('Мышь', 1500, 50),
('Клавиатура', 3000, 20),
('Монитор', 20000, 5),
('Наушники', 2500, -3); -- БАГ: отрицательный остаток

INSERT INTO orders (user_id, product_id, quantity, total, status) VALUES
(1, 1, 1, 50000, 'completed'),
(1, 2, 2, 3000, 'completed'),
(2, 3, 1, 3000, 'pending'),
(2, 4, 1, 20000, 'cancelled'),
(3, 5, 2, 5000, 'completed'),
(99, 1, 1, 50000, 'pending'), -- БАГ: несуществующий юзер
(1, 1, 0, 0, 'completed');    -- БАГ: нулевое количество