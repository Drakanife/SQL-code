
--tạo table subpublic.da_dim_gd_zwm07

create table subpublic.da_dim_gd_zwm07
(
phan_loai_gd text,
sl_gt text,
nhom_gd text,
code1 text,
code2 text,
code3 text
)
--tạo index cho da_sap_zwm07_vnp1

create index idx_zwm07_n1_thang_material on da_sap_zwm07_n1(thang,material)

create index idx_zwm07_p1_thang_material_att on da_sap_zwm07_p1(thang,material, attribute)
--da_sap_zwm07_vnp1
select * from da_sap_zwm07_vnp1
where phan_loai_gd_sl = 'Tồn cuối kỳ' and value_sl = 0
drop view da_sap_zwm07_vnp1
create view da_sap_zwm07_vnp1 as 
with cte as 
(
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Tồn đầu kỳ' as phan_loai_gd_sl,
	so_luong_ton_kho_dau_ky as value_sl,
	'GT đầu kỳ' as phan_loai_gd_gt,
	gia_tri_ton_kho_dau_ky as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập mua hàng' as phan_loai_gd_sl,
	nhap_mua_hang as value_sl,
	'Giá trị Nhập mua hàng' as phan_loai_gd_gt,
	gia_tri_nhap_mua_hang as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập sản xuất' as phan_loai_gd_sl,
	nhap_san_xuat as value_sl,
	'Giá trị Nhập sản xuất' as phan_loai_gd_gt,
	gia_tri_nhap_san_xuat as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập trả hàng' as phan_loai_gd_sl,
	nhap_tra_hang as value_sl,
	'Giá trị Nhập trả hàng' as phan_loai_gd_gt,
	gia_tri_nhap_tra_hang as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập PO-STO' as phan_loai_gd_sl,
	nhap_posto as value_sl,
	'Giá trị PO-STO' as phan_loai_gd_gt,
	gia_tri_nhap_posto as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập khác' as phan_loai_gd_sl,
	nhap_khac as value_sl,
	'Giá trị Nhập khác' as phan_loai_gd_gt,
	gia_tri_nhap_khac as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển mã' as phan_loai_gd_sl,
	nhap_chuyen_ma as value_sl,
	'Giá trị nhập chuyển mã' as phan_loai_gd_gt,
	gia_tri_nhap_chuyen_ma as value_gt
from da_sap_zwm07_n1

union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển batch' as phan_loai_gd_sl,
	nhap_chuyen_batch as value_sl,
	'Giá trị nhập chuyển batch' as phan_loai_gd_gt,
	gia_tri_nhap_chuyen_batch as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển kho' as phan_loai_gd_sl,
	nhap_chuyen_kho as value_sl,
	'Giá trị nhập chuyển kho' as phan_loai_gd_gt,
	gia_tri_nhap_chuyen_kho as value_gt
from da_sap_zwm07_n1

union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất sản xuất' as phan_loai_gd_sl,
	xuat_san_xuat as value_sl,
	'Giá trị xuất sản xuất' as phan_loai_gd_gt,
	gia_tri_xuat_san_xuat as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất bán hàng' as phan_loai_gd_sl,
	xuat_ban_hang as value_sl,
	'Giá trị xuất bán hàng' as phan_loai_gd_gt,
	giatri_xuat_ban_hang as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất trả hàng' as phan_loai_gd_sl,
	xuat_tra_hang as value_sl,
	'Giá trị xuất trả hàng' as phan_loai_gd_gt,
	gia_tri_xuat_tra_hang as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất PO-STO' as phan_loai_gd_sl,
	xuat_posto as value_sl,
	'Giá trị PO-STO' as phan_loai_gd_gt,
	gia_tri_xuat_posto as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất khác' as phan_loai_gd_sl,
	xuat_khac as value_sl,
	'Giá trị xuất khác' as phan_loai_gd_gt,
	gia_tri_xuat_khac as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển mã' as phan_loai_gd_sl,
	xuat_chuyen_ma as value_sl,
	'Giá trị xuất chuyển mã' as phan_loai_gd_gt,
	gia_tri_xuat_chuyen_ma as value_gt
from da_sap_zwm07_n1
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển batch' as phan_loai_gd_sl,
	xuat_chuyen_batch as value_sl,
	'Giá trị xuất chuyển batch' as phan_loai_gd_gt,
	gia_tri_xuat_chuyen_batch as value_gt
from da_sap_zwm07_n1

union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển kho' as phan_loai_gd_sl,
	xuat_chuyen_kho as value_sl,
	'Giá trị xuất chuyển kho' as phan_loai_gd_gt,
	gia_tri_xuat_chuyen_kho as value_gt
from da_sap_zwm07_n1
 
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Tồn cuối kỳ' as phan_loai_gd_sl,
	so_luong_ton_kho_cuoi_ky as value_sl,
	'GT cuối kỳ' as phan_loai_gd_gt,
	gia_tri_ton_kho_cuoi_ky as value_gt
from da_sap_zwm07_n1

UNION
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Tồn đầu kỳ'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Tồn đầu kỳ'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'GT đầu kỳ'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'GT đầu kỳ'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account

Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập mua hàng'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập mua hàng'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị Nhập mua hàng'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị Nhập mua hàng'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập sản xuất'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập sản xuất'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị Nhập sản xuất'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị Nhập sản xuất'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account

Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập trả hàng'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập trả hàng'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị Nhập trả hàng'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị Nhập trả hàng'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập khác'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập khác'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị Nhập khác'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị Nhập khác'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description, dvt,valuation_type, gl_account

Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập chuyển kho'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập chuyển kho'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển kho'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển kho'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập chuyển mã'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập chuyển mã'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển mã'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển mã'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập chuyển batch'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập chuyển batch'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển batch'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị nhập chuyển batch'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account	

Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Nhập PO-STO'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Nhập PO-STO'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị PO-STO'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị PO-STO'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description, dvt,valuation_type, gl_account	
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất sản xuất'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất sản xuất'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất sản xuất'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất sản xuất'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description, dvt,valuation_type, gl_account	
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất bán hàng'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất bán hàng'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất bán hàng'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất bán hàng'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account	
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất trả hàng'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất trả hàng'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất trả hàng'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất trả hàng'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
		
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất khác'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất khác'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất khác'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất khác'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description, dvt,valuation_type, gl_account	
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất PO-STO'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất PO-STO'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị PO-STO'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị PO-STO'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất chuyển kho'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất chuyển kho'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển kho'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển kho'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất chuyển mã'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất chuyển mã'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển mã'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển mã'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account			
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Xuất chuyển batch'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Xuất chuyển batch'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển batch'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'Giá trị xuất chuyển batch'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description,dvt, valuation_type, gl_account		
Union
select 
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	MAX(CASE WHEN attribute = 'Tồn cuối kỳ'then attribute end) as phan_loai_gd_sl,
	MAX(CASE WHEN attribute = 'Tồn cuối kỳ'then value end) as value_sl,
	MAX(CASE WHEN attribute = 'GT cuối kỳ'then attribute end) as phan_loai_gd_gt,
	MAX(CASE WHEN attribute = 'GT cuối kỳ'then value end) as value_gt
from da_sap_zwm07_p1
group by 
thang, plant, material, material_description, dvt,valuation_type, gl_account		
) 
select
	a.thang,
	a.plant,
	a.material,
	a.material_description,
	a.valuation_type,
	a.gl_account,
 	a.dvt,
	a.phan_loai_gd_gt,
	a.value_gt,	
	a.phan_loai_gd_sl,
	a.value_sl,
	b.c1_nhom_giao_dich,
	b.c2_nhom_giao_dich,
	b.c3_nhom_giao_dich,
	b.c4_nhom_giao_dich
from cte as a
left join da_master_sap_zwm06_n1 as b on a.phan_loai_gd_sl = b.phan_loai_giao_dich
where left(material,1) = '7'

select * from da_master_sap_zwm06_n1
--da_sap_zwm07_vnp2
select * from da_sap_zwm07_vnp2
drop view da_sap_zwm07_vnp2
create view da_sap_zwm07_vnp2 as 
with cte as 
(
select
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	sum(value_gt) as value_gt,	
	sum(value_sl) as value_sl,
	c1_nhom_giao_dich
from da_sap_zwm07_vnp1
where valuation_type = '01.SANXUAT'
group by thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	c1_nhom_giao_dich
order by thang, material
)
select
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
 	dvt,
	value_gt,
	value_sl,
	c1_nhom_giao_dich as nhom_gd,
	CASE when value_sl = 0 Then 0
		ELSE value_gt/value_sl
		END as don_gia
from cte
--tạo index cho da_sap_mb51_vnp1
drop index idx_mb51_n1_thang_material_movement_type_bth
create index idx_mb51_n1_thang_material_movement_type_bth on da_sap_mb51_n1 (month,material,movement_type)

drop index idx_mb51_p1_thang_material_movement_type_bth
create index idx_mb51_p1_thang_material_movement_type_bth on da_sap_mb51_p1 (thang,material,movement_type)

create index idx_mb51_thang_ma_bat on da_sap_mb51_n1 (month,material, batch)
create index idx_mb51_p1_thang_ma_bat on da_sap_mb51_p1 (thang,material, batch)


create index ind_da_dim_mvt_n1_move on subpublic.da_dim_mvt_n1(movement_type,nhom_gd)
--create view da_sap_mb51_vnp1

select * from da_sap_mb51_vnp1

drop view da_sap_mb51_vnp1
create view da_sap_mb51_vnp1 as
with cte as 
(
select 
	month::date,
	material,
	material_description,
	plant,
	storage_location,
	movement_type,
	special_stock,
	posting_date,
	material_document,
	material_docitem,
	batch,
	qty_in_unit_of_entry,
	unit_of_entry,
	name_1,
	movement_type_text,
	asset,
	sub_number,
	counter,
	order_1,
	routing_number_for_operations,
	document_header_text,
	document_date,
	qty_in_opun,
	order_price_unit,
	order_unit,
	qty_in_order_unit,
	company_code,
	valuation_type,
	entry_date,
	time_of_entry,
	purchase_order,
	smart_number,
	item,
	warehouse_document,
	warehouse_number,
	ext_amount_in_local_currency,
	sales_value,
	reason_for_movement,
	sales_order,
	sales_order_schedule,
	sales_order_item,
	cost_center,
	customer,
	movement_indicator,
	consumption,
	receipt_indicator,
	supplier,
	sales_order as sales_order1,
	sales_order_item as sales_order_item1,
	base_unit_of_measure,
	quantity,
	material_doc_year,
	network,
	activity,
	wbs_element,
	reservation,
	item_number_of_reservation,
	stock_segment,
	debit_credit_ind,
	user_name,
	trans_event_type,
	sales_value_inc_vat,
	currency,
	goods_receipt_issue_slip,
	item_automatically_created,
	reference,
	original_line_item,
	multiple_account_assignment
from da_sap_mb51_n1
where left(material,1) = '7'
union
select 	
	thang as month,
	material,
	material_description,
	plant,
	storage_location,
	movement_type,
	special_stock,
	posting_date,
	material_document,
	material_docitem,
	batch,
	qty_in_unit_of_entry,
	unit_of_entry,
	name1,
	movement_type_text,
	asset,
	sub_number,
	counter,
	a.order,
	routing_number_for_operations,
	document_header_text,
	document_date,
	qty_in_opun,
	order_price_unit,
	order_unit,
	qty_in_order_unit,
	company_code,
	valuation_type,
	entry_date,
	time_of_entry,
	purchase_order,
	smart_number,
	item,
	warehouse_document,
	warehouse_number,
	ext_amount_in_local_currency,
	sales_value,
	reason_for_movement,
	sales_order,
	sales_order_schedule,
	sales_order_item,
	cost_center,
	customer,
	movement_indicator,
	consumption,
	receipt_indicator,
	supplier,
	sales_order1,
	sales_order_item1,
	base_unit_of_measure,
	quantity,
	material_doc_year,
	network,
	activity,
	wbs_element,
	reservation,
	item_number_of_reservation,
	stock_segment,
	debitcredit_ind,
	user_name,
	transevent_type,
	sales_value_inc_vat,
	currency,
	goods_receiptissue_slip,
	item_automatically_created,
	reference,
	original_line_item,
	multiple_account_assignment
from da_sap_mb51_p1 as a
where left(material,1) = '7'
)
select
	a.month,
	a.material,
	a.material_description,
	a.plant,
	a.storage_location,
	a.movement_type,
	a.special_stock,
	a.posting_date,
	a.material_document,
	a.material_docitem,
	a.batch,
	a.qty_in_unit_of_entry,
	a.unit_of_entry,
	a.name_1,
	a.movement_type_text,
	a.asset,
	a.sub_number,
	a.counter,
	a.order_1,
	a.routing_number_for_operations,
	a.document_header_text,
	a.document_date,
	a.qty_in_opun,
	a.order_price_unit,
	a.order_unit,
	a.qty_in_order_unit,
	a.company_code,
	a.valuation_type,
	a.entry_date,
	a.time_of_entry,
	a.purchase_order,
	a.smart_number,
	a.item,
	a.warehouse_document,
	a.warehouse_number,
	a.ext_amount_in_local_currency,
	a.sales_value,
	a.reason_for_movement,
	a.sales_order,
	a.sales_order_schedule,
	a.sales_order_item,
	a.cost_center,
	a.customer,
	a.movement_indicator,
	a.consumption,
	a.receipt_indicator,
	a.supplier,
	a.sales_order as sales_order1,
	a.sales_order_item as sales_order_item1,
	a.base_unit_of_measure,
	a.quantity,
	a.material_doc_year,
	a.network,
	a.activity,
	a.wbs_element,
	a.reservation,
	a.item_number_of_reservation,
	a.stock_segment,
	a.debit_credit_ind,
	a.user_name,
	a.trans_event_type,
	a.sales_value_inc_vat,
	a.currency,
	a.goods_receipt_issue_slip,
	a.item_automatically_created,
	a.reference,
	a.original_line_item,
	a.multiple_account_assignment,
	b.c1_nhom_giao_dich,
	b.c2_nhom_giao_dich,
	b.c3_nhom_giao_dich,
	c.don_gia,
	c.don_gia * a.quantity as gia_tri
from cte as a
left join da_master_sap_mvt_n1 as b on a.movement_type = b.movement_type
left join da_sap_zwm07_vnp2 as c on a.month = c.thang and a.material = c.material and b.c1_nhom_giao_dich = c.nhom_gd


select * from da_master_sap_mvt_n1

--tao index cho da_sap_zwm06_vnp1

CREATE INDEX idx_da_sap_zwm06_n1 ON da_sap_zwm06_n1 (material,attribute,thang);


CREATE INDEX idx_da_sap_zwm06_p1 ON da_sap_zwm06_p1 (material,attribute,thang);
-- da_sap_zwm06_vnp1
select * from da_sap_zwm06_vnp1
drop view da_sap_zwm06_vnp1
create view da_sap_zwm06_vnp1 as
with cte as
(
select 
	thang,
	date_trunc('month', thang)::date as start_of_month,
	plant,
	material,
	material_description,
	storage_location,
	descr_of_storage_loc,
	dvt,
	special_stock,
	old_material_number,
	valuation_type,
	gross_weight,
	net_weight,
	total_net_weight,
	volume,
	total_gross_weight,
	material_type,
	material_type_desc,
	material_group,
	material_grp_desc2,
	batch,
	date_of_last_goods_receipt,
	aql,
	lo_ncc,
	ca_sx,
	chieu_dai_gang,
	dac_tinh_rieng,
	line_san_xuat,
	loi_ngoai_quan,
	mat,
	mu_nha_cung_cap,
	ngay_phoi_tron,
	nguoi_phoi_tron,
	stt_thung,
	tsc,
	date_for_unrestricted_use1,
	date_for_unrestricted_use2,
	date_for_unrestricted_use3,
	date_for_unrestricted_use4,
	date_for_unrestricted_use5,
	date_for_unrestricted_use6,
	country_region_of_origin,
	region_of_origin_of_material,
	date_when_batch_was_produced,
	vendor_batch_number,
	vendor_account_number,
	deletion_ind_for_batches,
	material_group_export,
	next_insp_date_for_batch,
	availability_date,
	expiration_date_shelf_life,
	status_of_batch,
	attribute,
	value
from da_sap_zwm06_n1
where left(material,1) = '7'
union
select 
	thang,
	date_trunc('month', thang)::date as start_of_month,
	plant,
	material,
	material_description,
	storage_location,
	descr_of_storage_loc,
	dvt,
	special_stock,
	old_material_number,
	valuation_type,
	gross_weight,
	net_weight,
	total_net_weight,
	volume,
	total_gross_weight,
	material_type,
	material_type_desc,
	material_group,
	material_grp_desc2,
	batch,
	date_of_last_goods_receipt,
	aql,
	lo_ncc,
	ca_sx,
	chieu_dai_gang,
	dac_tinh_rieng,
	line_san_xuat,
	loi_ngoai_quan,
	mat,
	mu_nha_cung_cap,
	ngay_phoi_tron,
	nguoi_phoi_tron,
	stt_thung,
	tsc,
	date_for_unrestricted_use1,
	date_for_unrestricted_use2,
	date_for_unrestricted_use3,
	date_for_unrestricted_use4,
	date_for_unrestricted_use5,
	date_for_unrestricted_use6,
	country_region_of_origin,
	region_of_origin_of_material,
	date_when_batch_was_produced,
	vendor_batch_number,
	vendor_account_number,
	deletion_ind_for_batches,
	material_group_export,
	next_insp_date_for_batch,
	availability_date,
	expiration_date_shelf_life,
	status_of_batch,
	attribute,
	value
from da_sap_zwm06_p1
where left(material,1) = '7'
)
select 
	a.thang,
	a.start_of_month,
	a.plant,
	a.material,
	a.material_description,
	a.storage_location,
	a.descr_of_storage_loc,
	a.dvt,
	a.special_stock,
	a.old_material_number,
	a.valuation_type,
	a.gross_weight,
	a.net_weight,
	a.total_net_weight,
	a.volume,
	a.total_gross_weight,
	a.material_type,
	a.material_type_desc,
	a.material_group,
	a.material_grp_desc2,
	a.batch,
	a.date_of_last_goods_receipt,
	a.aql,
	a.lo_ncc,
	a.ca_sx,
	a.chieu_dai_gang,
	a.dac_tinh_rieng,
	a.line_san_xuat,
	a.loi_ngoai_quan,
	a.mat,
	a.mu_nha_cung_cap,
	a.ngay_phoi_tron,
	a.nguoi_phoi_tron,
	a.stt_thung,
	a.tsc,
	a.date_for_unrestricted_use1,
	a.date_for_unrestricted_use2,
	a.date_for_unrestricted_use3,
	a.date_for_unrestricted_use4,
	a.date_for_unrestricted_use5,
	a.date_for_unrestricted_use6,
	a.country_region_of_origin,
	a.region_of_origin_of_material,
	a.date_when_batch_was_produced,
	a.vendor_batch_number,
	a.vendor_account_number,
	a.deletion_ind_for_batches,
	a.material_group_export,
	a.next_insp_date_for_batch,
	a.availability_date,
	a.expiration_date_shelf_life,
	a.status_of_batch,
	a.attribute,
	a.value,
	b.sl_gt,
	b.c1_nhom_giao_dich as nhom_gd,
	b.c2_nhom_giao_dich,
	b.c3_nhom_giao_dich,
	c.don_gia,
	c.don_gia * a.value as gia_tri
from cte as a
left join da_master_sap_zwm06_n1 as b on a.attribute = b.phan_loai_giao_dich
left join da_sap_zwm07_vnp2 as c on a.start_of_month = c.thang and a.material = c.material  and b.c1_nhom_giao_dich = c.nhom_gd

select * from da_master_sap_zwm06_n1

-- da_sap_mb51_vnp2
select * from da_sap_mb51_vnp2
drop view da_sap_mb51_vnp2
create view da_sap_mb51_vnp2 as 
select 
	batch,
	material,
	min(posting_date) as posting_date
from da_sap_mb51_vnp1
where left(material,1) = '7'
group by batch, material

--da_sap_zwm06_vnp2
select * from da_sap_zwm06_vnp1

select sum(value) from da_sap_zwm06_p1
where attribute = 'Tồn cuối kỳ' and thang = '2023-08-03'

where don_gia is null

drop view da_sap_zwm06_vnp2
create view da_sap_zwm06_vnp2 as 
select  
	a.thang,
	a.start_of_month,
	a.plant,
	a.material,
	a.material_description,
	a.storage_location,
	a.descr_of_storage_loc,
	a.dvt,
	a.special_stock,
	a.old_material_number,
	a.valuation_type,
	a.gross_weight,
	a.net_weight,
	a.total_net_weight,
	a.volume,
	a.total_gross_weight,
	a.material_type,
	a.material_type_desc,
	a.material_group,
	a.material_grp_desc2,
	a.batch,
	a.date_of_last_goods_receipt,
	a.aql,
	a.lo_ncc,
	a.ca_sx,
	a.chieu_dai_gang,
	a.dac_tinh_rieng,
	a.line_san_xuat,
	a.loi_ngoai_quan,
	a.mat,
	a.mu_nha_cung_cap,
	a.ngay_phoi_tron,
	a.nguoi_phoi_tron,
	a.stt_thung,
	a.tsc,
	a.date_for_unrestricted_use1,
	a.date_for_unrestricted_use2,
	a.date_for_unrestricted_use3,
	a.date_for_unrestricted_use4,
	a.date_for_unrestricted_use5,
	a.date_for_unrestricted_use6,
	a.country_region_of_origin,
	a.region_of_origin_of_material,
	a.date_when_batch_was_produced,
	a.vendor_batch_number,
	a.vendor_account_number,
	a.deletion_ind_for_batches,
	a.material_group_export,
	a.next_insp_date_for_batch,
	a.availability_date,
	a.expiration_date_shelf_life,
	a.status_of_batch,
	a.attribute,
	a.value,
	a.sl_gt,
	a.nhom_gd,
	a.c2_nhom_giao_dich,
	a.c3_nhom_giao_dich,
	a.don_gia,
	a.gia_tri,
	b.posting_date as min_posting_date,
	a.thang - b.posting_date as so_ngay_ton_kho
from da_sap_zwm06_vnp1 as a
left join da_sap_mb51_vnp2 as b on a.material = b.material and a.batch = b.batch
where left(a.material,1) = '7'

--tính tồn cuối kỳ
drop view da_sap_tonkho_n1
create view da_sap_tonkho_n1 as 
select  
	a.month,
	a.posting_date,
	a.material,
	a.material_description,
	a.storage_location,
	a.batch,
	b.qty::float as qty_dau_ky,
	b.nhom_gd as ton_dau_ky,
	a.quantity::float,
	a.nhom_gd,
	a.code1,
	a.code2,
	a.code3
from da_sap_mb51_vnp1 as a
left join subpublic.da_sap_tondauky_n1 as b on a.month = a.month and a.material = b.material and a.batch = b.batch
WHERE (a.nhom_gd = 'Nhập kho' OR a.nhom_gd = 'Xuất kho')
    AND a.month NOT IN ('2022-11-01', '2022-12-01', '2022-10-01');

	select 
		*
	from da_sap_mb51_vnp1
--
drop view subpublic.cte_ton 
create view subpublic.cte_ton as 
select 
		a.month,
		a.month::date as posting_date,
		a.material,
		a.material_description,
		a.batch,
		a.qty as qty_dau_ky,
		b.quantity_in as xuat,
		b.quantity_out as nhap,
		a.qty::float + COALESCE(quantity_in,0) + COALESCE(quantity_out,0) as qty_cuoi_ky		
	from 
		( select 
			month,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(qty::FLOAT) as qty
		from subpublic.da_sap_tondauky_n1
		 group by month,material,material_description,batch ) AS A
	left join 
		( select 
		 	month,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(CASE WHEN nhom_gd = 'Nhập kho' THEN quantity ELSE 0 END) AS quantity_in,
      		SUM(CASE WHEN nhom_gd = 'Xuất kho' THEN quantity ELSE 0 END) AS quantity_out
		 from da_sap_mb51_vnp1
		group by month, material, material_description, batch ) as b 
		on a.month::date = b.month and a.batch = b.batch and a.material = b.material
--

drop view da_sap_mb51_vnp3

create view da_sap_mb51_vnp3 as 
WITH RECURSIVE cte AS (
   select 
		a.posting_date,
		a.material,
		a.material_description,
		a.batch,
		a.qty as qty_dau_ky,
		b.quantity_in as quantity_in,
		b.quantity_out as quantity_out,
		a.qty::float + COALESCE(quantity_in,0) + COALESCE(quantity_out,0) as qty_cuoi_ky		
	from 
( select
	'2023-01-01'::date as posting_date,
	b.material,
	b.material_description,
	b.batch,
	sum(a.qty::float) as qty
from subpublic.da_sap_tondauky_n1 as a
right join (select distinct material,material_description, batch from da_sap_mb51_vnp1) as b 
on a.material = b.material and a.batch = b.batch
group by 1,2,3,4
order by 2,4) AS a
	left join 
		( select 
		 	posting_date,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(CASE WHEN c1_nhom_giao_dich = 'Nhập kho' THEN quantity ELSE 0 END) AS quantity_in,
      		SUM(CASE WHEN c1_nhom_giao_dich = 'Xuất kho' THEN quantity ELSE 0 END) AS quantity_out
		 from da_sap_mb51_vnp1
		group by posting_date, material, material_description, batch ) as b 
		on a.posting_date = b.posting_date and a.batch = b.batch and a.material = b.material
	
    UNION ALL

    SELECT
		CASE WHEN b.posting_date is null THEN (a.posting_date + INTERVAL '1 day')::date
				ELSE b.posting_date END as posting_date,
		CASE WHEN b.material is null THEN a.material
			ELSE b.material END as material,
		CASE WHEN b.material_description is null THEN a.material_description
			ELSE b.material_description END as material,
		CASE WHEN b.batch is null THEN a.batch
			ELSE b.batch END as material,
		a.qty_cuoi_ky as qty_dau_ky,
		COALESCE(b.quantity_in) as quantity_in,
		COALESCE(b.quantity_out) as quantity_out,
		COALESCE(a.qty_cuoi_ky,0) +  COALESCE(b.quantity_in,0) + COALESCE(b.quantity_out,0) as qty_cuoi_ky
    FROM
        cte as a
    left JOIN ( select 
			month,
  			posting_date,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(CASE WHEN c1_nhom_giao_dich = 'Nhập kho' THEN quantity ELSE 0 END) AS quantity_in,
      		SUM(CASE WHEN c1_nhom_giao_dich = 'Xuất kho' THEN quantity ELSE 0 END) AS quantity_out
		 from da_sap_mb51_vnp1
		group by month,posting_date, material, material_description, batch ) as b 
	ON b.posting_date = (a.posting_date + INTERVAL '1 day') and a.material = b.material and a.batch =b.batch
	where a.posting_date < (select max(posting_date) from da_sap_mb51_vnp1)
)
select
	a.posting_date,
	a.material,
	a.material_description,
	a.batch,
	a.qty_dau_ky as sl_dau_ky,
	b.don_gia_dau_ky,
	a.qty_dau_ky * b.don_gia_dau_ky as gt_dau_ky,
	a.quantity_in as sl_nhap_kho,
	b.don_gia_nhap_kho,
	a.quantity_in * b.don_gia_nhap_kho as gt_nhap_kho,
	a.quantity_out as sl_xuat_kho,
	b.don_gia_xuat_kho,
	a.quantity_out * b.don_gia_xuat_kho as gt_xuat_kho,
	a.qty_cuoi_ky as sl_cuoi_ky,
	b.don_gia_cuoi_ky,
	a.qty_cuoi_ky * b.don_gia_cuoi_ky as gia_tri_cuoi_ky
from cte as a
left join (
select distinct
	thang,
	material,
	SUM(CASE WHEN nhom_gd = 'Tồn đầu kỳ' THEN don_gia ELSE 0 END) AS don_gia_dau_ky,
	SUM(CASE WHEN nhom_gd = 'Nhập kho' THEN don_gia ELSE 0 END) AS don_gia_nhap_kho,
	SUM(CASE WHEN nhom_gd = 'Xuất kho' THEN don_gia ELSE 0 END) AS don_gia_xuat_kho,
	SUM(CASE WHEN nhom_gd = 'Tồn cuối kỳ' THEN don_gia ELSE 0 END) AS don_gia_cuoi_ky
from da_sap_zwm07_vnp2
group by thang,material ) as b 
	on EXTRACT(month FROM a.posting_date) = EXTRACT(month FROM b.thang)
	AND EXTRACT(year FROM a.posting_date) = EXTRACT(year FROM b.thang)
	AND a.material = b.material
where ((qty_dau_ky is not null and qty_dau_ky <> 0) 
	   or (quantity_in is not null and quantity_in <> 0) 
	   or (quantity_out is not null and quantity_out <> 0 ) )
order by a.posting_date, a.material, a.batch
-- theo tháng
WITH RECURSIVE cte AS (
   select 
		a.month,
		b.posting_date,
		a.material,
		a.material_description,
		a.batch,
		a.qty as qty_dau_ky,
		b.quantity_in as quantity_in,
		b.quantity_out as quantity_out,
		COALESCE(a.qty::float,0) + COALESCE(b.quantity_in,0) + COALESCE(b.quantity_out,0) as qty_cuoi_ky		
	from 
( select
	'2023-01-01'::date as month,
	b.material,
	b.material_description,
	b.batch,
	sum(a.qty::float) as qty
from subpublic.da_sap_tondauky_n1 as a
right join (select distinct material,material_description, batch from da_sap_mb51_vnp1) as b 
on a.material = b.material and a.batch = b.batch
group by 1,2,3,4
order by 2,4) AS a
	left join 
		( select 
		 	month,
		 	posting_date,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(CASE WHEN c1_nhom_giao_dich = 'Nhập kho' THEN quantity ELSE 0 END) AS quantity_in,
      		SUM(CASE WHEN c1_nhom_giao_dich = 'Xuất kho' THEN quantity ELSE 0 END) AS quantity_out
		 from da_sap_mb51_vnp1
		group by month, posting_date, material, material_description, batch 
		) as b 
		on a.month = b.month and a.batch = b.batch and a.material = b.material

	
    UNION ALL

    SELECT
		CASE WHEN b.posting_date is null THEN (a.posting_date + INTERVAL '1 day')::date
				ELSE b.posting_date END as posting_date,
		CASE WHEN b.material is null THEN a.material
			ELSE b.material END as material,
		CASE WHEN b.material_description is null THEN a.material_description
			ELSE b.material_description END as material,
		CASE WHEN b.batch is null THEN a.batch
			ELSE b.batch END as material,
		a.qty_cuoi_ky as qty_dau_ky,
		COALESCE(b.quantity_in) as quantity_in,
		COALESCE(b.quantity_out) as quantity_out,
		COALESCE(a.qty_cuoi_ky,0) +  COALESCE(b.quantity_in,0) + COALESCE(b.quantity_out,0) as qty_cuoi_ky
    FROM
        cte as a
    left JOIN ( select 
			month,
  			posting_date,
		 	material,
		 	material_description,
		 	batch,
		 	SUM(CASE WHEN c1_nhom_giao_dich = 'Nhập kho' THEN quantity ELSE 0 END) AS quantity_in,
      		SUM(CASE WHEN c1_nhom_giao_dich = 'Xuất kho' THEN quantity ELSE 0 END) AS quantity_out
		 from da_sap_mb51_vnp1
		group by month,posting_date, material, material_description, batch ) as b 
	ON b.posting_date = (a.posting_date + INTERVAL '1 day') and a.material = b.material and a.batch =b.batch
	where a.posting_date < (select max(posting_date) from da_sap_mb51_vnp1)
)
select
	a.posting_date,
	a.material,
	a.material_description,
	a.batch,
	a.qty_dau_ky as sl_dau_ky,
	b.don_gia_dau_ky,
	a.qty_dau_ky * b.don_gia_dau_ky as gt_dau_ky,
	a.quantity_in as sl_nhap_kho,
	b.don_gia_nhap_kho,
	a.quantity_in * b.don_gia_nhap_kho as gt_nhap_kho,
	a.quantity_out as sl_xuat_kho,
	b.don_gia_xuat_kho,
	a.quantity_out * b.don_gia_xuat_kho as gt_xuat_kho,
	a.qty_cuoi_ky as sl_cuoi_ky,
	b.don_gia_cuoi_ky,
	a.qty_cuoi_ky * b.don_gia_cuoi_ky as gia_tri_cuoi_ky
from cte as a
left join (
select distinct
	thang,
	material,
	SUM(CASE WHEN nhom_gd = 'Tồn đầu kỳ' THEN don_gia ELSE 0 END) AS don_gia_dau_ky,
	SUM(CASE WHEN nhom_gd = 'Nhập kho' THEN don_gia ELSE 0 END) AS don_gia_nhap_kho,
	SUM(CASE WHEN nhom_gd = 'Xuất kho' THEN don_gia ELSE 0 END) AS don_gia_xuat_kho,
	SUM(CASE WHEN nhom_gd = 'Tồn cuối kỳ' THEN don_gia ELSE 0 END) AS don_gia_cuoi_ky
from da_sap_zwm07_vnp2
group by thang,material ) as b 
	on EXTRACT(month FROM a.posting_date) = EXTRACT(month FROM b.thang)
	AND EXTRACT(year FROM a.posting_date) = EXTRACT(year FROM b.thang)
	AND a.material = b.material
where ((qty_dau_ky is not null and qty_dau_ky <> 0) 
	   or (quantity_in is not null and quantity_in <> 0) 
	   or (quantity_out is not null and quantity_out <> 0 ) )
order by a.posting_date, a.material, a.batch
-- tính tuổi 
drop view da_sap_mb51_vnp4

select * from da_sap_mb51_vnp4
where value is null


create view da_sap_mb51_vnp4 as

with cte as (
select distinct
	case when b.thang is null then DATE_TRUNC('month', MAX(a.posting_date))::Date
	ELSE b.thang END as month,
	a.material ,
	a.batch ,
	(CURRENT_DATE - INTERVAL '1 day')::Date AS report_date,
	b.value,
	MAX(a.posting_date) as max_date, 
	MIN(a.posting_date) as min_date, 
	MAX(a.posting_date) - MIN(a.posting_date) as date_ko_ton
	from da_sap_mb51_vnp1 as a
full join (select * from da_sap_zwm06_vnp1
	where nhom_gd = 'Tồn cuối kỳ' ) as b on a.material = b.material and a.batch = b.batch
--where (a.material = '70000008' and a.batch = '22S14KUA1') or (b.material = '70000008' and b.batch = '22S14KUA1')
group by
	a.material,
	a.batch, 
	b.thang,
	b.material,
	b.batch,
	b.value
)
select distinct
	month,
	material,
	batch,
	report_date,
	min(min_date),
	CASE WHEN value = 0 or value is null THEN date_ko_ton ELSE  report_date - min(min_date) END as tuoi,
	value
from cte
group by 
	month,
	material,
	batch,
	report_date,
	min_date,
	value,
	date_ko_ton

select * from  da_sap_mb51_vnp1
where material = '70000008' and batch = '23A04KUC2'

select * from  da_sap_zwm06_vnp1
where material = '70000008' and batch = '23A04KUC2'

select * from  subpublic.da_sap_zwm06_p1
where material = '70000008' and batch = '23A04KUC2'
--
with cte as (
select distinct
	a.month,
	a.material ,
	a.batch ,
	(CURRENT_DATE - INTERVAL '1 day')::Date AS report_date,
	b.value,
	MAX(a.posting_date) as max_date, 
	MIN(a.posting_date) as min_date, 
	MAX(a.posting_date) - MIN(a.posting_date) as date_ko_ton
	from da_sap_mb51_vnp1 as a
left join (select * from da_sap_zwm06_vnp1
	where nhom_gd = 'Tồn cuối kỳ' ) as b on a.material = b.material and a.batch = b.batch and a.month = b.thang
--where (a.material = '70000008' and a.batch = '22S13KUB4') or (b.material = '70000008' and b.batch = '22S13KUB4')
group by
	a.month,
	a.material,
	a.batch, 
	b.thang,
	b.material,
	b.batch,
	b.value
)
select distinct
	month,
	material,
	batch,
	report_date,
	min(min_date),
	CASE WHEN value = 0 or value is null THEN date_ko_ton ELSE  report_date - min(min_date) END as tuoi,
	value
from cte
group by 
	month,
	material,
	batch,
	report_date,
	min_date,
	value,
	date_ko_ton
	

--	-
	
select 
	thang,
	material,
	batch,
	MAX(CASE WHEN attribute = 'Tồn cuối kỳ' then value ELSE 0 end) as phan_loai_gd_sl
from  da_sap_zwm06_vnp1
--where material = '70000008' and batch = '23A04KUC2'
group by thang,
	material,
	batch