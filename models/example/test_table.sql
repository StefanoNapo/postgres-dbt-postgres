
{{ config(materialized='table') }}

with test_table as (

    select * from postgres.test_table


),
final as(
select id,
       items ->> 0 as name,
       items ->> 1 as age
       from(select id, jsonb_path_query_array(person::jsonb, '$.*') as items
       from test_table) as test_table
)

select * from final
