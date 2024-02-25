with age as  (

    select * from {{ ref('int_age_joined' )}}

)
select * from age;