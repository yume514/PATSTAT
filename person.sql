SELECT 
  t206.person_id, 
  t206.psn_name, 
  person_address, 
  person_ctry_code, 
  applt_seq_nr, 
  invt_seq_nr 
FROM tls206_person AS t206
JOIN tls207_pers_appln pa ON pa.person_id = t206.person_id
WHERE t206.psn_name LIKE '%docomo%'
