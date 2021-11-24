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
Read activity_labels.txt and store them in features_names variable.
Read features.txt and store them in features_names variable.
Merge the x_train and x_test to create features_data


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# 3. Uses descriptive activity names to name the activities in the data set

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Concatenate testData to trainData to generate a 10299x561 data frame, joinData; concatenate testLabel to trainLabel to generate a 10299x1 data frame, joinLabel; concatenate testSubject to trainSubject to generate a 10299x1 data frame, joinSubject.

Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns.
Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.
Transform the values of joinLabel according to the activity data frame.
Combine the joinSubject, joinLabel and joinData by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
Write the cleanedData out to "merged_data.txt" file in current working directory.
Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
Write the result out to "data_with_means.txt" file in current working directory.
