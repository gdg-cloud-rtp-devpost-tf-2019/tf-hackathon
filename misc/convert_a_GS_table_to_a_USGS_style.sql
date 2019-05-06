 /* water level = offset - distance 
    Might need to pick max and min, but not sure since data is not correct
    divide diff by 30.48 to convert cm to feet.
 */
     SELECT
      "GS" AS usgs,
      336700001 AS site_no,
      DATE(timestamp) AS date,
      (MAX(offset) - MAX(distance))/ 30.48 AS tidal_high,
      (MIN(offset) - MIN(distance))/ 30.48 AS tidal_low,
      0.0 AS precipitation_inches,
      AVG(lat) AS lat,
      AVG(long) AS long
    FROM
      `tf-hackathon-236400.greenstream.GSVBAP000001`
    GROUP BY
      date


