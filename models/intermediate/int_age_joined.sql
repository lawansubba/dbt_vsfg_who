 {{ config(materialized="table") }}

with age as (
    select 
        * 
    from 
        {{ ref('stg_age') }}
), 
sex as (
    select 
        *
    from
        {{ ref('stg_ref_sex') }}
),
causegroups as (
    select
        *
    from
        {{ ref('stg_ref_causegroups') }} 
)
select
    age.*,
    sex.sex,
    causegroups.level_3,
    causegroups.level_2,
    causegroups.level_1
from
    age
    left join sex on age.sex_id = sex.sex_id
    left join causegroups on age.cause_name = causegroups.level_3