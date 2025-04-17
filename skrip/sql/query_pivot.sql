-- https://duckdb.org/docs/stable/sql/statements/pivot.html
pivot (
    from read_parquet('dataset/house-price.parquet')
)
on furnishingstatus
using avg(price)
group by mainroad
;
