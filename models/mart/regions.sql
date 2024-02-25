with region as  (

    select * from {{ ref('int_regions_joined' )}}

)
select * from region;