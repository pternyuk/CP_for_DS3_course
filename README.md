# Getting and Cleaning Data
## Course Project
### Introduction

This repository contains the files for the Course Project of the "Getting and Cleaning Data" course.
The purpose of this project to perform skills of getting and cleaning data for the following analysis, using R programming language.

### Raw data

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Script

The name of the result script is "run_analysis.R"
The tasks that are performed by the script are the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

There are the following steps to execute script:
- Download "run_analysis.R" file to the R working directory
- Download and unzip raw data to the R working directory, the name of the unzipped directory must be "UCI HAR Dataset"
- Load "run_analysis.R" using the following function: source("./run_analysis.R")
- Execute function run_analysis(), assign the result to the function to the variable, which will contain the result dataframe (tidy data) after successful execution of the script


### Tidy data

The name of the file with the tidy data is "dataset.txt", as a result of writing tidy dataset to file system using the following function:
write.table(mean_data, "dataset.txt", row.names = FALSE)

### Code Book

The name of the codebook for this project is "CodeBook.md", which describes the variables, the data, and any transformations or work that were performed to clean up the data 
