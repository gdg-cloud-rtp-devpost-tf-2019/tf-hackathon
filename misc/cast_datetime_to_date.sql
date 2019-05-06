SELECT usgs, site_no, 
cast (date as DATE) as date_field, 
tidal_high, tidal_low, precipitation_inches, lat, long 
FROM `tf-hackathon-236400.usgs_v3.gsvb_all_data`

