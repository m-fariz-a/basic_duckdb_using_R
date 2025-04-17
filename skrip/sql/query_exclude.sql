--- mengambil semua kolom kecuali beberapa yang didefinisikan
select
    *
    exclude ('stories')
from read_parquet('dataset/house-price.parquet')
;
