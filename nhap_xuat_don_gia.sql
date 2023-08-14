
select * from da_sap_zwm07_xuat_v1

drop view da_sap_zwm07_xuat_v1
create view da_sap_zwm07_xuat_v1 as
select 
	thang::date,
	material,
	valuation_type,
	xuat_san_xuat::float + xuat_ban_hang::float +  xuat_tra_hang::float + xuat_posto::float + xuat_khac::float as so_luong,
	gia_tri_xuat_san_xuat::float + giatri_xuat_ban_hang::float + gia_tri_xuat_tra_hang::float + gia_tri_xuat_posto::float + gia_tri_xuat_khac::float as gia_tri,
	CASE WHEN xuat_san_xuat::float + xuat_ban_hang::float +  xuat_tra_hang::float + xuat_posto::float + xuat_khac::float = 0 then 0 else
	(gia_tri_xuat_san_xuat::float + giatri_xuat_ban_hang::float + gia_tri_xuat_tra_hang::float + gia_tri_xuat_posto::float + gia_tri_xuat_khac::float )/(xuat_san_xuat::float + xuat_ban_hang::float +  xuat_tra_hang::float + xuat_posto::float + xuat_khac::float) 
	END as don_gia
from da_sap_zwm07_vp


drop view da_sap_zwm07_nhap_v1
create view da_sap_zwm07_nhap_v1 as
select 
	thang::date,
	material,
	valuation_type,
	nhap_san_xuat::float + nhap_mua_hang::float +  nhap_tra_hang::float + nhap_posto::float + nhap_khac::float as so_luong,
	gia_tri_nhap_san_xuat::float + gia_tri_nhap_mua_hang::float + gia_tri_nhap_tra_hang::float + gia_tri_nhap_posto::float + gia_tri_nhap_khac::float as gia_tri,
	CASE WHEN nhap_san_xuat::float + nhap_mua_hang::float +  nhap_tra_hang::float + nhap_posto::float + nhap_khac::float  = 0 then 0 else
	(gia_tri_nhap_san_xuat::float + gia_tri_nhap_mua_hang::float + gia_tri_nhap_tra_hang::float + gia_tri_nhap_posto::float + gia_tri_nhap_khac::float )/(nhap_san_xuat::float+ nhap_mua_hang::float +  nhap_tra_hang::float + nhap_posto::float + nhap_khac::float ) 
	END as don_gia

from da_sap_zwm07_vp


drop view da_sap_zwm07_vp 
select * from da_sap_zwm07_vp

CREATE view da_sap_zwm07_vp as
select 
	thang,
plant::TEXT,
material::TEXT,
material_description::TEXT,
valuation_type::TEXT,
gl_account::TEXT,
dvt::TEXT,
so_luong_ton_kho_dau_ky::TEXT,
gia_tri_ton_kho_dau_ky::TEXT,
nhap_mua_hang::TEXT,
gia_tri_nhap_mua_hang::TEXT,
nhap_san_xuat::TEXT,
gia_tri_nhap_san_xuat::TEXT,
nhap_tra_hang::TEXT,
gia_tri_nhap_tra_hang::TEXT,
nhap_posto::TEXT,
gia_tri_nhap_posto::TEXT,
nhap_khac::TEXT,
gia_tri_nhap_khac::TEXT,
nhap_chuyen_ma::TEXT,
gia_tri_nhap_chuyen_ma::TEXT,
nhap_chuyen_batch::TEXT,
gia_tri_nhap_chuyen_batch::TEXT,
nhap_chuyen_kho::TEXT,
gia_tri_nhap_chuyen_kho::TEXT,
xuat_san_xuat::TEXT,
gia_tri_xuat_san_xuat::TEXT,
xuat_ban_hang::TEXT,
giatri_xuat_ban_hang::TEXT,
xuat_tra_hang::TEXT,
gia_tri_xuat_tra_hang::TEXT,
xuat_posto::TEXT,
gia_tri_xuat_posto::TEXT,
xuat_khac::TEXT,
gia_tri_xuat_khac::TEXT,
xuat_chuyen_ma::TEXT,
gia_tri_xuat_chuyen_ma::TEXT,
xuat_chuyen_batch::TEXT,
gia_tri_xuat_chuyen_batch::TEXT,
xuat_chuyen_kho::TEXT,
gia_tri_xuat_chuyen_kho::TEXT,
so_luong_ton_kho_cuoi_ky::TEXT,
gia_tri_ton_kho_cuoi_ky::TEXT
from da_sap_zwm07_n1
where left(material,1) = '7'
union

Select 
 '2023-07-01' as thang,
plant,
material,
material_description,
valuation_type,
gl_account,
dvt,
so_luong_ton_kho_dau_ky,
gia_tri_ton_kho_dau_ky,
nhap_mua_hang,
gia_tri_nhap_mua_hang,
nhap_san_xuat,
gia_tri_nhap_san_xuat,
nhap_tra_hang,
gia_tri_nhap_tra_hang,
nhap_posto,
gia_tri_nhap_posto,
nhap_khac,
gia_tri_nhap_khac,
nhap_chuyen_ma,
gia_tri_nhap_chuyen_ma,
nhap_chuyen_batch,
gia_tri_nhap_chuyen_batch,
nhap_chuyen_kho,
gia_tri_nhap_chuyen_kho,
xuat_san_xuat,
gia_tri_xuat_san_xuat,
xuat_ban_hang,
giatri_xuat_ban_hang,
xuat_tra_hang,
gia_tri_xuat_tra_hang,
xuat_posto,
gia_tri_xuat_posto,
xuat_khac,
gia_tri_xuat_khac,
xuat_chuyen_ma,
gia_tri_xuat_chuyen_ma,
xuat_chuyen_batch,
gia_tri_xuat_chuyen_batch,
xuat_chuyen_kho,
gia_tri_xuat_chuyen_kho,
so_luong_ton_kho_cuoi_ky,
gia_tri_ton_kho_cuoi_ky
From subpublic.da_sap_zwm07_p1
where left(material,1) = '7'



select * from subpublic.da_sap_zwm07_p1
where thang like '__/07/2023'




select * from subpublic.da_dim_zwm06_p1

drop view da_sap_mb51_vp
create view  da_sap_mb51_vp as 
with cte as 
(
 SELECT (da_sap_mb51_n1.month)::DATE AS month,
    (da_sap_mb51_n1.material)::text AS material,
    (da_sap_mb51_n1.material_description)::text AS material_description,
    (da_sap_mb51_n1.plant)::text AS plant,
    (da_sap_mb51_n1.storage_location)::text AS storage_location,
    (da_sap_mb51_n1.movement_type)::text AS movement_type,
    (da_sap_mb51_n1.special_stock)::text AS special_stock,
    (da_sap_mb51_n1.posting_date)::date AS posting_date,
    (da_sap_mb51_n1.material_document)::text AS material_document,
    (da_sap_mb51_n1.material_docitem)::text AS material_docitem,
    (da_sap_mb51_n1.batch)::text AS batch,
    (da_sap_mb51_n1.qty_in_unit_of_entry)::text AS qty_in_unit_of_entry,
    (da_sap_mb51_n1.unit_of_entry)::text AS unit_of_entry,
    (da_sap_mb51_n1.name_1)::text AS name_1,
    (da_sap_mb51_n1.movement_type_text)::text AS movement_type_text,
    (da_sap_mb51_n1.asset)::text AS asset,
    (da_sap_mb51_n1.sub_number)::text AS sub_number,
    (da_sap_mb51_n1.counter)::text AS counter,
    (da_sap_mb51_n1.order_1)::text AS order_1,
    (da_sap_mb51_n1.routing_number_for_operations)::text AS routing_number_for_operations,
    (da_sap_mb51_n1.document_header_text)::text AS document_header_text,
    (da_sap_mb51_n1.document_date)::text AS document_date,
    (da_sap_mb51_n1.qty_in_opun)::text AS qty_in_opun,
    (da_sap_mb51_n1.order_price_unit)::text AS order_price_unit,
    (da_sap_mb51_n1.order_unit)::text AS order_unit,
    (da_sap_mb51_n1.qty_in_order_unit)::text AS qty_in_order_unit,
    (da_sap_mb51_n1.company_code)::text AS company_code,
    (da_sap_mb51_n1.valuation_type)::text AS valuation_type,
    (da_sap_mb51_n1.entry_date)::text AS entry_date,
    (da_sap_mb51_n1.time_of_entry)::text AS time_of_entry,
    (da_sap_mb51_n1.purchase_order)::text AS purchase_order,
    (da_sap_mb51_n1.smart_number)::text AS smart_number,
    (da_sap_mb51_n1.item)::text AS item,
    (da_sap_mb51_n1.warehouse_document)::text AS warehouse_document,
    (da_sap_mb51_n1.warehouse_number)::text AS warehouse_number,
    (da_sap_mb51_n1.ext_amount_in_local_currency)::text AS ext_amount_in_local_currency,
    (da_sap_mb51_n1.sales_value)::text AS sales_value,
    (da_sap_mb51_n1.reason_for_movement)::text AS reason_for_movement,
    (da_sap_mb51_n1.sales_order_n1)::text AS sales_order_n1,
    (da_sap_mb51_n1.sales_order_schedule)::text AS sales_order_schedule,
    (da_sap_mb51_n1.sales_order_item_n1)::text AS sales_order_item_n1,
    (da_sap_mb51_n1.cost_center)::text AS cost_center,
    (da_sap_mb51_n1.customer)::text AS customer,
    (da_sap_mb51_n1.movement_indicator)::text AS movement_indicator,
    (da_sap_mb51_n1.consumption)::text AS consumption,
    (da_sap_mb51_n1.receipt_indicator)::text AS receipt_indicator,
    (da_sap_mb51_n1.supplier)::text AS supplier,
    (da_sap_mb51_n1.sales_order)::text AS sales_order,
    (da_sap_mb51_n1.sales_order_item)::text AS sales_order_item,
    (da_sap_mb51_n1.base_unit_of_measure)::text AS base_unit_of_measure,
    (da_sap_mb51_n1.quantity)::text AS quantity,
    (da_sap_mb51_n1.material_doc_year)::text AS material_doc_year,
    (da_sap_mb51_n1.network)::text AS network,
    (da_sap_mb51_n1.activity)::text AS activity,
    (da_sap_mb51_n1.wbs_element)::text AS wbs_element,
    (da_sap_mb51_n1.reservation)::text AS reservation,
    (da_sap_mb51_n1.item_number_of_reservation)::text AS item_number_of_reservation,
    (da_sap_mb51_n1.stock_segment)::text AS stock_segment,
    (da_sap_mb51_n1.debit_credit_ind)::text AS debit_credit_ind,
    (da_sap_mb51_n1.user_name)::text AS user_name,
    (da_sap_mb51_n1.trans_event_type)::text AS trans_event_type,
    (da_sap_mb51_n1.sales_value_inc_vat)::text AS sales_value_inc_vat,
    (da_sap_mb51_n1.currency)::text AS currency,
    (da_sap_mb51_n1.goods_receipt_issue_slip)::text AS goods_receipt_issue_slip,
    (da_sap_mb51_n1.item_automatically_created)::text AS item_automatically_created,
    (da_sap_mb51_n1.reference)::text AS reference,
    (da_sap_mb51_n1.original_line_item)::text AS original_line_item,
    (da_sap_mb51_n1.multiple_account_assignment)::text AS multiple_account_assignment
   FROM da_sap_mb51_n1
UNION
   
   SELECT 
    '2023-07-01'::date AS month_date,
    material,
    material_description,
    plant,
    storage_location,
    movement_type,
    special_stock,
    TO_DATE(posting_date, 'YYYY-MM-DD') as posting_date,
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
    sales_order AS sales_order_n1,
    sales_order_schedule,
    sales_order_item AS sales_order_item_n1,
    cost_center,
    customer,
    movement_indicator,
    consumption,
    receipt_indicator,
    supplier,
    sales_order1 AS sales_order,
    sales_order_item1 AS sales_order_item,
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
FROM subpublic.da_sap_mb51_p1	
	
)
select * from cte


drop view subpublic.da_sap_mb51_p1v
create view subpublic.da_sap_mb51_p1v as
 SELECT 
    '2023-07-01'::date AS month_date,
    material,
    material_description,
    plant,
    storage_location,
    movement_type,
    special_stock,
    TO_DATE(posting_date, 'yyyy/mm/dd') as posting_date,
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
    sales_order AS sales_order_n1,
    sales_order_schedule,
    sales_order_item AS sales_order_item_n1,
    cost_center,
    customer,
    movement_indicator,
    consumption,
    receipt_indicator,
    supplier,
    sales_order1 AS sales_order,
    sales_order_item1 AS sales_order_item,
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
FROM subpublic.da_sap_mb51_p1





