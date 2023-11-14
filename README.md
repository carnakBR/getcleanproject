---
title: "Readme"
---

# Problem Summary

This repository is my solution to Coursera Johns Hopkins University [Getting and Cleaning Data course](https://www.coursera.org/learn/data-cleaning) project. The goal is to prepare tidy data that can be used for later analysis, starting from an existing data set and following the project instructions to merge, select and process the data. The dataset is the Human Activity Recognition Using Smartphones Dataset Version 1.0, which represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available [here](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones).

The end result is a dataset that is exported as a file named tidydataset.txt, which is obtained by running a R script that performs the following, as requested by the project instructions:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Repository Contents

The repository includes the zip file containing the original dataset, the R script that reads the original dataset and outputs the desired dataset, this Readme file and the codebook describing the variables

|File Name|Description|
|---------|-----------|
|data\getdata_projectfiles_UCI HAR Dataset.zip|Original data which represents data collected from the accelerometers from the Samsung Galaxy S smartphone, including its Readme file describing each file|
|run_analysis.R|R script that reads the original data set and outputs the desired data set|
|README.md|Documentation explaining the project and the files in the repository|
|CodeBook.md|Describes the variables and the summary choices made|

# Process

## 1. Load relevant files from the original dataset

The zipped folder has multiple files. As the original dataset has its own readme file, we won't explain them in too much detail here; please refer to it for additional detail. The files with relevant data to be loaded in our project are:

* X_test.txt and X_train.txt: the pre-processed data for the test and train sets, respectively, containing 561 features (columns)
* y_test.txt and y_train.txt: the activity label (number between 1 and 6) for each observation (row) of the  test and train sets, respectively
* subject_test.txt and subject_train.txt: the subject for each observation (row) of the  test and train sets, respectively
* features.txt: the list of all 561 features present in X_test and X_train
* activity_labels.txt: the names (sitting, walking, etc.) of each of the 6 activity labels

The files in the "Inertial Signals" folders for train and test data won't be used in this project, as they don't contain relevant information for the desired output.

## 2. Insert the column names in the loaded data

Before we go about merging the train and test data, I decided to name all the columns in the separate variables first, as this way seemed to be easier than naming them after eliminating a bunch of columns in the later steps. So the variables with the subject numbers were named "subject", the variables with the activity labels were named "activity" and the 561 columns containing the features in the train and test data got their names from the features.txt file

## 3. Merge the data

First the subject, activity labels and the pre-processed data from test data were combined by column, and then the same was done for train data. Finally, the test data and train data were combined by row.

## 4. Extract only the measurements on the mean and standard deviation for each measurement

According to the features_info.txt file contained in the zip folder, all the mean variables contain mean() in their name and all the standard deviation variables contain std() in their name. Therefore, the script selects all columns that contain mean() or std() in its name, plus the subject and activity columns, totaling 68 columns.

## 5. Insert descriptive activity names

To replace the activity labels with the activity names, the script uses a for loop to go through the mapping table in the activity variable (loaded from activity_labels.txt) and applying the sub function.

## 6. Appropriately label the data set with descriptive variable names

Besides naming each column in step 2, the script makes sure the names are syntactically valid ("consists of letters, numbers and the dot or underline characters and starts with a letter or the dot not followed by a number", as explained in the R documentation for the make.names function). We used a combination of the make.names and sub functions to get rid of invalid characters. The script also fixes the name of some variables that for some reason had the word Body duplicated, such as fBodyBodyGyroMag-mean().

## 7. Create a independent tidy data set with the average of each variable for each activity and each subject

The dplyr library was used to group the data set by activity and subject, and then summarize by the average of each column for each unique combination of activity and subject, using the across function to also take care of renaming the columns.

At this stage the data set is already tidy, since:

- Each variable measured is in one column (subject, activity and the 68 features selected)
- Each different observation of that variable is in a different row. Actually each row is a mean of multiple observations of the same subject and activity, but since this is what is asked for in the instructions, it can be considered that this rule is being followed.
- There is only one table and no need to additional tables, as all variables are of the same "kind". If we had additional subject information, such as name, height, etc, then it would be correct to have another table for this, but it's not the case here

At this point we export the dataset as a txt file and the script reaches its objective.

