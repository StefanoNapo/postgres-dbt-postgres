
{{ config(materialized='table') }}

with test_table as (

    select * from {{ source('postgres', 'test_table')}}


),

final as(
SELECT id, substring(person, '"name"[ :]+((?=\[)\[[^]]*\]|(?=\{)\{[^\}]*\}|\"[^"]*\")') as name,
substring(person, '"age":(.*?)(?=,|}|$)') as age
FROM test_table

)

select * from final
