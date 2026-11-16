-- Поиск отрицательного остатка
SELECT * FROM products WHERE stock < 0;

-- Поиск заказов от несуществующих пользователей
SELECT * FROM orders WHERE user_id NOT IN (SELECT id FROM users);

-- Поиск заказов с нулевым или отрицательным количеством
SELECT * FROM orders WHERE quantity <= 0;

-- Поиск неверно посчитанной суммы заказа
SELECT o.id, o.total, p.price, o.quantity, (p.price * o.quantity) as expected_total
FROM orders o
JOIN products p ON o.product_id = p.id
WHERE o.total != (p.price * o.quantity);