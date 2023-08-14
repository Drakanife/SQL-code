	   
SELECT *,
    SUBSTRING(
        line_description,
        'hóa đơn số' || '[[:space:]]+' || '[0-9]+'
    ) AS invoice_number
FROM
    da_ar006;
	
	
	
SELECT *,
    (REGEXP_MATCHES(line_description, 'hóa đơn số ([0-9]+)'))[1] AS invoice_number
FROM
    da_ar006;

