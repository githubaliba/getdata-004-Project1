Getting and Cleaning Data - Project 1 CODE BOOK
========================================================

Names of Columns and Units of Data
----------------------------------
Below is the full list of data columns in the uploaded data set SubjectActivityMeans.txt.  Note that the data represented in the dataset is the MEAN value for the represented variables across a larger set of observations.  

The data is grouped by Subject (there were 30 participants) and activity (there were six activity types).  The remaining values represent various accelerometer readings collected by the study devices.  More information may be available on the original data site referenced below.  

Please note that names were cleaned up to make them more R-friendly, removing parentheses and commas and replacing them with dashes where applicable.  

"Subject"  
"Activity"  
"tBodyAcc-mean-X"  
"tBodyAcc-mean-Y"  
"tBodyAcc-mean-Z"  
"tBodyAcc-std-X"  
"tBodyAcc-std-Y"  
"tBodyAcc-std-Z"  
"tGravityAcc-mean-X"  
"tGravityAcc-mean-Y"  
"tGravityAcc-mean-Z"  
"tGravityAcc-std-X"  
"tGravityAcc-std-Y"  
"tGravityAcc-std-Z"  
"tBodyAccJerk-mean-X"  
"tBodyAccJerk-mean-Y"  
"tBodyAccJerk-mean-Z"  
"tBodyAccJerk-std-X"  
"tBodyAccJerk-std-Y"  
"tBodyAccJerk-std-Z"  
"tBodyGyro-mean-X"  
"tBodyGyro-mean-Y"  
"tBodyGyro-mean-Z"  
"tBodyGyro-std-X"  
"tBodyGyro-std-Y"  
"tBodyGyro-std-Z"  
"tBodyGyroJerk-mean-X"  
"tBodyGyroJerk-mean-Y"  
"tBodyGyroJerk-mean-Z"  
"tBodyGyroJerk-std-X"  
"tBodyGyroJerk-std-Y"  
"tBodyGyroJerk-std-Z"  
"tBodyAccMag-mean"  
"tBodyAccMag-std"  
"tGravityAccMag-mean"  
"tGravityAccMag-std"  
"tBodyAccJerkMag-mean"  
"tBodyAccJerkMag-std"  
"tBodyGyroMag-mean"  
"tBodyGyroMag-std"  
"tBodyGyroJerkMag-mean"  
"tBodyGyroJerkMag-std"  
"fBodyAcc-mean-X"  
"fBodyAcc-mean-Y"  
"fBodyAcc-mean-Z"  
"fBodyAcc-std-X"  
"fBodyAcc-std-Y"  
"fBodyAcc-std-Z"  
"fBodyAccJerk-mean-X"  
"fBodyAccJerk-mean-Y"  
"fBodyAccJerk-mean-Z"  
"fBodyAccJerk-std-X"  
"fBodyAccJerk-std-Y"  
"fBodyAccJerk-std-Z"  
"fBodyGyro-mean-X"  
"fBodyGyro-mean-Y"  
"fBodyGyro-mean-Z"  
"fBodyGyro-std-X"  
"fBodyGyro-std-Y"  
"fBodyGyro-std-Z"  
"fBodyAccMag-mean"  
"fBodyAccMag-std"  
"fBodyBodyAccJerkMag-mean"  
"fBodyBodyAccJerkMag-std"  
"fBodyBodyGyroMag-mean"  
"fBodyBodyGyroMag-std"  
"fBodyBodyGyroJerkMag-mean"  
"fBodyBodyGyroJerkMag-std"  
"angletBodyAccMean-gravity"  
"angletBodyAccJerkMean-gravityMean"  
"angletBodyGyroMean-gravityMean"  
"angletBodyGyroJerkMean-gravityMean"  
"angleX-gravityMean"  
"angleY-gravityMean"  
"angleZ-gravityMean"  

Original Data References  
------------------------
Original dataset page is located at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
Original dataset is downloadable at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Version
-------
File last updated and project last executed 2014-06-21.
