### Introduction to Course Project ###

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis. You will be graded by your peers on a
series of yes/no questions related to the project. You will be required
to submit: 1) a tidy data set as described below, 2) a link to a Github
repository with your script for performing the analysis, and 3) a code
book that describes the variables, the data, and any transformations or
work that you performed to clean up the data called CodeBook.md. You
should also include a README.md in the repo with your scripts. This repo
explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is
wearable computing - see for example this article . Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the
Samsung Galaxy S smartphone. A full description is available at the site
where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip%

### run_analysis.R ###

Before running the script, you must have the Samsung data in your
working directory in a file called "UCI HAR Dataset". No additional
libraries need to be loaded in R.

The run_analysis.R script does the following

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set called with the 
average of each variable for each activity and each subject.


#### How the Script Works####

Step 1. Read in Samsung accelerometer data from files in folder named "UCI HAR Dataset"
in the working directory
Step 2. Combine train data with test data
Step 3. Give decriptive names to all columns factor variables in data set
Step 4. Extract only measurements on the mean and standard deviation for each measurement
Step 5. Combine all clean data into a single tidy data set
Step 6. Compute averages for each subject for each activity
Step 7. Create a text file in the working directory containing the tidy table of averages
