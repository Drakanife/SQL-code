create view da_sap_zwm07_vnp as 
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

--
create view da_sap_mb51_vnp as
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

--
create view da_sap_zwm06_vnp as
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