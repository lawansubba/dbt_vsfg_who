{{ config(materialized="table") }}

with income as (
    select 
        * 
    from 
        {{ ref('stg_regions') }}
),
age as (
    select 
        *
    from
        {{ ref('stg_ref_age') }}
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
    income.*,
    age.age_group,
    sex.sex,
    causegroups.level_3,
    causegroups.level_2,
    causegroups.level_1
from
    income
    left join age on income.age_group_id = age.age_group_id
    left join sex on sex.sex_id = sex.sex_id
    left join causegroups on income.cause_name = causegroups.level_3