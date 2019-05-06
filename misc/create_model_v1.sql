#standardSQL
CREATE MODEL `tf-hackathon-236400.usgs_with_latlong.water_level_model`
OPTIONS
  (model_type='linear_reg',
        input_label_cols=['tidal_low']) AS
    SELECT tidal_high,
           tidal_low,
        #       precipitation_inches,
               lat,
                   long
                FROM `tf-hackathon-236400.usgs_with_latlong.SN0204288539_v2` 
                WHERE
                      tidal_low is not null


