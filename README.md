# tf-hackathon
This repo is for the GDG Cloud RTP submission for the Powered by TensorFlow 2.0 Hackathon


# Project Goal
One of our project members has a company which helps municipalities with early flood detection.  This company [Greenstream](http://greenstream.maxxpotential.org/) uses Google Cloud Platform (GCP) as the basis of their IoT system.  Greenstream deploys sensors which are solar powered water level meters.  The readings are similar to the existing USGS sensors.  Where as the GS sensors report data every six minutes, the USGS sensors seem to report on a daily basis.  This is implied based upon the public data.  Perhaps its more often, but I'm going based upon the available data reports.  

Since Greenstream has a 6 minute sample interval it can help with early flood detectionn.  However, these sensors can not be deployed in every location.  

With that said, enhancing Greenstreams ability to detect early flood situations using machine learning is a worthy goal.  

## primary goal
Use machine learning to predict water levels for locations which do not have an existing sensor.  This can help local municipalaties to predict water levels without an actual sensor.  In effect the project provides the concept of a virtual sensor.

## secondary goals
The GDG is focused on learning Google Cloud with a secondary focus on learning TensorFlow on GCP.  Greenstream uses firebase on GCP but does not use BigQuery or TensorFlow.  This project allows the GDG members and Greenstream to develop new skills in the area of GCP, big data and machine learning.

GCP componenets used in this project:

- BigQuery was used to manipulate and merge data
- BigQuery ML was used to get a baseline prediction model
- Dataprep was used to take the Greenstream firebase exports to Google Cloud Storage to wrangle the data and export back to BigQuery.  This was incredibly cool because storage had a large collection of .csv files and nested folders which could be read and proecessed with one Dataprep wrangle script.


# Overview of data gathering done on GCP

Greenstreams data from firebase was exported from firebase to google cloud storage.  This created a directory structure where each sensor was a folder and each day was a seperate file.  Google dataprep was pointed at the base of this directory structure in google cloud storage.  A wrangle script was written to "pitch match" the available data from USGS.  USGS has sensor readings on a daily basis and reports three readings, water level high, water level low and preciptation level.  The units for water level are in feet and the units for preciptation are in inches.

Greenstream has a distance and offset reading in centimeters.  The wrangle script used the two values and conversion factor for cm to feet to convert into a water level high and water level low using the same standard.

Regarding the USGS data.  Originally the data was downloaded as tab seperated value files with a bunch of commentary.  There is a script testy-convert-tsv-to-csv.ipynb which was an attempt to read the tsv files as is.  It did not work.  Not sure if its a bug in the read csv api or not but it failed to parse the .tsv file using '\t' separator.  So, bash and sed was used to process the .tsv files to .csv files.  The individual .csv files were imported into bigquery where they were combined into one big file via a series of steps.  All of the SQL queries used to this are stored in the `misc` folder.  For example, lat and long were added to the files for each sensor. 

# Sensor Data and Location
The area around Virginia Beach, Virginia was chosen as the location.  This site has quite a few USGS sensors and a large number of Greenstream sensors.  In order to "pitch match" the data, the continous 5-minute interval for greenstream sensors were downsampled into a daily high and low sample. (see above)  These values correspond to water high and water low with the USGS readings.

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
- **ALTITUDE**
- **WIND SPEED**
- **WIND DIRECTION**
- **WATER TEMPERATURE**
- **AIR TEMPERATURE**

The area of interest and the two sets of sensor locations are shown in Figure 1.  Note this image was taken from plot-station.ipynb script.


![USGS GSVB Sensors Picture](/pics/usgs-gsvb-locations.png?raw=true "Figure 1 - USGS GSVB Sensor Locations")

A USGS station near RTP is shown in Figures 2,3, and 4

![USGS Sensor Picture](/pics/a_usgs_site_no1.jpeg?raw=true "Figure 2 - USGS box one")
![USGS Sensor Picture](/pics/a_usgs_site_no2.jpeg?raw=true "Figure 3 - USGS box two")
![USGS Sensor Picture](/pics/a_usgs_site_no3.jpeg?raw=true "Figure 4 - USGS box two closeup")

A greenstream station is shown in Figures 5

![GSVB Sensor Picture](/pics/gs_sensor.jpeg?raw=true "Figure 5 - Greenstream sensor")


# Filestem Overview
This is an overview of the git repo filesystem

- src - python source for jupyter notebooks.  All code is in python 3 for tensorflow 2.0
- tsv - this contains the original .tsv files for the USGS sensors
- csv - csv files.  Some are bigquery exports
- misc - BigQuery schema files, Dataprep wrangle scripts and some BigQuery scripts.
- bin - bash and sed scripts used for data wrangling.



# Usage
Given the model, a lat, long and precipitation for the day, the model can predict was the high water level will be.  The prediction given the model can be off by as much as a half of a foot so its not very precise.  However, given additional time to include more data this model could be much better.

# Appendix
Because it was an enjoyable part of the project, here are some pictures of the greenstream data in buckets and the dataprep workflow.

![GSVB GCP Storage root Picture](/pics/gs-buckets.png?raw=true "Figure 6 - GSVB GCP Storage root Picture")
![GSVB GCP Storage one sensor folder Picture](/pics/gs-one-sensor.png?raw=true "Figure 6 - GSVB GCP Storage one sensor folder Picture")
![GSVB GCP dataprep Picture 1](/pics/dataprep-screenshot-01.png?raw=true "Figure 7 - GSVB GCP Dataprep Picture 1")
![GSVB GCP dataprep Picture 2](/pics/dataprep-screenshot-02.png?raw=true "Figure 8 - GSVB GCP Dataprep Picture 2")


A video of the project is [here.](https://youtu.be/OXKUhyBzzu8) 
