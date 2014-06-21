##Part 0: Download and Unzip Data
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName1 = "samsungData.zip"
filePath1 = paste("./data/",fileName1,sep="")
download.file(fileUrl1,destfile=filePath1,method="curl")

unzip("./data/samsungData.zip",exdir="./data")

##Part 1: Merges the training and the test sets to create one data set.

#This code reads in the various data files using read.table, and then strings them all together for a merged set.

train <- read.table('data/UCI HAR Dataset/train/X_train.txt',row.names=NULL)
train.activity <- read.table('data/UCI HAR Dataset/train/y_train.txt')
train.subject <- read.table('data/UCI HAR Dataset/train/subject_train.txt')

test <- read.table('data/UCI HAR Dataset/test/X_test.txt',row.names=NULL)
test.activity <- read.table('data/UCI HAR Dataset/test/y_test.txt')
test.subject <- read.table('data/UCI HAR Dataset/test/subject_test.txt')

allData <- rbind(train,test)
allData.activity <- rbind(train.activity,test.activity)
allData.subject <- rbind(train.subject,test.subject)

#remove the interim data sets from the workspace to save memory
rm(train,train.activity,train.subject)
rm(test,test.activity,test.subject)

##Skipping ahead to Part 3: Uses descriptive activity names to name the activities in the data set.
allData.activity[allData.activity==1] <- "WALKING"
allData.activity[allData.activity==2] <- "WALKING_UPSTAIRS"
allData.activity[allData.activity==3] <- "WALKING_DOWNSTAIRS"
allData.activity[allData.activity==4] <- "SITTING"
allData.activity[allData.activity==5] <- "STANDING"
allData.activity[allData.activity==6] <- "LAYING"

# I actually skip ahead and am doing part 4 here as well.  The labels aren't incredibly user friendly, 
# but they map to the data collected and have significance to this sort of analysis.  I clean them up more later.

labels <- read.table('data/UCI HAR Dataset/features.txt')
colnames(allData) <- labels[,2]
allData$Activity <- unlist(allData.activity)
allData$Subject <- unlist(allData.subject)

##Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# We will leverage the labels data imported above to create a filtering vector to grab the columns.
# This grep INCLUDES the angle...gravityMean options but does NOT includes meanFreq (as that is a different function)

tidyData.MeanStdev <- allData[,grep('[M|m]ean[^F]|[S|s]td|^Subject$|^Activity$',colnames(allData))]
tidyData.MeanStdev$Activity <- unlist(allData.activity)
tidyData.MeanStdev$Subject <- unlist(allData.subject)

colnames(tidyData.MeanStdev) <- gsub("[()]","",colnames(tidyData.MeanStdev))
colnames(tidyData.MeanStdev) <- gsub("[(]","-",colnames(tidyData.MeanStdev))
colnames(tidyData.MeanStdev) <- gsub("[)]$","",colnames(tidyData.MeanStdev))
colnames(tidyData.MeanStdev) <- gsub("[,]","-",colnames(tidyData.MeanStdev))
colnames(tidyData.MeanStdev) <- gsub("-+","-",colnames(tidyData.MeanStdev))
colnames(tidyData.MeanStdev) <- gsub("[-]$","",colnames(tidyData.MeanStdev))

#Part 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# this is a perfect job for reshape2 / meld and cast

library(reshape2)
tidyMelt <- melt(tidyData.MeanStdev, id=c("Subject","Activity"),measure.vars=colnames(tidyData.MeanStdev)[1:73])
tidyData.SubjectActivityMeans <- dcast(tidyMelt,Subject+Activity~variable,mean)

write.table(tidyData.SubjectActivityMeans,file="data/SubjectActivityMeans.txt",row.names=FALSE)

