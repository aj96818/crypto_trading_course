use crypto_tracker_db;

-- create test table for account balances

-- drop table accounts;

create table accounts (
	account_id int not null auto_increment
    , last_updated date
    , symbol VARCHAR(25)
    , crypto_name VARCHAR(75)
    , quantity decimal(12, 4)
	, location VARCHAR(125)
    , url VARCHAR(255)
    , wallet_address VARCHAR(255)
    , notes VARCHAR(255)
    , primary key (account_id));

INSERT INTO account_balances (account_id, last_updated, symbol, quantity, location)
VALUES ('1', '2021-12-30', 'LINK', 0, 'Coinbase Pro')
, ('2', '2021-12-30', 'ADA', 0, 'Coinbase Pro'); 

SELECT * FROM accounts;


WITH
  buy_cte AS (SELECT 
					symbol
                    , txn_type
                    , sum(quantity) 'buy_quantity'
              FROM txns
              WHERE txn_type = 'buy'
              GROUP BY
				symbol
                , txn_type),
  sell_cte AS (SELECT
					symbol
                    , txn_type
                    , sum(quantity) 'sell_quantity'
				FROM txns
                WHERE txn_type = 'sell'
                GROUP BY
					symbol
                    , txn_type), 
balances_cte as (select
					symbol
                    , quantity
                    , last_updated_balance_date
				FROM account_balances)
                    
SELECT
	buy_cte.symbol
    , (buy_cte.buy_quantity - sell_cte.sell_quantity) 'net_buy_sell'
    , balances_cte.symbol
    , balances_cte.quantity
    , ((buy_cte.buy_quantity - sell_cte.sell_quantity)+ balances_cte.quantity) 'net_quantity'
FROM
	buy_cte
JOIN
	sell_cte
JOIN
	balances_cte
WHERE buy_cte.symbol = sell_cte.symbol
and buy_cte.symbol = balances_cte.symbol;


select * from txns limit 10;

select symbol, txn_type,sum(quantity)
from txns
where symbol = 'ADA' and txn_type = 'buy'
union
select symbol, txn_type, sum(quantity)
from txns
where symbol = 'ADA' and txn_type = 'sell';



