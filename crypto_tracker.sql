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
    , primary key (txn_id)
); 

select * from txns;


-- /Users/alanjackson/PycharmProjects/CryptoTradingProject/crypto_trading_bot/crypto_tracking_app.py