-- Finding IMMEDIATE SHORT-RUN average/median price for Mesa's vault period
-- Repeated first two queries with only changes to order_type filter and limit amount
-- Median: 100 sell vs 60 buy  |  Average: 105 sell vs 55 buy
-- Minimum selling price: 80   |  Maximum buying price: 70
SELECT * FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-15' AND '2024-03-14'
ORDER BY platinum
LIMIT 44;

SELECT ROUND(AVG(platinum), 0) AS vault_short
FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-15' AND '2024-03-14';

SELECT MIN(platinum) AS sell_min_short
FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-15' AND '2024-03-14';

SELECT MAX(platinum) AS buy_max_short
FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date BETWEEN '2024-02-15' AND '2024-03-14';


-- Finding SHORT-RUN average/median price for Mesa's vault period
-- Repeated first two queries with only changes to order_type filter and limit amount
-- Median: 90 sell vs 65 buy  |  Average: 94 sell vs 62 buy
-- Minimum selling price: 50  |  Maximum buying price: 85        !!!!!
-- MIN selling price leaned towards 80, MAX buying price leaned towards 70
SELECT * FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-14'
ORDER BY platinum
LIMIT 46;

SELECT ROUND(AVG(platinum), 0) AS vault_long
FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-14';

SELECT MIN(platinum) AS sell_min_long
FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date > '2024-03-14';

SELECT MAX(platinum) AS buy_max_long
FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-14';

SELECT platinum
FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date > '2024-03-14'
ORDER BY platinum ASC;

SELECT platinum
FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-14'
ORDER BY platinum DESC;


-- Finding month-by-month price changes starting in Feb. (min sell price, max buy price)
-- min_sell: 80 -> 80 -> 60 -> 50 -> 75
-- max_buy: 60 -> 70 -> 85 -> 80 -> 85
SELECT MIN(platinum) AS min_sell, MONTH(creation_date) AS month
FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date > '2024-02-15'
GROUP BY MONTH(creation_date);

SELECT MAX(platinum) AS max_buy, MONTH(creation_date) AS month
FROM mesa_prices
WHERE order_type = 'buy'
AND creation_date > '2024-02-15'
GROUP BY MONTH(creation_date);
