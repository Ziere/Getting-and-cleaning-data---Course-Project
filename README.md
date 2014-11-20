Getting and cleaning data - Course project
==========================================

*General information about the project

>This repo is for the the course project of Getting and cleaning data of Coursera

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>Here are the data for the project: 

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

> You should create one R script called run_analysis.R that does the following. 
>Merges the training and the test sets to create one data set.
>Extracts only the measurements on the mean and standard deviation for each measurement. 
>Uses descriptive activity names to name the activities in the data set
>Appropriately labels the data set with descriptive variable names. 
>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

>Good luck!

*Script Explanation

>1. After all we load the packages the will use
>2. Create a variable called dataPath with the path of the data, in this case the folder is "UCI HAR Dataset"
>3. Read the files required for the task:
>   - subject_train.txt (for subject number)
>   - subject_test.txt
>   - y_train.txt (for the activity of each row)
>   - y_test.txt
>   - X_train.txt (for the variable data)
>   - X_test.txt
>4. Merge the data of each pair of files and put the propers names to the columns
>5. Creating a tidy dataset with subject number, activity and the feature with the value in each row using subject number and activity as keys of the data.table
>6. Disambiguation of the features adding more readibility
>7. Setting again the keys for all the variables of the data.table less the value, and creating a new data.table with the mean of each variable for each activity and each subject
