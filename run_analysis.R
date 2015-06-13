library(plyr)
###############################################################################
# 1._Merge the training and the test sets to create one data set.             #
###############################################################################

#Read files in table format and create a data frames from them
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# combine data frames x_train and x_test by rows.
x_train_test <- rbind(x_train, x_test)

# combine data frames y_train and y_test by rows.
y_train_test <- rbind(y_train, y_test)

# combine data frames subject_train and subject_test by rows.
subject_train_test <- rbind(subject_train, subject_test)

############################################################################################
# 2._Extract only the measurements on the mean and standard deviation for each measurement # 
############################################################################################

features <- read.table("features.txt")

# get the indexes for columns with mean() or std() in their names
features_mean_std <- features[grep("-(mean|std)\\(\\)", features$V2, perl=TRUE), 1]

# subset by filtered features
extracted_data_set <- x_train_test[, features_mean_std]

###############################################################################
# 3._Use descriptive activity names to name the activities in the data set    #
###############################################################################

activities <- read.table("activity_labels.txt")

# replace the ID's activities by labels 
y_train_test[, 1] <- activities[y_train_test[, 1], 2]

# set column name
names(y_train_test) <- "activityType"

##############################################################################
# 4._Appropriately labels the data set with descriptive variable names.      #
##############################################################################

# set the column names
names(extracted_data_set) <- features[features_mean_std, 2]

# set column name
names(subject_train_test) <- "subjectId"

# combine data frames extracted_data_set, y_train_test and subject_train_test by columns
merge_train_test <- cbind(extracted_data_set, y_train_test, subject_train_test)

###################################################################################
# 5._Create a second, independent tidy data set with the average of each variable #
# for each activity and each subject                                              #
###################################################################################

# data frame average break down by activity and subject
independent_tidy_data <- ddply(merge_train_test, .(subjectId, activityType), function(x) colMeans(x[, 1:66]))

write.table(independent_tidy_data, "independent_tidy_data.txt", row.name=FALSE)
