## Background

This is the course Project work for the course Getting and Cleaning Data.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.


## Dataset

The dataset is based on Human Activity Recognition Using Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Features collected for each record

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Script to run to get and clean and generate tidy dataset
The R script run_analysis.R runs on the raw data collected and outputs a tidy datasets with all measures/variables in a single file


## Steps to generate tidy dataset
1) Merge the training and the test sets to create one data set.
2) Extract only the measurements on the mean and standard deviation for each measurement.
3) Use descriptive activity names to name the activities in the data set
4) Appropriately label the data set with descriptive variable names.
5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject


## Outputs
The output of this script is a file named as "tidy_dataset_mean_std_each_activity.txt", where each record consists of the subject, one of the 6 the activities performed, and various measures captured/calculated using the embedded accelerometer and gyroscope by wearing the smartphone device on the waist (Samsung Galaxy S II)


