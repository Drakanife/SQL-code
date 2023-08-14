--1. da_sap_zpp07_v3 logic

select altbom, count(*) from da_sap_zpp07_v2
group by 1

SELECT material, altbom
FROM da_sap_zpp07_v2
WHERE (material, altbom) NOT IN (
    SELECT material, MIN(altbom) AS min_altbom FROM da_sap_zpp07_v2
    GROUP BY material
);

WITH cte AS 
(
	SELECT material, MIN(altbom) AS min_altbom, '1' as stt_altbom FROM da_sap_zpp07_v2
	GROUP BY material
	UNION
	SELECT material, altbom as min_altbom, '2' as stt_altbom
FROM da_sap_zpp07_v2
WHERE (material, altbom) NOT IN (
    SELECT material, MIN(altbom) AS min_altbom FROM da_sap_zpp07_v2
    GROUP BY material)
)
SELECT 
	a.material,
	'1' as base_quantity,
	a.material_description,
	a.altbom,
	c.material AS b_material,
	b.altbom as alt,
	CASE WHEN b.component IS NULL THEN a.component
		ELSE b.component
		END AS component,
	CASE WHEN c.stt_altbom is null then '1'
	ELSE c.stt_altbom
	END as b_stt,
	CASE WHEN b.quantity_1 IS NULL THEN a.quantity_1 / a.base_quantity_1 
		ELSE b.quantity_1
		END AS quantity_per_1
FROM cte AS c
RIGHT JOIN da_sap_zpp07_v1 AS a ON a.component = c.material
LEFT JOIN da_sap_zpp07_v2 AS b ON CONCAT(c.material, '-', c.min_altbom) = CONCAT(b.material, '-', b.altbom)
WHERE a.production_version_lock IS NOT NULL
ORDER BY a.material, a.altbom, b.material, b.component;


--2. MB51v3

select * from da_sap_mb51_v2

select 
	a.month::date,
	a.order_1,
	a.material,
	a.material_description,
	a.base_unit_of_measure,
	a.sum,
	b.b_material as btp,
	b.component,
	b.quantity_per_1000/1000*a.sum as quantity_btp
from da_sap_mb51_v2 as a 
left join da_sap_zpp07_v3 as b on concat(a.material,'-',a.bom_alternative) = concat(b.material,'-',b.altbom)
where a.bom_alternative is not null and b.b_stt = '1'
order by 1,2,3,7


--3.chi phí sx thực tế
create view da_sap_zco01_v2 as
with cte as
(
select date, material,
		'nhan_cong_truc_tiep' as hang_muc,
		nhan_cong_truc_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'nhan_cong_gian_tiep' as hang_muc,
		nhan_cong_gian_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'khau_hao_truc_tiep' as hang_muc,
		khau_hao_truc_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'ccdc_phan_bo' as hang_muc,
		ccdc_phan_bo as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_schua_btri' as hang_muc,
		chi_phi_schua_btri as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_dien' as hang_muc,
		chi_phi_dien as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_nuoc' as hang_muc,
		chi_phi_nuoc as value
from da_sap_zco01_v1
union 
select date, material,
		'nhiet_hoi' as hang_muc,
		nhiet_hoi as value
from da_sap_zco01_v1
union 
select date, material,
		'nvl_phu_dung_chung' as hang_muc,
		nvl_phu_dung_chung as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_sxuat_chung' as hang_muc,
		chi_phi_sxuat_chung as value
from da_sap_zco01_v1
)
select * from cte


select distinct
	c.date,
	c.material,
	c.hang_muc,
	c.value,
	a.order_1
FROM cte as c
left join da_sap_mb51_v1 as a on a.month::date = c.date and a.material = c.material
order by 1,2,5

select * from da_sap_mb51_v1

--
with cte as
(
select date, material,
		'nhan_cong_truc_tiep' as hang_muc,
		nhan_cong_truc_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'nhan_cong_gian_tiep' as hang_muc,
		nhan_cong_gian_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'khau_hao_truc_tiep' as hang_muc,
		khau_hao_truc_tiep as value
from da_sap_zco01_v1
union 
select date, material,
		'ccdc_phan_bo' as hang_muc,
		ccdc_phan_bo as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_schua_btri' as hang_muc,
		chi_phi_schua_btri as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_dien' as hang_muc,
		chi_phi_dien as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_nuoc' as hang_muc,
		chi_phi_nuoc as value
from da_sap_zco01_v1
union 
select date, material,
		'nhiet_hoi' as hang_muc,
		nhiet_hoi as value
from da_sap_zco01_v1
union 
select date, material,
		'nvl_phu_dung_chung' as hang_muc,
		nvl_phu_dung_chung as value
from da_sap_zco01_v1
union 
select date, material,
		'chi_phi_sxuat_chung' as hang_muc,
		chi_phi_sxuat_chung as value
from da_sap_zco01_v1
)
Select date, sum(value) from cte
group by 1
--
select month, a.order_1, sum(a.sum) from da_sap_mb51_v1 as a
group by 1,2

--
with cte as 
(select month, sum(a.sum ) from da_sap_mb51_v1 as a
group by 1
)
select 
	a.month,
	b.order_1,
	b.material,
	sum(b.sum) as quantity,
	a.sum as tong,
	sum(b.sum)/a.sum as ty_trong ,
	c.tong_cp,
	sum(b.sum)/a.sum * c.tong_cp as cpsx,
	d.tong_sl_tp
from cte as a 
right join da_sap_mb51_v1 as b on a.month = b.month
left join 
	(select date, sum(value) as tong_cp from da_sap_zco01_v2 group by 1) as c on a.month::date = c.date
left join 
	(select month, a.material, sum(a.sum) as tong_sl_tp from da_sap_mb51_v1 as a  group by 1,2) as d on a.month = d.month and b.material = d.material
group by 1,2,3,5,7,9


-- 
select month, a.material, sum(a.sum) from da_sap_mb51_v1 as a
group by 1,2

--4. CP SX TT

select 
		c.date,
		c.material,
		c.hang_muc,
		c.value,
		a.order_1,
		a.quantity/b.total_material_qty as ty_trong_material,
		c.value*(a.quantity/b.total_material_qty) as chi_phi_sx_tt
from da_sap_mb51_v1 as a
left join 
		( select month, material, sum(quantity) as total_material_qty from da_sap_mb51_v1 group by 1,2 ) 
		as b on a.month = b.month and a.material = b. material
right join da_sap_zco01_v2 as c on a.month::date = c.date and a.material = c.material
where quantity <> 0
order by c.date, c.material

--5 MB51 nguyên liêu gốc kế hoạch
--NLG treo ty lệ
select * from da_sap_mb51_n1
--NHAP BTP
create view NHAP_BTP as
WITH CTE AS (
	SELECT 
		month,
		batch as batch_nhap_btp,
		material as material_nhap_btp,
		order_1 as order_nhap_btp,
		SUM ( quantity ) as quantity_nhap_btp
	FROM da_sap_mb51_n1
	WHERE LEFT ( movement_type, 1) = '1' AND
		LEFT ( order_1, 1) = '1'
	GROUP BY 
		month,
		batch,
		material,
		order_1
	HAVING SUM (quantity ) <> 0
	ORDER BY order_nhap_btp
)
select * from cte

--XUAT CHI BTP

create view XUAT_CHI_BTP as
WITH CTE AS (
	SELECT 
		month,
		batch as batch_xuat_btp
		, material as material_xuat_btp
		, order_1 as order_sx
		, SUM ( quantity) as quantity_xuat_btp
	FROM da_sap_mb51_n1
	WHERE LEFT (movement_type, 1) = '2'
		AND LEFT (material, 1) = '6'
	GROUP BY 
		month,
		batch
		, material
		, order_1
	HAVING SUM ( quantity ) <> 0	
) 
SELECT * FROM CTE;


--TY LE NHAP 
create view TY_LE_XUAT_PER_NHAP_BTP as
WITH CTE AS (
SELECT 
	a.month,
	a.order_sx
	, a.batch_xuat_btp
	, a.material_xuat_btp
	, a.quantity_xuat_btp
	, b.quantity_nhap_btp
	, ABS (a.quantity_xuat_btp / b.quantity_nhap_btp) as percentage
FROM XUAT_CHI_BTP a
LEFT JOIN NHAP_BTP b ON a.batch_xuat_btp = b.batch_nhap_btp AND a.material_xuat_btp = b.material_nhap_btp and a.month = b.month
)
SELECT * FROM CTE;


--SX_TP

create view SX_TP as
WITH CTE_SX_TP AS (
	SELECT 
		month,
		order_1
		, batch
		, material
		, material_document
		, material_docitem
		, quantity
		, valuation_type
	FROM da_sap_mb51_n1
	WHERE LEFT (movement_type, 1) = '2'
		AND LEFT (order_1, 1) = '2'
)
SELECT * FROM CTE_SX_TP;


--SX_BTP
create view SX_BTP as
WITH CTE AS (
	SELECT 
		month,	
		order_1
		, batch
		, material
		, material_document
		, material_docitem
		, quantity
		, valuation_type
	FROM da_sap_mb51_n1
	WHERE LEFT (movement_type, 1) = '2'
		AND LEFT (order_1, 1) = '1'
)
SELECT * FROM CTE;


-- MB51 NGUYEN LIEU GOC
drop view da_sap_mb51_v5
create view da_sap_mb51_v5 as
WITH RECURSIVE CTE AS (
	SELECT 
		a.month,
		a.order_1 as order_sx_tp
		, CAST(null AS character varying) as order_sx_btp
		, a.batch as batch_sx_tp
		, a.material as material_sx_tp
		, a.quantity as quantity_sx_tp
		, a.material_document as material_document
		, a.material_docitem as material_doc_item
		, b.order_nhap_btp as order_nhap_btp
		, CAST ( 0 AS DOUBLE PRECISION ) as percentage_prev_level
		, CASE
				WHEN LEFT (a.material, 1) = '6' THEN COALESCE (c.percentage, 0)
				ELSE COALESCE (c.percentage, 1) 
			END as percentage_curr_level
		, CASE
				WHEN LEFT (a.material, 1) = '6' THEN COALESCE (c.percentage, 0)
				ELSE COALESCE (c.percentage, 1) 
			END as percentage_final
		, 0 as level
		, a.valuation_type as valuation_type
	FROM SX_TP a
	LEFT JOIN NHAP_BTP b ON a.batch = b.batch_nhap_btp 
		AND a.material = b.material_nhap_btp
		AND a.month = b.month
	LEFT JOIN TY_LE_XUAT_PER_NHAP_BTP c ON a.batch = c.batch_xuat_btp
		AND a.material = c.material_xuat_btp
		AND a.order_1 = c.order_sx
		AND a.month = c.month
	where a.month = '2023-06-01'
	
	UNION
	
	SELECT 
		a.month
		,a.order_sx_tp as order_sx_tp
		, a.order_nhap_btp as order_sx_btp
		, sxbtp.batch as batch_sx_tp
		, sxbtp.material as material_sx_tp
		, sxbtp.quantity as quantity_sx_tp
		, sxbtp.material_document as material_document
		, sxbtp.material_docitem as material_doc_item
		, nbtp.order_nhap_btp as order_nhap_btp
		, a.percentage_final as percentage_prev_level
		, CASE
				WHEN LEFT (sxbtp.material, 1) = '6' THEN COALESCE (tyle.percentage, 0)
				ELSE COALESCE (tyle.percentage, 1)
			END as percentage_curr_level
		, a.percentage_final * 
								CASE
									WHEN LEFT (sxbtp.material, 1) = '6' THEN COALESCE (tyle.percentage, 0)
									ELSE COALESCE (tyle.percentage, 1) 
								END as percentage_final
		, level + 1 as level
		, sxbtp.valuation_type as valuation_type
	FROM CTE a 
	INNER JOIN SX_BTP sxbtp ON a.order_nhap_btp = sxbtp.order_1  and a.month = sxbtp.month
	LEFT JOIN NHAP_BTP nbtp ON nbtp.batch_nhap_btp = sxbtp.batch
		AND nbtp.material_nhap_btp = sxbtp.material
		AND nbtp.month = sxbtp.month
	LEFT JOIN TY_LE_XUAT_PER_NHAP_BTP tyle ON tyle.batch_xuat_btp = sxbtp.batch
		AND tyle.material_xuat_btp = sxbtp.material
		AND tyle.order_sx = sxbtp.order_1 
		AND tyle.month = sxbtp.month
	where level < 20
)
SELECT 
	month
	, order_sx_btp
	, batch_sx_tp
	, material_sx_tp
	, quantity_sx_tp
	, material_document
	, material_doc_item
	, order_nhap_btp
	, percentage_prev_level
	, percentage_curr_level
	, percentage_final
	, level
	, quantity_sx_tp * percentage_final as quantity_sx_tp_theo_tyle
	, valuation_type
	, CONCAT(material_sx_tp, '-', valuation_type) as fk_material_sx_tp_valuation_type
FROM CTE
WHERE LEFT(material_sx_tp, 1) <> '6' -- chỉ lấy nguyên liệu gốc
ORDER BY level
	, month
	, order_sx_btp
	, order_nhap_btp
	, material_document
	, material_doc_item;
	
-- tạo index 
-- Tạo index cho bảng "da_sap_mb51_n1" sử dụng trong view "NHAP_BTP"
CREATE INDEX idx_nhaph_btp_month ON da_sap_mb51_n1 (month);
CREATE INDEX idx_nhaph_btp_batch_material_order ON da_sap_mb51_n1 (batch, material, order_1);


--1. tạo bảng dim truy NLG

--NLG table da_sap_nlg_v1
select * from da_sap_nlg_v1
where quantity_nlg = 0
drop view da_sap_nlg_v1


create view da_sap_nlg_v1 as
with cte AS (
select
	month,
	material,
	material_description,
	batch,
	order_1,
	valuation_type,
	base_unit_of_measure,
	SUM(quantity) as quantity_btp
from 
da_sap_mb51_n1
where left(order_1,1) = '1' and left(movement_type,1) = '1'
group by 
	month,
	material,
	material_description,
	batch,
	order_1,
	valuation_type,
	base_unit_of_measure
)
select distinct
		a.month,
		a.material as btp,
		a.batch as batch_btp,
		a.order_1,
		a.base_unit_of_measure,
		a.quantity_btp,
		b.material as nlg,
		b.material_description,
		b.batch as batch_nlg,
		b.valuation_type,
		sum(b.quantity_nlg) as quantity_nlg	
from cte as a
left join
		( select
		month,
		material,
		material_description,
		batch,
		order_1,
		valuation_type,
		base_unit_of_measure,
		SUM(quantity) as quantity_nlg
	from 
	da_sap_mb51_n1
	where left(order_1,1) = '1' and left(movement_type,1) = '2'
	group by 
		month,
		material,
		material_description,
		batch,
		order_1,
		valuation_type,
		base_unit_of_measure) as b
	on a.month = b.month and a.order_1 = b.order_1
where quantity_btp <> 0 and quantity_nlg <> 0
group by
		a.month,
		a.material,
		a.batch,
		a.order_1,
		a.base_unit_of_measure,
		a.quantity_btp,
		b.material,
		b.material_description,
		b.batch,
		b.valuation_type


-- Thành phẩm table da_sap_tp_v1
drop view da_sap_tp_v1
create view da_sap_tp_v1 as
with cte as (
select
		month,
		order_1,
		material,
		material_description,
		batch,
		base_unit_of_measure,
		SUM(quantity) as quantity_btp,
		valuation_type
from 
	da_sap_mb51_n1
where left(order_1,1) = '2' and left(movement_type,1) = '2'
group by 
		month,
		order_1,
		material,
		material_description,
		batch,
		base_unit_of_measure,
		valuation_type
)	
select * from cte where quantity_btp <> 0


--lệnh nhập btp để sản xuất tp da_sap_tinhnlg_v1
drop view da_sap_tinhnlg_v1
create view da_sap_tinhnlg_v1 as
WITH cte AS (
	SELECT
		month,
		material,
		material_description,
		batch,
		order_1,
		valuation_type,
		base_unit_of_measure,
		SUM(quantity) as quantity_btp
	FROM da_sap_mb51_n1
	WHERE left(order_1,1) = '2' AND left(movement_type,1) = '2' AND left(material,1) = '6'
	GROUP BY 
		month,
		material,
		material_description,
		batch,
		order_1,
		valuation_type,
		base_unit_of_measure
)
Select * from cte

-- đệ quy truy nguyên liệu gốc

drop view da_sap_mb51_v5
create view da_sap_mb51_v5 as
with RECURSIVE cte_table as 
(
	select distinct
		a.month,
		a.order_1 as order_tp,
		a.material as material_tp,
		b.order_1 as order_btp,
		a.material as component,
		a.batch as batch_btp,
		case when a.quantity_btp <0 then a.quantity_btp * -1 
			ELSE a.quantity_btp
		END as quantity_btp,
		a.valuation_type,
		0 as level
	from da_sap_tp_v1 as a
	left join da_sap_nlg_v1 as b on a.month = b.month and a.batch = b.batch_btp
	UNION
	select distinct
		a.month,
		a.order_tp,
		a.material_tp,
		b.order_1 as order_btp,
		b.nlg as component,
		b.batch_nlg as batch_btp,
		CASE WHEN (b.quantity_nlg/b.quantity_btp*a.quantity_btp) < 0 THEN (b.quantity_nlg/b.quantity_btp*a.quantity_btp)*-1
			ELSE b.quantity_nlg/b.quantity_btp*a.quantity_btp
		END as quantity_btp,
		b.valuation_type,
		level + 1 as level
	from cte_table as a
	left join da_sap_nlg_v1 as b on a.month = b.month and a.batch_btp = b.batch_btp
	where level < 20
)
	select 
		month,
		order_tp,
		material_tp,
		order_btp,
		component,
		batch_btp,
		quantity_btp,
		valuation_type,
		level
	from cte_table 
	where left(component, 1) <> '6'
	order by
		month,
		order_tp,
		material_tp,
		level
-- index cho đệ quy
-- Tạo chỉ mục cho cột month và batch trong bảng da_sap_tp_v1
CREATE INDEX idx_da_sap_tp_v1_month_batch ON da_sap_mb51_n1 (month, batch);

case when a.quantity_btp <0 then a.quantity_btp * -1 
			ELSE a.quantity_btp
		END as quantity_btp

create view cte_test as
select distinct
		a.month,
		a.order_1 as order_tp,
		a.material as material_tp,
		b.order_1 as order_btp,
		a.material as component,
		a.batch as batch_btp,
		a.quantity_btp,
		a.valuation_type,
		0 as level
	from da_sap_tp_v1 as a
	left join da_sap_nlg_v1 as b on a.month = b.month and a.batch = b.batch_btp
	where a.month = '2023-06-01'
	

select * from da_sap_nlg_v1

