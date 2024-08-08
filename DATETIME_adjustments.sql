-- Table adujustments for creation date; repeated this query for Atlas, Equinox, and Wukong
ALTER TABLE mesa_prices
MODIFY creation_date DATE;


-- Finding amount of entries for early vault/unvault periods
-- Repeated this query for Atlas, Equinox, and Wukong with their corresponding vault/unvault periods
-- Given limitations of current data, only analyze price changes from most recent vault/unvault periods
SELECT COUNT(*) FROM mesa_prices
WHERE order_type = 'sell'
AND creation_date BETWEEN '2018-12-18' AND '2020-10-26';
