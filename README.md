# uberDataEng-Analytics

Read about GCP and main component
read about big query and looker
mage is open data pipeline tool as airflow
for doing ETL
Fact and dimension table

#for data fetching, we go to nyc.gov/site to get data

data dictionary or data catalog is used to get feild name associate with description what is used for.

Dataset Used
TLC Trip Record Data Yellow and green taxi trip records include fields capturing pick-up and drop-off dates/times, pick-up and drop-off locations, trip distances, itemized fares, rate types, payment types, and driver-reported passenger counts.

Here is the dataset used in the video - https://github.com/darshilparmar/uber-etl-pipeline-data-engineering-project/blob/main/data/uber_data.csv

More info about dataset can be found here:

Website - https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
Data Dictionary - https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf

Data Model
![image](https://github.com/user-attachments/assets/178d66a5-f81e-4542-94a3-97e46c5e8d61)


afte datamodelling using lucid chart.

we need to convert drop off time and pickup time from object to date time using below command:

df['tpep_pickup_datetime'] = pd.to_datetime(df['tpep_pickup_datetime'])
df['tpep_dropoff_datetime'] = pd.to_datetime(df['tpep_dropoff_datetime'])

few lines from jupyter lab while cleaning data 

fact_table = df.merge(passenger_count_dim, left_on='trip_id', right_on='passenger_count_id') \
             .merge(trip_distance_dim, left_on='trip_id', right_on='trip_distance_id') \
             .merge(rate_code_dim, left_on='trip_id', right_on='rate_code_id') \
             .merge(pickup_location_dim, left_on='trip_id', right_on='pickup_location_id') \
             .merge(dropoff_location_dim, left_on='trip_id', right_on='dropoff_location_id')\
             .merge(datetime_dim, left_on='trip_id', right_on='datetime_id') \
             .merge(payment_type_dim, left_on='trip_id', right_on='payment_type_id') \
             [['trip_id','VendorID', 'datetime_id', 'passenger_count_id',
               'trip_distance_id', 'rate_code_id', 'store_and_fwd_flag', 'pickup_location_id', 'dropoff_location_id',
               'payment_type_id', 'fare_amount', 'extra', 'mta_tax', 'tip_amount', 'tolls_amount',
               'improvement_surcharge', 'total_amount']]


After this , we need to login google console and enter id pass
then creating new project and activate resources instances and load csv files and them made public. We also have to get a ip address of machine to access project on browser.

After that SSH in -browser will open where we will update pythen and pip dependencies.
Then we will install pandas and mage.AI from github using command **pip install mage-ai**
After installing it , use command **mage start _projectName_**.

It will give use a port 4 digit  port number, which we have give to the google console so that it give access to access this port on machine.

After writing ip addres / port number, we are able to acces mage ai on browser, ss below,
![image](https://github.com/user-attachments/assets/42bcb037-7719-4f6b-b35f-f520f3161ed5)








