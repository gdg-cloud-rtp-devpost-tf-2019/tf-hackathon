#standardSQL
SELECT 
  predicted_tidal_low
FROM
  ML.PREDICT(MODEL  `tf-hackathon-236400.usgs_with_latlong.water_level_model`,
      (
          SELECT tidal_high,
               tidal_low,
            #       precipitation_inches,
                   lat,
                       long
                      FROM `tf-hackathon-236400.usgs_with_latlong.SN0204288539_v2` 
                      WHERE
                          tidal_high = 1.2))


