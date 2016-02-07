# Getting and Cleaning Data Course Human Activity Project
Readme file

The file run_analysis.R will download the .zip file for the project, unzip
it and process the five steps for the project.

1. Merges the training and the test sets to create one data set.
      + Download and Unzip the *.zip* file containing the data files.
      + Deleted the files from the data set that aren't needed.
      + Set up variables for the filenames that we will need.
      + Read in the required data using `read.table()`.
      + Use rbind to combine the *Train* and *Test* data sets.
      + Get rid of the intermediary data sets to save on memory usage.
      + Created a vector of `col.names` to include the **Subject** and **Activity**.
2. Extracts only the measurements on the mean and standard deviation for
each measurement.
      + Use `grepl()` to search for the **mean** and **std** strings.
      + Now use `cbind()` to combine the columns into a single data set.
3. Uses descriptive activity names to name the activities in the data set.
      + Create a vector of the strings in the activity.txt file.
      + Index into that vector to assign the **Activity** values to the appropriate strings.
4. Appropriately labels the data set with descriptive variable names.
      + Use `sub()` and `gsub()` to transform the variable names.
      + **t** and **f** into **time** and **freq** respectively.
      + **Acc** into **Accelerometer**
      + **Gyro** into **Gyroscope**
      + **Mag** into **Magnitude**
      + **mean** into **Mean**
      + **std** into **StdDev**
      + Remove the hyphens and parentheses.
      + Update the `col.names()` with the new strings.
5. From the data set in step 4, creates a second, independent tidy data 
set with the average of each variable for each activity and each subject.
      + Load the **dplyr** library.
      + Use `group_by()` and `summarise_each` to summarize the tidyData.
6. Write the data set out to a file.
      + Upload your data set as a txt file created with `write.table()` using `row.name=FALSE`.

The file CodeBook.md describes the data in tidyData.txt and the relevant
information for the columns of data.


# GettingAndCleaningData
