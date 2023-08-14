--check DMTK chưa có
with cte as (
select * from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_THE'
)
select distinct
	a.revenue_account,
	b.loai_bh,
	b.loai_hinh
from CTE as a
left join subpublic.da_dim_dmtk_erp_n1 as b on a.revenue_account = b.revenue_account
where b.loai_bh is null





with cte as (
select * from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_THE'
)
select 
	a.gl_date,
	a.due_date,
	b.loai_bh,
	b.loai_hinh,
	c.nhom_sp,
	c.ten_sp,
	a.item_code,
	CASE WHEN a.item_code is null and 
				a.line_description like '%CPQLDN_Phí%' or 
				a.line_description like '%Tiền thưởng%' or
				a.line_description like '%Mở STK%' or
				a.line_description like '&phí dịch vụ%'
			Then 'Khác'
	ELSE c.loai_sp
	End as loai_sp
from CTE as a
left join subpublic.da_dim_dmtk_erp_n1 as b on a.revenue_account = b.revenue_account
left join subpublic.da_dim_dmsp_erp_n1 as c on a.item_code = c.item_code





--DIm line_description
with cte as (
select * from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_THE'
)
select distinct
	line_description,
	COALESCE(item_code,' ') as item_code
from CTE 

-- DIm số hóa đơn

with cte as (
select *,  
	CASE
        WHEN line_description ~ 'hóa đơn số ([0-9]+)' THEN SUBSTRING(line_description FROM 'hóa đơn số ([0-9]+)')
        WHEN line_description ~ 'Hóa đơn số ([0-9]+)' THEN SUBSTRING(line_description FROM 'Hóa đơn số ([0-9]+)')
		WHEN line_description ~ 'Hoá đơn số ([0-9]+)' THEN SUBSTRING(line_description FROM 'Hóa đơn số ([0-9]+)')
		WHEN line_description ~ 'hóa đơn GTGT số ([0-9]+)' THEN SUBSTRING(line_description FROM 'hóa đơn GTGT số ([0-9]+)')
		WHEN line_description ~ ' HÓA ĐƠN MẪU SỐ 1 KÝ HIỆU C23THE SỐ ([0-9]+)' THEN SUBSTRING(line_description FROM ' HÓA ĐƠN MẪU SỐ 1 KÝ HIỆU C23THE SỐ ([0-9]+)')
        ELSE NULL
    END AS invoice_number,
	CASE 
        WHEN line_description ~ 'hóa đơn số ([0-9]+)' THEN to_date(substring(line_description FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})'),'dd/mm/yyyy')
        WHEN line_description ~ 'Hóa đơn số ([0-9]+)' THEN to_date(substring(line_description FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})'),'dd/mm/yyyy')
		WHEN line_description ~ 'Hoá đơn số ([0-9]+)' THEN to_date(substring(line_description FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})'),'dd/mm/yyyy')
		WHEN line_description ~ 'hóa đơn GTGT số ([0-9]+)' THEN to_date(substring(line_description FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})'),'dd/mm/yyyy')
		WHEN line_description ~ ' HÓA ĐƠN MẪU SỐ 1 KÝ HIỆU C23THE SỐ ([0-9]+)' THEN to_date(substring(line_description FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})'),'dd/mm/yyyy')
        ELSE NULL
    END AS ngay_lech_ky
from public.da_ar006
where gl_date > '2023-01-01' and gl_date <'2023-05-30' and business_unit = 'THUANHAI_THE'
)
SELECT line_description,invoice_number,ngay_lech_ky
FROM
   cte
where invoice_number is not null
	

-- kỷ thuật
SELECT
    CASE
        WHEN line_description ~ 'hóa đơn số ([0-9]+)' THEN SUBSTRING(line_description FROM 'hóa đơn số ([0-9]+)')
        WHEN line_description ~ 'Hóa đơn số ([0-9]+)' THEN SUBSTRING(line_description FROM 'Hóa đơn số ([0-9]+)')
        ELSE NULL
    END AS invoice_number
FROM
    da_ar006;
--

SELECT substring(your_column FROM '([0-9]{2}/[0-9]{2}/[0-9]{4})') AS ngay
FROM your_table;

