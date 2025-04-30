SELECT
	*
FROM tls201_appln a
JOIN(
	SELECT
    	appln_id,
    	event_id,
        event_auth,
        event_code,
        event_effective_date,
        event_filing_date
	FROM tls231_inpadoc_legal_event
) le ON le.appln_id = a.appln_id
JOIN(
	SELECT
    	event_code,
        event_category_code,
        event_category_title,
        event_descr,
        event_descr_orig
    FROM tls803_legal_event_code
) lec ON lec.event_code = le.event_code
JOIN tls203_appln_abstr ab ON ab.appln_id = a.appln_id
WHERE ab.appln_abstract LIKE '%keywords%';
