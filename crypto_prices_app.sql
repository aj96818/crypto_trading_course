
-- This table needs to be dropped before new day's prices are obtained.

drop table prices;

create table prices (
	row_id int not null auto_increment
    , Symbol VARCHAR(25)
    , `name` VARCHAR(75)
    , date_added VARCHAR(25)
    , last_updated VARCHAR(25)
    , price_usd decimal(15, 5)
	, volume_24h decimal(35, 5)
    , market_cap decimal(35, 5)
    , percent_change_24h decimal(10, 4)
    , percent_change_7d decimal(10, 4)
    , percent_change_30d decimal(10, 4)
    , percent_change_60d decimal(10, 4)
    , percent_change_90d decimal(10, 4)
    , primary key (row_id));
    
select * from prices order by symbol;

select * from accounts;

WITH
  accounts_cte AS (SELECT 
					symbol
                    , sum(quantity) 'accounts_quantity'
              FROM accounts
              GROUP BY
				symbol),
  prices_cte AS (SELECT
					symbol
                    , price_usd
				FROM prices)
                    
SELECT
	accounts_cte.symbol
    , accounts_cte.accounts_quantity
    , prices_cte.price_usd
    , (accounts_cte.accounts_quantity * prices_cte.price_usd) 'total quantity * price'
FROM
	accounts_cte
JOIN
	prices_cte
WHERE 
	accounts_cte.symbol = prices_cte.symbol;


-- Insert into 'balances' table:

-- Must first create 'balances' table before we can insert records into it.

DROP TABLE balances;

CREATE TABLE balances (
	symbol VARCHAR(25)
    , quantity decimal(12, 5)
    , price_usd decimal(12, 5)
    , total_amount decimal(25, 6)
);

-- https://stackoverflow.com/questions/24008316/insert-into-from-cte

INSERT INTO balances
	WITH
		accounts_cte AS (SELECT 
					symbol
                    , sum(quantity) 'accounts_quantity'
              FROM accounts
              GROUP BY
				symbol),
		prices_cte AS (SELECT
					symbol
                    , price_usd
				FROM prices)
                    
SELECT
	accounts_cte.symbol as symbol
    , accounts_cte.accounts_quantity as quantity
    , prices_cte.price_usd as price_usd
    , (accounts_cte.accounts_quantity * prices_cte.price_usd) as total_amount
FROM
	accounts_cte
JOIN
	prices_cte
WHERE 
	accounts_cte.symbol = prices_cte.symbol;

select * from balances order by total_amount desc;
select sum(total_amount) from balances;

SELECT * FROM accounts order by location desc;
select * from txns order by txn_id desc;
select distinct name from prices order by name desc;