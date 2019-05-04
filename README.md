### Getting and Cleaning Data Course Project

<a href="https://github.com/lizthree/tidy-data-course-project">Link to Github Repo</a>

## Purpose

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. <b> Details of this document has been taken from </b> <a href="https://www.coursera.org/specializations/jhu-data-science">Getting and Cleaning Data Course. </a>

## Data

Raw data collected from the same accelerometers in Samsung Galaxy S smartphone. 

Description on how the raw data was obtained is available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Requirements met in assignment

Created one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Contents of run_analysis.R

<b>Libraries:</b>
* dplyr
* reshape2

<b>Flow:</b>
* Download and unzip data
* Read all data into tables
* rbind column names
* Filter measurements by mean, std
* cbind all data
* Clean up measurement column names (remove '()')
* Mutate new column converting activity id to description
* Rearrange dataset to have subject and activity_label next in front
* Melt all data by subject and activity_label
* dcast all melted data to take mean of all subjects + activity_labels
* Wrtie output to tidy.txt

