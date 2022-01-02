-- create test table for latest prices

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
    
select * from prices;