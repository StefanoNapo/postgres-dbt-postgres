{{ config(materialized='table') }}

with csv_test as (

   select * from {{ ref('Sample-Spreadsheet-1000-rows.csv') }}


),
final as(

select * from csv_test

)

select * from final
