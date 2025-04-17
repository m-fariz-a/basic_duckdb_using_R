library(duckdb)

# Membuat koneksi ke memori
con <- dbConnect(duckdb())
result <- dbGetQuery(
  con,
  "select
    *
  from read_parquet('dataset/house-price.parquet');"
)
result_tibble <- as_tibble(result)
print(result_tibble)

# query dari file sql
sql_query <- readLines("skrip/sql/agg_house_price.sql")
sql_query <- paste(sql_query, collapse = "\n")
result_agg <- dbGetQuery(con, sql_query)
result_agg_tibble <- as_tibble(result_agg)
print(result_agg_tibble)

# Menutup koneksi
dbDisconnect(con)
