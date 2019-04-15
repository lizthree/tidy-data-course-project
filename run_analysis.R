## Getting and Cleaning Data - Week 4
library(dplyr)
library(reshape2)

# file handling
# create data folder and download
if (!file.exists("./data")) {
  dir.create("./data")
}
file <- file.path("./data", "uci-dataset.zip")
data_dir <- file.path("./data" , "UCI HAR Dataset")

if (!file.exists(file)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, file, method = "curl")
}

# unzip
if (!file.exists(data_dir)){
  unzip(file, exdir='./data')
}

# define tables for features and
features <- read.table("./data/UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
# filter features by mean and std
features_filtered <- grepl(".*mean.*|.*std.*",features[,2])

# activity labels (class(features[,2]) "factor")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
activity_labels[,1] <- as.character(activity_labels[,1])

# define tables of test and training data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

# start merge by filtering data 
# add column names to x data
x <- rbind(features[features_filtered,2], x_test[,features_filtered], x_train[,features_filtered])
colnames(x) = x[1, ] # the first row will be the header
x = x[-1,]           # remove first row holding merged headers

# clean headers: remove '()'
names(x) <- gsub("[(][)]","", names(x))

# combine y data and store in new column
y <- rbind(y_test, y_train)
colnames(y) <- c("activity")
data <- cbind(y, x)

# combine subject data and store in new column
subject <- rbind(subject_test, subject_train)
colnames(subject) <- c("subject")
data <- cbind(subject, data)

# creates new column with the activity description (activity_desc)
data <- mutate(data, activity_label = activity_labels[data$activity,2])
# rearrange columns and rename
data <- data[, c(1, length(names(data)), 3:(length(names(data))-1))]

# activities and subjects into factors before writing to table
data$activity_label <- as.factor(data$activity_label)
data$subject <- as.factor(data$subject)

# arrange data by subject and data
data_melt <- melt(data, id.var = c("subject", "activity_label"))
# class(data_melt) = "character", "character", "character", "character"
# need to convert value to numeric before taking mean
data_melt[,4] <- as.numeric(data_melt[,4])
data_mean <- dcast(data_melt, subject + activity_label ~ variable, fun.aggregate = mean)

# output to tidy.txt
write.table(data_mean, file="tidy.txt", quote = FALSE, col.names = TRUE, row.names = FALSE)