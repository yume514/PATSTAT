SELECT
	*
FROM(
	SELECT
    	appln_id,
        docdb_family_id,
        inpadoc_family_id,
        docdb_family_size
	FROM	tls201_appln
)	a
JOIN(
	SELECT
    	appln_id,
        pat_publn_id
FROM tls211_pat_publn        
) pp ON pp.appln_id = a.appln_id
JOIN(
	SELECT
    	pat_publn_id,
        cited_appln_id,
        pat_citn_seq_nr
    FROM tls212_citation
) c ON c.pat_publn_id = pp.pat_publn_id
JOIN tls203_appln_abstr ab ON ab.appln_id = a.appln_id
WHERE ab.appln_abstract LIKE '%SLAM%';
