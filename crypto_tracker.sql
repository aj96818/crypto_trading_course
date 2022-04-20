create database crypto_tracker_db;

# drop database py_tk_crypto_tracker;

use crypto_tracker_db;

drop table txns;

create table txns (
	txn_id int not null auto_increment
    , txn_date date
    , symbol VARCHAR(20)
    , txn_type varchar(15)
    , exchange_name varchar(100)
    , price decimal(12, 4)
    , quantity decimal(12, 4)
    , fee decimal(12,4)
    , primary key (txn_id)
); 

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "/Users/alanjackson/dumps/cb_historical_fills.csv"
INTO TABLE txns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Example manual import statement (after executing "mysql_csv_import_v2.py" script from CryptoTradingProject [PyCharm Project])
INSERT INTO txns (txn_id, txn_date, symbol, txn_type, exchange_name, price, quantity, fee) VALUES 
('282', '2021-09-27', 'BNB', 'Sell', 'Binance', '335.631', '1', '0'), ('284', '2021-09-27', 'BTC', 'Sell', 'Binance', '42156.06', '0.007974', '0'), ('292', '2021-10-02', 'BNB', 'Sell', 'Binance', '427.222', '0.188', '0'), ('294', '2021-10-02', 'BNB', 'Sell', 'Binance', '427.222', '0.312', '0'), ('295', '2021-10-02', 'BTC', 'Sell', 'Binance', '47649.61', '0.0016732', '0'), ('296', '2021-10-02', 'BTC', 'Sell', 'Binance', '47649.61', '0.0027768', '0'), ('298', '2021-10-09', 'BTC', 'Sell', 'Binance', '54929.74', '0.004025', '0'), ('302', '2021-10-13', 'FTM', 'Buy', 'Binance', '2.34527', '150', '0'), ('303', '2021-10-13', 'BNB', 'Buy', 'Binance', '470.521', '0.6855', '0'), ('305', '2021-10-13', 'FTM', 'Buy', 'Binance', '2.34527', '50', '0'), ('306', '2021-10-13', 'BNB', 'Buy', 'Binance', '470.521', '0.2285', '0'), ('309', '2021-10-13', 'AAVE', 'Sell', 'Binance', '261', '0.79', '0'), ('310', '2021-10-13', 'AAVE', 'Sell', 'Binance', '261', '0.21', '0'), ('311', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00109893', '0'), ('312', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00413407', '0'), ('315', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '4.206e-4', '0'), ('316', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.05', '0'), ('317', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.01', '0'), ('321', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.36', '0'), ('322', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00302832', '0'), ('323', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.36', '0'), ('324', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00302832', '0'), ('325', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '8.412e-5', '0'), ('329', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.215', '0'), ('330', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00179331', '0'), ('331', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.235', '0'), ('333', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '0.00196013', '0'), ('335', '2021-10-13', 'BNB', 'Sell', 'Binance', '470.521', '0.05', '0'), ('336', '2021-10-13', 'BTC', 'Sell', 'Binance', '57363.89', '4.1705e-4', '0'), ('339', '2021-10-24', 'BTC', 'Sell', 'Binance', '60857.44', '0.003', '0'), ('340', '2021-10-24', 'RUNE', 'Sell', 'Binance', '11.24', '15', '0'), ('341', '2021-11-02', 'FTM', 'Buy', 'Binance', '2.7984', '7', '0'), ('344', '2021-11-02', 'BTC', 'Buy', 'Binance', '63204.54', '2.9827e-4', '0'), ('345', '2021-11-02', 'FTM', 'Buy', 'Binance', '2.7984', '43', '0'), ('346', '2021-11-02', 'BTC', 'Buy', 'Binance', '63204.54', '0.00183266', '0'), ('348', '2021-11-04', 'FTM', 'Buy', 'Binance', '2.46', '100', '0'), ('349', '2021-11-04', 'BNB', 'Buy', 'Binance', '558.896', '0.47443', '0'), ('350', '2021-11-04', 'ETH', 'Sell', 'Binance', '4533.62', '0.00847', '0'), ('351', '2021-11-04', 'THETA', 'Sell', 'Binance', '7.239', '5', '0'), ('353', '2021-11-04', 'ETH', 'Sell', 'Binance', '4533.62', '0.01226', '0'), ('355', '2021-11-04', 'ONT', 'Sell', 'Binance', '1.1244', '50', '0'), ('356', '2021-11-05', 'IOTA', 'Sell', 'Binance', '1.0921', '50', '0'), ('358', '2021-11-05', 'ETH', 'Sell', 'Binance', '4474.32', '0.014935', '0'), ('360', '2021-11-05', 'BTC', 'Buy', 'Binance', '60958.25', '0.001398', '0'), ('362', '2021-11-05', 'ONT', 'Buy', 'Binance', '1.1244', '75', '0'), ('365', '2021-11-05', 'BTC', 'Buy', 'Binance', '60958.25', '4.104e-4', '0'), ('368', '2021-11-07', 'ETH', 'Sell', 'Binance', '4612.77', '0.019935', '0'), ('370', '2021-11-07', 'XRP', 'Sell', 'Binance', '1.2169', '75', '0'), ('372', '2021-11-09', 'BTC', 'Sell', 'Binance', '66930.24', '7.4443e-4', '0'), ('373', '2021-11-09', 'FTM', 'Sell', 'Binance', '3.3409', '17', '0'), ('375', '2021-11-09', 'LUNA', 'Sell', 'Binance', '50.059', '4', '0'), ('376', '2021-11-09', 'BTC', 'Sell', 'Binance', '66930.24', '0.0030536', '0'), ('379', '2021-11-09', 'BTC', 'Sell', 'Binance', '66930.24', '0.0036178', '0'), ('380', '2021-11-09', 'SOL', 'Sell', 'Binance', '245.029', '1', '0'), ('382', '2021-11-09', 'BTC', 'Sell', 'Binance', '66930.24', '0.0011532', '0'), ('384', '2021-11-09', 'RUNE', 'Sell', 'Binance', '13.995', '6', '0'), ('387', '2021-11-09', 'BTC', 'Sell', 'Binance', '66930.24', '0.0028641', '0'), ('388', '2021-11-09', 'BNB', 'Sell', 'Binance', '634.849', '0.3', '0'), ('390', '2021-11-22', 'ETH', 'Sell', 'Binance', '4087.43', '0.01405', '0'), ('391', '2021-11-22', 'CVC', 'Sell', 'Binance', '0.41685', '100', '0'), ('392', '2021-11-22', 'BNB', 'Sell', 'Binance', '559.2', '0.211', '0'), ('395', '2021-11-22', 'CHZ', 'Buy', 'Binance', '0.40999', '250', '0'), ('398', '2021-11-22', 'BNB', 'Sell', 'Binance', '559.2', '0.35', '0'), ('402', '2021-11-22', 'SAND', 'Buy', 'Binance', '4.6', '25', '0'), ('404', '2021-12-01', 'BTC', 'Sell', 'Binance', '57189.78', '2.727e-4', '0'), ('405', '2021-12-01', 'KLAY', 'Sell', 'Binance', '1.5', '10', '0'), ('406', '2021-12-07', 'BTC', 'Sell', 'Binance', '50595.04', '0.005', '0'), ('409', '2021-12-07', 'BTC', 'Sell', 'Binance', '50595.04', '0.005', '0'), ('412', '2021-12-09', 'BTC', 'Buy', 'Binance', '47564.26', '0.00514', '0'), ('415', '2021-12-09', 'BTC', 'Buy', 'Binance', '47564.26', '0.00524', '0');

-- Queries (Begin)

select * from txns
where symbol = 'aave'
 order by txn_id desc;

-- DELETE FROM txns where txn_id = 262;

-- Avg Price 

SELECT
    symbol
    , txn_type
    , ROUND(SUM(quantity), 2) AS `Total Quantity`
    , ROUND(SUM(quantity * price)) AS `Total Price`
	, ROUND(SUM(quantity * price) / SUM(quantity), 2) AS `Avg Price`
    , SUM(fee) AS `Total Fees`
	, COUNT(*) AS `Total Txns`
FROM
    txns
WHERE
    txn_type = 'buy'
AND symbol = 'aave'   
and exchange_name = 'binance' 
GROUP BY
    symbol, txn_type
ORDER BY ROUND(SUM(quantity * price)) DESC;

CALL sp_GetAvgBuySell('BTC')

-- /Users/alanjackson/PycharmProjects/CryptoTradingProject/crypto_trading_bot/crypto_tracking_app.py

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


CALL sp_GetAvgBuySell('grt')


