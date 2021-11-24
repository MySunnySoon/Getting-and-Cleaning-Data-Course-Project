# Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

A full description of the data can be obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
 
The run_analysis.R script performs the following steps:

# 1. Merges the training and the test sets to create one data set.
Read subject_train.txt, X_train.txt and y_train.txt and store them in subject_train, x_train and y_train variables respectively.

Read subject_test.txt, X_test.txt and y_test.txt and store them in subject_test, x_test and y_test variables respectively.

Read features.txt and store them in features_names variable.

Merge the x_train and x_test to create features_data

Merge the y_train and y_test to create activity_data

Merge the subject_train and subject_test to create subject_data

Merge the subject_data, activity_data and features_data into merged_data

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Extract matching column name that contain "Mean" or "Std" from merged_data into columns_mean_std variable

Extract 1st, 2nd and columns_mean_std column from merged_data into extracted_data


# 3. Uses descriptive activity names to name the activities in the data set

Read activity_labels.txt and store them in activity_labels variable.

Replace the "Activity" column with descriptive activity names found activity_labels 

# 4. Appropriately labels the data set with descriptive variable names. 

Replace the following acronyms with descriptive variable names:
* "Acc" with "Accelerometer"
* "Gyro" with "Gyroscope"
* "BodyBody" with "Body"
* "Mag" with "Magnitude"
* "^t" with "Time"
* "^f" with "Frequency"
* "tBody" with "TimeBody"
* "-mean()" with "Mean"
* "-std()" with "STD"
* "-freq()" with "Frequency"
* "angle" with "Angle"
* "gravity" with "Gravity"


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Average each variable for each activity and each subject of extracted_data into tidy_data 

Save into tidydata.txt
