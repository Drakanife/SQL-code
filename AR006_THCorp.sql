-- chọn THCorp
with cte as (
select * from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_VN'
)
select *
from CTE

--1. Dim line description
with cte as (
select * from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_VN'
)
select distinct item_code,
	line_description
from CTE