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





-- Queries (Begin)

select * from txns order by txn_id desc;

-- Avg Price 

SELECT
    symbol
    , ROUND(SUM(quantity * price) / SUM(quantity), 2) AS `Avg Cost`
    , COUNT(*) AS COUNT
    , SUM(fee) AS Fees
FROM
    txns
WHERE
    txn_type = 'BUY'
GROUP BY
    symbol



-- /Users/alanjackson/PycharmProjects/CryptoTradingProject/crypto_trading_bot/crypto_tracking_app.py