drop table subpublic.da_dim_zwm06_p1
create table subpublic.da_dim_zwm06_p1
(phan_loai text,
loai text,
nhom_gd text,
loai_gd_n1 text,
loai_gd_n2 text,
loai_gd_n3 text
)


select * from subpublic.da_dim_zwm06_p1

create view 
select * from subpublic.da_sap_zwm07_p1
where left(material,1) = '7'

select * from da_sap_zwm07_vp

--da_sap_zwm07_v3
select * from da_sap_zwm07_v3
drop view da_sap_zwm07_v3
create view da_sap_zwm07_v3 as
with cte as
(select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Tồn đầu kỳ' as att,
	so_luong_ton_kho_dau_ky as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'GT đầu kỳ' as att,
	gia_tri_ton_kho_dau_ky as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập mua hàng' as att,
	nhap_mua_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị Nhập mua hàng' as att,
	gia_tri_nhap_mua_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập sản xuất' as att,
	nhap_san_xuat as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị Nhập sản xuất' as att,
	gia_tri_nhap_san_xuat as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập trả hàng' as att,
	nhap_tra_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị Nhập trả hàng' as att,
	gia_tri_nhap_tra_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập PO-STO' as att,
	nhap_posto as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị PO-STO' as att,
	gia_tri_nhap_posto as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập khác' as att,
	nhap_khac as value
from da_sap_zwm07_vp

union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị Nhập khác' as att,
	gia_tri_nhap_khac as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển mã' as att,
	nhap_chuyen_ma as value
from da_sap_zwm07_vp

union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị nhập chuyển mã' as att,
	gia_tri_nhap_chuyen_ma as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển batch' as att,
	nhap_chuyen_batch as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị nhập chuyển batch' as att,
	gia_tri_nhap_chuyen_batch as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Nhập chuyển kho' as att,
	nhap_chuyen_kho as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị nhập chuyển kho' as att,
	gia_tri_nhap_chuyen_kho as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất sản xuất' as att,
	xuat_san_xuat as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất sản xuất' as att,
	gia_tri_xuat_san_xuat as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất bán hàng' as att,
	xuat_ban_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất bán hàng' as att,
	giatri_xuat_ban_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất trả hàng' as att,
	xuat_tra_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất trả hàng' as att,
	gia_tri_xuat_tra_hang as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất PO-STO' as att,
	xuat_posto as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị PO-STO2' as att,
	gia_tri_xuat_posto as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất khác' as att,
	xuat_khac as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất khác' as att,
	gia_tri_xuat_khac as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển mã' as att,
	xuat_chuyen_ma as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất chuyển mã' as att,
	gia_tri_xuat_chuyen_ma as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển batch' as att,
	xuat_chuyen_batch as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất chuyển batch' as att,
	gia_tri_xuat_chuyen_batch as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Xuất chuyển kho' as att,
	xuat_chuyen_kho as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Giá trị xuất chuyển kho' as att,
	gia_tri_xuat_chuyen_kho as value
from da_sap_zwm07_vp
union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'Tồn cuối kỳ' as att,
	so_luong_ton_kho_cuoi_ky as value
from da_sap_zwm07_vp
 union
select  
	thang,
	plant,
	material,
	material_description,
	valuation_type,
	gl_account,
	dvt,
	'GT cuối kỳ' as att,
	gia_tri_ton_kho_cuoi_ky as value
from da_sap_zwm07_vp
)
select 
	a.thang,
	a.plant,
	a.material,
	a.material_description,
	a.valuation_type,
	a.gl_account,
	a.dvt,
	a.att,
	a.value::float,
	b.loai,
	b.nhom_gd,
	b.loai_gd_n1,
	b.loai_gd_n2,
	b.loai_gd_n3
from cte as a
left join subpublic.da_dim_zwm06_p1 as b on a.att = b.phan_loai
order by a.thang, a.material, a.att

select * from da_sap_zwm07_vp
--da_dim_zwm06_n1

create table subpublic.da_dim_zwm06_n1
(
movement_type text,
debit_credit_ind text,
special_stock text,
phan_loai text,
value1 text,
code_mvt_n1 text,
loai text,
nhom_gd text,
loai_gd_n1 text,
loai_gd_n2 text,
loai_gd_n3 text
)

drop view da_sap_mb51_v6
create view da_sap_mb51_v6 as
select 
	a.month ,
a.material ,
a.material_description ,
a.plant ,
a.storage_location ,
a.movement_type ,
a.special_stock ,
a.posting_date ,
a.material_document ,
a.material_docitem ,
a.batch ,
a.qty_in_unit_of_entry ,
a.unit_of_entry ,
a.name_1 ,
a.movement_type_text ,
a.asset ,
a.sub_number ,
a.counter ,
a.order_1 ,
a.routing_number_for_operations ,
a.document_header_text ,
a.document_date ,
a.qty_in_opun ,
a.order_price_unit ,
a.order_unit ,
a.qty_in_order_unit ,
a.company_code ,
a.valuation_type ,
a.entry_date ,
a.time_of_entry ,
a.purchase_order ,
a.smart_number ,
a.item ,
a.warehouse_document ,
a.warehouse_number ,
a.ext_amount_in_local_currency ,
a.sales_value ,
a.reason_for_movement ,
a.sales_order_n1 ,
a.sales_order_schedule ,
a.sales_order_item_n1 ,
a.cost_center ,
a.customer ,
a.movement_indicator ,
a.consumption ,
a.receipt_indicator ,
a.supplier ,
a.sales_order ,
a.sales_order_item ,
a.base_unit_of_measure ,
a.quantity ,
a.material_doc_year ,
a.network ,
a.activity ,
a.wbs_element ,
a.reservation ,
a.item_number_of_reservation ,
a.stock_segment ,
a.debit_credit_ind ,
a.user_name ,
a.trans_event_type ,
a.sales_value_inc_vat ,
a.currency ,
a.goods_receipt_issue_slip ,
a.item_automatically_created ,
a.reference ,
a.original_line_item ,
a.multiple_account_assignment,
b.nhom_gd ,
b.loai_gd_n1 ,
b.loai_gd_n2 ,
b.loai_gd_n3 
from da_sap_mb51_vp as a
left join subpublic.da_dim_zwm06_n1 as b on Concat(a.movement_type,a.special_stock,a.debit_credit_ind) = Concat(b.movement_type,b.special_stock,b.debit_credit_ind)
where left(a.material,1) = '7'


select  
	a.month ,
a.material ,
a.material_description ,
a.plant ,
a.storage_location ,
a.movement_type ,
a.special_stock ,
a.posting_date ,
a.material_document ,
a.material_docitem ,
a.batch ,
a.qty_in_unit_of_entry ,
a.unit_of_entry ,
a.name_1 ,
a.movement_type_text ,
a.asset ,
a.sub_number ,
a.counter ,
a.order_1 ,
a.routing_number_for_operations ,
a.document_header_text ,
a.document_date ,
a.qty_in_opun ,
a.order_price_unit ,
a.order_unit ,
a.qty_in_order_unit ,
a.company_code ,
a.valuation_type ,
a.entry_date ,
a.time_of_entry ,
a.purchase_order ,
a.smart_number ,
a.item ,
a.warehouse_document ,
a.warehouse_number ,
a.ext_amount_in_local_currency ,
a.sales_value ,
a.reason_for_movement ,
a.sales_order ,
a.sales_order_schedule ,
a.sales_order_item ,
a.cost_center ,
a.customer ,
a.movement_indicator ,
a.consumption ,
a.receipt_indicator ,
a.supplier ,
a.sales_order1 ,
a.sales_order_item1 ,
a.base_unit_of_measure ,
a.quantity ,
a.material_doc_year ,
a.network ,
a.activity ,
a.wbs_element ,
a.reservation ,
a.item_number_of_reservation ,
a.stock_segment ,
a.debit_credit_ind ,
a.user_name ,
a.trans_event_type ,
a.sales_value_inc_vat ,
a.currency ,
a.goods_receipt_issue_slip ,
a.item_automatically_created ,
a.reference ,
a.original_line_item ,
a.multiple_account_assignment,
a.nhom_gd ,
a.loai_gd_n1 ,
a.loai_gd_n2 ,
a.loai_gd_n3,
b.so_luong_ton_kho_cuoi_ky as ton_kho
from da_sap_mb51_v6 as a
left join subpublic.da_sap_zwm07_p1 as b on a.material = b.material


select * from subpublic.da_sap_zwm07_p1 where so_luong_ton_kho_cuoi_ky = '0'
select * from da_sap_mb51_v6

--da_sap_zwm07_vp tuổi
with cte as 
(
select 
month,
batch,
material, 
'2023-07-27'::date as reporting_date,
MAX(posting_date) as max_date, 
MIN(posting_date) as min_date, 
MAX(posting_date) - MIN(posting_date) as date_ko_ton
from da_sap_mb51_v6
group by month, material,batch
)
select 
a.month as month_MB51,
a.material,
a.batch,
a.reporting_date,
a.max_date,
a.min_date,
CASE WHEN b.so_luong_ton_kho_cuoi_ky = '0' THEN a.date_ko_ton
	ELSE a.reporting_date - a.min_date
	END as tuoi,
b.so_luong_ton_kho_cuoi_ky
from cte as a
left join da_sap_zwm07_vp as b on a.material = b.material and a.month = b.thang
order by a.month, a.material

where b.so_luong_ton_kho_cuoi_ky = '0'

--subpublic.da_sap_zwm06_p1

with cte as 
(
select 
	month,
	material,
	material_description,
	MAX(posting_date) as max_date, 
	MIN(posting_date) as min_date, 
	MAX(posting_date) - MIN(posting_date) as date_ko_ton
from da_sap_mb51_v6
group by month,material, material_description
)
select 
	a.month,
	a.material,
	a.material_description,
	
from cte





select * from subpublic.da_sap_zwm06_p1
where left(material,1) = '7'















