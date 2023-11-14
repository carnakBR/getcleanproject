# Code to create a tidy dataset according to instructions in the Getting and Cleaning Data Course Project

library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# downloads the zip file with the data if it isn't in the data subfolder. Coded with Windows in mind
if(!file.exists("./data/getdata_projectfiles_UCI HAR Dataset.zip")){
    download.file(fileURL, destfile = "./data/getdata_projectfiles_UCI HAR Dataset.zip", method = "libcurl", mode = "wb")
    dateDownloaded <- date()
}

# Load the relevant train and test files:
subject_test <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt"))
subject_train <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt"))
set_test <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt"))
set_train <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt"))
labels_test <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt"))
labels_train <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt"))
set_features <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt"))
activity <- read.table(unz("./data/getdata_projectfiles_UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt"))

# insert the column names in the loaded data
names(subject_test) <- "subject"
names(subject_train) <- "subject"
names(labels_test) <- "activity"
names(labels_train) <- "activity"
names(set_test) <- set_features[,2]
names(set_train) <- set_features[,2]

# merge the subject, labels and set from test data, and then do the same for train data 
testdata <- cbind(subject_test, labels_test, set_test)
traindata <- cbind(subject_train, labels_train, set_train)

# merge the test and train data
mergedata <- rbind(testdata, traindata)

#subsets columns 1 (subject), 2 (activity) and all columns that contain mean() or std()
meanstddata <- mergedata[, c(1, 2, grep("mean\\(\\)|std\\(\\)", names(mergedata)))]

# replace the activity labels with the activity names
for(i in 1:dim(activity)[1]){
    meanstddata$activity <- sub(activity[i, 1], activity[i, 2], meanstddata$activity)
}

# update column names to be syntactically valid (remove hyphens and parenthesis) and fix duplicated word "Body" in some variable names
names(meanstddata) <- sub("\\(\\)", "", names(meanstddata))
names(meanstddata) <- make.names(names(meanstddata))
names(meanstddata) <- sub("BodyBody", "Body", names(meanstddata))

# group the dataset by activity and subject and then summarize by the average of each column:
act_subj_mean <- meanstddata %>% group_by(activity, subject) %>% summarise(across(everything(), mean, .names = "avg.{.col}"))

# export the dataset
write.table(act_subj_mean, file="tidydataset.txt", row.name=FALSE)