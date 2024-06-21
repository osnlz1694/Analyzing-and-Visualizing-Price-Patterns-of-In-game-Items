-- Finding SHORT-RUN average/median price for Atlas' vault period
-- Repeated first two queries with only changes to order_type filter and limit amount
-- Median: 70 sell vs 35 buy   |  Average: 82 sell vs 33 buy
-- Minimum selling price: 60   |  Maximum buying price: 40
SELECT * FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-16' AND '2024-03-15'
ORDER BY platinum
LIMIT 19;

SELECT ROUND(AVG(platinum), 0) AS vault_short
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-16' AND '2024-03-15';

SELECT MIN(platinum) AS sell_min_short
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2024-02-16' AND '2024-03-15';

SELECT MAX(platinum) AS buy_max_short
FROM atlas_prices
WHERE order_type = 'buy'
AND creation_date BETWEEN '2024-02-16' AND '2024-03-15';


-- Finding LONG-RUN average/median price for Mesa's vault period
-- Repeated first two queries with only changes to order_type filter and limit amount
-- Median: 70 sell vs 42 buy  |  Average: 72 sell vs 41 buy
-- Minimum selling price: 50  |  Maximum buying price: 60
SELECT * FROM atlas_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-15'
ORDER BY platinum
LIMIT 239;

SELECT ROUND(AVG(platinum), 0) AS vault_long
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date > '2024-03-15';

SELECT MIN(platinum) AS sell_min_long
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date > '2024-03-15';

SELECT MAX(platinum) AS buy_max_long
FROM atlas_prices
WHERE order_type = 'buy'
AND creation_date > '2024-03-15';


-- Finding month-by-month price changes (avg, min, max)
-- Repeated first query with only changes to order_type filter
SELECT ROUND(AVG(platinum), 0) AS avg_sell, MONTH(creation_date) AS month
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date > '2024-02-16'
GROUP BY MONTH(creation_date);

SELECT MIN(platinum) AS min_sell, MONTH(creation_date) AS month
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date > '2024-02-16'
GROUP BY MONTH(creation_date);

SELECT MAX(platinum) AS max_buy, MONTH(creation_date) AS month
FROM atlas_prices
WHERE order_type = 'sell'
AND creation_date > '2024-02-16'
GROUP BY MONTH(creation_date);