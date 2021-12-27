
library(readr)
library(lubridate)
library(dplyr)

txns <- read_csv("Downloads/BinanceTxnHistory_2021-09.csv")
txns$Pair <- paste0(txns$Coin, 'USDT')
txns$UTC_Time <- as_date(txns$UTC_Time)

# Import historical crypto prices CSV for relevant symbols from Binance Futures Testnet API
# see "main.py" python script 'get_historical_candles' module.

df_merged <- read_csv("PycharmProjects/CryptoTradingProject/df_merged.csv")

df_merged$close_date <- df_merged$close_date/1000
df_merged$close_date <- as_date(df_merged$close_date)

# left join txns data to historical prices data to get USD.

df_left_join <- left_join(txns, df_merged, by = c("Pair" = "symbol", "UTC_Time" = "close_date"))

# Total Fees (USD)

df_left_join$total_usd <- df_left_join$Change * df_left_join$price

fees <- df_left_join[df_left_join$Operation == 'Fee',]



# MySQL DB 'txns' table column names: (txn_id, txn_date, symbol, txn_type, exchange_name, price, quantity, fee)

# txn_id
df_left_join$txn_id <- 1:nrow(df_left_join)
df_left_join$txn_id <- df_left_join$txn_id + 277

# txn_date
df_left_join$txn_date <- df_left_join$UTC_Time

# symbol
df_left_join$symbol <- df_left_join$Coin

# txn_type
df_left_join$txn_type <- df_left_join$Operation

# exchange_name
df_left_join$exchange_name <- 'Binance'

# price is price

# quantity
df_left_join$quantity <- abs(df_left_join$Change)

# fee
df_left_join$fee <- 0

# filter txns to only include 'Buy', 'Sell', and non-NA for 'price.'

df_out <- df_left_join[df_left_join$Operation %in% c('Buy', 'Sell'), ]
df_out <- df_out[!is.na(df_out$price),]
  

col_names <- c('txn_id', 'txn_date', 'symbol', 'txn_type', 'exchange_name', 'price', 'quantity', 'fee')

df_csv <- df_out[col_names]

write_csv(df_csv, 'binance_txns_import.csv')
