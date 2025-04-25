SELECT
  	 a.appln_id
	, appln_auth
	, appln_filing_date
	, appln_filing_year
	, docdb_family_id
	, inpadoc_family_id
	, docdb_family_size
FROM tls201_appln a
JOIN(
	SELECT
    	t.appln_id
		,appln_title
    	, appln_title_lg
FROM tls202_appln_title
) t
ON a.appln_id = t.appln_id
JOIN(
	SELECT
    	ab.appln_id
		,appln_abstract
    	, appln_abstract_lg
FROM tls203_appln_abstr
) ab
ON a.appln_id = ab.appln_id
JOIN 	(
SELECT 
	t207.person_id, 
    t207.appln_id
from tls207_pers_appln
)  t207
ON a.appln_id = t207.appln_id
JOIN 	(
SELECT 
  	person_id, 
    psn_name, 
    person_address, 
    person_ctry_code 
from tls206_person 
where t206.psn_name like 'docomo%';
)  t206
ON t207.person_id = t206.person_id
