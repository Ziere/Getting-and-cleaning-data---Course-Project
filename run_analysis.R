## Package required
packages <- c("data.table", "tidyr", "dplyr", "reshape")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

## Set the path to current directory
setwd("C:/Users/Xhaos/Desktop/R/R - Tareas/Getting-and-cleaning-data---Course-Project")
path <- getwd()

dataPath <- file.path(path, "UCI HAR Dataset")

## Reading the data
numberSubjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
numberSubjectTest  <- read.table(file.path(dataPath, "test", "subject_test.txt"))

activityTrain <- read.table(file.path(dataPath, "train", "y_train.txt"))
activityTest  <- read.table(file.path(dataPath, "test", "y_test.txt"))
activityNames <- read.table(file.path(dataPath, "activity_labels.txt"))

featuresTrain  <- read.table(file.path(dataPath, "train", "X_train.txt"))
featuresTest   <- read.table(file.path(dataPath, "test", "X_test.txt"))
featuresNames  <- read.table(file.path(dataPath, "features.txt"))
names(featuresNames) <- c("feature_Number","feature_Name")

## Merging the data
numberSubject <- rbind(numberSubjectTest, numberSubjectTrain)
names(numberSubject) <- "subject_Number"
activity <- rbind(activityTest, activityTrain)
names(activity) <- "activity"
features <- rbind(featuresTest, featuresTrain)
names(features) <- featuresNames[,"feature_Name"]
## only get the features of means and std
## from the features_info.txt
## mean(): Mean value
## std(): Standard deviation
features <- features[,grepl("std()",names(features))|(grepl("mean()",names(features))&!grepl("meanFreq()",names(features)))]

# Creating the data.table with the info and the assing keys
dt <- data.table(numberSubject,activity,features)
setkey(dt,subject_Number,activity)
# Creating the tidy data table with each feature per row, reshapping the data from dt
dt2 <- data.table(melt(dt, key(dt)))
setnames(dt2,"variable","feature")

## Adding readility extracting info from the feature name
## Features with 2 categories
n <- 2
y <- matrix(seq(1, n), nrow = n)
x <- matrix(c(grepl("^t", dt2$feature), grepl("^f", dt2$feature)), ncol = nrow(y))
dt2$domain <- factor(x %*% y, labels = c("Time", "Frequency"))
x <- matrix(c(grepl("Acc", dt2$feature), grepl("Gyro", dt2$feature)), ncol = nrow(y))
dt2$instrument <- factor(x %*% y, labels = c("Accelerometer", "Gyroscope"))
x <- matrix(c(grepl("BodyAcc", dt2$feature), grepl("GravityAcc", dt2$feature)), ncol = nrow(y))
dt2$acceleration <- factor(x %*% y, labels = c(NA, "Body", "Gravity"))
x <- matrix(c(grepl("mean()", dt2$feature), grepl("std()", dt2$feature)), ncol = nrow(y))
dt2$variable <- factor(x %*% y, labels = c("Mean", "SD"))

## Features with 1 category
dt2$jerk <- factor(grepl("Jerk", dt2$feature), labels = c(NA, "Jerk"))
dt2$magnitude <- factor(grepl("Mag", dt2$feature), labels = c(NA, "Magnitude"))

## Features with 3 categories
n <- 3
y <- matrix(seq(1, n), nrow = n)
x <- matrix(c(grepl("-X", dt2$feature), grepl("-Y", dt2$feature), grepl("-Z", dt2$feature)), ncol = nrow(y))
dt2$axis <- factor(x %*% y, labels = c(NA, "X", "Y", "Z"))

## Deleting the feature column because is not necessary anymore
dt2$feature <- NULL

## Reorder and put the type of variable an the value at the end of each row to clarify
dt2 <- subset(dt2, select=c(names(dt2)[-variable][-value],"variable","value"))
write.table(dt2,"tidy_data_set.txt", row.name=FALSE)

## setting again the keys without the value field (the last one)
setkeyv(dt2,names(dt2)[-length(names(dt2))])

## creating a new var dtTidy with the tidy data set with the means for each subject and activity
dtTidy <- dt2[, list(count = .N, average = mean(value)), by = key(dt2)]

write.table(dtTidy,"tidy_data_set_mean.txt", row.name=FALSE)