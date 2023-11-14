---
title: "Codebook"
---

# Introduction

The purpose of this codebook is to update the original data set codebook with the variables calculated by the script and outputted in the txt file. For information on the variables for the original data, please refer to the Readme file of the original dataset, which is present in the zipped folder containing the dataset and is  available for download [here](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones).

# Summary choices

As proposed by the course project instructions, the script extracts only the features related to the mean or the standard deviation for each measurement. According to the features_info.txt file contained in the zip folder, all the mean variables contain mean() in their name and all the standard deviation variables contain std() in their name. Therefore, the script selects only the columns that contain mean() or std() in its name, plus the subject and activity columns, totaling 68 columns. Additionally, again to follow the course project instructions, for each of the 66 features, it was calculated the mean for each unique combination of activity and subject.

# Variables

The following updates were made to the variable names, compared to the original data set:

* The variable identifying the subject is named subject
* The variable identifying the activity is named activity
* The variables that came from the feature vector were modified as follows:
    + To make them syntactically valid, the parenthesis were removed and hyphens were converted into dots
    + Removed the duplicated occurrence of the word Body that was present in some variables
    + Added the string "avg." to the beginning of each variable to indicate that it now represents the average of each variable for each unique combination of activity and subject

Since the only calculation made to the variables that came from the feature vector was to obtain the average value, the unit of those variables remain the same as the units of the original variables. Please see the original data set documentation for more details.

Below is a list of all the variables present in the data set output by the script:

|Field Position|Field Name|Description|
|--|----|--------------|
|1|subject|Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.|
|2|activity|Activity performed by the subject. Its value can be WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING|
|3|avg.tBodyAcc.mean.X|Average of tBodyAcc-mean()-X for each activity and each subject|
|4|avg.tBodyAcc.mean.Y|Average of tBodyAcc-mean()-Y for each activity and each subject|
|5|avg.tBodyAcc.mean.Z|Average of tBodyAcc-mean()-Z for each activity and each subject|
|6|avg.tBodyAcc.std.X|Average of tBodyAcc-std()-X for each activity and each subject|
|7|avg.tBodyAcc.std.Y|Average of tBodyAcc-std()-Y for each activity and each subject|
|8|avg.tBodyAcc.std.Z|Average of tBodyAcc-std()-Z for each activity and each subject|
|9|avg.tGravityAcc.mean.X|Average of tGravityAcc-mean()-X for each activity and each subject|
|10|avg.tGravityAcc.mean.Y|Average of tGravityAcc-mean()-Y for each activity and each subject|
|11|avg.tGravityAcc.mean.Z|Average of tGravityAcc-mean()-Z for each activity and each subject|
|12|avg.tGravityAcc.std.X|Average of tGravityAcc-std()-X for each activity and each subject|
|13|avg.tGravityAcc.std.Y|Average of tGravityAcc-std()-Y for each activity and each subject|
|14|avg.tGravityAcc.std.Z|Average of tGravityAcc-std()-Z for each activity and each subject|
|15|avg.tBodyAccJerk.mean.X|Average of tBodyAccJerk-mean()-X for each activity and each subject|
|16|avg.tBodyAccJerk.mean.Y|Average of tBodyAccJerk-mean()-Y for each activity and each subject|
|17|avg.tBodyAccJerk.mean.Z|Average of tBodyAccJerk-mean()-Z for each activity and each subject|
|18|avg.tBodyAccJerk.std.X|Average of tBodyAccJerk-std()-X for each activity and each subject|
|19|avg.tBodyAccJerk.std.Y|Average of tBodyAccJerk-std()-Y for each activity and each subject|
|20|avg.tBodyAccJerk.std.Z|Average of tBodyAccJerk-std()-Z for each activity and each subject|
|21|avg.tBodyGyro.mean.X|Average of tBodyGyro-mean()-X for each activity and each subject|
|22|avg.tBodyGyro.mean.Y|Average of tBodyGyro-mean()-Y for each activity and each subject|
|23|avg.tBodyGyro.mean.Z|Average of tBodyGyro-mean()-Z for each activity and each subject|
|24|avg.tBodyGyro.std.X|Average of tBodyGyro-std()-X for each activity and each subject|
|25|avg.tBodyGyro.std.Y|Average of tBodyGyro-std()-Y for each activity and each subject|
|26|avg.tBodyGyro.std.Z|Average of tBodyGyro-std()-Z for each activity and each subject|
|27|avg.tBodyGyroJerk.mean.X|Average of tBodyGyroJerk-mean()-X for each activity and each subject|
|28|avg.tBodyGyroJerk.mean.Y|Average of tBodyGyroJerk-mean()-Y for each activity and each subject|
|29|avg.tBodyGyroJerk.mean.Z|Average of tBodyGyroJerk-mean()-Z for each activity and each subject|
|30|avg.tBodyGyroJerk.std.X|Average of tBodyGyroJerk-std()-X for each activity and each subject|
|31|avg.tBodyGyroJerk.std.Y|Average of tBodyGyroJerk-std()-Y for each activity and each subject|
|32|avg.tBodyGyroJerk.std.Z|Average of tBodyGyroJerk-std()-Z for each activity and each subject|
|33|avg.tBodyAccMag.mean|Average of tBodyAccMag-mean() for each activity and each subject|
|34|avg.tBodyAccMag.std|Average of tBodyAccMag-std() for each activity and each subject|
|35|avg.tGravityAccMag.mean|Average of tGravityAccMag-mean() for each activity and each subject|
|36|avg.tGravityAccMag.std|Average of tGravityAccMag-std() for each activity and each subject|
|37|avg.tBodyAccJerkMag.mean|Average of tBodyAccJerkMag-mean() for each activity and each subject|
|38|avg.tBodyAccJerkMag.std|Average of tBodyAccJerkMag-std() for each activity and each subject|
|39|avg.tBodyGyroMag.mean|Average of tBodyGyroMag-mean() for each activity and each subject|
|40|avg.tBodyGyroMag.std|Average of tBodyGyroMag-std() for each activity and each subject|
|41|avg.tBodyGyroJerkMag.mean|Average of tBodyGyroJerkMag-mean() for each activity and each subject|
|42|avg.tBodyGyroJerkMag.std|Average of tBodyGyroJerkMag-std() for each activity and each subject|
|43|avg.fBodyAcc.mean.X|Average of fBodyAcc-mean()-X for each activity and each subject|
|44|avg.fBodyAcc.mean.Y|Average of fBodyAcc-mean()-Y for each activity and each subject|
|45|avg.fBodyAcc.mean.Z|Average of fBodyAcc-mean()-Z for each activity and each subject|
|46|avg.fBodyAcc.std.X|Average of fBodyAcc-std()-X for each activity and each subject|
|47|avg.fBodyAcc.std.Y|Average of fBodyAcc-std()-Y for each activity and each subject|
|48|avg.fBodyAcc.std.Z|Average of fBodyAcc-std()-Z for each activity and each subject|
|49|avg.fBodyAccJerk.mean.X|Average of fBodyAccJerk-mean()-X for each activity and each subject|
|50|avg.fBodyAccJerk.mean.Y|Average of fBodyAccJerk-mean()-Y for each activity and each subject|
|51|avg.fBodyAccJerk.mean.Z|Average of fBodyAccJerk-mean()-Z for each activity and each subject|
|52|avg.fBodyAccJerk.std.X|Average of fBodyAccJerk-std()-X for each activity and each subject|
|53|avg.fBodyAccJerk.std.Y|Average of fBodyAccJerk-std()-Y for each activity and each subject|
|54|avg.fBodyAccJerk.std.Z|Average of fBodyAccJerk-std()-Z for each activity and each subject|
|55|avg.fBodyGyro.mean.X|Average of fBodyGyro-mean()-X for each activity and each subject|
|56|avg.fBodyGyro.mean.Y|Average of fBodyGyro-mean()-Y for each activity and each subject|
|57|avg.fBodyGyro.mean.Z|Average of fBodyGyro-mean()-Z for each activity and each subject|
|58|avg.fBodyGyro.std.X|Average of fBodyGyro-std()-X for each activity and each subject|
|59|avg.fBodyGyro.std.Y|Average of fBodyGyro-std()-Y for each activity and each subject|
|60|avg.fBodyGyro.std.Z|Average of fBodyGyro-std()-Z for each activity and each subject|
|61|avg.fBodyAccMag.mean|Average of fBodyAccMag-mean() for each activity and each subject|
|62|avg.fBodyAccMag.std|Average of fBodyAccMag-std() for each activity and each subject|
|63|avg.fBodyAccJerkMag.mean|Average of fBodyAccJerkMag-mean() for each activity and each subject|
|64|avg.fBodyAccJerkMag.std|Average of fBodyAccJerkMag-std() for each activity and each subject|
|65|avg.fBodyGyroMag.mean|Average of fBodyGyroMag-mean()  for each activity and each subject|
|66|avg.fBodyGyroMag.std|Average of fBodyGyroMag-std() for each activity and each subject|
|67|avg.fBodyGyroJerkMag.mean|Average of fBodyGyroJerkMag-mean() for each activity and each subject|
|68|avg.fBodyGyroJerkMag.std|Average of fBodyGyroJerkMag-std() for each activity and each subject|

