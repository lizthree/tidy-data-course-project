## Getting and Cleaning Data - Week 4
library(dplyr)

# file handling
file <- "uci-dataset.zip"

# download
if (!file.exists(file)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, file, method = "curl")
}
# unzip
if (!file.exists("UCI HAR Dataset")){
  unzip(file)
}

##          Requirement 2        ##
## Extracts only the measurements 
## on the mean and std for each

# define tables for features and
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
# filter features by mean and std
features_filtered <- grepl(".*mean.*|.*std.*",features[,2])

# activity labels (class(features[,2]) "factor")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

# define tables of test and training data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")


##        Requirement 1 & 4      ##
## Merges the training and the test
## sets to create one data set.
## Appropriately labels the data set 
## with descriptive variable names.

# merge by filtered data only
# add column names to x data
x <- rbind(features[features_filtered,2], x_test[,features_filtered], x_train[,features_filtered])
colnames(x) = x[1, ] # the first row will be the header
x = x[-1,]           # remove first row holding merged headers

# clean headers: remove '()'
names(x) <- gsub("[(][)]","", names(x))

# combine y data and store in new column
y <- rbind(y_test, y_train)
colnames(y) <- c("activity")
data <- cbind(x, y)

# combine subject data and store in new column
subject <- rbind(subject_test, subject_train)
colnames(subject) <- c("subject")
data <- cbind(data, subject)

##          Requirement 3        ##
## Uses descriptive activity names to 
## name the activities in the data set

# creates new column with the activity description (activity_desc)
data <- mutate(data, activity_desc = activity_labels[data$activity,2])

##          Requirement 5        ##
## From the data set in step 4, 
## creates a second, independent 
## tidy data set with the average 
## of each variable for each activity 
## and each subject.