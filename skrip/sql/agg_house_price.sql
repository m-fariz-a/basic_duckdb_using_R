select
    furnishingstatus as status_furnishing,
    sum(case when airconditioning='yes' then 1 else 0 end) as ber_ac,
    sum(case when airconditioning='no' then 1 else 0 end) as tidak_ber_ac,
    sum(case when airconditioning is null then 1 else 0 end) as tidak_diketahui
from read_parquet('dataset/house-price.parquet')
where
    price >= 5000000
group by
    furnishingstatus
;
