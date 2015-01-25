library(plyr)

## 1.) Loading and merging the data:

# Read the train data set.
X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
# Read the test data set.
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
# Merge the train and test data sets for each type of table.
X_all <- rbind(X_train, X_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
# Bind the columns of X-all, y_all and subject_all.
X_y_s_all <- cbind(X_all, y_all, subject_all)

## 2.) Extracts mean and standard measurements:

# First read features table.
features <- read.table(".\\UCI HAR Dataset\\features.txt")
# Second filter X_y_s_all on "mean" and "std". I included a trailing "(" to each because "meanFreq"
# and "gravityMean" are probably not wanted.
X_y_s_all_mean_sd <- X_y_s_all[, grepl("mean\\(|std\\(", features[, 2], ignore.case = TRUE)]
# Third clean the column names and asign it to the data set.
# Remove "(", ")" and "-" because they are not nice in column names.
# Upper case first letter of "mean" and "std" since it improves readability.
names(X_y_s_all_mean_sd) <- gsub("std", "Std", gsub("mean", "Mean", gsub("\\(\\)|-", "", features[grepl("mean\\(|std\\(", features[, 2], ignore.case = TRUE), 2])))

## 3.) Load and prepare clean "activity_labels":

# Read the activity_labels data set.
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
# Note for a bigger data set there are smarter ways of doing that.
activity_labels[, 2] <- gsub("STANDING", "standing",
                        gsub("SITTING", "sitting",
                        gsub("LAYING", "laying",
                        gsub("WALKING\\_?", "walking",
                        gsub("UPSTAIRS", "Upstairs",
                        gsub("DOWNSTAIRS", "Downstairs", (activity_labels[, 2])))))))

## 4.) Label the data set:

# Prepare the column names to be able to "left join" the activity labels.
colnames(X_y_s_all_mean_sd)[67] <- "leftJoinOn"
colnames(activity_labels)[1] <- "leftJoinOn"
colnames(activity_labels)[2] <- "activity"
colnames(X_y_s_all_mean_sd)[68] <- "subject"
# Do the "left join" and exclude join column from result.
tidyDataSet <- merge(X_y_s_all_mean_sd, activity_labels, by = "leftJoinOn")[, 2:69]
# Write tidy data set to ".txt" file.
write.table(tidyDataSet, "tidyDataSet.txt", row.name = FALSE)


## 5.) Creates tidy data set with the average of each variable for each activity/subject.

# Calculate the means for all columns except subject/activity.
meansTidyDataSet <- ddply(tidyDataSet, .(subject, activity), function(x) colMeans(x[,c(1:66)]))
# Write means of tidy data set to ".txt" file.
write.table(meansTidyDataSet, "meansTidyDataSet.txt", row.name = FALSE)