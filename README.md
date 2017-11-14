# Getting and Cleaning Data - Course Project Week4-Assignment

This is the repository created for Getting and Cleaning Data Coursera - Course Project week4 assignment.
* 1. Download and unzip the data file into R working directory
* 2. Download the R source code into R working directory
* 3. Execute R source code to create tidyy data file

And the R script, `run_analysis.R`, does the following:

1. Read train and test datasets into R environment
2. Read variable names into R environment
3. Read subject index into R environmet 
4. Merges the training and the test sets to create one data set.
Use command rbind to combine training and test set
5. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
6. Uses descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
7. Appropriately label the data set with descriptive variable names.
Give the selected descriptive names to variable columns
8. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package