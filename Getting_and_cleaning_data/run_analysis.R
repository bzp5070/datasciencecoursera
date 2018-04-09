### Course Project

fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
unzip("UCI HAR Dataset.zip", exdir = getwd())

setwd("UCI HAR Dataset/")

features <- read.table("features.txt", header=FALSE, sep='')
head(features)


## Read training datasets
x_train <- read.table('train/X_train.txt')
dim(x_train)
y_train <- read.table('train/y_train.txt',header=FALSE, sep='')
dim(y_train)
subject_train <- read.table("train/subject_train.txt", header=FALSE)
dim(subject_train)

training_data <- cbind(subject_train, y_train, x_train)
dim(training_data)
names(training_data) = c("subject","label", features[,2])
training_data$data_type = "train"


## Read testing datasets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt", header=FALSE, sep='')
subject_test <- read.table("test/subject_test.txt", header=FALSE, sep='')
testing_data <- cbind(subject_test, y_test, x_test)
dim(testing_data)
names(testing_data) = c("subject", "label", features[,2])
testing_data$data_type = "test"



### Merge training and testing data together
activity_data_merged <- rbind(training_data, testing_data)
dim(activity_data_merged)



### Extract only mean and sd for each measure
mean_sd_colnames <- grep("mean|std", features[,2])
mean_sd_subset_data <- activity_data_merged[,c(1,2,mean_sd_colnames+2, 564)]
names(mean_sd_subset_data)[4:length(names(mean_sd_subset_data))-1] = as.character(features[grep("mean|std", features[,2]),2])



### Activity labels
labels <- read.table("activity_labels.txt", header=FALSE, sep=' ')
activity_labels = merge(mean_sd_subset_data, labels, by.x="label", by.y="V1")
names(activity_labels)[83]= "activity"

### Appropriately labels the data set with descriptive variable names
descriptive_names = names(activity_labels)
descriptive_names = gsub("[(][)]", "", descriptive_names)
descriptive_names = gsub("^t","TimeDomain_", descriptive_names)
descriptive_names = gsub("^f","FrequencyDomain_", descriptive_names)
descriptive_names = gsub("Acc","Accelerometer",descriptive_names)
descriptive_names = gsub("Gyro","Gyroscope", descriptive_names)
descriptive_names = gsub("Mag","Magnitude", descriptive_names)
descriptive_names = gsub("-","_",descriptive_names)
descriptive_names = gsub("std", "StandardDeviation",descriptive_names)
descriptive_names = gsub("mean","Mean",descriptive_names)
descriptive_names = gsub("MeanFreq","MeanFrequency",descriptive_names)
descriptive_names
names(activity_labels) = descriptive_names


### Mean and STD of each activity
final_data_mean_std_each_activity <- aggregate(activity_labels[,3:81], by = list(activity = activity_labels$activity, subject = activity_labels$subject),FUN = mean)
