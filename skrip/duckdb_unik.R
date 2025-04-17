library(duckdb)

# Membuat koneksi ke memori
con <- dbConnect(duckdb())

# query dari file sql
sql_query <- readLines("skrip/sql/query_pivot.sql")
sql_query <- paste(sql_query, collapse = "\n")
result_agg <- dbGetQuery(con, sql_query)
result_agg_tibble <- as_tibble(result_agg)
print(result_agg_tibble)

# Menutup koneksi
dbDisconnect(con)
