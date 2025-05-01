SELECT
	a.appln_id,
    a.docdb_family_id,
    a.inpadoc_family_id,
    a.docdb_family_size,
    --pp.pat_publn_id は除外
    c.cited_npl_publn_id,
    c.npl_citn_seq_nr,
    npl.npl_publn_id,
    npl.npl_biblio,
    npl.npl_title1,
    npl.npl_title2,
    npl.npl_author,
    npl.npl_abstract_nr,
    npl.npl_publn_date,
    npl.npl_publn_end_date,
    npl.npl_doi
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
        cited_npl_publn_id,
        npl_citn_seq_nr
    FROM tls212_citation
) c ON c.pat_publn_id = pp.pat_publn_id
JOIN(
	SELECT
    	npl_publn_id,
    	npl_biblio,
        npl_title1,
        npl_title2,
        npl_author,
        npl_abstract_nr,
        npl_publn_date,
        npl_publn_end_date,
        npl_doi
FROM tls214_npl_publn
) npl ON npl.npl_publn_id = c.cited_npl_publn_id
JOIN tls203_appln_abstr ab ON ab.appln_id = a.appln_id
WHERE ab.appln_abstract LIKE '%SLAM%';
