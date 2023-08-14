--1. tạo view da_sap_zpp07_v1
--drop view public.da_sap_zpp07_v1
drop view da_sap_zpp07_v1
create view public.da_sap_zpp07_v1 as
select 
a.material,
a.material_number as material_description,
a.altBOM,
a.base_quantity,
a.quantity,
a.uom,
a.component,
a.bOM_component,
a.un,
1000 as base_quantity_1 ,
a.quantity/a.base_quantity*1000 as quantity_1,
b.production_version_lock
from  da_sap_zpp07_n1 as a
left join (select distinct material, altbom,production_version_lock,status
	from da_sap_zpp09_n1 where status = 'false') as b on concat(a.material, a.altbom) = concat(b.material, b.altbom)
where left(a.material,1) = '7' and a.status = 'false'

--2. tạo view da_sap_mb51_v1
drop view da_sap_mb51_v1
create view public.da_sap_mb51_v1 as
select 
		month,
		order_1,
		material,
		material_description,
		base_unit_of_measure,
		sum(quantity) as quantity
from public.da_sap_mb51_n1
where 
left (order_1,1) = '2' and
movement_type in ('101', '102')
group by order_1,
		material,
		material_description,
		base_unit_of_measure,
		month;

--3. 5. da_sap_zpp07_v2
create view public.da_sap_zpp07_v2 as
select 
		material,
		material_number,
		altbom,
		uom,
		component,
		bom_component,
		un,
		1 as base_quantity_1,
		quantity/base_quantity as quantity_1
from public.da_sap_zpp07_n1
where left(material, 1) = '6'
		and status = 'false';

--4. view da_sap_mb51_v2
drop view da_sap_mb51_v2
create view public.da_sap_mb51_v2 as
select 
		a.order_1,
		a.material,
		a.material_description,
		a.base_unit_of_measure,
		sum(a.quantity),
		a.month,
		b.bom_alternative
from public.da_sap_mb51_n1 as a
left join public.da_sap_coois_n1 as b on a.order_1 = b.order and a.month::date = b.date
where 
left (a.order_1,1) = '2' and
a.movement_type in ('101', '102')
group by a.order_1,
		a.material,
		a.material_description,
		a.base_unit_of_measure,
		a.month,
		b.bom_alternative;

--5. da_sap_zco02_v1
create view da_sap_zco02_v1 as
select 
		distinct material,
		nhan_cong_truc_tiep,
		nhan_cong_gian_tiep,
		khau_hao_truc_tiep,
		ccdc_phan_bo,
		chi_phi_schua_btri,
		chi_phi_dien,
		chi_phi_nuoc,
		nhiet_hoi,
		nvl_phu_dung_chung,
		chi_phi_sxuat_chung,
		month

from public.da_sap_zco02_n1
where left(material, 1) = '7'
order by month

--6. da_sap_zco01_v1
drop view da_sap_zco01_v1
create view public.da_sap_zco01_v1 as
select 
		distinct material,
		nhan_cong_truc_tiep,
		nhan_cong_gian_tiep,
		khau_hao_truc_tiep,
		khau_hao_gian_tiep,
		ccdc_phan_bo,
		chi_phi_schua_btri,
		chi_phi_dien,
		chi_phi_nuoc,
		nhiet_hoi,
		nvl_phu_dung_chung,
		chi_phi_sxuat_chung,
		date
from public.da_sap_zco01_n1
where left(material, 1) = '7'
order by date

--da_sap_zco01_v2
drop view da_sap_zco01_v2
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
		'khau_hao_gian_tiep' as hang_muc,
		khau_hao_gian_tiep as value
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


--7. da_sap_zsd03_v1
create view da_sap_zsd03_v1 as
select 
		material_number,
		billing_qty_sku,
		base_unit,
		total_in_vnd,
		payer,
		customer_name,
		distribution_channel_description,
		month
from da_sap_zsd03_n1


--8. da_master_sap_zmm60_v1

create view public.da_master_sap_zmm60_v1 as
select 
		material,
		material_description,
		material_group,
		SPLIT_PART(material_group,'-', 2 ) as material_group_short,
		SPLIT_PART(z_weight,'-',2 ) as trong_luong,
		REVERSE(SPLIT_PART(REVERSE(material_description), '-', 1)) as kich_thuoc,
		SPLIT_PART(z_color,'-',2 ) as mau_sac,
		concat(SPLIT_PART(material_group,'-', 2 ), ' ', SPLIT_PART(z_weight,'-',2 )) as bom_name
from public.da_master_sap_zmm60_n1
where left(material,1) = '7'

--9. da_sap_zpp02_v1

create view public.da_sap_zpp02_v1 as
select distinct
		a.order,
		a.med_material as material,
		a.med_material_description as material_description,
		a.med_order_unit as uoe,
		a.total_order_quantity,
		a.month
from public.da_sap_zpp02_n1 as a
where left(med_material , 1) = '7'


--10. da_sap_zpp07_v3
drop view da_sap_zpp07_v3

CREATE VIEW da_sap_zpp07_v3 AS
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
	order by 1
)
SELECT 
	a.material,
	a.un,
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
	a.base_quantity_1,
	CASE WHEN b.quantity_1 is null THEN a.quantity_1
	ELSE b.quantity_1 * a.quantity_1
	END quantity_per_1000
FROM cte AS c
RIGHT JOIN da_sap_zpp07_v1 AS a ON a.component = c.material
LEFT JOIN da_sap_zpp07_v2 AS b ON CONCAT(c.material, '-', c.min_altbom) = CONCAT(b.material, '-', b.altbom)
ORDER BY a.material, a.altbom, b.material, b.component;


--11. MB51 số lượng NLG kế hoạch da_sap_mb51_v3
drop view da_sap_mb51_v3
create view da_sap_mb51_v3 as
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

--12. da_sap_mb51_v4
drop view da_sap_mb51_v4
create view da_sap_mb51_v4 as
select month, a.order_1, sum(a.quantity) as total_order from da_sap_mb51_v1 as a
group by 1,2

--13. da_sap_zco01_v3
drop view da_sap_zco01_v3
create view da_sap_zco01_v3 as
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

--14. da_sap_zgl05_v2
drop view da_sap_zgl05_v2
create view da_sap_zgl05_v2 as
select 
	a.month,
	a.order_1,
	a.total_order/b.total as ty_trong,
	c.chi_tieu,
	c.gia_tri,
	(a.total_order/b.total) * c.gia_tri as chi_phi_nsx
from da_sap_mb51_v4 as a
left join
	(select month, sum(total_order) as total from da_sap_mb51_v4 group by month) as b
	on a.month = b.month
left join da_sap_zgl05_v1 as c on a.month::date = c.month
order by 1,2

--15 da_sap_zgl05_v1
create view da_sap_zgl05_v1 as
select 
		ky as month,
		chi_tieu,
		gia_tri
from da_sap_zgl05_n1
where left(chi_tieu,1) = '7' or left(chi_tieu,1) = '8' or left(chi_tieu,1) = '9'

--16 đơn giá thực tế da_sap_zwm07_v1
create view da_sap_zwm07_v1 as
select 
	thang,
	material,
	valuation_type,
	xuat_san_xuat + xuat_ban_hang +  xuat_tra_hang + xuat_posto + xuat_khac + xuat_chuyen_ma + xuat_chuyen_batch + xuat_chuyen_kho as so_luong,
	gia_tri_xuat_san_xuat + giatri_xuat_ban_hang + gia_tri_xuat_tra_hang + gia_tri_xuat_posto + gia_tri_xuat_khac +gia_tri_xuat_chuyen_ma + gia_tri_xuat_chuyen_batch + gia_tri_xuat_chuyen_kho as gia_tri,
	CASE WHEN xuat_san_xuat + xuat_ban_hang +  xuat_tra_hang + xuat_posto + xuat_khac + xuat_chuyen_ma + xuat_chuyen_batch + xuat_chuyen_kho = 0 then 0 else
	(gia_tri_xuat_san_xuat + giatri_xuat_ban_hang + gia_tri_xuat_tra_hang + gia_tri_xuat_posto + gia_tri_xuat_khac +gia_tri_xuat_chuyen_ma + gia_tri_xuat_chuyen_batch + gia_tri_xuat_chuyen_kho)/(xuat_san_xuat + xuat_ban_hang +  xuat_tra_hang + xuat_posto + xuat_khac + xuat_chuyen_ma + xuat_chuyen_batch + xuat_chuyen_kho) 
	END as don_gia
from da_sap_zwm07_n1

--17 đơn giá kế hoạch da_sap_zwm07_v2
drop view da_sap_zwm07_v2
create view da_sap_zwm07_v2 as
SELECT 
	thang,
	material,
	CASE WHEN so_luong = 0 then 
		CASE when so_luong_ton_kho_cuoi_ky = 0 then 0
		ELSE gia_tri_ton_kho_cuoi_ky/so_luong_ton_kho_cuoi_ky
		END
	ELSE gia_tri/so_luong
	END as don_gia_kh
from 
    (select 
	 thang,
	material, 
	SUM(so_luong_ton_kho_cuoi_ky) as so_luong_ton_kho_cuoi_ky,
	SUM(gia_tri_ton_kho_cuoi_ky) as gia_tri_ton_kho_cuoi_ky,
	SUM(xuat_san_xuat + xuat_ban_hang +  xuat_tra_hang + xuat_posto + xuat_khac + xuat_chuyen_ma + xuat_chuyen_batch + xuat_chuyen_kho) as so_luong,
	SUM(gia_tri_xuat_san_xuat + giatri_xuat_ban_hang + gia_tri_xuat_tra_hang + gia_tri_xuat_posto + gia_tri_xuat_khac +gia_tri_xuat_chuyen_ma + gia_tri_xuat_chuyen_batch + gia_tri_xuat_chuyen_kho) as gia_tri
from da_sap_zwm07_n1
Group by 1,2
Order by 1,2) AS subquery_alias
;

--18. nguyen lieu goc thuc te MB51

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
	on  a.order_1 = b.order_1
where a.quantity_btp <> 0 and b.quantity_nlg <> 0
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
	
--đệ quy cho btp
select * from da_sap_nlg_v1

drop view da_sap_truy_nlg
create view da_sap_truy_nlg as 
with RECURSIVE cte_btp as
(
	select 
		month,
		btp,
		batch_btp,
		order_1,
		1 as quantity_btp,
		nlg,
		material_description,
		batch_nlg,
		valuation_type,
		month as material_month,
		quantity_nlg/quantity_btp as quantity_nlg,
		1 as level
	from da_sap_nlg_v1
	union
	select 
		a.month,
		a.btp,
		a.batch_btp,
		a.order_1,
		a.quantity_btp,
		b.nlg,
		b.material_description,
		b.batch_nlg,
		b.valuation_type,
		b.month as material_month,
		(b.quantity_nlg/b.quantity_btp)*a.quantity_nlg as quantity_nlg,
		level + 1 as level
	from cte_btp as a
	left join da_sap_nlg_v1 as b on a.batch_nlg = b.batch_btp
	where level < 10 and b.nlg is not null
)
	Select 
		month,
		btp,
		batch_btp,
		order_1,
		quantity_btp,
		nlg,
		material_description,
		batch_nlg,
		valuation_type,
		material_month,
		quantity_nlg,
		level
	from cte_btp
	where left(nlg,1) <> '6'
	order by 
		month,
		btp,
		order_1,
		nlg,
		level;

--18. MB51 nguyen lieu goc thuc te 
drop view da_sap_mb51_v5
create view da_sap_mb51_v5 as
select 
	a.month,
	a.order_1 as order_tp,
	a.material as material_tp,
	a.batch as batch_tp,
	a.quantity_btp as quantity_btp,
	b.nlg,
	CASE WHEN left(a.material,1) <> '6' THEN a.material
		ELSE b.nlg
	END as material,
	CASE WHEN left(a.material,1) <> '6' THEN a.material_description
		ELSE b.material_description
	END as material_description,
	CASE WHEN left(a.material,1) <> '6' THEN a.valuation_type
		ELSE	b.valuation_type
		END as valuation_type,
	a.base_unit_of_measure as unit_of_measure,
	CASE WHEN left(a.material,1) <> '6' THEN a.month
		ELSE b.material_month
		END as material_month,
	CASE WHEN left(a.material,1) <> '6' THEN a.quantity_btp*-1
		ELSE 
			CASE WHEN a.quantity_btp*b.quantity_nlg < 0 THEN (a.quantity_btp*b.quantity_nlg)*-1 
				ELSE a.quantity_btp*b.quantity_nlg
				END
		END as quantity,
	CASE WHEN left(a.material,1) <> '6' THEN 0
		ELSE	b.level
		END as level
from da_sap_tp_v1 as a
left join da_sap_truy_nlg as b on a.batch = b.batch_btp
order by a.month, a.order_1, a.material, level

select * from da_sap_tp_v1

select * from da_sap_mb51_v5
where material is not null
select * from da_sap_truy_nlg

