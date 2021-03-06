## Getting and Cleaning Data Project

Jesús Ortega

### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

our transformations or work that we performed to clean up the data

### 1._Merge the training and the test sets to create one data set.
- Read files in table format and create a data frames from them
- combine data frames x_train and x_test by rows.
- combine data frames y_train and y_test by rows.
- combine data frames subject_train and subject_test by rows.

### 2._Extract only the measurements on the mean and standard deviation for each measurement
- Read file 'features.txt' in table format
- get the indexes for columns with mean() or std() in their names
- subset by filtered features

### 3._Use descriptive activity names to name the activities in the data set.
- Read file 'activity_labels.txt' in table format.
- replace the ID's activities by labels.
- set column name

### 4._Appropriately labels the data set with descriptive variable names.
- set the column names for extracted data set.
- set column name subject data set.
- combine data frames extracted_data_set, y_train_test and subject_train_test by columns

### 5._Create a second, independent tidy data set with the average of each variablefor each activity and each subject
- calculate data frame average break down by activity and subject.
- Create a file for independent tidy data set called 'independent_tidy_data.txt'
