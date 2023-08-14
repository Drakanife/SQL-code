--tao table subpublic.da_sap_zmm06_p1
drop table subpublic.da_sap_zmm06_p1
create table subpublic.da_sap_zmm06_p1
(
	thang text,
	plant text,
material text,
material_description text,
batch text,
size text,
color text,
weight text,
aql text,
value_from text,
mu_ncc text,
loi_ngoai_quan text
)

--check zwm06
select * from subpublic.da_sap_zmm06_p1
--tạo index
	CREATE INDEX idx_da_sap_mb51_p1_storage_material
ON subpublic.da_sap_mb51_p1 (storage_location, material);

-- da_sap_zmm06_p1 
drop view da_sap_zmm06_vp1
create view da_sap_zmm06_vp1 as
with cte as (
	select distinct
		a.thang,
		a.plant,
		a.material,
		a.material_description,
		a.batch,
		a.size,
		a.color,
		a.weight,
		a.aql,
		a.value_from,
		a.mu_ncc,
		CASE WHEN a.loi_ngoai_quan is null THEN c.loi_ngoai_quan
			ELSE a.loi_ngoai_quan
			END as Loi_ngoai_quan
	from subpublic.da_sap_zmm06_p1 as a
	left outer join 
	( select * from subpublic.da_sap_zmm06_p1 where loi_ngoai_quan is not null)
	as c
	on a.material = c.material and a.thang=c.thang and a.batch = c.batch
)
	Select 
		a.thang,
		a.plant,
		a.material,
		a.material_description,
		a.batch,
		a.size,
		a.color,
		a.weight,
		a.aql,
		a.value_from,
		CASE WHEN a.mu_ncc is null then 'BS thông tin'
			ELSE a.mu_ncc
			END as mu_ncc,
		CASE WHEN a.loi_ngoai_quan is null then 'BS thông tin'
			ELSE a.loi_ngoai_quan
			END as loi_ngoai_quan,
		b.storage_location
	from cte as a
	left join 
		(
		select distinct
			month, material, batch, storage_location
		from subpublic.da_sap_mb51_p1
		where storage_location is not null and left(material,1) = '7'
		) as b
	on a.thang = b.month and a.material = b.material and a.batch = b.batch
	