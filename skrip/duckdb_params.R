library(DBI)
library(duckdb)

# Membuat koneksi ke memori
con <- dbConnect(duckdb())

# query dari file sql
sql_query <- readLines("skrip/sql/agg_house_price_param.sql")
sql_query <- paste(sql_query, collapse = "\n")

# Prepare and bind
stmt <- dbSendQuery(con, sql_query)

# Bind parameters
dbBind(stmt, list(7000000, 'unfurnished'))
result_agg <- dbFetch(stmt)
dbClearResult(stmt)

result_agg_tibble <- as_tibble(result_agg)
print(result_agg_tibble)

# Menutup koneksi
dbDisconnect(con)
