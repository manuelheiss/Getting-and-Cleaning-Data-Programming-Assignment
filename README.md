# Getting and Cleaning Data

Given the unzipped data from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
in your working directory running the script "run_analysis.R" creates two files "tidyDataSet.txt" and "meansTidyDataSet.txt" by applying the following steps:
1.) It merges the training and the test sets to create one data set.
2.) It extracts only the measurements on the mean and standard deviation for each measurement.
3.) It uses descriptive activity names to name the activities in the data set.
4.) And it appropriately labels the data set with descriptive variable names. (The result of this step is "tidyDataSet.txt")
5.) From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.
(The result of this step is "meansTidyDataSet.txt")