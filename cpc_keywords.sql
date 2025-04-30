SELECT
	a.appln_id,
	cpc.cpc_class_symbol
FROM
	tls201_appln a
JOIN tls224_appln_cpc cpc ON cpc.appln_id = a.appln_id
JOIN tls203_appln_abstr ab ON ab.appln_id = a.appln_id
WHERE ab.appln_abstract LIKE '%key-word%';
