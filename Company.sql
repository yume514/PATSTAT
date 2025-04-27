SELECT 
    a.appln_id,
    a.appln_auth,
    a.appln_filing_date,
    a.appln_filing_year,
    a.docdb_family_id,
    a.inpadoc_family_id,
    a.docdb_family_size
FROM tls201_appln a
JOIN tls202_appln_title t
    ON a.appln_id = t.appln_id
JOIN tls203_appln_abstr ab
    ON a.appln_id = ab.appln_id
JOIN tls207_pers_appln t207
    ON a.appln_id = t207.appln_id
JOIN (
    SELECT 
        person_id, 
        psn_name, 
        person_address, 
        person_ctry_code
    FROM tls206_person
    WHERE psn_name LIKE '%docomo%'
) p
    ON p.person_id = t207.person_id
;
