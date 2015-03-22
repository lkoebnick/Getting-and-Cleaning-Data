## run_analysis.R will create a file containing averages and standard deviations
## of measurements taken from accelerometers on the Samsung Galexy S smartphone.

## read in files after downloading and unzipping into folder named "UCI HAR Dataset":
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
ActivityTest  <- read.table("UCI HAR Dataset/test/Y_test.txt" ,header = FALSE)
ActivityTrain  <- read.table("UCI HAR Dataset/train/y_train.txt" ,header = FALSE)
SubjectTest  <- read.table("UCI HAR Dataset/test/subject_test.txt" ,header = FALSE)
SubjectTrain  <- read.table("UCI HAR Dataset/train/subject_train.txt" ,header = FALSE)
FeaturesTest  <- read.table("UCI HAR Dataset/test/X_test.txt" ,header = FALSE)
FeaturesTrain  <- read.table("UCI HAR Dataset/train/X_train.txt" ,header = FALSE)

## combine train data with test data
activityData <- rbind(ActivityTrain, ActivityTest)
subjectData <- rbind(SubjectTrain, SubjectTest)
featureData <- rbind(FeaturesTrain, FeaturesTest)

## give decriptive names
names(activityData) <- c("activity")
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")
activityData[, 1] <- activityNames[activityData[, 1], 2]

names(subjectData) <- c("subject")

featureNames <- read.table("UCI HAR Dataset/features.txt" ,header = FALSE)
specialFeatures <- featureNames$V2[grep("(mean|std)\\(\\)", featureNames$V2)]
    ## Extract only measurements on the mean and standard deviation for each measurement 
featureData <- featureData[, specialFeatures]
names(featureData) <- specialFeatures

## combine all data into a single tidy data set
tidyData <- cbind(subjectData, activityData, featureData)

## compute averages for each subject for each activity
tidyAverages <- aggregate(tidyData[, 3:68], by=list
    (subject = tidyData$subject, activity = tidyData$activity), mean)

## create a file containing table of averages
write.table(tidyAverages, "tidy_averages.txt", row.name=FALSE)
