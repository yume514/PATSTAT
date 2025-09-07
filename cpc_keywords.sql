SELECT
	a.appln_id,
	cpc.cpc_class_symbol
FROM
	tls201_appln a
JOIN tls224_appln_cpc cpc ON cpc.appln_id = a.appln_id
JOIN tls203_appln_abstr ab ON ab.appln_id = a.appln_id
WHERE ab.appln_abstract LIKE '%keywords%';


-- キーワード抽出した特許の分類記号ごとの件数
SELECT
    cpc.cpc_class_symbol,
    COUNT(DISTINCT a.appln_id) AS appln_count
FROM
    tls201_appln a
JOIN tls224_appln_cpc cpc 
    ON cpc.appln_id = a.appln_id
JOIN tls203_appln_abstr ab 
    ON ab.appln_id = a.appln_id
WHERE
    LOWER(ab.appln_abstract) LIKE '%keywords%'
GROUP BY
    cpc.cpc_class_symbol
ORDER BY
    appln_count DESC;
