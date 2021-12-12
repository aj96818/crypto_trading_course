
df <- read_csv("~/Downloads/CoinbasePro Historical Fills 2021-12-12.csv")


install.packages("RMySQL")
library(RMySQL)



df$symbol_1 <- sub("-.*", "", df$product)
df$symbol_2 <- sub(".*-", "", df$product)

df <- df[df$symbol_2 == 'USD', ]

df$txn_id <- seq.int(nrow(df))
df$`txn_date` <- as.character(as.Date(df$`created at`, format = "%Y-%m-%d"))
df$symbol <- df$symbol_1
df$txn_type <- df$side
df$exchange_name <- 'Coinbase Pro'
df$price <- abs(df$price)
df$quantity <- abs(df$size)
df$fee <- abs(df$fee)

df_out <- df[, c('txn_id', 'txn_date', 'symbol', 'txn_type', 'exchange_name', 'price', 'quantity', 'fee')]



setwd('/Users/alanjackson/dumps')


write_csv(df_out[1:99,], 'cb_historical_fills_p1.csv')
write_csv(df_out[100:199,], 'cb_historical_fills_p2.csv')
write_csv(df_out[200:nrow(df_out),], 'cb_historical_fills_p3_v2.csv')


mydb = dbConnect(MySQL(), user = 'root', password = 'mysqlrootpw',
                 dbname='crypto_tracker_db', host = 'localhost')

dbWriteTable(mydb, value = df_out, name = 'txns', append = T)


