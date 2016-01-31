library(plyr)

## STEP 1: Merges the training and the test sets to create one data set.
# Getting the training data
training_set <- read.table("./train/X_train.txt")
training_labels <- read.table("./train/Y_train.txt")
training_subject <- read.table("./train/subject_train.txt")

# Getting the testing data
testing_set <- read.table("./test/X_test.txt")
testing_labels <- read.table("./test/Y_test.txt")
testing_subject <- read.table("./test/subject_test.txt")

# Getting the features
features <- read.table("./features.txt")[,2]

# Merging the data
xmerged <- rbind(training_set, testing_set)
ymerged <- rbind(training_labels, testing_labels)[, 1]
subjects <- rbind(training_subject, testing_subject)[,1]
names(xmerged) <- features

## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Extracting measurements on mean and std and fixing the names
xmerged <- xmerged[, grep("(mean|std)\\(\\)", names(xmerged))]
names(xmerged) <- gsub("-", "", names(xmerged))
names(xmerged) <- gsub("-mean\\(\\)", "Mean", names(xmerged))
names(xmerged) <- gsub("-std\\(\\)", "StdDev", names(xmerged))
names(xmerged) <- gsub("^t", "Time", names(xmerged))
names(xmerged) <- gsub("^f", "Frequency", names(xmerged))
names(xmerged) <- gsub("BodyBody", "Body", names(xmerged))

## STEP 3: Uses descriptive activity names to name the activities in the data set.
# Getting the labels for activities
activities <- tolower(read.table("./activity_labels.txt")[,2])
activities <- gsub("_", " ", activities)
activities <- activities[ymerged]

## STEP 4: Appropriately labels the data set with descriptive variable names.
# Getting there: adding subjects and activities
tidy_data <- cbind(Subject = subjects, Activity = activities, xmerged)

# Writing files
write.table(tidy_data, file="tidy_data.txt", sep = "\t", row.names=FALSE)
write.table(tidy_data, file="tidy_data.csv", sep = ",", row.names=FALSE)

## STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Getting the means
means_data <- ddply(tidy_data, .(Subject, Activity), function(x) {colMeans(x[,-c(1,2)])})

# Fixing the names
names(means_data)[-c(1,2)] <- paste0("mean", names(means_data)[-c(1,2)])

# Writing files
write.table(means_data, file="means_data.txt", sep = "\t", row.names=FALSE)
write.table(means_data, file="means_data.csv", sep = ",", row.names=FALSE)
