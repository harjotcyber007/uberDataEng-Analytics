SELECT VendorID, SUM(fare_amount) FROM `uber-data-analysis-demo-rohan.uber_data_analysis_ds.fact_table`
GROUP BY VendorID;

SELECT payment_type_name, AVG(ftable.tip_amount) AS AverageTipAmount FROM `uber-data-analysis-demo-rohan.uber_data_analysis_ds.fact_table` ftable
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.payment_type_dim` ptable
ON ftable.payment_type_id= ptable.payment_type
GROUP BY payment_type_name;

CREATE OR REPLACE TABLE `uber-data-analysis-demo-rohan.uber_data_analysis_ds.tbl_analytics` AS (
SELECT f.VendorID, dt.tpep_pickup_datetime, dt.tpep_dropoff_datetime, ps.passenger_count, td.trip_distance, rc.rate_code_name, pl.pickup_latitude, pl.pickup_longitude, dp.dropoff_latitude, dp.dropoff_longitude, pt.payment_type_name, f.fare_amount, f.extra, f.mta_tax, f.tip_amount, f.tolls_amount, f.improvement_surcharge, f.total_amount FROM
`uber-data-analysis-demo-rohan.uber_data_analysis_ds.fact_table` f
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.datatime_dim` dt ON f.datetime_id= dt.datetime_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.dropoff_location_dim` dp ON f.dropoff_location_id= dp.dropoff_location_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.passenger_count_dim` ps ON f.passenger_count_id= ps.passenger_count_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.payment_type_dim` pt ON f.payment_type_id= pt.payment_type_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.pickup_location_dim` pl ON f.pickup_location_id= pl.pickup_location_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.rate_code_dim` rc ON f.rate_code_id= rc.rate_code_id
JOIN `uber-data-analysis-demo-rohan.uber_data_analysis_ds.trip_distance_dim` td ON f.trip_distance_id= td.trip_distance_id
);



