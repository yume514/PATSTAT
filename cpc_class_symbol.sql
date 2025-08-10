SELECT DISTINCT 
	a.appln_id,
    appln_title,
    appln_title_lg,
    appln_abstract,
    appln_abstract_lg,
    a.appln_auth,
    a.appln_filing_date,
    a.appln_filing_year,
    a.docdb_family_id,
    a.inpadoc_family_id,
    a.docdb_family_size,
	cpc.cpc_class_symbol
FROM tls201_appln a
JOIN tls202_appln_title t ON a.appln_id = t.appln_id
JOIN tls203_appln_abstr ab ON a.appln_id = ab.appln_id
JOIN tls224_appln_cpc cpc ON a.appln_id = cpc.appln_id
WHERE REPLACE(cpc.cpc_class_symbol, ' ', '') LIKE 'G01C21/20%'; -- CPCコードに一致
