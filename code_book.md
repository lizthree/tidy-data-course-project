# Code Book

## Contents of Code Book

This code book provides the details about the data identifiers, measurements, and overall contents output into `tidy.txt`.

## Identifiers

* `subject` - The ID of the test subject
* `activity_label` - The type of activity performed while measurements were taken

## Measurements

<b>Key:</b>
<b>t</b> represents `time`.
<b>f</b> represents `frequency`.
<b>std</b> represents `standard deviation`.
<b>Mag</b> represents `magnitude`.
<b>Acc</b> represents `acceleration`.

<b>Columns:</b>
* `tBodyAcc-mean-X`
* `tBodyAcc-std-X`
* `tGravityAcc-mean-X`
* `tGravityAcc-std-X`
* `tBodyAccJerk-mean-X`
* `tBodyAccJerk-std-X`
* `tBodyGyro-mean-X`
* `tBodyGyro-std-X`
* `tBodyGyroJerk-mean-X`
* `tBodyGyroJerk-std-X`
* `tBodyAccMag-mean`
* `tGravityAccMag-std`
* `tBodyGyroMag-mean`
* `tBodyGyroJerkMag-std`
* `fBodyAcc-mean-Z`
* `fBodyAcc-std-Z`
* `fBodyAcc-meanFreq-Z`
* `fBodyAccJerk-mean-Z`
* `fBodyAccJerk-std-Z`
* `fBodyAccJerk-meanFreq-Z`
* `fBodyGyro-mean-Z`
* `fBodyGyro-std-Z`
* `fBodyGyro-meanFreq-Z`
* `fBodyAccMag-meanFreq`
* `fBodyBodyAccJerkMag-meanFreq`
* `fBodyBodyGyroMag-meanFreq`
* `fBodyBodyGyroJerkMag-meanFreq`
* `tBodyAcc-mean-Y`
* `tBodyAcc-std-Y`
* `tGravityAcc-mean-Y`
* `tGravityAcc-std-Y`
* `tBodyAccJerk-mean-Y`
* `tBodyAccJerk-std-Y`
* `tBodyGyro-mean-Y`
* `tBodyGyro-std-Y`
* `tBodyGyroJerk-mean-Y`
* `tBodyGyroJerk-std-Y`
* `tBodyAccMag-std`
* `tBodyAccJerkMag-mean`
* `tBodyGyroMag-std`
* `fBodyAcc-mean-X`
* `fBodyAcc-std-X`
* `fBodyAcc-meanFreq-X`
* `fBodyAccJerk-mean-X`
* `fBodyAccJerk-std-X`
* `fBodyAccJerk-meanFreq-X`
* `fBodyGyro-mean-X`
* `fBodyGyro-std-X`
* `fBodyGyro-meanFreq-X`
* `fBodyAccMag-mean`
* `fBodyBodyAccJerkMag-mean`
* `fBodyBodyGyroMag-mean`
* `fBodyBodyGyroJerkMag-mean`
* `tBodyAcc-mean-Z`
* `tBodyAcc-std-Z`
* `tGravityAcc-mean-Z`
* `tGravityAcc-std-Z`
* `tBodyAccJerk-mean-Z`
* `tBodyAccJerk-std-Z`
* `tBodyGyro-mean-Z`
* `tBodyGyro-std-Z`
* `tBodyGyroJerk-mean-Z`
* `tBodyGyroJerk-std-Z`
* `tGravityAccMag-mean`
* `tBodyAccJerkMag-std`
* `tBodyGyroJerkMag-mean`
* `fBodyAcc-mean-Y`
* `fBodyAcc-std-Y`
* `fBodyAcc-meanFreq-Y`
* `fBodyAccJerk-mean-Y`
* `fBodyAccJerk-std-Y`
* `fBodyAccJerk-meanFreq-Y`
* `fBodyGyro-mean-Y`
* `fBodyGyro-std-Y`
* `fBodyGyro-meanFreq-Y`
* `fBodyAccMag-std`
* `fBodyBodyAccJerkMag-std`
* `fBodyBodyGyroMag-std`
* `fBodyBodyGyroJerkMag-std` 

## Activity Labels (activity_label)

* `WALKING_UPSTAIRS`: subject walking up a staircase while measurements were taken
* `WALKING_DOWNSTAIRS`: subject walking down a staircase while measurements were taken
* `WALKING`: subject walking while measurements were taken
* `SITTING`: subject sitting while measurements were taken
* `STANDING`: subject standing while measurements were taken
* `LAYING`: subject laying down while measurements were taken

## Contents of tidy.txt

180 rows of rolled up data summarizing all 30 subjects (`subject`) with the mean of each measurement for every activity (`activity_label`).
