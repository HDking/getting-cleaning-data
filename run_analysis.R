library(dplyr)
library(plyr)

#Reading the datasets
# STEP 1
# Merging training and test set to create one data set
###############################################################
# test data
x_test <- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")

# training data
x_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")

#create x data set
x_data <- rbind(x_train, x_test)

#create y data set
y_data <- rbind(y_train, y_test)

#create subject data set
subject_data <- rbind(subject_train, subject_test)


#STEP 2
#Extracts only the measurements on the mean and standard deviation for each measurement
###############################################################
#subset of columns
labels <- read.table("./features.txt")

#get only the lables with mean or std in their names
mean_and_std <- grep("-(mean|std)\\(\\)", labels[,2])

#subset of the desired columns
x_data <- x_data[,mean_and_std]

#label correction with the subset
names(x_data) <- as.character(labels[mean_and_std,2])


#STEP 3
#Uses descriptive activity names to name the activities in the data set
###############################################################
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

#Update the y values with the correct activity names
y_data[,1] <- activities[y_data[,1],2]

#Label with correct name
names(y_data) <- "activity"

#STEP 4
#Appropriately labels the data set with descriptive variable names
###############################################################
# give column name 
names(subject_data) <- "subject"

#make one integrated dataset (this makes activity var nr 67 and subject nr 68)
data_tot <- cbind(x_data, y_data, subject_data)

#STEP 5
# Create a second, independent tidy data set with the average of each variable
###############################################################
averages_data <- ddply(data_tot, .(subject, activity), colMeans(data_tot[,1:66]))
write.table(averages_data, "./data/averages_data.txt", row.name=FALSE)
