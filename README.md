# tf-hackathon
This repo is for the GDG Cloud RTP submission for the Powered by TensorFlow 2.0 Hackathon

# Project Goal
One of our project members has a company which helps municipalities with early flood detection.  This company Greenstream uses Google Cloud Platform (GCP) as the basis of their IoT system.  Greenstream deploys sensors which are solar powered water and precipitation levels.  The readings are similar to the existing USGS sensors.  The USGS sensors seem to be gathered manually and on a monthly basis.

Since Greenstream has a 5 minute sample interval it can help with early flood detectionn.  However, these sensors can not be deployed in every location.  

With that said, enhancing Greenstreams ability to detect early flood situations using machine learning is a worthy goal.  

## primary goal
Use machine learning to predict water levels for locations which do not have an existing sensor.  This can help local municipalaties to predict water levels without an actual sensor.  In effect the project provides the concept of a virtual sensor.

## secondary goals
The GDG is focused on learning Google Cloud with a secondary focus on learning TensorFlow on GCP.  Greenstream uses firebase on GCP but until now did not use BigQuery or TensorFlow.  This project allows the GDG members and Greenstream to develop new skills in the area of GCP and machine learning.

GCP componenets used in this project:

- BigQuery was used to manipulate and merge data
- BigQuery ML was used to get a baseline prediction model
- Dataprep was used to take the Greenstream firebase exports to Google Cloud Storage to wrangle the data and export back to BigQuery.  This was incredibly cool because storage had a large collection of .csv files and nested folders which could be read and proecessed with one Dataprep wrangle script.




# Sensor Data and Location
The area around Virginia Beach, Virginia was chosen as the location.  This site has quite a few USGS sensors and a large number of Greenstream sensors.  In order to "pitch match" the data, the continous 5-minute interval for greenstream sensors were downsampled into a daily high and low sample.  These values correspond to water high and water low with the USGS readings.

Some of the USGS readings are on a two week interval.  Some of the readings are complete where others might only have a high water readings.

Ideally we would like to have additional data sources added.  Below are the goals for features which we thought might be usefull.  Items in normal text are present the 9875 sensor readings.  Items in bold are desirable features but not currently in the input data.

- site id - either USGS or GSVB (Greensteam Virginia Beach)
- site no - an integer which identifies the sensor
- date - date of reading
- tidal high - high water reading (feet)
- tidal low - low water reading (feet)
- precipitation - rain fall (inches) (currently only usgs)
- lat - latititue of sensor
- long - longtitude of sensor
- ALTITUDE
- WIND SPEED
- WIND DIRECTION
- WATER TEMPERATURE
- AIR TEMPERATURE

The area of interest and the two sets of sensor locations are shown in Figure 1.


# Filestem Overview
This is an overview of the git repo filesystem

- src - python source for jupyter notebooks.  All code is in python 3 for tensorflow 2.0
- tsv - this contains the original .tsv files for the USGS sensors
- csv - csv files.  Some are bigquery exports
- misc - BigQuery schema files, Dataprep wrangle scripts and some BigQuery scripts.
- bin - bash and sed scripts used for data wrangling.





