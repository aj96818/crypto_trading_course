use crypto_tracker_db;

DROP PROCEDURE sp_GetAvgBuySell;

DELIMITER //
CREATE PROCEDURE sp_GetAvgBuySell(IN symbol varchar(50))
BEGIN
SELECT
    t.symbol
    , t.txn_type
    , ROUND(SUM(t.quantity), 2) AS `Total Quantity`
    , ROUND(SUM(t.quantity * t.price)) AS `Total Price`
	, ROUND(SUM(t.quantity * t.price) / SUM(t.quantity), 2) AS `Avg Price`
    , SUM(t.fee) AS `Total Fees`
	, COUNT(*) AS `Total Txns`
FROM
    txns t
WHERE
    t.txn_type = 'BUY'
AND t.symbol = symbol    
GROUP BY
    t.symbol
    , t.txn_type
UNION
SELECT
    t.symbol
    , t.txn_type
    , ROUND(SUM(t.quantity), 2) AS `Total Quantity`
    , ROUND(SUM(t.quantity * t.price)) AS `Total Price`
	, ROUND(SUM(t.quantity * t.price) / SUM(t.quantity), 2) AS `Avg Price`
    , SUM(t.fee) AS `Total Fees`
	, COUNT(*) AS `Total Txns`
FROM
    txns t
WHERE
    t.txn_type = 'SELL'
AND t.symbol = symbol    
GROUP BY
    t.symbol
    , t.txn_type;
END //
DELIMITER ;
