# 1.) Loading and merging the data:

The following files are loaded into R "X_train.txt", "y_train.txt", "subject_train.txt", X_test.txt", "y_test.txt",
"subject_test.txt")
Then the "X_train" and "X_test" as well as the "y_train" and "y_test" as well as"subject_train" and "subject_test"
data sets are each merged together with rowbind. The merged data sets are called "X_all", "y_all" and "subject_all".
As a next step the columns of "X-all", "y_all" and "subject_all" are bind with cbind reulting in a data set named
"X_y_s_all" having all the information we need later on.

# 2.) Extracts mean and standard measurements:

First we have to read the "features.txt" table. Second we filter "X_y_s_all" on the ocurense of the texts "mean(" and
"std(" in the "features" table. A trailing "(" is included because e.g. "meanFreq" and "gravityMean" are not wanted.
This results in a data set called "X_y_s_all_mean_sd" that only has columns refering to
"mean" and "std" plus the two additional columns for subject and activity. As a last step the clean column names are
asignd to the data set. Clean means that "(", ")" and "-" are removes, because they are not nice in column names.
Additionally the first letters of "mean" and "std" are put to upper case since it improves readability.

# 3.) Load and prepare clean "activity_labels":

First the "activity_labels.txt" data set is loaded. Second all the names are lower cased, "-"s are removed
and the first letter of each sub word beeing not the start of the entire word is upper cased.

# 4.) Label the data set:

The information gathered in the last step is then brought to the "X_y_s_all_mean_sd" data set of step two by linking both
data sets on the connecting variable, and so performing some kind of a "left join". Finally the "activity"and "subject"column
names are put respectivly and the now tidy data set is written to "tidyDataSet.txt".


# 5.) Creates tidy data set with the average of each variable for each activity/subject.

Calculate the means for all columns except subject/activity and Write it to "meansTidyDataSet.txt".


The "tidyDataSet.txt" and the "meansTidyDataSet.txt" data sets have both the following variables:
"tBodyAccMeanX"
"tBodyAccMeanY"
"tBodyAccMeanZ"
"tBodyAccStdX"
"tBodyAccStdY"
"tBodyAccStdZ"
"tGravityAccMeanX"
"tGravityAccMeanY"
"tGravityAccMeanZ"
"tGravityAccStdX"
"tGravityAccStdY"
"tGravityAccStdZ"
"tBodyAccJerkMeanX"
"tBodyAccJerkMeanY"
"tBodyAccJerkMeanZ"
"tBodyAccJerkStdX"
"tBodyAccJerkStdY"
"tBodyAccJerkStdZ"
"tBodyGyroMeanX"
"tBodyGyroMeanY"
"tBodyGyroMeanZ"
"tBodyGyroStdX"
"tBodyGyroStdY"
"tBodyGyroStdZ"
"tBodyGyroJerkMeanX"
"tBodyGyroJerkMeanY"
"tBodyGyroJerkMeanZ"
"tBodyGyroJerkStdX"
"tBodyGyroJerkStdY"
"tBodyGyroJerkStdZ"
"tBodyAccMagMean"
"tBodyAccMagStd"
"tGravityAccMagMean"
"tGravityAccMagStd"
"tBodyAccJerkMagMean"
"tBodyAccJerkMagStd"
"tBodyGyroMagMean"
"tBodyGyroMagStd"
"tBodyGyroJerkMagMean"
"tBodyGyroJerkMagStd"
"fBodyAccMeanX"
"fBodyAccMeanY"
"fBodyAccMeanZ"
"fBodyAccStdX"
"fBodyAccStdY"
"fBodyAccStdZ"
"fBodyAccJerkMeanX"
"fBodyAccJerkMeanY"
"fBodyAccJerkMeanZ"
"fBodyAccJerkStdX"
"fBodyAccJerkStdY"
"fBodyAccJerkStdZ"
"fBodyGyroMeanX"
"fBodyGyroMeanY"
"fBodyGyroMeanZ"
"fBodyGyroStdX"
"fBodyGyroStdY"
"fBodyGyroStdZ"
"fBodyAccMagMean"
"fBodyAccMagStd"
"fBodyBodyAccJerkMagMean"
"fBodyBodyAccJerkMagStd"
"fBodyBodyGyroMagMean"
"fBodyBodyGyroMagStd"
"fBodyBodyGyroJerkMagMean"
"fBodyBodyGyroJerkMagStd"
"subject"
"activity"
which all come from the original data set and contain some observations.