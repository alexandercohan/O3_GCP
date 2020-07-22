CREATE OR REPLACE TABLE EPAO3.o3monthlymax AS (
SELECT 
  MAX(os.first_max_value) as O3,
  os.state_name as state,
  os.county_name as county,
  DATE_TRUNC(os.date_local, MONTH) as month,
  ANY_VALUE(cb.county_geom) as geom
FROM 
  `bigquery-public-data.epa_historical_air_quality.o3_daily_summary` os
LEFT JOIN
  `bigquery-public-data.geo_us_boundaries.counties` cb on 
  CONCAT(os.state_code, os.county_code) = cb.county_fips_code
WHERE
  os.date_local >= DATE('2016-01-01')
GROUP BY
  2,3,4
  )


