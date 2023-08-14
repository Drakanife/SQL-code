SELECT makhachhang, khachhang_id, congtrinh_id, diengiai FROM public.inv_transactions
where makhachhang is not null or khachhang_id is not null or congtrinh_id is not null 


select makhachhang, khachhang_id, congtrinh_id, count(*) FROM public.inv_transactions
where makhachhang is not null or khachhang_id is not null or congtrinh_id is not null 
group by 1,2,3



SELECT distinct 
		c.name as khach_hang, 
		b.name as cong_trinh,
		a.diengiai 
FROM public.inv_transactions as a
left join congtrinh as b on a.congtrinh_id = b.id
left join res_partner as c on a.khachhang_id = c.id
where a.makhachhang is not null or a.khachhang_id is not null or a.congtrinh_id is not null 

select * from public.inv_transactions
where makhachhang is not null or khachhang_id is not null or congtrinh_id is not null
order by id