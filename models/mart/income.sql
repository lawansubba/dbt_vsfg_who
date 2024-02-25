with income as  (

    select * from {{ ref('int_income_joined' )}}

)
select * from income;