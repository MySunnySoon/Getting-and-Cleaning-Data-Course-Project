## run_analysis.R  

library(dplyr)
library(data.table)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-"./data/getdata_projectfiles_UCI HAR Dataset.zip"

download.file(fileURL, filename, method="curl")
unzip(filename)

features_names <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read test data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)

# Read training data
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)

## 1. Merges the training and the test sets to create one data set.

features_data <- rbind(x_train, x_test)
colnames(features_data) <- t(features_names[2])
activity_data <- rbind(y_train, y_test)
colnames(activity_data) <- "Activity"
subject_data <- rbind(subject_train, subject_test)
colnames(subject_data) <- "Subject"

merged_data <- cbind(subject_data, activity_data, features_data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

columns_mean_std <- grep(".*Mean.*|.*Std.*", names(merged_data), ignore.case=TRUE)
extracted_data <- merged_data[,c(1,2,columns_mean_std)]
dim(extracted_data)

## 3. Uses descriptive activity names to name the activities in the data set
extracted_data$Activity <- activity_labels[extracted_data$Activity, 2]

## 4. Appropriately labels the data set with descriptive variable names. 
names(extracted_data)<-gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data)<-gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data)<-gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data)<-gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data)<-gsub("^t", "Time", names(extracted_data))
names(extracted_data)<-gsub("^f", "Frequency", names(extracted_data))
names(extracted_data)<-gsub("tBody", "TimeBody", names(extracted_data))
names(extracted_data)<-gsub("-mean()", "Mean", names(extracted_data), ignore.case = TRUE)
names(extracted_data)<-gsub("-std()", "STD", names(extracted_data), ignore.case = TRUE)
names(extracted_data)<-gsub("-freq()", "Frequency", names(extracted_data), ignore.case = TRUE)
names(extracted_data)<-gsub("angle", "Angle", names(extracted_data))
names(extracted_data)<-gsub("gravity", "Gravity", names(extracted_data))


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- aggregate(. ~Subject + Activity, extracted_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, file = "tidydata.txt", row.names = FALSE)


