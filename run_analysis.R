#############################################################################
#
# run_analysis.R
#
# by Lisa M. Primm
#
# Getting and Clean Data Course Project
#
#############################################################################
#
# 1. Merges the training and the test sets to create one data set.
#
#############################################################################
# Download and Unzip the .zip file containing the data files.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localZipFile <- "./UCI HAR Dataset.zip"
if (!file.exists(localZipFile)) { download.file(fileUrl, localZipFile, method = "curl")}
unzip(localZipFile, junkpaths = TRUE)

# Delete the extra files that we don't need
unlink("body*")
unlink("total*")

# Set up variables for the filenames that we will need
activityLabelsFile <- "activity_labels.txt"
featuresLabelsFile <- "features.txt"
subjectTrainFile <- "subject_train.txt"
subjectTestFile <- "subject_test.txt"
XTrainFile <- "X_train.txt"
XTestFile <- "X_test.txt"
yTrainFile <- "y_train.txt"
yTestFile <- "y_test.txt"

# Read in the data
activityData <- read.table(activityLabelsFile, stringsAsFactors = FALSE)
featureData <- read.table(featuresLabelsFile, stringsAsFactors = FALSE)
subjectTrainData <- read.table(subjectTrainFile)
subjectTestData <- read.table(subjectTestFile)
XTrainData <- read.table(XTrainFile)
XTestData <- read.table(XTestFile)
yTrainData <- read.table(yTrainFile)
yTestData <- read.table(yTestFile)

# Use rbind and cbind to combine the data based on which type it is; get rid
# of the intermediary data sets to save on memory usage
subjectData <- rbind(subjectTrainData, subjectTestData)
XData <- rbind(XTrainData, XTestData)
yData <- rbind(yTrainData, yTestData)
rm(subjectTrainData)
rm(subjectTestData)
rm(XTrainData)
rm(XTestData)
rm(yTrainData)
rm(yTestData)

# Add column names before combining to 1 data set
colnames(subjectData) <- c("TestSubject")
colnames(yData) <- c("Activity")
colnames(XData) <- featureData$V2

#############################################################################
#
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
#
#############################################################################
XData <- XData[, grepl("mean|std", colnames(XData))]

# Combine into 1 big data set
fullDataSet <- cbind(subjectData, yData)
fullDataSet <- cbind(fullDataSet, XData)

#############################################################################
#
# 3. Uses descriptive activity names to name the activities in the data set.
#
#############################################################################
activityLookUp <- activityData$V2
fullDataSet$Activity <- activityLookUp[fullDataSet$Activity]

#############################################################################
#
# 4. Appropriately labels the data set with descriptive variable names.
#
#############################################################################
codedColNames <- colnames(fullDataSet)
codedColNames <- sub("^t", "time", codedColNames)
codedColNames <- sub("^f", "freq", codedColNames)
codedColNames <- gsub("Acc", "Accelerometer", codedColNames)
codedColNames <- gsub("Gyro", "Gyroscope", codedColNames)
codedColNames <- gsub("Mag", "Magnitude", codedColNames)
codedColNames <- gsub("mean", "Mean", codedColNames)
codedColNames <- gsub("std", "StdDev", codedColNames)
codedColNames <- gsub("-", "", codedColNames)
codedColNames <- gsub("()", "", codedColNames, fixed = TRUE)
colnames(fullDataSet) <- codedColNames

#############################################################################
#
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each
#    subject.
#
#############################################################################
library(dplyr)
summaryData <- fullDataSet %>%
      group_by(TestSubject,Activity) %>%
      summarise_each(funs(mean))

# Write data out to files
tidyDataFile <- "./tidyData.txt"
summaryFile <- "./summary.txt"
write.table(fullDataSet, tidyDataFile, col.names = TRUE, quote = FALSE)
write.table(summaryData, summaryFile, col.names = TRUE, quote = FALSE)

